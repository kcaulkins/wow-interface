local FUI, E, L, V, P, G = unpack(select(2, ...))

-- FragnanceUI ingame options
function FUI:Configtable()

	E.Options.args.FUI = {
		order = 100,
		type = 'group',
		name = FUI.Name,
		childGroups = 'tab',
		args = {
			header1 = {
				order = 1,
				type = 'header',
				name = FUI.Name.." "..FUI.Version,
			},
			general = {
				type = 'group',
				name = 'General',
				order = 1,
				args = {
					installer = {
						order = 1,
						type = 'group',
						inline = true,
						name = 'Installer',
						args = {
							install = {
								order = 1,
								type = 'execute',
								name = 'Install',
								desc = 'Run the installation process.',
								func = function() E:GetModule('PluginInstaller'):Queue(FUI.InstallerData); E:ToggleOptionsUI(); end,
							},
						},
					},
					defaults = {
						order = 2,
						type = 'group',
						inline = true,
						name = 'Defaults',
						args = {
							private = {
								order = 1,
								type = 'execute',
								name = 'Reset Media',
								desc = 'Reset Media to FragnanceUI defaults.',
								func = function() FUI:SetupPrivate(); end,
								confirm = true,
							},
							cvars = {
								order = 2,
								type = 'execute',
								name = 'Reset CVars',
								desc = 'Reset CVars to FragnanceUI defaults.',
								func = function() FUI:SetupCVars(); end,
								confirm = true,
							},
						},
					},
					addonsGeneral = {
						order = 3,
						type = 'group',
						inline = true,
						name = 'Addon Profiles General',
						args = {
							glass = {
								order = 1,
								type = 'execute',
								name = 'Glass',
								desc = 'Reset to FragnanceUI defaults.',
								func = function() FUI:AddonSetupGlass(); end,
								confirm = true,
							},
							omnicc = {
								order = 2,
								type = 'execute',
								name = 'OmniCC',
								desc = 'Reset to FragnanceUI defaults.',
								func = function() FUI:AddonSetupOCC(); end,
								confirm = true,
							},
							plater = {
								order = 3,
								type = 'execute',
								name = 'Plater',
								desc = 'Reset to FragnanceUI defaults.',
								func = function() FUI:AddonSetupPlater(); end,
								confirm = true,
							},
							sle = {
								order = 4,
								type = 'execute',
								name = 'Shadow&Light',
								desc = 'Reset to FragnanceUI defaults.',
								func = function() FUI:AddonSetupSLE(); end,
								confirm = true,
							},
						},
					},
					addons1440p = {
						order = 4,
						type = 'group',
						inline = true,
						name = 'Addon Profiles 1440p',
						args = {
							bigwigs = {
								order = 1,
								type = 'execute',
								name = 'BigWigs 1440p',
								desc = 'Reset to FragnanceUI defaults.',
								func = function() FUI:AddonSetupBW('1440p'); end,
								confirm = true,
							},
							details = {
								order = 2,
								type = 'execute',
								name = 'Details 1440p',
								desc = 'Reset to FragnanceUI defaults.',
								func = function() FUI:AddonSetupDT('1440p'); end,
								confirm = true,
							},
						},
					},
					addons1080p = {
						order = 5,
						type = 'group',
						inline = true,
						name = 'Addon Profiles 1080p',
						args = {
							bigwigs = {
								order = 1,
								type = 'execute',
								name = 'BigWigs 1080p',
								desc = 'Reset to FragnanceUI defaults.',
								func = function() FUI:AddonSetupBW('1080p'); end,
								confirm = true,
							},
							details = {
								order = 2,
								type = 'execute',
								name = 'Details 1080p',
								desc = 'Reset to FragnanceUI defaults.',
								func = function() FUI:AddonSetupDT('1080p'); end,
								confirm = true,
							},
						},
					},
				},
			},
		},
	}

	for _, func in pairs(FUI.Config) do
		func()
	end
end
