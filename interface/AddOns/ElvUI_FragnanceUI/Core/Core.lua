local FUI, E, L, V, P, G = unpack(select(2, ...))

local IsAddOnLoaded = IsAddOnLoaded

-- FragnanceUI print
function FUI:Print(msg)
	print('|cff1c86eeFragnanceUI|r: '..msg)
end

-- BigWigs Profile
function FUI:AddonSetupBW(res)
	if not IsAddOnLoaded('BigWigs') then return end

	if res == '1440p' then
		FUI:GetBigWigsProfile('1440p')
	elseif res == '1080p' then
		FUI:GetBigWigsProfile('1080p')
	end

	FUI:Print('BigWigs profile has been set.')
end

-- Details Profile
function FUI:AddonSetupDT(res)
	if not IsAddOnLoaded('Details') then return end

	if res == '1440p' then
		FUI:GetDetailsProfile('1440p')
	elseif res == '1080p' then
		FUI:GetDetailsProfile('1080p')
	end

	FUI:Print('Details profile has been set.')
end

-- Glass Profile
function FUI:AddonSetupGlass()

	if IsAddOnLoaded('Glass') then
		FUI:GetGlassProfile()
		FUI:Print('Glass profile has been set.')
	end
end

-- OmniCC Profile
function FUI:AddonSetupOCC()

	if IsAddOnLoaded('OmniCC') then
		FUI:GetOmniCCProfile()
		FUI:Print('OmniCC profile has been set.')
	end
end

-- Plater Profile
function FUI:AddonSetupPlater()

	if IsAddOnLoaded('Plater') then
		FUI:GetPlaterProfile()
		FUI:Print('Plater profile has been set.')
	end
end

-- Shadow & Light Profile
function FUI:AddonSetupSLE()

	if IsAddOnLoaded('ElvUI_SLE') then

		-- Global DB SLE
		E.global["sle"]["advanced"]["confirmed"] = true
		E.global["sle"]["advanced"]["gameMenu"]["enable"] = false
		E.global["sle"]["advanced"]["general"] = true

		-- Private DB SLE
		E.private["sle"]["install_complete"] = "3.78"

		-- Profile DB SLE
		E.db["sle"]["armory"]["character"]["background"]["selectedBG"] = "CLASS"
		E.db["sle"]["armory"]["character"]["enable"] = true
		E.db["sle"]["armory"]["character"]["enchant"]["xOffset"] = 2
		E.db["sle"]["armory"]["character"]["gem"]["size"] = 11
		E.db["sle"]["armory"]["character"]["gradient"]["quality"] = true
		E.db["sle"]["armory"]["character"]["ilvl"]["font"] = "Expressway"
		E.db["sle"]["armory"]["character"]["ilvl"]["xOffset"] = 5
		E.db["sle"]["armory"]["character"]["ilvl"]["yOffset"] = 2
		E.db["sle"]["armory"]["character"]["transmog"]["enableArrow"] = false
		E.db["sle"]["quests"]["visibility"]["bg"] = "FULL"
		E.db["sle"]["quests"]["visibility"]["enable"] = true
		E.db["sle"]["raidmarkers"]["buttonSize"] = 19
		E.db["sle"]["raidmarkers"]["enable"] = false
		E.db["sle"]["raidmarkers"]["spacing"] = 1

		FUI:Print('Shadow & Light profile has been set.')
	end
end

-- CVars General
function FUI:SetupCVars()

	-- ElvUI CVars
	E:SetupCVars(noDisplayMsg)

	-- General CVars
	SetCVar('SpellQueueWindow', 180)

	-- NamePlate CVars
	SetCVar('nameplateLargerScale', 1.1)
	SetCVar('nameplateMinAlpha', 0.9)
	SetCVar('nameplateMinScale', 1)
	SetCVar('nameplateMotion', 1)
	SetCVar('nameplateOccludedAlphaMult', 1)
	SetCVar('nameplateOverlapH', 0.8)
	SetCVar('nameplateOverlapV', 0.9)
	SetCVar('nameplateSelectedScale', 1.15)
	SetCVar('nameplateSelfAlpha', 1)

	SetCVar('nameplateShowAll', 1)
	SetCVar('nameplateShowEnemyGuardians', 1)
	SetCVar('nameplateShowEnemyMinions', 1)
	SetCVar('nameplateShowEnemyPets', 1)
	SetCVar('nameplateShowEnemyTotems', 1)
	SetCVar('nameplateShowSelf', 0)

	-- Name CVars
	SetCVar('UnitNameEnemyGuardianName', 0)
	SetCVar('UnitNameEnemyMinionName', 0)
	SetCVar('UnitNameEnemyPetName', 0)
	SetCVar('UnitNameEnemyPlayerName', 0)
	SetCVar('UnitNameEnemyTotem', 0)

	FUI:Print('CVars have been set.')
end

-- Private DB
function FUI:SetupPrivate()

	E.private["chat"]["enable"] = false
	E.private["general"]["chatBubbles"] = "disabled"
	E.private["general"]["dmgfont"] = "Expressway"
	E.private["install_complete"] = "11.52"
	E.private["nameplates"]["enable"] = false

	E:StaggeredUpdateAll(nil, true)

	FUI:Print('Note: Fonts do not change until you restart WoW.')
end

-- Global DB
function FUI:SetupGlobal(res)

	E.global["general"]["fadeMapWhenMoving"] = false
	E.global["general"]["mapAlphaWhenMoving"] = 1
	E.global["general"]["smallerWorldMap"] = false

	if res == '1440p' then

		do
			E.DataTexts:BuildPanelFrame("hehe")
			E.global["datatexts"]["customPanels"]["hehe"]["backdrop"] = false
			E.global["datatexts"]["customPanels"]["hehe"]["border"] = false
			E.global["datatexts"]["customPanels"]["hehe"]["enable"] = true
			E.global["datatexts"]["customPanels"]["hehe"]["fonts"]["enable"] = true
			E.global["datatexts"]["customPanels"]["hehe"]["fonts"]["font"] = "PT Sans Narrow"
			E.global["datatexts"]["customPanels"]["hehe"]["fonts"]["fontOutline"] = "OUTLINE"
			E.global["datatexts"]["customPanels"]["hehe"]["fonts"]["fontSize"] = 13
			E.global["datatexts"]["customPanels"]["hehe"]["frameLevel"] = 1
			E.global["datatexts"]["customPanels"]["hehe"]["frameStrata"] = "HIGH"
			E.global["datatexts"]["customPanels"]["hehe"]["growth"] = "HORIZONTAL"
			E.global["datatexts"]["customPanels"]["hehe"]["height"] = 22
			E.global["datatexts"]["customPanels"]["hehe"]["mouseover"] = false
			E.global["datatexts"]["customPanels"]["hehe"]["name"] = "hehe"
			E.global["datatexts"]["customPanels"]["hehe"]["numPoints"] = 1
			E.global["datatexts"]["customPanels"]["hehe"]["panelTransparency"] = false
			E.global["datatexts"]["customPanels"]["hehe"]["tooltipAnchor"] = "ANCHOR_TOPLEFT"
			E.global["datatexts"]["customPanels"]["hehe"]["tooltipXOffset"] = -17
			E.global["datatexts"]["customPanels"]["hehe"]["tooltipYOffset"] = 4
			E.global["datatexts"]["customPanels"]["hehe"]["visibility"] = "[petbattle] hide;show"
			E.global["datatexts"]["customPanels"]["hehe"]["width"] = 62
		end

	elseif res == '1080p' then

		do
			E.DataTexts:BuildPanelFrame("hehe")
			E.global["datatexts"]["customPanels"]["hehe"]["backdrop"] = false
			E.global["datatexts"]["customPanels"]["hehe"]["border"] = false
			E.global["datatexts"]["customPanels"]["hehe"]["enable"] = true
			E.global["datatexts"]["customPanels"]["hehe"]["fonts"]["enable"] = true
			E.global["datatexts"]["customPanels"]["hehe"]["fonts"]["font"] = "PT Sans Narrow"
			E.global["datatexts"]["customPanels"]["hehe"]["fonts"]["fontOutline"] = "OUTLINE"
			E.global["datatexts"]["customPanels"]["hehe"]["fonts"]["fontSize"] = 12
			E.global["datatexts"]["customPanels"]["hehe"]["frameLevel"] = 1
			E.global["datatexts"]["customPanels"]["hehe"]["frameStrata"] = "HIGH"
			E.global["datatexts"]["customPanels"]["hehe"]["growth"] = "HORIZONTAL"
			E.global["datatexts"]["customPanels"]["hehe"]["height"] = 22
			E.global["datatexts"]["customPanels"]["hehe"]["mouseover"] = false
			E.global["datatexts"]["customPanels"]["hehe"]["name"] = "hehe"
			E.global["datatexts"]["customPanels"]["hehe"]["numPoints"] = 1
			E.global["datatexts"]["customPanels"]["hehe"]["panelTransparency"] = false
			E.global["datatexts"]["customPanels"]["hehe"]["textJustify"] = "CENTER"
			E.global["datatexts"]["customPanels"]["hehe"]["tooltipAnchor"] = "ANCHOR_TOPLEFT"
			E.global["datatexts"]["customPanels"]["hehe"]["tooltipXOffset"] = -17
			E.global["datatexts"]["customPanels"]["hehe"]["tooltipYOffset"] = 4
			E.global["datatexts"]["customPanels"]["hehe"]["visibility"] = "[petbattle] hide;show"
			E.global["datatexts"]["customPanels"]["hehe"]["width"] = 62
		end
	end
end

-- UI Scale
function FUI:SetupScale(res)

	if res == '1440p' then

		E.global["general"]["UIScale"] = 0.53333333333333

	elseif res == '1080p' then

		E.global["general"]["UIScale"] = 0.71111111111111

	end
end
