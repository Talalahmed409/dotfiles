local home = os.getenv("HOME")
local scrPath = home .. "/.local/share/bin"
local currentPath = os.getenv("PATH")

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
-- --
hl.on("hyprland.start", function()
	hl.exec_cmd("dbus-update-activation-environment --systemd --all")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

	-- 2. Background Daemons (Add & if the wrapper feels "sticky")
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("waybar")
	--
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
end)
