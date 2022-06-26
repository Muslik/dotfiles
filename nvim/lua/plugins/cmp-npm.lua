local status_ok, cmp_npm = pcall(require, "cmp-npm")
if not status_ok then
  return
end

cmp_npm.setup({
  ignore = {},
  only_semantic_versions = true,
})
