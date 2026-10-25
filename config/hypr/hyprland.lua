-- Hyprland Lua Configuration
---@module 'hl'

-- --- Display & Input ---

hl.monitor({
	output = "*",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

hl.config({
	decoration = {
		rounding = 15,
		rounding_power = 2,
	},
	general = {
		border_size = 1,
	},
	input = {
		left_handed = true,
		follow_mouse = 1,
	},
})

-- --- Variables ---

local mainMod = "SUPER"

-- Keybindings ---

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd("ghostty"))
hl.bind(mainMod .. " + C", hl.dsp.window.close())
hl.bind(
	mainMod .. " + Q",
	hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit")
)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("ghostty -e nvim -c Neotree"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + V", hl.dsp.window.float())
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("google-chrome-stable"))
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("google-chrome-stable --app=https://mail.proton.me"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("google-chrome-stable --app=https://gemini.google.com"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("waypaper"))
hl.bind(mainMod .. " + space", hl.dsp.exec_cmd("/home/tony/.config/hypr/scripts/WaybarStyles.sh"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("proton-pass"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("hyprsnipper"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("codium"))
-- Window Drag & Resize Mouse Bindings
hl.exec_cmd("hyprctl keyword bind SUPER SHIFT, S, exec, /home/tony/dotfiles/sync-dotfiles.sh")
hl.exec_cmd("hyprctl keyword bind SUPER ALT, S, exec, /home/tony/.config/hypr/sync-hypr.sh")

-- Switch workspaces with mainMod + [0-9]
for i = 1, 9 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 9 do
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

-- Lock Screen
hl.bind(mainMod .. " + SHIFT + A", hl.dsp.exec_cmd("hyprlock"))

-- --- Autostart Services ---

hl.on("hyprland.start", function()
	hl.exec_cmd("/usr/bin/kwalletd6")
	hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
	hl.exec_cmd("waybar")
	hl.exec_cmd("mako")
	hl.exec_cmd("nm-applet --indicator")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("blueman-applet")
	hl.exec_cmd("hypridle")
end)
