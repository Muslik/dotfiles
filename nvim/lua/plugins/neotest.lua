local status_ok, neotest = pcall(require, 'neotest')
if not status_ok then
  return
end

neotest.setup({
  adapters = {
    require('neotest-vitest')({
      filter_dir = function(name)
        return name ~= 'node_modules'
      end,
    }),
  },
})
