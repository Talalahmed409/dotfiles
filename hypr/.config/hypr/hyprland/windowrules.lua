--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Global Dialogs
hl.window_rule({
	name = "global-dialogs-float",
	match = { title = "^(Open File|Select a File|Choose wallpaper|Open Folder|Save As|File Upload)$" },
	float = true,
	center = true,
})

-- Picture-in-Picture (Pinned to bottom right)
hl.window_rule({
	name = "pip-behavior",
	match = { title = "^Picture(-| )in(-| )[Pp]icture$" },
	float = true,
	pin = true,
	keep_aspect_ratio = true,
	move = "73% 72%",
	size = "25% 25%",
})

-- Tiled window styling (No shadow for performance/look)
hl.window_rule({
	name = "tiled-no-shadow",
	match = { float = false },
	no_shadow = true,
})

-- OBS Studio
hl.window_rule({
	name = "obs-styling",
	match = { class = "^com\\.obsproject\\.Studio$" },
	rounding = 20,
	no_blur = true,
})

-- System Utilities (Pavucontrol, Blueman, etc.)
hl.window_rule({
	name = "utils-float",
	match = { class = "^(org\\.pulseaudio\\.pavucontrol|nwg-look|blueman-manager|nm-connection-editor)$" },
	float = true,
})

-- Media (mpv)
hl.window_rule({
	name = "mpv-float",
	match = { class = "^mpv$" },
	float = true,
})

-- GNOME Calculator
hl.window_rule({
	name = "calc-float",
	match = { class = "^org\\.gnome\\.Calculator$" },
	float = true,
})

-- GNOME Loupe (Image Viewer)
hl.window_rule({
	name = "loupe-float-centered",
	match = { class = "^org\\.gnome\\.Loupe$" },
	float = true,
	center = true,
	size = "800 600",
})

-- Steam main window & games
hl.window_rule({
	name = "steam-tile",
	match = { class = "^(steam|Steam)$" },
	tile = true,
})

hl.window_rule({
	name = "steam-apps-tile",
	match = { class = "^steam_app_\\.*$" },
	tile = true,
})

-- Steam Dialogs
hl.window_rule({
	name = "steam-dialogs-float",
	match = { title = "^(Steam Settings|Friends List|Screenshot Uploader|Steam Guard|Add a Game)$" },
	float = true,
})
