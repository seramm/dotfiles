local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local status_ok1, dashboard = pcall(require, "dashboard")
if not status_ok1 then
  return
end

alpha.setup(dashboard.config)
