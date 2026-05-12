-- Custom Bézier Curves
hl.curve("wind", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("md3_decel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.1 } } })
hl.curve("menu_decel", { type = "bezier", points = { { 0.1, 1 }, { 0, 1 } } })
hl.curve("menu_accel", { type = "bezier", points = { { 0.38, 0.04 }, { 1, 0.07 } } })
hl.curve("easeOutExpo", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("fluent_edge", { type = "bezier", points = { { 0.36, 0 }, { 0.66, -0.56 } } })
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("myBezier", { type = "bezier", points = { { 0.4, 0.0 }, { 0.2, 1.0 } } })

-- Global enable
-- hl.animation({ leaf = "global", enabled = true })

-- Window Animations
hl.animation({ leaf = "windows", enabled = true, speed = 2.5, bezier = "myBezier", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 2.5, bezier = "myBezier" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 7, bezier = "menu_decel", style = "slide" })

-- Fades
hl.animation({ leaf = "fade", enabled = true, speed = 2.5, bezier = "myBezier" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 3, bezier = "myBezier" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 3, bezier = "myBezier" })
hl.animation({ leaf = "fadeSwitch", enabled = true, speed = 3, bezier = "myBezier" })
hl.animation({ leaf = "fadeShadow", enabled = true, speed = 3, bezier = "myBezier" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 3, bezier = "myBezier" })

-- Layer Shell Animations
hl.animation({ leaf = "layersIn", enabled = true, speed = 3, bezier = "menu_decel", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.6, bezier = "menu_accel", style = "slide" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 2, bezier = "overshot" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 5, bezier = "easeOutExpo" })

-- Special Workspaces
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 3, bezier = "md3_decel", style = "slidevert" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 3, bezier = "md3_decel", style = "slidevert" })
