local status_ok, browse = pcall(require, "browse")
if not status_ok then
  return
end

local utils = require('utils');

local bookmarks = {
  "https://javascript.info/",
  "https://doc.rust-lang.org/book/",
  "https://bitbucket.org/OneTwoTrip/front-avia/src/master/",
  "https://bitbucket.org/OneTwoTrip/front-tlive/src/master/",
  "https://bitbucket.org/OneTwoTrip/front-index/src/master/",
  "https://bitbucket.org/OneTwoTrip/front-components/src/master/",
  "https://jenkins.twiket.com/view/DEPLOY/job/dynamic_deploy/build",
  "https://onetwotripdev.atlassian.net/jira/software/c/projects/OTT/boards/147?assignee=60f94c09a248f0006aa40268"
}

local function command(name, rhs, opts)
  opts = opts or {}
  vim.api.nvim_create_user_command(name, rhs, opts)
end

command("BrowseInputSearch", function()
  browse.input_search()
end, {})

command("Browse", function()
  browse.browse { bookmarks = bookmarks }
end, {})

command("BrowseBookmarks", function()
  browse.open_bookmarks { bookmarks = bookmarks }
end, {})

command("BrowseDevdocsSearch", function()
  browse.devdocs.search()
end, {})

command("BrowseDevdocsFiletypeSearch", function()
  browse.devdocs.search_with_filetype()
end, {})

command("BrowseMdnSearch", function()
  browse.mdn.search()
end, {})

utils.map("n", "<m-o>", "<cmd>BrowseBookmarks<cr>")

browse.setup({
  provider = "google"
})

