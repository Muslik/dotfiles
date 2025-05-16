local status_ok, dbee = pcall(require, 'dbee')
if not status_ok then
  return
end

dbee.setup()
