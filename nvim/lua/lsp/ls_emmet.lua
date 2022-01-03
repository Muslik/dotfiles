local lspconfig = require'lspconfig'
local configs = require'lspconfig.configs'

if not configs.ls_emmet then
  configs.ls_emmet = {
    default_config = {
      cmd = { 'ls_emmet', '--stdio' };
      filetypes = { 'html', 'css', 'scss','haml',
        'xml', 'xsl', 'pug', 'slim', 'sass', 'stylus', 'less'};
      root_dir = function()
        return vim.loop.cwd()
      end;
      settings = {};
    };
  }
end

return {
  cmd = { 'ls_emmet', '--stdio' };
  filetypes = { 'html', 'css', 'scss','haml',
    'xml', 'xsl', 'pug', 'slim', 'sass', 'stylus', 'less'};
  root_dir = function()
    return vim.loop.cwd()
  end;
  settings = {};
}
