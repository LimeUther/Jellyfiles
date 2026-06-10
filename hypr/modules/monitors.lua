------------------
---- MONITORS ----
------------------

hl.monitor({
  output   = "eDP-1",
  mode     = "1920x1080@60",
  position = "0x0",
  scale    = 1,
})

for i = 1, 4 do
  hl.workspace_rule({
    workspace = tostring(i),
    default = i == 1,
    persistent = true,
    monitor = "eDP-1",
  })
end

