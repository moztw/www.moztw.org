/**
 * This script can help you get the latest stable version
 * of Firefox and Thunderbird.
 *
 * This utility can help you find the stable version of
 * Firefox and Thunderbird easily with
 * the official Product-Details JSON API:
 *
 * <https://wiki.mozilla.org/Release_Management/Product_details>
 *
 * This script has no dependency, but it needs a Deno runtime.
 * You can get one at https://deno.land/#installation.
 *
 * After Deno runtime is installed, you can execute the
 * following command to run it:
 *
 *     deno run --allow-net tools/get-stable-version.ts
 *
 * And you may see the following outputs:
 *
 *     The latest stable version of Firefox is 103.0.
 *     The latest stable version of Thunderbird is 102.1.0.
 *
 * You can use them for updating dlfx_var.shtml and dltb2.shtml.
 */

const firefoxVersionsApi =
  "https://product-details.mozilla.org/1.0/firefox_versions.json";
const thunderbirdVersionsApi =
  "https://product-details.mozilla.org/1.0/thunderbird_versions.json";

const [fxLatestVer, tbLatestVer] = await Promise.all(
  [
    ["fx", firefoxVersionsApi],
    ["tb", thunderbirdVersionsApi],
  ].map(async ([id, url]) => {
    const response = await fetch(url);
    const deserializedResponse = await response.json();

    return deserializedResponse[
      id === "fx" ? "LATEST_FIREFOX_VERSION" : "LATEST_THUNDERBIRD_VERSION"
    ];
  }),
);

console.log(
  `The latest stable version of \x1b[1;33mFirefox\x1b[0m is \x1b[1m${fxLatestVer}\x1b[0m.`,
);
console.log(
  `The latest stable version of \x1b[1;34mThunderbird\x1b[0m is \x1b[1m${tbLatestVer}\x1b[0m.`,
);
