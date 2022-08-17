/**
 * This script can automatically check if the `dlfx_var.shtml`
 * and the `dltb2.shtml` is defined correctly.
 *
 * It does the following checks:
 *
 * - Check if we can access the defined download URLs.
 * - Check if the TAGVER in the `dlfx_var.shtml` is correct.
 *
 * This script has no dependency, but it needs a Deno runtime.
 * You can get one at https://deno.land/#installation.
 *
 * After Deno runtime is installed, you can execute the
 * following command to run it:
 *
 *     deno run --allow-read --allow-net tools/lint-version-metadata.ts
 *
 * It will output such the following messages:
 *
 *     [  OK  ] https://download.mozilla.org/?product=firefox-103.0&os=win64&lang=zh-TW
 *     [  OK  ] https://download.mozilla.org/?product=firefox-103.0&os=linux64&lang=zh-TW
 *     [  OK  ] https://download.mozilla.org/?product=thunderbird-102.0.3-SSL&os=win64&lang=zh-TW
 *     [  OK  ] https://download.mozilla.org/?product=firefox-103.0&os=win&lang=zh-TW
 *     [  OK  ] https://download.mozilla.org/?product=thunderbird-102.0.3-SSL&os=linux64&lang=zh-TW
 *     [  OK  ] https://download.mozilla.org/?product=firefox-103.0&os=osx&lang=zh-TW
 *     [  OK  ] https://download.mozilla.org/?product=firefox-103.0&os=linux&lang=zh-TW
 *     [  OK  ] https://download.mozilla.org/?product=thunderbird-102.0.3-SSL&os=win&lang=zh-TW
 *     [  OK  ] https://download.mozilla.org/?product=thunderbird-102.0.3-SSL&os=linux&lang=zh-TW
 *     [  OK  ] https://download.mozilla.org/?product=thunderbird-102.0.3-SSL&os=osx&lang=zh-TW
 *     [  OK  ] TAGVER is as expected: 10300
 *
 * If anything is wrong, it will mark the status as red FAIL:
 *
 *     [ FAIL ] https://download.mozilla.org/?product=firefox-103.2.0&os=win64&lang=zh-TW
 *     [ FAIL ] https://download.mozilla.org/?product=firefox-103.2.0&os=win&lang=zh-TW
 *     [  OK  ] https://download.mozilla.org/?product=firefox-103.0&os=linux64&lang=zh-TW
 *     [  OK  ] https://download.mozilla.org/?product=firefox-103.0&os=osx&lang=zh-TW
 *     [  OK  ] https://download.mozilla.org/?product=thunderbird-102.0.3-SSL&os=osx&lang=zh-TW
 *     [  OK  ] https://download.mozilla.org/?product=firefox-103.0&os=linux&lang=zh-TW
 *     [  OK  ] https://download.mozilla.org/?product=thunderbird-102.0.3-SSL&os=win64&lang=zh-TW
 *     [  OK  ] https://download.mozilla.org/?product=thunderbird-102.0.3-SSL&os=linux64&lang=zh-TW
 *     [  OK  ] https://download.mozilla.org/?product=thunderbird-102.0.3-SSL&os=win&lang=zh-TW
 *     [  OK  ] https://download.mozilla.org/?product=thunderbird-102.0.3-SSL&os=linux&lang=zh-TW
 *     [ FAIL ] TAGVER is not as expected. You should change the TAGVER in dlfx_var.shtml to “10320“.
 *
 * It is for CI and test purpose; therefore, this script won't help you
 * update the version defined in the Firefox and Thunderbird metadata.
 * You can find the latest version in the official site,
 * or with `tools/get-stable-version.ts`.
 */

const getAbsPath = (pathStr: string) => new URL(pathStr, import.meta.url);
const firefoxTemplateFile = getAbsPath("../inc/dlfx_var.shtml");
const thunderbirdTemplateFile = getAbsPath("../inc/dltb2.shtml");

function succeedLog(succeed: boolean, message: string) {
  console.log(
    `\x1b[1m[${succeed ? "  OK  " : "\x1b[31m FAIL "}\x1b[0m] ${message}`,
  );
}

type VarTable = Map<string, string>;
function extractVar(inputs: string): VarTable {
  const varTable: VarTable = new Map();

  const extractor = /^<!--#set var="(?<key>.+)" value="(?<value>.+)" -->$/gm;
  const extractedKeyValuePair = inputs.matchAll(extractor);

  for (const pair of extractedKeyValuePair) {
    if (!pair.groups) throw new Error("pair.group is unexpectly undefined");

    const { key, value } = pair.groups;
    varTable.set(key, value);
  }

  return varTable;
}

function expandStringVar(value: string, fullVarTable: VarTable): string {
  const extractor = /(?<interpolation>\$\{(?<key>.+)\})/g;
  const foundVariables = value.matchAll(extractor);

  for (const variable of foundVariables) {
    if (!variable.groups) {
      throw new Error("variable.group is unexpectly undefined");
    }

    const { key, interpolation } = variable.groups;
    const expandedValue = fullVarTable.get(key);

    if (expandedValue) {
      value = value.replace(interpolation, expandedValue);
    }
  }

  return value;
}

function getExpandedUrls(varTable: VarTable): string[] {
  const expandedUrls: string[] = [];

  for (const keys of varTable.keys()) {
    if (!keys.endsWith("URL")) continue;

    const value = varTable.get(keys);
    if (!value) continue;

    const expandedValue = expandStringVar(value, varTable);
    expandedUrls.push(expandedValue);
  }

  return expandedUrls;
}

/**
 * Try to request url, and return whether this URL can be
 * request successfully.
 */
async function tryRequest(url: string): Promise<boolean> {
  const ac = new AbortController();
  const id = setTimeout(() => ac.abort(), 5000);

  try {
    const response = await fetch(url, { signal: ac.signal });
    return response.ok;
  } catch (e) {
    console.error(e);
    return false;
  } finally {
    clearTimeout(id);
  }
}

function tagVarCheck(actualVer: string, tagVar: string): [boolean, string] {
  const expectedTagVarBuf = actualVer.split(".");

  // Make the expectedTagVar to be like "x.y.z".
  //
  // For example:
  //
  //   [103] → [103, 0, 0]
  //   [103, 1] → [103, 1, 0]
  //   [103, 1, 2] → [103, 1, 2]
  while (expectedTagVarBuf.length < 3) {
    expectedTagVarBuf.push("0");
  }

  const expectedTagVar = expectedTagVarBuf.join("");

  return [expectedTagVar === tagVar, expectedTagVar];
}

const decoder = new TextDecoder();

const [firefoxTemplate, thunderbirdTemplate] = await Promise.all(
  [firefoxTemplateFile, thunderbirdTemplateFile].map(async (path) => {
    const fileBuf = await Deno.readFile(path);
    const fileStr = decoder.decode(fileBuf);

    return fileStr;
  }),
);

/**
 * Check I: Check if links are valid
 */

const [firefoxVariables, _] = await Promise.all(
  [firefoxTemplate, thunderbirdTemplate].map(async (fileStr) => {
    const extractedVariables = extractVar(fileStr);
    const expandedUrls = getExpandedUrls(extractedVariables);

    await Promise.all(
      expandedUrls.map(async (url) => {
        const result = await tryRequest(url);

        succeedLog(result, url);
      }),
    );

    return extractedVariables;
  }),
);

/**
 * Check II: Check if the TAGVER is as expected.
 */
void (function () {
  const tagVar = firefoxVariables.get("TAGVER");
  const actualVer = firefoxVariables.get("WINVER") ||
    firefoxVariables.get("WIN64VER") ||
    firefoxVariables.get("LINUXVER") ||
    firefoxVariables.get("LINUX64VER") ||
    firefoxVariables.get("OSXVER");

  if (!tagVar) {
    succeedLog(
      false,
      "TAGVER is not defined. You should specify it in dlfx_var.shtml.",
    );
    return;
  }

  if (!actualVer) {
    succeedLog(false, "No versions are defined. Please check your changes.");
    return;
  }

  const [succeed, expected] = tagVarCheck(actualVer, tagVar);

  if (succeed) {
    succeedLog(true, `TAGVER is as expected: ${expected}`);
  } else {
    succeedLog(
      false,
      `TAGVER is not as expected. You should change the TAGVER in dlfx_var.shtml to “${expected}“.`,
    );
  }
})();
