# 實作計畫：新增 Firefox 版本資訊頁（.shtml）

### 來源

- 官方 {xxx.x} Release Notes（英文）[link](https://www.firefox.com/en-US/firefox/{xxx.x}/releasenotes/)

### 要做的事

- 在 `firefox/releases/{xxx.x}/` 新增 `index.shtml`，不用建立 `index.html`。
- 依過去版本 `./index.shtml` 的結構與標籤樣式撰寫，包含：`fx_head-sandstone.shtml`/`fx_tail-sandstone.shtml` 引入、`<article id="whatsnew">`、兩個 `<ul class="tags">` 區段、結尾完整變更清單與前一版本連結區塊、社群貢獻者清單。
- 社群貢獻者清單中的 bug 編號需加上可點擊的 Bugzilla 連結（`https://bugzilla.mozilla.org/<bug>`）。
- **重要：連結處理原則**
  - **必須參考原始 release notes 網頁中的連結，不要自己添加或修改**
  - 站內連結（如 `/path`）不使用 `target="_blank"`
  - 外部連結（如 `https://`）必須使用 `target="_blank"`
  - 功能名稱、API、技術術語應連結到對應的 MDN 或官方文件
  - 常見需要加連結的項目：
    - Firefox 功能：連結到 SUMO 說明頁面
    - Web API：連結到 MDN 文件
    - CSS 屬性：連結到 MDN CSS 參考
    - JavaScript 方法：連結到 MDN JavaScript 參考
    - 技術提案：連結到 GitHub 或 W3C 規格
    - 安全性修正：連結到 Mozilla 安全公告
- 若官方段落包含示意圖：請下載圖片至 `firefox/releases/{xxx.x}/`，沿用清楚且可辨識的檔名（例如：`{xxx}_<slug>.png`），並在對應的 `<li>` 描述文字之後加入：`<p><img src="/firefox/releases/{xxx.x}/{filename}" alt="{圖說（繁中）}"></p>`。
 - 若官方標示為逐步釋出（progressive roll out），請在該 `<li>` 下加入一段 `p.progressive-roll` 說明，並移除原文括號註記。
- 同步更新版號與首頁新聞：
  - 更新變數檔 `inc/dlfx_var.shtml`：
    - 將 `WINVER/WIN64VER/LINUXVER/LINUX64VER/OSXVER` 設為最新版本（例如：`{xxx.x}` 或 `{xxx.x.y}`）。
    - 將 `TAGVER` 設為去點後的整數版號（例如：`131.0.3 → 13103`、`143.0 → 14300`）。
    - 將 `LATEST_RELEASE_NOTES_VER` 設為最新版本字串（例如：`{xxx.x}`）。
  - 首頁新聞 `inc/news.html`：
    - 依釋出日期新增一筆最新新聞，連到 `/firefox/releases/{xxx.x}/`。
- 置頂變數：
  - `release_date` 設為新版釋出日期
  - `version` 設為新版版本號
  - `previous_version` 設為前一版版本號
  - 版本鏈結規則：大版本連到大版本，小版本連到同一大版本的小版本。
    - 大版本 `X.0` 的 `previous_version` 設為上一個大版本 `X-1.0`，例如 `154.0 → 153.0`。
    - 小版本 `X.0.Y` 的 `previous_version` 設為上一個同系列版本 `X.0.(Y-1)`；第一個小版本 `X.0.1` 則連到 `X.0`。
- 內容以繁體中文整理以下段落與重點，沿用 `tag-new/tag-fixed/tag-changed/tag-enterprise/tag-developer/tag-html5` 等樣式：
  - `(Learn More)` 一律翻譯成「深入瞭解」。
  - 全新功能：
  - 修正：
  - 企業版：
    - 連結至 Firefox for Enterprise xxx 版本資訊：`https://support.mozilla.org/kb/firefox-enterprise-{xxx}-release-notes`
  - 開發者：
    - 連結 MDN Releases {xxx}：`https://developer.mozilla.org/docs/Mozilla/Firefox/Releases/{xxx}`。
  - 網路平台：
  - 社群貢獻者：
    - 依來源頁所列完整名單與 Bug 編號呈現，並將編號連到 Bugzilla。
- 結尾區塊「完整變更清單」：
  - Bugzilla 查詢更新為 {xxx}：`v3=Firefox {xxx}` / `v1=mozilla{xxx}`，並維持 `cf_status_firefox{xxx}` 與 `fixed,verified` 條件。
  - 「前一個版本」連到 `/firefox/releases/{previous_version}/`，連結文字為 `Firefox <!--#echo var="previous_version" --> 版本更新資訊`。「瞭解」與連結之間保留一空格（`你可能也想瞭解 <a href=...`）以利閱讀。

### 重要片段（示意）

- 置頂變數與引入：
```2:8:firefox/releases/{xxx.x}/index.shtml
<!--#set var="release_date" value="{release_date}" -->
<!--#set var="version" value="{xxx.x}" -->
<!--#set var="previous_version" value="{previous_version}" -->

<!--#include virtual="/firefox/inc/fx_head-sandstone.shtml" -->
```

- 結尾查詢與上一版：
```1:6:firefox/releases/{xxx.x}/index.shtml
<ul class="tags">
  <li class="complete">
    請參考此版本的<a target="_blank" href="https://bugzilla.mozilla.org/buglist.cgi?j_top=OR&f1=target_milestone&o3=equals&v3=Firefox%20{xxx}&o1=equals&resolution=FIXED&o2=anyexact&query_format=advanced&f3=target_milestone&f2=cf_status_firefox{xxx}&bug_status=RESOLVED&bug_status=VERIFIED&bug_status=CLOSED&v1=mozilla{xxx}&v2=fixed%2Cverified&limit=0">完整變更清單</a>。
    你可能也想瞭解 <a href='/firefox/releases/<!--#echo var="previous_version" -->/'>Firefox <!--#echo var="previous_version" --> 版本更新資訊</a>。
  </li>
</ul>
```

### To-dos

- [ ] 建立 `firefox/releases/{xxx.x}/index.shtml` 檔案（無 index.html）
- [ ] 設定 release_date={release_date}, version={xxx.x}, previous_version={previous_version}
- [ ] 撰寫全新功能/修正/企業版/開發者/網路平台段落（繁中）
- [ ] **檢查並添加所有必要的連結**（必須參考原始 release notes 網頁中的連結，不要自己添加）
- [ ] 加入社群貢獻者名單（依來源頁）
- [ ] 社群貢獻者 bug 編號加上 Bugzilla 連結
- [ ] 若段落含示意圖：下載圖片到該版本目錄並插入 `<img>` 標記
- [ ] 加入 Bugzilla 完整變更清單與前一版連結，收尾 include
- [ ] 更新 `inc/dlfx_var.shtml` 的版本號、`TAGVER` 與 `LATEST_RELEASE_NOTES_VER`
- [ ] 在 `inc/news.html` 新增一筆最新新聞（同一行規則）
