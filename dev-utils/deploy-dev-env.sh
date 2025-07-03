#!/usr/bin/env bash
# Deploy environment for developing the project
#
# Copyright 2025 林博仁(Buo-ren Lin) <buo.ren.lin@gmail.com>
# SPDX-License-Identifier: MPL-2.0

set_opts=(
    # Terminate script execution when an unhandled error occurs
    -o errexit
    -o errtrace

    # Terminate script execution when an unset parameter variable is
    # referenced
    -o nounset
)
if ! set "${set_opts[@]}"; then
    printf \
        'Error: Unable to configure the defensive interpreter behaviors.\n' \
        1>&2
    exit 1
fi

required_commands=(
    apt-get
    dpkg
    realpath
)
flag_required_command_check_failed=false
for command in "${required_commands[@]}"; do
    if ! command -v "${command}" >/dev/null; then
        flag_required_command_check_failed=true
        printf \
            'Error: This program requires the "%s" command to be available in your command search PATHs.\n' \
            "${command}" \
            1>&2
    fi
done
if test "${flag_required_command_check_failed}" == true; then
    printf \
        'Error: Required command check failed, please check your installation.\n' \
        1>&2
    exit 1
fi

if test -v BASH_SOURCE; then
    # Convenience variables may not need to be referenced
    # shellcheck disable=SC2034
    {
        printf \
            'Info: Determining the absolute path of the program...\n'
        if ! script="$(realpath "${BASH_SOURCE[0]}")"; then
            printf \
                'Error: Unable to determine the absolute path of the program.\n' \
                1>&2
            exit 1
        fi
        script_dir="${script%/*}"
        script_filename="${script##*/}"
        script_name="${script_filename%%.*}"
    }
fi
# Convenience variables may not need to be referenced
# shellcheck disable=SC2034
{
    script_args=("${@}")
}

trap_err(){
    printf -- \
        '%s: Error: The program prematurely terminated due to an unhandled error.\n' \
        "${script_name}" \
        1>&2
    exit 99
}
if ! trap trap_err ERR; then
    printf -- \
        '%s: Error: Unable to set the ERR trap.\n' \
        "${script_name}" \
        1>&2
    exit 1
fi

if test "${EUID}" -ne 0; then
    printf -- \
        '%s: Error: This program is required to be run as the superuser(root).\n' \
        "${script_name}" \
        1>&2
    exit 1
fi

if test "${#script_args[@]}" -ne 0; then
    printf -- \
        '%s: Error: This program does not accept any command-line arguments.\n' \
        "${script_name}" \
        1>&2
    exit 2
fi

if ! current_epoch_time="$(printf '%(%s)T')"; then
    printf -- \
        '%s: Error: Unable to query the current epoch time.\n' \
        "${script_name}" \
        1>&2
    exit 2
fi

if ! apt_list_modification_time="$(stat --format=%Y /var/lib/apt/lists)"; then
    printf -- \
        '%s: Error: Unable to query the modification of the local cache of the APT software sources.\n' \
        "${script_name}" \
        1>&2
    exit 2
fi

if test "$((current_epoch_time - apt_list_modification_time))" -ge 86400; then
    printf -- \
        '%s: Info: Syncing the software source cache of the APT package manager...\n' \
        "${script_name}"
    if ! apt-get update; then
        printf -- \
            '%s: Error: Unable to sync the software source cache of the APT package manager.\n' \
            "${script_name}" \
            1>&2
        exit 2
    fi
fi

# Avoid debconf interactive prompts on Debian-like systems
export DEBIAN_FRONTEND=noninteractive

dev_deps_pkgs=(
    grunt
    npm
)
if ! dpkg --status "${dev_deps_pkgs[@]}" &>/dev/null; then
    printf -- \
        '%s: Info: Installing the project development dependencies packages...\n' \
        "${script_name}"
    aptget_install_opts=(
        --no-install-recommends
        --yes
    )
    if ! apt-get install "${aptget_install_opts[@]}" \
        "${dev_deps_pkgs[@]}"; then
        printf -- \
            '%s: Error: Unable to install the project development dependencies packages.\n' \
            "${script_name}" \
            1>&2
        exit 2
    fi
fi

if test "${script_dir}" == /etc/profile.d; then
    # We're in the development environment container
    project_dir=/project
else
    if ! project_dir="$(realpath "${script_dir}/..")"; then
        printf -- \
            '%s: Error: Unable to determine the absolute path of the project directory.\n' \
            "${script_name}" \
            1>&2
        exit 2
    fi
fi

if ! cd "${project_dir}"; then
    printf -- \
        '%s: Error: Unable to switch the working directory to the project directory.\n' \
        "${script_name}" \
        1>&2
    exit 2
fi

printf -- \
    '%s: Info: Installing the Node.js dependencies of the project...\n' \
    "${script_name}"
if test -v SUDO_USER; then
    if ! sudo -u "${SUDO_USER}" npm install; then
        printf -- \
            '%s: Error: Unable to install the Node.js dependencies of the project.\n' \
            "${script_name}" \
            1>&2
        exit 2
    fi
else
    if ! npm install; then
        printf -- \
            '%s: Error: Unable to install the Node.js dependencies of the project.\n' \
            "${script_name}" \
            1>&2
        exit 2
    fi
fi

printf -- \
    '%s: Info: Operation completed without errors.\n' \
    "${script_name}"

if test "${#BASH_SOURCE[@]}" -gt 1; then
    set_opts=(
        +o errexit
        +o errtrace
        +o nounset
    )
    if ! set "${set_opts[@]}"; then
        printf -- \
            '%s: Error: Unable to reset the interpreter behaviors.\n' \
            "${script_name}" \
            1>&2
        return 2
    fi

    if ! trap - ERR; then
        printf -- \
            '%s: Error: Unable to reset the ERR trap.\n' \
            "${script_name}" \
            1>&2
        return 2
    fi

    return 0
else
    exit 0
fi
