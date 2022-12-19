local FUI, E, L, V, P, G = unpack(select(2, ...))

-- Glass Profile setup
function FUI:GetGlassProfile()

	GlassDB = {
		["profileKeys"] = {
			[E.mynameRealm] = "Default",
		},
		["global"] = {
			["version"] = "1.8.0",
		},
		["profiles"] = {
			["Default"] = {
				["iconTextureYOffset"] = 3.1,
				["indentWordWrap"] = false,
				["editBoxBackgroundOpacity"] = 0.64,
				["frameHeight"] = 240,
				["positionAnchor"] = {
					["yOfs"] = 1.001167178153992,
					["xOfs"] = 0.9999979734420776,
				},
				["messageLinePadding"] = 0,
				["messageLeading"] = 2,
				["font"] = "Expressway",
				["chatBackgroundOpacity"] = 0,
				["frameWidth"] = 430,
				["messageFontSize"] = 13,
			},
		},
	}

end
