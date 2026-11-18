-- Boxes appended to the end of every HTML page of the book (growth experiments;
-- see research-methods-mcp/docs/BOOK-EXPERIMENTS.md). Written into the static HTML
-- at render time, so readers without JavaScript and AI crawlers see them too.
--
--   E9  "Related in other books": up to three links to the author's other books,
--       for chapters listed in growth/related.json. Plain URLs, no UTM tags.
--   E7  "Cite this section": APA and BibTeX for the book, with the chapter title
--       and URL. Every chapter and the home page; not part pages or References.
--   E3  "Use this book with your AI assistant": the Research Methods Library MCP
--       endpoint tagged ?src=book-marketing-research, with Cursor and VS Code
--       install buttons. Every page, home page included.
--
-- Each box is a <div role="complementary">, not an <aside>: Quarto moves <aside> into the
-- right margin column.
--
-- HTML output only: PDF and EPUB are untouched. Styles live in growth/book-boxes.css.

local MCP_SITE = "https://research-methods-mcp.vercel.app/"
local ENDPOINT = MCP_SITE .. "mcp?src=book-marketing-research"

-- The book's citation, as in research-methods-mcp/sources.yml (id marketing_research).
local BOOK = {
  key = "Nguyen2026Marketing",
  title = "Marketing Research: A Technical and Academic Treatment",
  title_apa = "Marketing research: A technical and academic treatment",
  author_apa = "Nguyen, M.",
  author_bib = "Nguyen, Mike",
  year = "2026",
}

-- Same button images and link format as research-methods-mcp/README.md, with this
-- book's endpoint. Cursor: base64 of {"url":"<endpoint>"}; VS Code: percent-encoded
-- {"type":"http","url":"<endpoint>"}. ("&amp;" because these go into HTML attributes.)
local CURSOR_INSTALL = "https://cursor.com/en/install-mcp?name=research-methods&amp;config="
  .. "eyJ1cmwiOiJodHRwczovL3Jlc2VhcmNoLW1ldGhvZHMtbWNwLnZlcmNlbC5hcHAvbWNwP3NyYz1ib29rLW1hcmtldGluZy1yZXNlYXJjaCJ9"
local VSCODE_INSTALL = "https://insiders.vscode.dev/redirect/mcp/install?name=research-methods&amp;config="
  .. "%7B%22type%22%3A%22http%22%2C%22url%22%3A%22https%3A%2F%2Fresearch-methods-mcp.vercel.app"
  .. "%2Fmcp%3Fsrc%3Dbook-marketing-research%22%7D"

local function esc(s)
  return (s:gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub('"', "&quot;"))
end

local function bib_esc(s)
  return (s:gsub("([&%%#_])", "\\%1"))
end

-- The page's site-relative output path ("08-branding.html", "parts/substantive.html").
local function page_path()
  local input = quarto.doc.input_file
  local name = pandoc.path.split_extension(pandoc.path.filename(input))
  local dir = pandoc.path.filename(pandoc.path.directory(input))
  if dir == "parts" then return "parts/" .. name .. ".html", name, true end
  return name .. ".html", name, false
end

local function site_url(meta)
  local url = meta.book and meta.book["site-url"] or meta["site-url"]
  url = url and pandoc.utils.stringify(url) or "https://mikenguyen13.github.io/marketing_research"
  return (url:gsub("/+$", ""))
end

-- Quarto lifts a chapter's level-1 heading into the title metadata before user filters.
local function chapter_title(meta, blocks)
  -- Drop the chapter number Quarto prefixes ("26 Marketing–Finance Interface"): numbers
  -- shift as chapters are added, and the URL already identifies the chapter.
  if meta.title then
    local inl = pandoc.Inlines(meta.title):walk({
      Span = function(s) if s.classes:includes("chapter-number") then return {} end end,
    })
    local t = pandoc.utils.stringify(inl):gsub("^[%s\194\160]+", "")
    if t ~= "" then return t end
  end
  for _, b in ipairs(blocks) do
    if b.t == "Header" and b.level == 1 then return pandoc.utils.stringify(b.content) end
  end
end

local function related_box(links)
  local items = {}
  for i, l in ipairs(links) do
    if i > 3 then break end
    items[#items + 1] = '<li><a href="' .. esc(l.url) .. '">' .. esc(l.title) .. '</a> (<em>'
      .. esc(l.book) .. '</em>)</li>'
  end
  return table.concat({
    '<div class="mr-box mr-related" role="complementary" aria-label="Related in other books">',
    '<p class="mr-box-title">Related in other books</p>',
    '<ul>', table.concat(items, "\n"), '</ul>',
    '</div>',
  }, "\n")
end

local function cite_box(chapter, url, stem)
  local apa, bib
  if chapter then
    apa = BOOK.author_apa .. " (" .. BOOK.year .. "). " .. esc(chapter) .. ". In <em>"
      .. BOOK.title_apa .. "</em>. " .. '<a href="' .. url .. '">' .. url .. '</a>'
    bib = table.concat({
      "@inbook{" .. BOOK.key .. "-" .. stem .. ",",
      "  author    = {" .. BOOK.author_bib .. "},",
      "  title     = {" .. BOOK.title .. "},",
      "  chapter   = {" .. bib_esc(chapter) .. "},",
      "  year      = {" .. BOOK.year .. "},",
      "  url       = {" .. url .. "}",
      "}",
    }, "\n")
  else
    apa = BOOK.author_apa .. " (" .. BOOK.year .. "). <em>" .. BOOK.title_apa .. "</em>. "
      .. '<a href="' .. url .. '">' .. url .. '</a>'
    bib = table.concat({
      "@book{" .. BOOK.key .. ",",
      "  author    = {" .. BOOK.author_bib .. "},",
      "  title     = {" .. BOOK.title .. "},",
      "  year      = {" .. BOOK.year .. "},",
      "  url       = {" .. url .. "}",
      "}",
    }, "\n")
  end
  return table.concat({
    '<div class="mr-box mr-cite" role="complementary" aria-label="Cite this section">',
    '<p class="mr-box-title">Cite this section</p>',
    '<p class="mr-cite-apa">' .. apa .. '</p>',
    '<details><summary>BibTeX</summary>',
    '<pre class="mr-cite-bib"><code>' .. esc(bib) .. '</code></pre>',
    '</details>',
    '</div>',
  }, "\n")
end

local function ai_box()
  return table.concat({
    '<div class="mr-box mr-ai" role="complementary" aria-label="Use this book with your AI assistant">',
    '<p class="mr-box-title">Use this book with your AI assistant</p>',
    '<p>Ask questions about this book in Claude, Cursor, VS Code, or ChatGPT, with answers that cite the section.</p>',
    '<p class="mr-ai-endpoint"><code>' .. ENDPOINT .. '</code> ',
    '<button type="button" class="mr-copy" data-copy="' .. ENDPOINT .. '" aria-label="Copy the endpoint">Copy</button></p>',
    '<p class="mr-ai-install">',
    '<a href="' .. CURSOR_INSTALL .. '"><img src="https://cursor.com/deeplink/mcp-install-dark.svg" alt="Add to Cursor" height="24" loading="lazy"></a> ',
    '<a href="' .. VSCODE_INSTALL .. '"><img src="https://img.shields.io/badge/VS_Code-Install_server-0098FF?logo=visualstudiocode&amp;logoColor=white" alt="Install in VS Code" height="20" loading="lazy"></a> ',
    '<a href="' .. MCP_SITE .. '">Setup for other assistants</a></p>',
    '<script>document.currentScript.parentNode.querySelector(".mr-copy").addEventListener("click",function(e){',
    'var b=e.currentTarget;if(!navigator.clipboard)return;navigator.clipboard.writeText(b.dataset.copy).then(function(){',
    'b.textContent="Copied";setTimeout(function(){b.textContent="Copy"},1500)})});</script>',
    '</div>',
  }, "\n")
end

local related
local function related_for(stem)
  if related == nil then
    local dir = pandoc.path.directory(PANDOC_SCRIPT_FILE)
    local f = io.open(pandoc.path.join({ dir, "related.json" }), "r")
    related = f and pandoc.json.decode(f:read("a"), false) or {}
    if f then f:close() end
  end
  return related[stem]
end

-- citeproc appends a chapter's reference list after the last block unless the page
-- already holds a #refs div; give it one first, so the boxes come after the references.
local function has_refs(blocks)
  local found = false
  pandoc.walk_block(pandoc.Div(blocks), {
    Div = function(d) if d.identifier == "refs" then found = true end end,
  })
  return found
end

function Pandoc(doc)
  if not quarto.doc.is_format("html") then return nil end
  local path, stem, is_part = page_path()
  local base = site_url(doc.meta)

  if not has_refs(doc.blocks) then
    doc.blocks:insert(pandoc.Div({}, pandoc.Attr("refs")))
  end

  local links = related_for(stem)
  if links and #links > 0 then
    doc.blocks:insert(pandoc.RawBlock("html", related_box(links)))
  end

  if not is_part and stem ~= "99-references" then
    if stem == "index" then
      doc.blocks:insert(pandoc.RawBlock("html", cite_box(nil, base .. "/", stem)))
    else
      doc.blocks:insert(pandoc.RawBlock("html", cite_box(chapter_title(doc.meta, doc.blocks), base .. "/" .. path, stem)))
    end
  end

  doc.blocks:insert(pandoc.RawBlock("html", ai_box()))
  return doc
end
