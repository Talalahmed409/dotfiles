---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier
local terminal = "kitty"

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
-- hl.bind(
-- 	mainMod .. " + M",
-- 	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
-- )
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("pkill fuzzel || fuzzel"))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("kitty -e nvim"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd("zen-browser"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("kitty -e yazi"))
hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind("CTRL + SHIFT + ESCAPE", hl.dsp.exec_cmd("kitty -e htop")) -- dwindle only
hl.bind(mainMod .. " + CTRL + V", hl.dsp.exec_cmd("pavucontrol"))
hl.bind("ALT + RETURN", hl.dsp.window.fullscreen({ action = "toggle" }))

hl.bind(
	mainMod .. " + SHIFT + P",
	hl.dsp.exec_cmd(
		"bash -c 'mkdir -p ~/Pictures/Screenshots && grimblast --freeze copysave area ~/Pictures/Screenshots/Screenshot_$(date +%Y-%m-%d_%H.%M.%S).png'"
	)
)
hl.bind(
	mainMod .. " + P",
	hl.dsp.exec_cmd(
		"bash -c 'mkdir -p ~/Pictures/Screenshots && grimblast copysave area ~/Pictures/Screenshots/Screenshot_$(date +%Y-%m-%d_%H.%M.%S).png'"
	)
)
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))

-- =========================================================
-- Floating / Window Controls
-- =========================================================

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + Z", hl.dsp.window.drag())

hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + X", hl.dsp.window.resize())

-- =========================================================
-- Focus movement
-- =========================================================

hl.bind(mainMod .. " + LEFT", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + UP", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + DOWN", hl.dsp.focus({ direction = "down" }))

-- =========================================================
-- Move windows
-- =========================================================

hl.bind(mainMod .. " + SHIFT + LEFT", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + RIGHT", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + UP", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + DOWN", hl.dsp.window.move({ direction = "down" }))

-- =========================================================
-- Special Workspace
-- =========================================================

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("special"))

hl.bind(mainMod .. " + ALT + S", hl.dsp.window.move({ workspace = "special:special" , follow = false }))

hl.bind("CTRL + " .. mainMod .. " + SHIFT + UP", hl.dsp.window.move({ workspace = "special:special" }))

hl.bind("CTRL + " .. mainMod .. " + SHIFT + DOWN", hl.dsp.window.move({ workspace = "e+0" }))

-- =========================================================
-- Workspaces
-- =========================================================

for i = 1, 10 do
	local key = i % 10

	-- Go to workspace
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = tostring(i) }))

	-- Move focused window to workspace
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = tostring(i) }))
end

-- =========================================================
-- Workspace cycling
-- =========================================================

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "-1" }))

hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "+1" }))

hl.bind("CTRL + " .. mainMod .. " + LEFT", hl.dsp.focus({ workspace = "-1" }))

hl.bind("CTRL + " .. mainMod .. " + RIGHT", hl.dsp.focus({ workspace = "+1" }))

hl.bind(mainMod .. " + PAGE_UP", hl.dsp.focus({ workspace = "-1" }))

hl.bind(mainMod .. " + PAGE_DOWN", hl.dsp.focus({ workspace = "+1" }))

-- =========================================================
-- Move window to workspace +/-1
-- =========================================================

hl.bind("CTRL + " .. mainMod .. " + SHIFT + RIGHT", hl.dsp.window.move({ workspace = "+1" }))

hl.bind("CTRL + " .. mainMod .. " + SHIFT + LEFT", hl.dsp.window.move({ workspace = "-1" })) -- Laptop multimedia keys for volume and LCD brightness
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- =========================================================
-- Clipboard / Emoji / powermenu
-- =========================================================
hl.bind(
	mainMod .. " + V",
	hl.dsp.exec_cmd("pkill fuzzel || cliphist list | fuzzel --match-mode fzf --dmenu | cliphist decode | wl-copy")
)
hl.bind(mainMod .. " + PERIOD", hl.dsp.exec_cmd("pkill fuzzel || ~/.local/share/bin/fuzzel-emoji"))
hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd("pkill fuzzel || ~/.local/share/bin/powermenu"))

-- =========================================================
-- Bar / UI
-- =========================================================

hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("pkill fuzzel || ~/.local/share/bin/toggle-waybar"))

-- =========================================================
-- Keyboard Layout
-- =========================================================

hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("hyprctl switchxkblayout all next"))

-- =========================================================
-- GPU Screen Recorder
-- =========================================================

hl.bind("SUPER + CTRL + F10", hl.dsp.exec_cmd("~/.local/bin/save-replay.sh"))

-- =========================================================
-- Notifications / Testing
-- =========================================================

hl.bind(
	mainMod .. " + ALT + F12",
	hl.dsp.exec_cmd([[notify-send -u low -i dialog-information-symbolic \
        'Test notification' \
        "Here's a really long message to test truncation and wrapping\nYou can middle click or flick this notification to dismiss it!" \
        -a 'Shell' \
        -A "Test1=I got it!" \
        -A "Test2=Another action"]])
)

-- =========================================================
-- Bluetooth
-- =========================================================

hl.bind("XF86PickupPhone", hl.dsp.exec_cmd("rfkill toggle bluetooth"))

-- =========================================================
-- ThinkPad Keyboard Backlight
-- =========================================================

hl.bind(
	"XF86HangupPhone",
	hl.dsp.exec_cmd([[sh -c 'CUR=$(brightnessctl -d tpacpi::kbd_backlight g); \
        NEXT=$(( (CUR + 1) % 3 )); \
        brightnessctl -d tpacpi::kbd_backlight set $NEXT']])
)
