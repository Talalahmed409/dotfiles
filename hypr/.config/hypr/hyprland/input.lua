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
			scroll_factor = 0.45,
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
})
