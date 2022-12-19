local FUI, E, L, V, P, G = unpack(select(2, ...))

-- OmniCC profile setup
function FUI:GetOmniCCProfile()

	OmniCCDB = {
		["profileKeys"] = {
		},
		["global"] = {
			["addonVersion"] = "9.0.1",
			["dbVersion"] = 5,
		},
		["profiles"] = {
			["Default"] = {
				["rules"] = {
					{
						["patterns"] = {
							"PlaterMainAuraIcon", -- [1]
							"PlaterSecondaryAuraIcon", -- [2]
							"ExtraIconRowIcon", -- [3]
						},
						["id"] = "Plater Nameplates Rule",
						["priority"] = 1,
						["theme"] = "Plater Nameplates Theme",
					}, -- [1]
				},
				["themes"] = {
					["Default"] = {
						["textStyles"] = {
							["soon"] = {
								["scale"] = 1.25,
							},
							["minutes"] = {
								["scale"] = 0.8209952712059021,
							},
							["seconds"] = {
								["scale"] = 1.25,
							},
							["hours"] = {
								["scale"] = 1,
							},
							["charging"] = {
								["scale"] = 1.1,
							},
							["controlled"] = {
								["scale"] = 1.1,
							},
						},
						["fontSize"] = 17,
						["minDuration"] = 0,
						["tenthsDuration"] = 4,
						["mmSSDuration"] = 300,
						["fontFace"] = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\Expressway.ttf",
					},
					["Plater Nameplates Theme"] = {
						["textStyles"] = {
							["seconds"] = {
								["scale"] = 1.2,
							},
							["minutes"] = {
								["scale"] = 0.821,
							},
							["soon"] = {
								["scale"] = 1.2,
							},
							["hours"] = {
								["scale"] = 1.013767838478088,
							},
							["controlled"] = {
								["scale"] = 0.75,
							},
						},
						["fontFace"] = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\Expressway.ttf",
						["tenthsDuration"] = 4,
						["mmSSDuration"] = 300,
						["fontSize"] = 21,
						["minDuration"] = 0,
					},
				},
			},
			["Fragnance"] = {
				["rules"] = {
				},
				["themes"] = {
					["Default"] = {
						["textStyles"] = {
							["soon"] = {
								["scale"] = 1.25,
							},
							["seconds"] = {
								["scale"] = 1.25,
							},
							["minutes"] = {
								["scale"] = 0.8209952712059021,
							},
							["hours"] = {
								["scale"] = 1,
							},
							["charging"] = {
								["scale"] = 1.1,
							},
							["controlled"] = {
								["scale"] = 1.1,
							},
						},
						["fontFace"] = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\Expressway.ttf",
						["tenthsDuration"] = 4,
						["mmSSDuration"] = 300,
						["minDuration"] = 0,
						["fontSize"] = 17,
					},
					["Plater Nameplates Theme"] = {
						["textStyles"] = {
							["soon"] = {
								["scale"] = 1.2,
							},
							["seconds"] = {
								["scale"] = 1.2,
							},
							["hours"] = {
								["scale"] = 1.013767838478088,
							},
							["minutes"] = {
								["scale"] = 0.821,
							},
							["controlled"] = {
								["scale"] = 0.75,
							},
						},
						["fontFace"] = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\Expressway.ttf",
						["tenthsDuration"] = 4,
						["mmSSDuration"] = 300,
						["fontSize"] = 21,
						["minDuration"] = 0,
					},
				},
			},
		},
	}
end
