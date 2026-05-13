---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us,ara",
		follow_mouse = 1,
		numlock_by_default = true,
		-- accel_profile = "adaptive",
		-- sensitivity = 0.35,

		touchpad = {
			natural_scroll = true,
			disable_while_typing = true,
			scroll_factor = 0.07,
			drag_lock = false,
		},
	},

	hl.gesture({

		fingers = 3,

		direction = "horizontal",

		action = "workspace",
	}),
})

-- =========================================================
-- Per-Device Configs
-- =========================================================

-- Attack Shark X3 (Flat profile for gaming/precision)
hl.device({
	name = "attack-shark-x3",
	accel_profile = "flat",
	sensitivity = 0,
	natural_scroll = false,
})

-- ThinkPad T14 Gen 2 Touchpad
hl.device({
	name = "synps/2-synaptics-touchpad",
	sensitivity = 0.2,
	accel_profile = "adaptive",
	-- accel_profile = "custom  0.2144477506 0.000 0.307 0.615 1.077 1.539 2.002 2.505 3.208 3.910 4.613 5.315 6.018 6.720 7.423 8.125 8.828 9.530 10.233 10.935 12.387", --windows
	-- accel_profile = "custom 0.5 0.000 0.053 0.115 0.189 0.280 0.391 0.525 0.687 0.880 1.108 1.375 1.684 2.040 2.446 2.905 3.422 4.000 4.643 5.355 6.139", macos
})
