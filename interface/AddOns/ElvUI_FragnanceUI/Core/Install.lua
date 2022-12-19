local FUI, E, L, V, P, G = unpack(select(2, ...))

local ReloadUI = ReloadUI
local format = string.format

-- Set version & reload on "Skip" and "Finished"
local function InstallComplete()
	E.private.FUI.install_version = FUI.Version
	ReloadUI()
end

-- Installer Steps
FUI.InstallerData = {
	Title = format('|cff1c86ee%s %s|r', FUI.Name, 'Installation'),
	Name = FUI.Name,
	--tutorialImage = 'Interface\\AddOns\\ElvUI_FragnanceUI\\Media\\Textures\\f2.tga',
	Pages = {
		[1] = function()
			PluginInstallFrame.SubTitle:SetFormattedText('Welcome')
			PluginInstallFrame.Desc1:SetText('This installation process will guide you through a few steps and apply settings to your current ElvUI profile.')
			PluginInstallFrame.Desc2:SetText('Note: |cff4beb2cMake sure you have a backup of your current profile|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', InstallComplete)
			PluginInstallFrame.Option1:SetText('Skip Process')
		end,
		[2] = function()
			PluginInstallFrame.SubTitle:SetText('Layouts')
			PluginInstallFrame.Desc1:SetText('Please click a button below to apply the layout of your choosing.')
			PluginInstallFrame.Desc2:SetText('Importance: |cff4beb2cHigh|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() FUI:SetupLayout('1440p') end)
			PluginInstallFrame.Option1:SetText('ElvUI 1440p')
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() FUI:SetupLayout('1080p') end)
			PluginInstallFrame.Option2:SetText('ElvUI 1080p')
		end,
		[3] = function()
			PluginInstallFrame.SubTitle:SetFormattedText('CVars')
			PluginInstallFrame.Desc1:SetText('This will apply the following CVar values:')
			PluginInstallFrame.Desc2:SetText('Importance: |cff4beb2cOptional|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() FUI:SetupCVars() end)
			PluginInstallFrame.Option1:SetText('Setup CVars')
		end,
		[4] = function()
			PluginInstallFrame.SubTitle:SetFormattedText('BigWigs Profile')
			PluginInstallFrame.Desc1:SetText('Please click the button below to apply Fragnance profile for BigWigs.')
			PluginInstallFrame.Desc2:SetText('Importance: |cff4beb2cOptional|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() FUI:AddonSetupBW('1440p') end)
			PluginInstallFrame.Option1:SetText('BigWigs 1440p')
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() FUI:AddonSetupBW('1080p') end)
			PluginInstallFrame.Option2:SetText('BigWigs 1080p')
		end,
		[5] = function()
			PluginInstallFrame.SubTitle:SetFormattedText('Details Profile')
			PluginInstallFrame.Desc1:SetText('Please click the button below to apply Fragnance profile for Details! Damage Meter.')
			PluginInstallFrame.Desc2:SetText('Importance: |cff4beb2cOptional|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() FUI:AddonSetupDT('1440p') end)
			PluginInstallFrame.Option1:SetText('Details 1440p')
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() FUI:AddonSetupDT('1080p') end)
			PluginInstallFrame.Option2:SetText('Details 1080p')
		end,
		[6] = function()
			PluginInstallFrame.SubTitle:SetFormattedText('Glass Profile')
			PluginInstallFrame.Desc1:SetText('Please click the button below to apply Fragnance profile for Glass.')
			PluginInstallFrame.Desc2:SetText('Importance: |cff4beb2cOptional|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() FUI:AddonSetupGlass() end)
			PluginInstallFrame.Option1:SetText('Setup Glass')
		end,
		[7] = function()
			PluginInstallFrame.SubTitle:SetFormattedText('OmniCC Profile')
			PluginInstallFrame.Desc1:SetText('Please click the button below to apply Fragnance profile for OmniCC.')
			PluginInstallFrame.Desc2:SetText('Importance: |cff4beb2cOptional|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() FUI:AddonSetupOCC() end)
			PluginInstallFrame.Option1:SetText('Setup OmniCC')
		end,
		[8] = function()
			PluginInstallFrame.SubTitle:SetFormattedText('Plater Profile')
			PluginInstallFrame.Desc1:SetText('Please click the button below to apply Fragnance profile for Plater NamePlates.')
			PluginInstallFrame.Desc2:SetText('Importance: |cff4beb2cOptional|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() FUI:AddonSetupPlater() end)
			PluginInstallFrame.Option1:SetText('Setup Plater')
		end,
		[9] = function()
			PluginInstallFrame.SubTitle:SetText('Installation Complete')
			PluginInstallFrame.Desc1:SetText('You have completed the installation process, please click "Finished" to reload the UI.')
			PluginInstallFrame.Desc2:SetText('Importance: |cff4beb2cHigh|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', InstallComplete)
			PluginInstallFrame.Option1:SetText('Finished')
		end,
	},
	StepTitles = {
		[1] = 'Welcome',
		[2] = 'Layouts',
		[3] = 'CVars',
		[4] = 'BigWigs',
		[5] = 'Details',
		[6] = 'Glass',
		[7] = 'OmniCC',
		[8] = 'Plater',
		[9] = 'Installation Complete',
	},
	StepTitlesColor = {1, 1, 1},
	StepTitlesColorSelected = {0, 179/255, 1},
	StepTitleWidth = 200,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = 'CENTER',
}
