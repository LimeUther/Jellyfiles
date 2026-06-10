-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- Cursors (You already had these, which is perfect)
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_THEME",    "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE",    "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- XDG Specifications (Crucial for screen sharing and file portals)
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE",    "wayland" )
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- Toolkit Backend Variables (Forces apps to use Wayland first)
hl.env("GDK_BACKEND",     "wayland,x1 1,*")
hl.env("QT_QPA_PLATFORM", "wayland; xcb"  )

-- Qt App Tweaks (Ensures Dolphin and other Qt apps look right)
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR",         "1")

-- Firefox 
hl.env("MOZ_ENABLE_WAYLAND" ,"1")

