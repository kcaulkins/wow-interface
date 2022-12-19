local FUI, E, L, V, P, G = unpack(select(2, ...))

local twipe = table.wipe

-- Plater Profile
function FUI:GetPlaterProfile()

	local key = "Fragnance Plater"

	if PlaterDB then twipe(PlaterDB) end

	PlaterDB = {
		["profileKeys"] = {
			[E.mynameRealm] = key,
		},
		["profiles"] = {
			["Default"] = {
				["use_ui_parent"] = true,
				["aura_tracker"] = {
					["buff_tracked"] = {
						[209859] = true,
					},
				},
				["hook_auto_imported"] = {
					["Reorder Nameplate"] = 4,
					["Dont Have Aura"] = 1,
					["Players Targetting Amount"] = 4,
					["Color Automation"] = 1,
					["Execute Range"] = 1,
					["Cast Bar Icon Config"] = 2,
					["Attacking Specific Unit"] = 1,
					["Hide Neutral Units"] = 1,
					["Combo Points"] = 3,
					["Target Color"] = 3,
					["Aura Reorder"] = 2,
					["Extra Border"] = 2,
				},
				["script_data"] = {
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = false --change to true to change the color\n    envTable.NameplateColor = \"pink\"\n    envTable.NameplateSizeOffset = 6 --increase the nameplate height by this value\n    envTable.GlowAlpha = 0.5 --amount of alpha in the outside glow effect\n    \n    --create a glow effect around the nameplate\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar, envTable.NameplateColor)\n    envTable.glowEffect:SetOffset (-27, 25, 9, -11)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() --\n    \n    --set the glow effect alpha\n    envTable.glowEffect:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n--[=[\nUsing spellIDs for multi-language support\n\n135029 - A Knot of Snakes (Temple of Sethraliss)\n135388 - A Knot of Snakes (Temple of Sethraliss)\n134612 - Grasping Tentacles (Shrine of the Storm)\n133361 - Wasting Servant (Waycrest Manor)\n136330 - Soul Thorns (Waycrest Manor)\n130896 - Blackout Barrel (Freehold)\n129758 - Irontide Grenadier (Freehold)\n131009 - Spirit of Gold (Atal`Dazar)\n--]=]",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \nend\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
						["Time"] = 1537884697,
						["url"] = "",
						["Icon"] = 135996,
						["Enabled"] = true,
						["Revision"] = 156,
						["semver"] = "",
						["Author"] = "Izimode-Azralon",
						["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
						["SpellIds"] = {
						},
						["PlaterCore"] = 1,
						["NpcNames"] = {
							"135029", -- [1]
							"134388", -- [2]
							"134612", -- [3]
							"133361", -- [4]
							"136330", -- [5]
							"130896", -- [6]
							"129758", -- [7]
							"Healing Tide Totem", -- [8]
							"131009", -- [9]
						},
						["Name"] = "Unit - Important [Plater]",
						["version"] = -1,
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \nend\n\n\n",
					}, -- [1]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self)\n    \nend",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Hide()\n    \nend",
						["ScriptType"] = 1,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
						["Time"] = 1539013601,
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
						["Enabled"] = true,
						["Revision"] = 399,
						["semver"] = "",
						["Author"] = "Tercioo-Sylvanas",
						["Desc"] = "Add the buff name in the trigger box.",
						["SpellIds"] = {
							275826, -- [1]
							272888, -- [2]
							272659, -- [3]
							267901, -- [4]
							267830, -- [5]
							265393, -- [6]
						},
						["PlaterCore"] = 1,
						["NpcNames"] = {
						},
						["Name"] = "Aura - Buff Alert [Plater]",
						["version"] = -1,
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Show()\n    \nend",
					}, -- [2]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.8 --0.8\n    local CONFIG_BORDER_GLOW_ALPHA = 0.3 --0.3\n    local CONFIG_SHAKE_DURATION = 0.2 --0.2\n    local CONFIG_SHAKE_AMPLITUDE = 5 --5\n    \n    --create a glow effect in the border of the cast bar\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (self)\n    envTable.glowEffect:SetOffset (-32, 30, 7, -9)\n    envTable.glowEffect:SetAlpha (CONFIG_BORDER_GLOW_ALPHA)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, CONFIG_SHAKE_DURATION, CONFIG_SHAKE_AMPLITUDE, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))    \n    \n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)\n    fadeOut:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = CONFIG_SHAKE_AMPLITUDE\n    envTable.FrameShake.OriginalDuration = CONFIG_SHAKE_DURATION  \n    \nend",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["Time"] = 1561923707,
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
						["Enabled"] = true,
						["Revision"] = 391,
						["semver"] = "",
						["Author"] = "Bombad�o-Azralon",
						["Desc"] = "Highlight a very important cast applying several effects into the Cast Bar. Add spell in the Add Trigger field.",
						["SpellIds"] = {
							257785, -- [1]
							267237, -- [2]
							266951, -- [3]
							267273, -- [4]
							267433, -- [5]
							263066, -- [6]
							255577, -- [7]
							255371, -- [8]
						},
						["PlaterCore"] = 1,
						["NpcNames"] = {
						},
						["Name"] = "Cast - Very Important [Plater]",
						["version"] = -1,
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \nend\n\n\n",
					}, -- [3]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = 3\n    envTable.GlowAlpha = .45\n    envTable.ShowArrow = true\n    envTable.ArrowAlpha = .45    \n    envTable.HealthBarColor = \"orange\"\n    \n    --custom frames\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    envTable.glowEffect:SetOffset (-27, 25, 6, -8)\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 32\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\CastingBar\\UI-CastingBar-Spark]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = 8\n    envTable.topArrow.height = 8\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.glowEffect:Hide()\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-16, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \n    --update the health bar color coloring from yellow to red\n    --Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    \n    Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n\n",
						["Time"] = 1540663131,
						["url"] = "",
						["Icon"] = 2175503,
						["Enabled"] = true,
						["Revision"] = 324,
						["semver"] = "",
						["Author"] = "Bombad�o-Azralon",
						["Desc"] = "Apply several animations when the explosion orb cast starts on a Mythic Dungeon with Explosion Affix",
						["SpellIds"] = {
							240446, -- [1]
							273577, -- [2]
						},
						["PlaterCore"] = 1,
						["NpcNames"] = {
						},
						["Name"] = "Explosion Affix M+ [Plater]",
						["version"] = -1,
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 32\n    \n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \n    \nend\n\n\n\n\n\n\n",
					}, -- [4]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.debuffIconGlow = envTable.debuffIconGlow or Plater.CreateIconGlow (self)\n    \nend\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Hide()\n    \nend\n\n\n",
						["ScriptType"] = 1,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["Time"] = 1538429739,
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
						["Enabled"] = true,
						["Revision"] = 232,
						["semver"] = "",
						["Author"] = "Tercioo-Sylvanas",
						["Desc"] = "Add the debuff name in the trigger box.",
						["SpellIds"] = {
						},
						["PlaterCore"] = 1,
						["NpcNames"] = {
						},
						["Name"] = "Aura - Debuff Alert [Plater]",
						["version"] = -1,
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Show()\n    \nend\n\n\n",
					}, -- [5]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --https://www.wowhead.com/spell=253583/fiery-enchant\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = \"darkorange\"\n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.4\n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = 5\n    \n    \n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, 0.2, 5, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()        \n    \nend\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    --restore the cast bar to its original height\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n        envTable.OriginalHeight = nil\n    end\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \nend\n\n\n\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["Time"] = 1561924439,
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
						["Enabled"] = true,
						["Revision"] = 574,
						["semver"] = "",
						["Author"] = "Tercioo-Sylvanas",
						["Desc"] = "Flash, Bounce and Red Color the CastBar border when when an important cast is happening. Add spell in the Add Trigger field.",
						["SpellIds"] = {
							258153, -- [1]
							258313, -- [2]
							257069, -- [3]
							274569, -- [4]
							278020, -- [5]
							261635, -- [6]
							272700, -- [7]
							280404, -- [8]
							268030, -- [9]
							265368, -- [10]
							263891, -- [11]
							264520, -- [12]
							265407, -- [13]
							278567, -- [14]
							278602, -- [15]
							258128, -- [16]
							257791, -- [17]
							258938, -- [18]
							265089, -- [19]
							272183, -- [20]
							256060, -- [21]
							257397, -- [22]
							257899, -- [23]
							269972, -- [24]
							270901, -- [25]
							270492, -- [26]
							268129, -- [27]
							268709, -- [28]
							263215, -- [29]
							268797, -- [30]
							262540, -- [31]
							262554, -- [32]
							253517, -- [33]
							255041, -- [34]
							252781, -- [35]
							250368, -- [36]
							258777, -- [37]
						},
						["PlaterCore"] = 1,
						["NpcNames"] = {
						},
						["Name"] = "Cast - Big Alert [Plater]",
						["version"] = -1,
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \nend\n\n\n\n\n\n\n\n\n",
					}, -- [6]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = 0.6\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    \n    \nend\n\n\n\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \nend\n\n\n",
						["Time"] = 1539201768,
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
						["Enabled"] = true,
						["Revision"] = 376,
						["semver"] = "",
						["Author"] = "Tercioo-Sylvanas",
						["Desc"] = "Flashes the Cast Bar when a spell in the trigger list is Cast. Add spell in the Add Trigger field.",
						["SpellIds"] = {
							275192, -- [1]
							265912, -- [2]
							274438, -- [3]
							268317, -- [4]
							268375, -- [5]
							276767, -- [6]
							264105, -- [7]
							265876, -- [8]
							270464, -- [9]
							266106, -- [10]
							272180, -- [11]
							278961, -- [12]
							278755, -- [13]
							265468, -- [14]
							256405, -- [15]
							256897, -- [16]
							264101, -- [17]
							280604, -- [18]
							268702, -- [19]
							281621, -- [20]
							262515, -- [21]
							255824, -- [22]
							253583, -- [23]
							250096, -- [24]
						},
						["PlaterCore"] = 1,
						["NpcNames"] = {
						},
						["Name"] = "Cast - Small Alert [Plater]",
						["version"] = -1,
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
					}, -- [7]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = true --set to 'false' to disable blinks\n        envTable.GlowEnabled = true --set to 'false' to disable glows\n        envTable.ChangeNameplateColor = true; --set to 'true' to enable nameplate color change\n        envTable.TimeLeftToBlink = 4.5; --in seconds, affects the blink effect only\n        envTable.BlinkSpeed = 1.0; --time to complete a blink loop\n        envTable.BlinkColor = \"white\"; --color of the blink\n        envTable.BlinkMaxAlpha = 0.50; --max transparency in the animation loop (1.0 is full opaque)\n        envTable.NameplateColor = \"darkred\"; --nameplate color if ChangeNameplateColor is true\n        \n        --text color\n        envTable.TimerColorEnabled = true --set to 'false' to disable changes in the color of the time left text\n        envTable.TimeLeftWarning = 8.0; --in seconds, affects the color of the text\n        envTable.TimeLeftCritical = 3.0; --in seconds, affects the color of the text    \n        envTable.TextColor_Warning = \"yellow\"; --color when the time left entered in a warning zone\n        envTable.TextColor_Critical = \"red\"; --color when the time left is critical\n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        \n        envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
						["ScriptType"] = 1,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
						["Time"] = 1547991413,
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_blink",
						["Enabled"] = true,
						["Revision"] = 157,
						["semver"] = "",
						["Author"] = "Izimode-Azralon",
						["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
						["SpellIds"] = {
						},
						["PlaterCore"] = 1,
						["NpcNames"] = {
						},
						["Name"] = "Aura - Blink by Time Left [Plater]",
						["version"] = -1,
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
					}, -- [8]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.movingArrow = envTable.movingArrow or Plater:CreateImage (self, [[Interface\\PETBATTLES\\PetBattle-StatIcons]], 16, self:GetHeight(), \"background\", {0, 15/32, 18/32, 30/32})\n    \n    envTable.movingArrow:SetAlpha (0.275)\n    --envTable.movingArrow:SetDesaturated (true)\n    \n    envTable.movingAnimation = envTable.movingAnimation or Plater:CreateAnimationHub (envTable.movingArrow, \n        function() \n            envTable.movingArrow:Show() \n            envTable.movingArrow:SetPoint(\"left\", 0, 0)\n        end, \n        function() envTable.movingArrow:Hide() end)\n    \n    envTable.movingAnimation:SetLooping (\"REPEAT\")\n    \n    local animation = Plater:CreateAnimation (envTable.movingAnimation, \"translation\", 1, 0.2, self:GetWidth()-16, 0)\n    \n    \n    \nend\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Stop()\nend\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "		function (self, unitId, unitFrame, envTable)\n			\n		end\n	",
						["Time"] = 1539201849,
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
						["Enabled"] = true,
						["Revision"] = 171,
						["semver"] = "",
						["Author"] = "Izimode-Azralon",
						["Desc"] = "Does an animation for casts that affect the frontal area of the enemy. Add spell in the Add Trigger field.",
						["SpellIds"] = {
							255952, -- [1]
							257426, -- [2]
							274400, -- [3]
							272609, -- [4]
							269843, -- [5]
							269029, -- [6]
							272827, -- [7]
							269266, -- [8]
							263912, -- [9]
							264923, -- [10]
							258864, -- [11]
							256955, -- [12]
							265540, -- [13]
							260793, -- [14]
							270003, -- [15]
							270507, -- [16]
							257337, -- [17]
							268415, -- [18]
							275907, -- [19]
							268865, -- [20]
							260669, -- [21]
							260280, -- [22]
							253239, -- [23]
							265541, -- [24]
							250258, -- [25]
						},
						["PlaterCore"] = 1,
						["NpcNames"] = {
						},
						["Name"] = "Cast - Frontal Cone [Plater]",
						["version"] = -1,
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Play()\nend\n\n\n",
					}, -- [9]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \nend\n\n\n\n\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
						["ScriptType"] = 1,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n    end    \nend\n\n\n",
						["Time"] = 1539187387,
						["url"] = "",
						["Icon"] = 1029718,
						["Enabled"] = true,
						["Revision"] = 190,
						["semver"] = "",
						["Author"] = "Celian-Sylvanas",
						["Desc"] = "Show above the nameplate who is the player fixated",
						["SpellIds"] = {
							272584, -- [1]
							244653, -- [2]
						},
						["PlaterCore"] = 1,
						["NpcNames"] = {
						},
						["Name"] = "Fixate [Plater]",
						["version"] = -1,
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Show();\n    envTable.FixateIcon:Show();\n    \nend\n\n\n",
					}, -- [10]
					{
						["ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [268074] = \"Dark Purpose\", --G'huun Mythic Add\n        [260954] = \"Iron Gaze\", --Sergeant Bainbridge - Siege of Boralus\n        [257739] = \"Blind Rage\", --Blacktooth Scrapper - Freehold\n        [257314] = \"Black Powder Bomb\", --Irontide Grenadier - Freehold\n        [266107] = \"Thirst For Blood\", --Feral Bloodswarmer - The Underrot\n        [257582] = \"Raging Gaze\", --Earthrager - The MOTHERLODE!!\n        [262377] = \"Seek and Destroy\", --Crawler Mine - The MOTHERLODE!!\n        [257407] = \"Pursuit\", --Rezan - Atal'Dazar\n        --[] = \"\" --       \n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Time"] = 1543250950,
						["url"] = "",
						["Icon"] = 841383,
						["Enabled"] = true,
						["Revision"] = 194,
						["semver"] = "",
						["Author"] = "Tecno-Azralon",
						["Desc"] = "When an enemy places a debuff and starts to chase you. This script changes the nameplate color and place your name above the nameplate as well.",
						["SpellIds"] = {
							"spawn of g'huun", -- [1]
							"smuggled crawg", -- [2]
							"sergeant bainbridge", -- [3]
							"blacktooth scrapper", -- [4]
							"irontide grenadier", -- [5]
							"feral bloodswarmer", -- [6]
							"earthrager", -- [7]
							"crawler mine", -- [8]
							"rezan", -- [9]
						},
						["PlaterCore"] = 1,
						["NpcNames"] = {
							"smuggled crawg", -- [1]
							"sergeant bainbridge", -- [2]
							"blacktooth scrapper", -- [3]
							"irontide grenadier", -- [4]
							"feral bloodswarmer", -- [5]
							"earthrager", -- [6]
							"crawler mine", -- [7]
							"rezan", -- [8]
							"136461", -- [9]
						},
						["Name"] = "Fixate On You [Plater]",
						["version"] = -1,
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
					}, -- [11]
				},
				["aura2_x_offset"] = 0,
				["hook_data"] = {
					{
						["Enabled"] = false,
						["Revision"] = 50,
						["semver"] = "",
						["HooksTemp"] = {
						},
						["Author"] = "Kastfall-Azralon",
						["version"] = -1,
						["Desc"] = "Easy way to change the color of an unit. Open the constructor script and follow the examples.",
						["Hooks"] = {
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.NpcColors = {\n        \n        --examples, using the unit name in lower case, regular unit name and the unitID:\n        \n        [\"Thunderlord Windreader\"] = \"red\", --using regular mob name and color it as red\n        [\"thunderlord crag-leaper\"] = {1, 1, 0}, --using lower case and coloring it yellow\n        [75790] = \"#00FF00\", --using the ID of the unit and using green as color\n        \n        --insert the new mobs here:\n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n    } --close custom color bracket\n    \nend\n\n\n\n\n",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --attempt to get the color from the unit color list\n    local color = envTable.NpcColors [unitFrame.namePlateUnitNameLower] or envTable.NpcColors [unitFrame.namePlateUnitName] or envTable.NpcColors [unitFrame.namePlateNpcId]\n    \n    --if the color exists, set the health bar color\n    if (color) then\n        Plater.SetNameplateColor (unitFrame, color)\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n",
						},
						["PlaterCore"] = 1,
						["Time"] = 1547392935,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["race"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["role"] = {
							},
						},
						["LastHookEdited"] = "",
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\color_bar",
						["Name"] = "Color Automation [Plater]",
					}, -- [1]
					{
						["Enabled"] = false,
						["Revision"] = 73,
						["semver"] = "",
						["HooksTemp"] = {
						},
						["Author"] = "Izimode-Azralon",
						["version"] = -1,
						["Desc"] = "Hide neutral units, show when selected, see the constructor script for options.",
						["Hooks"] = {
							["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end\n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        envTable.HideNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n\n\n",
							["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        --check the unit reaction\n        if (unitFrame.namePlateIsTarget) then\n            envTable.ShowNameplate (unitFrame)\n            \n        else\n            envTable.HideNameplate (unitFrame)\n            \n        end    \n    end\n    \nend\n\n\n\n\n\n\n",
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        envTable.ShowNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when plater finishes an update on the nameplate\n    --check within the envTable if the healthBar of this nameplate should be hidden\n    if (envTable.IsHidden) then\n        if (unitFrame.healthBar:IsShown()) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\n    \nend\n\n\n\n\n",
							["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.ShowNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.OnlyInOpenWorld = true;\n    envTable.ShowInCombat = true;\n    \n    --consts\n    envTable.REACTION_NEUTRAL = 4;\n    \n    --functions to hide and show the healthBar\n    function envTable.HideNameplate (unitFrame)\n        Plater.HideHealthBar (unitFrame)\n        Plater.DisableHighlight (unitFrame)\n        envTable.IsHidden = true\n    end\n    \n    function envTable.ShowNameplate (unitFrame)\n        Plater.ShowHealthBar (unitFrame)\n        Plater.EnableHighlight (unitFrame)\n        envTable.IsHidden = false\n    end\n    \nend\n\n\n\n\n",
						},
						["PlaterCore"] = 1,
						["Time"] = 1541606242,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["race"] = {
							},
						},
						["LastHookEdited"] = "",
						["url"] = "",
						["Icon"] = 1990989,
						["Name"] = "Hide Neutral Units [Plater]",
					}, -- [2]
					{
						["Enabled"] = false,
						["Revision"] = 93,
						["Options"] = {
						},
						["HooksTemp"] = {
						},
						["Time"] = 1596791840,
						["Author"] = "Kastfall-Azralon",
						["Name"] = "Reorder Nameplate [Plater]",
						["Desc"] = "Function Plater.UpdatePlateSize from Plater.lua exported to scritps.",
						["Hooks"] = {
							["Nameplate Added"] = "\n\n-- exported function Plater.UpdatePlateSize() from Plater.lua\n--this is for advanced users which wants to reorder the nameplate frame at their desire\n\n\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --check if there's a type of unit on this nameplate\n    local plateFrame = unitFrame:GetParent()\n    if (not plateFrame.actorType) then\n        return\n    end\n    \n    --get all the frames and cache some variables\n    local ACTORTYPE_ENEMY_PLAYER = \"enemyplayer\"\n    local profile = Plater.db.profile\n    local DB_PLATE_CONFIG = profile.plate_config\n    local isInCombat = Plater.IsInCombat()\n    local actorType = plateFrame.actorType\n    \n    local unitFrame = plateFrame.unitFrame\n    local healthBar = unitFrame.healthBar\n    local castBar = unitFrame.castBar\n    local powerBar = unitFrame.powerBar\n    local buffFrame1 = unitFrame.BuffFrame\n    local buffFrame2 = unitFrame.BuffFrame2\n    \n    --use in combat bars when in pvp\n    if (plateFrame.actorType == ACTORTYPE_ENEMY_PLAYER) then\n        if ((Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"arena\") and DB_PLATE_CONFIG.player.pvp_always_incombat) then\n            isInCombat = true\n        end\n    end\n    \n    --get the config for this actor type\n    local plateConfigs = DB_PLATE_CONFIG [actorType]\n    --get the config key based if the player is in combat\n    local castBarConfigKey, healthBarConfigKey, manaConfigKey = Plater.GetHashKey (isInCombat)\n    \n    --get the width and height from what the user set in the options panel\n    local healthBarWidth, healthBarHeight = unitFrame.customHealthBarWidth or plateConfigs [healthBarConfigKey][1], unitFrame.customHealthBarHeight or plateConfigs [healthBarConfigKey][2]\n    local castBarWidth, castBarHeight = unitFrame.customCastBarWidth or plateConfigs [castBarConfigKey][1], unitFrame.customCastBarHeight or plateConfigs [castBarConfigKey][2]\n    local powerBarWidth, powerBarHeight = unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][1], unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][2]\n    \n    --calculate the offset for the cast bar, this is done due to the cast bar be anchored to topleft and topright\n    local castBarOffSetX = (healthBarWidth - castBarWidth) / 2\n    local castBarOffSetY = plateConfigs.castbar_offset\n    \n    --calculate offsets for the power bar\n    local powerBarOffSetX = (healthBarWidth - powerBarWidth) / 2\n    local powerBarOffSetY = 0\n    \n    --calculate the size deviation for pets\n    local unitType = Plater.GetUnitType (plateFrame)\n    if (unitType == \"pet\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.pet_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.pet_width_scale\n        \n    elseif (unitType == \"minus\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.minor_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.minor_width_scale\n    end\n    \n    --unit frame - is set to be the same size as the plateFrame\n    unitFrame:ClearAllPoints()\n    unitFrame:SetAllPoints()\n    \n    --calculates the health bar anchor points\n    --it will always be placed in the center of the nameplate area (where it accepts mouse clicks) \n    local xOffSet = (plateFrame:GetWidth() - healthBarWidth) / 2\n    local yOffSet = (plateFrame:GetHeight() - healthBarHeight) / 2\n    \n    --set the health bar point\n    healthBar:ClearAllPoints()\n    PixelUtil.SetPoint (healthBar, \"topleft\", unitFrame, \"topleft\", xOffSet + profile.global_offset_x, -yOffSet + profile.global_offset_y)\n    PixelUtil.SetPoint (healthBar, \"bottomright\", unitFrame, \"bottomright\", -xOffSet + profile.global_offset_x, yOffSet + profile.global_offset_y)\n    \n    --set the cast bar point and size\n    castBar:ClearAllPoints()\n    PixelUtil.SetPoint (castBar, \"topleft\", healthBar, \"bottomleft\", castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetPoint (castBar, \"topright\", healthBar, \"bottomright\", -castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetHeight (castBar, castBarHeight)\n    PixelUtil.SetSize (castBar.Icon, castBarHeight, castBarHeight)\n    PixelUtil.SetSize (castBar.BorderShield, castBarHeight * 1.4, castBarHeight * 1.4)\n    \n    --set the power bar point and size\n    powerBar:ClearAllPoints()\n    PixelUtil.SetPoint (powerBar, \"topleft\", healthBar, \"bottomleft\", powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetPoint (powerBar, \"topright\", healthBar, \"bottomright\", -powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetHeight (powerBar, powerBarHeight)\n    \n    --power bar are hidden by default, show it if there's a custom size for it\n    if (unitFrame.customPowerBarWidth and unitFrame.customPowerBarHeight) then\n        powerBar:SetUnit (unitFrame.unit)\n    end\n    \n    --aura frames\n    local bf1Anchor = Plater.db.profile.aura_frame1_anchor\n    Plater.SetAnchor (buffFrame1, {side = bf1Anchor.side, x = bf1Anchor.x, y = bf1Anchor.y + plateConfigs.buff_frame_y_offset}, unitFrame.healthBar, (Plater.db.profile.aura_grow_direction or 2) == 2)\n    \n    local bf2Anchor = Plater.db.profile.aura_frame2_anchor\n    Plater.SetAnchor (buffFrame2, {side = bf2Anchor.side, x = bf2Anchor.x, y = bf2Anchor.y + plateConfigs.buff_frame_y_offset}, unitFrame.healthBar, (Plater.db.profile.aura2_grow_direction or 2) == 2)\n    \nend\n\n\n",
						},
						["PlaterCore"] = 1,
						["version"] = -1,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["race"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["LastHookEdited"] = "",
						["url"] = "",
						["Icon"] = 574574,
						["semver"] = "",
					}, -- [3]
					{
						["Enabled"] = false,
						["Revision"] = 59,
						["semver"] = "",
						["HooksTemp"] = {
						},
						["Author"] = "Izimode-Azralon",
						["version"] = -1,
						["Desc"] = "Change the nameplate color when a nameplate does not have the auras set in the constructor script.",
						["Hooks"] = {
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --Important: lines starting with double dashes are comments and are not part of the script\n    \n    --set this to true if you are not using threat colors in the health bar\n    envTable.ForceRefreshNameplateColor = true\n    \n    --if the unit does not have any of the following auras, it will be painted with the color listed below\n    --list of spells to track, can be the spell name (case-sensitive) or the spellID\n    envTable.TrackingAuras = {\n        --[\"Nightblade\"] = true, --this is an example using the spell name\n        --[195452] = true, --this is an example using the spellID\n        \n    }\n    \n    --which color the nameplate wil be changed\n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    --you may also use /plater colors\n    envTable.NameplateColor = \"pink\"\n    \nend",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --do nothing if the player isn't in combat\n    if (not Plater.IsInCombat()) then\n        return \n    end\n    \n    --do nothing if the unit isn't in combat\n    if (not unitFrame.InCombat) then\n        return\n    end\n    \n    --do nothing if the unit is the player it self\n    if (unitFrame.IsSelf) then\n        return\n    end\n    \n    --check the auras\n    local hasAura = false\n    \n    for auraName, _ in pairs (envTable.TrackingAuras) do\n        if (Plater.NameplateHasAura (unitFrame, auraName)) then\n            hasAura = true\n            break\n        end\n    end\n    \n    if (not hasAura) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    else\n        if (envTable.ForceRefreshNameplateColor) then\n            Plater.RefreshNameplateColor (unitFrame) \n        end\n    end    \n    \nend",
						},
						["PlaterCore"] = 1,
						["Time"] = 1554138845,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["race"] = {
							},
							["pvptalent"] = {
							},
							["role"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["LastHookEdited"] = "",
						["url"] = "",
						["Icon"] = 136207,
						["Name"] = "Don't Have Aura [Plater]",
					}, -- [4]
					{
						["Enabled"] = false,
						["Revision"] = 182,
						["semver"] = "",
						["HooksTemp"] = {
						},
						["Author"] = "Izimode-Azralon",
						["version"] = -1,
						["Desc"] = "Show how many raid members are targeting the unit",
						["Hooks"] = {
							["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    envTable.CanShow = false;\n    envTable.TargetAmount:SetText (\"\")\nend\n\n\n",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when a nameplate is added to the screen check if the player is in combat\n    if (InCombatLockdown()) then\n        --player is in combat, check if can check amount of targets\n        envTable.CanShow = envTable.CanShowTargetAmount();\n        \n    else\n        envTable.CanShow = false; \n    end\n    \n    envTable.TargetAmount:SetText (\"\");\n    \nend",
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.TargetAmount:SetText (\"\");\n    envTable.CanShow = false;\n    \nend\n\n\n",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --if the script is allowed to show the amount of targets\n    --also check if the unit is in combat\n    if (envTable.CanShow and UnitAffectingCombat (unitId)) then\n        \n        --check if can update the amount of targets following the cooldown set in the constructor script\n        --by default Plater updates the nameplate every 250ms, by default the cooldown is 2, so it'll update the amuont of target every 1/2 of a second\n        envTable.UpdateCooldown = envTable.UpdateCooldown + 1\n        if (envTable.UpdateCooldown < envTable.UpdateInterval) then\n            return\n        else\n            \n            --reset the cooldown interval to check the amount of target again\n            envTable.UpdateCooldown = 0\n            \n            --get the amount of targets\n            local amount;\n            if (envTable.InRaid) then\n                amount = envTable.NumTargetsInRaid (unitFrame)      \n                \n            elseif (envTable.InParty) then\n                amount = envTable.NumTargetsInParty (unitFrame)   \n                \n            else\n                envTable.TargetAmount:SetText (\"\")\n                return\n            end\n            \n            --update the amount text\n            if (amount == 0) then\n                envTable.TargetAmount:SetText (\"\")\n            else\n                envTable.TargetAmount:SetText (amount)\n            end\n            \n        end\n    end\nend\n\n\n",
							["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can show the amount of targets\n    envTable.CanShow = envTable.CanShowTargetAmount();\n    \n    if (not envTable.CanShow) then\n        envTable.TargetAmount:SetText (\"\") \n    end\nend\n\n\n\n\n",
							["Constructor"] = "--all gray text like this are comments and do not run as code\n--build the settings and basic functions for the hook\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --declare setting variables:\n    local textColor = \"orange\";\n    local textSize = 12;\n    \n    local showInRaid = true;\n    local showInDungeon = true;\n    local showInArena = false;\n    local showInBattleground = false;\n    local showInOpenWorld = true;\n    \n    envTable.UpdateInterval = 2; --each 2 updates in the nameplate it'll update the amount of targets\n    \n    local anchor = {\n        side = 6, --1 = topleft 2 = left 3 = bottomleft 4 = bottom 5 = bottom right 6 = right 7 = topright 8 = top\n        x = 4, --x offset\n        y = 0, --y offset\n    };\n    \n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------\n    \n    \n    --frames:\n    \n    --create the text that will show the amount of people targeting the unit\n    if (not  unitFrame.healthBar.TargetAmount) then\n        envTable.TargetAmount = Plater:CreateLabel (unitFrame.healthBar, \"\", textSize, textColor);\n        Plater.SetAnchor (envTable.TargetAmount, anchor);\n        unitFrame.healthBar.TargetAmount = envTable.TargetAmount\n    end\n    \n    --in case Plater wipes the envTable\n    envTable.TargetAmount = unitFrame.healthBar.TargetAmount\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --private variables (they will be used in the other scripts within this hook)\n    envTable.CanShow = false;\n    envTable.UpdateCooldown = 0;\n    envTable.InRaid = false;\n    envTable.InParty = false;\n    \n    ---------------------------------------------------------------------------------------------------------------------------------------------           \n    --functions\n    \n    --update the InRaid or InParty proprieties\n    function envTable.UpdateGroupType()\n        if (IsInRaid()) then\n            envTable.InRaid = true;\n            envTable.InParty = false;     \n            \n        elseif (IsInGroup()) then\n            envTable.InRaid = false;\n            envTable.InParty = true;   \n            \n        else\n            envTable.InRaid = false;            \n            envTable.InParty = false;\n        end\n    end\n    \n    --this function controls if the amount of targets can show following the settings in the top of this script\n    function envTable.CanShowTargetAmount()\n        \n        local _, instanceType, difficultyID, _, _, _, _, instanceMapID, instanceGroupSize = GetInstanceInfo()\n        \n        if (showInRaid and instanceType == \"raid\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInDungeon and instanceType == \"party\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInArena and instanceType == \"arena\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInBattleground and instanceType == \"pvp\") then\n            envTable.UpdateGroupType()\n            return true\n        end\n        \n        if (showInOpenWorld and instanceType == \"none\") then\n            envTable.UpdateGroupType()\n            if (envTable.InRaid or envTable.InParty) then\n                return true\n            end\n        end\n        \n        return false\n    end\n    \n    --get the amount of player targetting the unit in raid or party\n    function envTable.NumTargetsInRaid (unitFrame)\n        local amount = 0\n        for i = 1, GetNumGroupMembers() do\n            local unit = \"raid\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        return amount\n    end\n    \n    function envTable.NumTargetsInParty()\n        local amount = 0\n        for i = 1, GetNumGroupMembers() - 1 do\n            local unit = \"party\" .. i .. \"target\"\n            if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n                amount = amount + 1\n            end\n        end\n        \n        local unit = \"playertarget\"\n        if (UnitGUID (unit) == unitFrame.namePlateUnitGUID) then\n            amount = amount + 1\n        end        \n        \n        return amount\n    end\n    \nend",
						},
						["PlaterCore"] = 1,
						["Time"] = 1548278227,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["race"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["role"] = {
							},
						},
						["LastHookEdited"] = "",
						["url"] = "",
						["Icon"] = 1966587,
						["Name"] = "Players Targeting a Target [Plater]",
					}, -- [5]
					{
						["Enabled"] = false,
						["Revision"] = 348,
						["Options"] = {
							{
								["Type"] = 5,
								["Name"] = "Icon Settings",
								["Value"] = "Icon Settings:",
								["Key"] = "option4",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [1]
							{
								["Type"] = 4,
								["Name"] = "Show Icon",
								["Value"] = true,
								["Key"] = "showIcon",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "Show the castbar icon when enabled",
							}, -- [2]
							{
								["Type"] = 4,
								["Name"] = "Icon on Left Side",
								["Value"] = true,
								["Key"] = "iconOnLeftSide",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "If enabled it anchor the icon on the left side, right otherwise",
							}, -- [3]
							{
								["Type"] = 4,
								["Key"] = "useFullSize",
								["Value"] = false,
								["Name"] = "Use Big Icon",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "If enabled the icon has the size of the cast bar plus the healthbar",
							}, -- [4]
							{
								["Type"] = 2,
								["Max"] = 5,
								["Desc"] = "Fine tune the icon size",
								["Min"] = 0,
								["Fraction"] = true,
								["Value"] = 0,
								["Name"] = "Icon Size Offset",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "iconSizeOffset",
							}, -- [5]
							{
								["Type"] = 2,
								["Max"] = 5,
								["Desc"] = "Space between the icon and the cast bar",
								["Min"] = -5,
								["Name"] = "Icon Padding",
								["Value"] = 0,
								["Key"] = "iconPadding",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = false,
							}, -- [6]
							{
								["Type"] = 6,
								["Name"] = "Blank Space",
								["Value"] = 0,
								["Key"] = "option6",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [7]
							{
								["Type"] = 5,
								["Name"] = "Interrupt Texture",
								["Value"] = "Can't Interrupt Texture:",
								["Key"] = "option5",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [8]
							{
								["Type"] = 4,
								["Name"] = "Show Texture",
								["Value"] = true,
								["Key"] = "showTexture",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "If enabled show a texture to tell the cast can't be interrupted",
							}, -- [9]
							{
								["Type"] = 3,
								["Name"] = "Texture Path",
								["Value"] = "Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON",
								["Key"] = "iconTexturePath",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_text",
								["Desc"] = "Insert the path for the texture",
							}, -- [10]
							{
								["Type"] = 4,
								["Name"] = "Texture Desaturated",
								["Value"] = true,
								["Key"] = "desaturatedTexture",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "If enbaled, texture is shown in black & white",
							}, -- [11]
							{
								["Type"] = 1,
								["Name"] = "Texture Color",
								["Value"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									0.3056715726852417, -- [4]
								},
								["Key"] = "textureColor",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "Select the color of the texture",
							}, -- [12]
							{
								["Type"] = 2,
								["Max"] = 32,
								["Desc"] = "Adjust the texture width",
								["Min"] = 1,
								["Fraction"] = false,
								["Value"] = 10,
								["Name"] = "Texture Width",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "textureWidth",
							}, -- [13]
							{
								["Type"] = 2,
								["Max"] = 16,
								["Desc"] = "The texture is set to be the same size as the cast bar, fine tune the height as wanted",
								["Min"] = -16,
								["Name"] = "Texture Height Mod",
								["Value"] = 0,
								["Key"] = "textureHeightMod",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Fraction"] = true,
							}, -- [14]
							{
								["Type"] = 2,
								["Max"] = 32,
								["Desc"] = "Adjust the texture position",
								["Min"] = -32,
								["Fraction"] = false,
								["Value"] = 0,
								["Name"] = "Texture Position",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Key"] = "texturePosition",
							}, -- [15]
							{
								["Type"] = 2,
								["Max"] = 1,
								["Desc"] = "Adjust the texture transparency",
								["Min"] = 0,
								["Key"] = "textureAlpha",
								["Value"] = 1,
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Texture Alpha",
							}, -- [16]
						},
						["HooksTemp"] = {
						},
						["Time"] = 1597097268,
						["Author"] = "Ditador-Azralon",
						["Name"] = "Cast Bar Icon Settings [P]",
						["Desc"] = "Move the icon of the spell cast to the left or right side of the nameplate.",
						["Hooks"] = {
							["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    unitFrame.castBar.BorderShield:SetDrawLayer(\"artwork\")\n    envTable.UpdateIconPosition (unitFrame)\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    self.ThrottleUpdate = -1\n    \nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    \n    --private:\n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local noInterruptTexture = castBar.BorderShield\n        \n        if (modTable.config.showIcon) then\n            icon:ClearAllPoints()\n            \n            if (modTable.config.iconOnLeftSide) then\n                if (modTable.config.useFullSize) then\n                    icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                    \n                else\n                    \n                    icon:SetPoint (\"topright\", unitFrame.castBar, \"topleft\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                end\n                \n            else\n                if (modTable.config.useFullSize) then\n                    icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                    \n                else\n                    \n                    icon:SetPoint (\"topleft\", unitFrame.castBar, \"topright\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                end\n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n        else\n            icon:Hide()\n        end\n        \n        if (modTable.config.showTexture and not castBar.canInterrupt) then\n            noInterruptTexture:Show()\n            \n            local texturePath = modTable.config.iconTexturePath\n            texturePath = texturePath:gsub(\"//\", \"/\")\n            texturePath = texturePath:gsub(\"\\\\\", \"/\")\n            \n            noInterruptTexture:SetTexture (texturePath)\n            noInterruptTexture:SetTexCoord (0, 1, 0, 1)\n            \n            if (modTable.config.desaturatedTexture) then\n                noInterruptTexture:SetDesaturated (modTable.config.desaturatedTexture)\n            else\n                noInterruptTexture:SetVertexColor (DetailsFramework:ParseColors (modTable.config.textureColor))\n            end\n            \n            noInterruptTexture:SetSize (modTable.config.textureWidth, castBar:GetHeight() + modTable.config.textureHeightMod)\n            noInterruptTexture:ClearAllPoints()\n            noInterruptTexture:SetPoint (\"center\", castBar, \"left\", modTable.config.texturePosition, 0)\n            noInterruptTexture:SetAlpha (modTable.config.textureAlpha)\n        else\n            noInterruptTexture:Hide()\n        end\n    end\nend",
						},
						["PlaterCore"] = 1,
						["version"] = -1,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["race"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["LastHookEdited"] = "",
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\castbar_icon",
						["semver"] = "",
					}, -- [6]
					{
						["Enabled"] = false,
						["Revision"] = 84,
						["semver"] = "",
						["HooksTemp"] = {
						},
						["Author"] = "Ahwa-Azralon",
						["version"] = -1,
						["Desc"] = "Add extra effects to execute range. See the constructor script for options.",
						["Hooks"] = {
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --execute detection, if true the script will handle the execute percent\n    --while false Plater will automatically trigger the execute range\n    --you only want to set this to true in case of Plater not detecting the execute range correctly\n    envTable.UseCustomExecutePercent = false\n    --execute percent, if not detecting automatic, this is the percent to active the execute range\n    --use from zero to one, 0.20 is equal to 20% of the unit life\n    envTable.ExecutePercent = 0.20\n    \n    --allow this script to change the nameplate color when the unit is in execute range\n    envTable.CanChangeColor = true\n    --change the health bar color to this color when the unit is in execute range\n    --color can be set as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}\n    envTable.ExecuteColor = \"green\"\n    \n    --border color\n    envTable.CanChangeBorderColor = false\n    envTable.BorderColor = \"red\"\n    \n    --hide the default health divisor and the health execute indicator\n    envTable.HideHealthDivisor = false\n    --if not hidden, adjust the health divisor settings and the health execute indicator\n    envTable.HealthDivisorAlpha = 0.5\n    envTable.HealthDivisorColor = \"white\"\n    envTable.HealthExecuteIndicatorAlpha = 0.15\n    envTable.HealthExecuteIndicatorColor = \"darkred\"\n    \n    \n    --private (internal functions)\n    do\n        function envTable.UnitInExecuteRange (unitFrame)\n            --check if can change the execute color\n            if (envTable.CanChangeColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.ExecuteColor)\n            end\n            \n            if (envTable.CanChangeBorderColor) then\n                Plater.SetBorderColor (unitFrame, envTable.BorderColor)\n            end\n            \n            if (envTable.HideHealthDivisor) then\n                unitFrame.healthBar.healthCutOff:Hide() \n                unitFrame.healthBar.executeRange:Hide()\n                \n            else\n                envTable.UpdateHealthDivisor (unitFrame)\n                \n            end\n        end\n        \n        function envTable.UpdateHealthDivisor (unitFrame)\n            local healthBar = unitFrame.healthBar\n            \n            healthBar.healthCutOff:Show()\n            healthBar.healthCutOff:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthDivisorColor))\n            healthBar.healthCutOff:SetAlpha (envTable.HealthDivisorAlpha)\n            \n            healthBar.executeRange:Show()\n            healthBar.executeRange:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthExecuteIndicatorColor))\n            healthBar.executeRange:SetAlpha (envTable.HealthExecuteIndicatorAlpha)\n            \n            if (envTable.UseCustomExecutePercent) then\n                healthBar.healthCutOff:ClearAllPoints()\n                healthBar.executeRange:ClearAllPoints()\n                \n                healthBar.healthCutOff:SetSize (healthBar:GetHeight(), healthBar:GetHeight())\n                healthBar.healthCutOff:SetPoint (\"center\", healthBar, \"left\", healthBar:GetWidth() * envTable.ExecutePercent, 0)\n                \n                healthBar.executeRange:SetTexCoord (0, envTable.ExecutePercent, 0, 1)\n                healthBar.executeRange:SetHeight (healthBar:GetHeight())\n                healthBar.executeRange:SetPoint (\"left\", healthBar, \"left\", 0, 0)\n                healthBar.executeRange:SetPoint (\"right\", healthBar.healthCutOff, \"center\")\n            end\n            \n        end\n    end\n    \nend",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (envTable.UseCustomExecutePercent) then\n        \n        --manual detection\n        local healthBar = unitFrame.healthBar\n        if (healthBar.CurrentHealth / healthBar.CurrentHealthMax <= envTable.ExecutePercent) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end        \n        \n    else\n        \n        --auto detection\n        if (unitFrame.InExecuteRange) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end\n        \n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n",
						},
						["PlaterCore"] = 1,
						["Time"] = 1547406548,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["race"] = {
							},
							["pvptalent"] = {
							},
							["role"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["LastHookEdited"] = "",
						["url"] = "",
						["Icon"] = 135358,
						["Name"] = "Execute Range [Plater]",
					}, -- [7]
					{
						["Enabled"] = false,
						["Revision"] = 222,
						["semver"] = "",
						["HooksTemp"] = {
						},
						["Author"] = "Kastfall-Azralon",
						["version"] = -1,
						["Desc"] = "Change the nameplate color if the unit is attacking a specific unit like Monk's Ox Statue or Druid's Treants. You may edit which units it track in the constructor script.",
						["Hooks"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the GUID of the target of the unit\n    local targetGUID = UnitGUID (unitId .. \"target\")\n    \n    if (targetGUID) then\n        \n        --get the npcID of the target\n        local npcID = Plater.GetNpcIDFromGUID (targetGUID)\n        --check if the npcID of this unit is in the npc list \n        if (envTable.ListOfNpcs [npcID]) then\n            Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [npcID])\n            \n        else\n            --check if the name of ths unit is in the list\n            local unitName = UnitName (unitId .. \"target\")\n            if (envTable.ListOfNpcs [unitName]) then\n                Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])\n                \n            else\n                --check if the name of the unit in lower case is in the npc list\n                unitName = string.lower (unitName)\n                if (envTable.ListOfNpcs [unitName]) then\n                    Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])                \n                    \n                end\n            end\n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.ListOfNpcs = {\n        [61146] = \"olive\", --monk statue npcID\n        [103822] = \"olive\", --druid treant npcID\n        \n    }\n    \n    \nend\n\n\n\n\n",
						},
						["PlaterCore"] = 1,
						["Time"] = 1547993111,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["race"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["role"] = {
							},
						},
						["LastHookEdited"] = "",
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_attacking_unit",
						["Name"] = "Attacking Specific Unit [Plater]",
					}, -- [8]
					{
						["Enabled"] = false,
						["Revision"] = 176,
						["semver"] = "",
						["HooksTemp"] = {
						},
						["Author"] = "Tecno-Azralon",
						["version"] = -1,
						["Desc"] = "Add another border with more customizations. This border can also be manipulated by other scripts.",
						["Hooks"] = {
							["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    if (envTable.IsEnabled) then\n        if (unitFrame.IsSelf) then\n            if (envTable.ShowOnPersonalBar) then\n                envTable.BorderFrame:Show()\n            else\n                envTable.BorderFrame:Hide() \n            end\n        else\n            envTable.BorderFrame:Show()\n        end   \n    end\n    \nend   \n\n\n\n",
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
							["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BorderFrame:Hide()\n    \nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --border color\n    local borderColor = \"yellow\"\n    \n    --size of the border\n    local borderSize = 1\n    \n    --transparency\n    local borderAlpha = 1\n    \n    --enabled (set to false it you only want to use the extra border in other scripts)\n    local isEnabled = true\n    \n    --export border (allow the border to be used by other scripts)\n    --other scripts can use:\n    --unitFrame.healthBar.extraBorder:Show()\n    --unitFrame.healthBar.extraBorder:SetVertexColor (r, g, b)\n    --unitFrame.healthBar.extraBorder:SetBorderSizes (borderSize)\n    local canExportBorder = true\n    \n    --do not add the border to personal bar\n    local noPersonalBar = true\n    \n    --private\n    do\n        \n        local newBorder = CreateFrame (\"frame\", nil, unitFrame.healthBar, \"NamePlateFullBorderTemplate\")\n        envTable.BorderFrame = newBorder\n        \n        newBorder:SetBorderSizes (borderSize, borderSize, borderSize, borderSize)\n        newBorder:UpdateSizes()\n        \n        local r, g, b = DetailsFramework:ParseColors (borderColor)\n        newBorder:SetVertexColor (r, g, b, borderAlpha)\n        \n        envTable.ShowOnPersonalBar = not noPersonalBar\n        \n        if (canExportBorder) then\n            unitFrame.healthBar.extraBorder = newBorder\n        end\n        \n        if (not isEnabled) then\n            envTable.IsEnabled = false\n        else\n            envTable.IsEnabled = true\n        end\n    end\n    \nend\n\n\n",
						},
						["PlaterCore"] = 1,
						["Time"] = 1547409079,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["race"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["LastHookEdited"] = "",
						["url"] = "",
						["Icon"] = 133689,
						["Name"] = "Extra Border [Plater]",
					}, -- [9]
					{
						["Enabled"] = false,
						["Revision"] = 189,
						["semver"] = "",
						["HooksTemp"] = {
						},
						["Author"] = "Izimode-Azralon",
						["version"] = -1,
						["Desc"] = "Show combo points above the nameplate for Druid Feral and Rogues.",
						["Hooks"] = {
							["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    --constructor is executed only once when any script of the hook runs.\n    \nend\n\n\n",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if need update the amount of combo points shown\n    if (envTable.LastPlayerTalentUpdate > envTable.LastUpdate) then\n        envTable.UpdateComboPointAmount()\n    end    \n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end    \n    \nend\n\n\n",
							["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if this nameplate is the current target\n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Player Power Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.UpdateComboPoints()\n    end\n    \n    \nend\n\n\n\n\n\n\n",
							["Player Talent Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the amount of comboo points shown when the player changes talents or specialization\n    envTable.UpdateComboPointAmount()\n    \n    --save the time of the last talent change\n    envTable.LastPlayerTalentUpdate = GetTime()\n    \n    \nend\n\n\n",
							["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n\n\n",
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    local anchors = {\n        {\"bottom\", unitFrame.healthBar, \"top\", 0, 24},\n    }\n    \n    local sizes = {\n        width = 12,\n        height = 12,\n        scale = 1,\n    }\n    \n    local textures = {\n        backgroundTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        backgroundTexCoords = {78/128, 98/128, 21/64, 41/64},\n        \n        comboPointTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        comboPointTexCoords = {100/128, 120/128, 21/64, 41/64},\n    }\n    \n    local frameLevel = 1000\n    local frameStrata = \"high\"    \n    \n    --private\n    do\n        --store combo points frames on this table\n        envTable.ComboPoints = {}\n        --save when the player changed talents or spec\n        envTable.LastPlayerTalentUpdate = GetTime()\n        --save when this nameplate got a combo point amount and alignment update        \n        \n        --build combo points frame anchor (combo point are anchored to this)\n        if (not unitFrame.PlaterComboPointFrame) then\n            local hostFrame = CreateFrame (\"frame\", nil, unitFrame)\n            hostFrame.ComboPointFramesPool = {}\n            unitFrame.PlaterComboPointFrame = hostFrame\n            envTable.ComboPointFrame = hostFrame\n            \n            --DetailsFramework:ApplyStandardBackdrop (envTable.ComboPointFrame) --debug anchor size\n            \n            --animations\n            local onPlayShowAnimation = function (animation)\n                --stop the hide animation if it's playing\n                if (animation:GetParent():GetParent().HideAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().HideAnimation:Stop()\n                end\n                \n                animation:GetParent():Show()\n            end\n            \n            local onPlayHideAnimation = function (animation)\n                --stop the show animation if it's playing\n                if (animation:GetParent():GetParent().ShowAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().ShowAnimation:Stop()\n                end\n            end        \n            local onStopHideAnimation = function (animation)\n                animation:GetParent():Hide()       \n            end\n            \n            local createAnimations = function (comboPoint)\n                --on show\n                comboPoint.ShowAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayShowAnimation, nil)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 1, 0.1, 0, 0, 1, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"alpha\", 1, 0.1, .5, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 2, 0.1, 1.2, 1.2, 1, 1)\n                \n                --on hide\n                comboPoint.HideAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayHideAnimation, onStopHideAnimation)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"scale\", 1, 0.1, 1, 1, 0, 0)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"alpha\", 1, 0.1, 1, 0)\n            end\n            \n            --build combo point frame        \n            for i =1, 10 do \n                local f = CreateFrame (\"frame\", nil, envTable.ComboPointFrame)\n                f:SetSize (sizes.width, sizes.height)\n                tinsert (envTable.ComboPoints, f)\n                tinsert (unitFrame.PlaterComboPointFrame.ComboPointFramesPool, f)\n                \n                local backgroundTexture = f:CreateTexture (nil, \"background\")\n                backgroundTexture:SetTexture (textures.backgroundTexture)\n                backgroundTexture:SetTexCoord (unpack (textures.backgroundTexCoords))\n                backgroundTexture:SetSize (sizes.width, sizes.height)\n                backgroundTexture:SetPoint (\"center\")\n                \n                local comboPointTexture = f:CreateTexture (nil, \"artwork\")\n                comboPointTexture:SetTexture (textures.comboPointTexture)\n                comboPointTexture:SetTexCoord (unpack (textures.comboPointTexCoords))\n                \n                comboPointTexture:SetSize (sizes.width, sizes.height)\n                comboPointTexture:SetPoint (\"center\")\n                comboPointTexture:Hide()            \n                \n                f.IsActive = false\n                \n                f.backgroundTexture = backgroundTexture\n                f.comboPointTexture = comboPointTexture\n                \n                createAnimations (f)\n            end\n            \n        else\n            envTable.ComboPointFrame = unitFrame.PlaterComboPointFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            envTable.ComboPoints = unitFrame.PlaterComboPointFrame.ComboPointFramesPool\n            \n        end            \n        \n        envTable.ComboPointFrame:SetFrameLevel (frameLevel)\n        envTable.ComboPointFrame:SetFrameStrata (frameStrata)\n        \n        function envTable.UpdateComboPoints()\n            local comboPoints = UnitPower (\"player\", Enum.PowerType.ComboPoints)\n            \n            for i = 1, envTable.TotalComboPoints do\n                local thisComboPoint = envTable.ComboPoints [i]\n                \n                if (i <= comboPoints ) then\n                    --combo point enabled\n                    if (not thisComboPoint.IsActive) then\n                        thisComboPoint.ShowAnimation:Play()\n                        thisComboPoint.IsActive = true\n                        \n                    end\n                    \n                else\n                    --combo point disabled\n                    if (thisComboPoint.IsActive) then\n                        thisComboPoint.HideAnimation:Play()\n                        thisComboPoint.IsActive = false\n                        \n                    end\n                end\n            end\n            \n            \n        end\n        \n        function envTable.UpdateComboPointAmount()\n            local namePlateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat[1]\n            local comboPoints = UnitPowerMax (\"player\", Enum.PowerType.ComboPoints)\n            local reservedSpace = namePlateWidth / comboPoints\n            \n            --store the total amount of combo points\n            envTable.TotalComboPoints = comboPoints\n            \n            --update anchor frame\n            envTable.ComboPointFrame:SetWidth (namePlateWidth)\n            envTable.ComboPointFrame:SetHeight (20)\n            envTable.ComboPointFrame:ClearAllPoints()\n            for i = 1, #anchors do\n                local anchor = anchors[i]\n                envTable.ComboPointFrame:SetPoint (unpack (anchor))\n            end        \n            \n            --\n            for i = 1, #envTable.ComboPoints do\n                envTable.ComboPoints[i]:Hide()\n                envTable.ComboPoints[i]:ClearAllPoints()\n            end\n            \n            for i = 1, comboPoints do\n                local comboPoint = envTable.ComboPoints[i]\n                comboPoint:SetPoint (\"left\", envTable.ComboPointFrame, \"left\", reservedSpace * (i-1), 0)\n                comboPoint:Show()\n            end\n            \n            envTable.LastUpdate = GetTime()\n            \n            envTable.UpdateComboPoints()\n        end\n        \n        --initialize\n        envTable.UpdateComboPointAmount()\n        envTable.ComboPointFrame:Hide()\n    end\n    \n    \nend",
						},
						["PlaterCore"] = 1,
						["Time"] = 1548354524,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
								["Enabled"] = true,
								["DRUID"] = true,
								["ROGUE"] = true,
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["race"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
								[103] = true,
								["Enabled"] = true,
							},
						},
						["LastHookEdited"] = "",
						["url"] = "",
						["Icon"] = 135426,
						["Name"] = "Combo Points [Plater]",
					}, -- [10]
					{
						["Enabled"] = false,
						["Revision"] = 93,
						["semver"] = "",
						["HooksTemp"] = {
						},
						["Author"] = "Izimode-Azralon",
						["version"] = -1,
						["Desc"] = "Changes the target color to the color set in the constructor script.",
						["Hooks"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
							["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --usage: color name e.g \"red\" \"yellow\"; color table e.g {1, 0, 0} {1, 1, 0}; hex string e.g. \"#FF0000\" \"FFFF00\"\n    \n    envTable.TargetColor = \"purple\"\n    --envTable.TargetColor = \"#FF00FF\"\n    --envTable.TargetColor = {252/255, 0/255, 254/255}\n    \n    function envTable.UpdateColor (unitFrame)\n        --do not change the color of the personal bar\n        if (not unitFrame.IsSelf) then\n            \n            --if this nameplate the current target of the player?\n            if (unitFrame.namePlateIsTarget) then\n                Plater.SetNameplateColor (unitFrame, envTable.TargetColor)  --rgb\n            else\n                --refresh the nameplate color\n                Plater.RefreshNameplateColor (unitFrame)\n            end\n        end\n    end\n    \nend\n\n\n\n\n",
						},
						["PlaterCore"] = 1,
						["Time"] = 1552354619,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["race"] = {
							},
							["pvptalent"] = {
							},
							["role"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["LastHookEdited"] = "",
						["url"] = "",
						["Icon"] = 878211,
						["Name"] = "Current Target Color [Plater]",
					}, -- [11]
					{
						["Enabled"] = false,
						["Revision"] = 295,
						["Options"] = {
						},
						["HooksTemp"] = {
						},
						["Time"] = 1596741775,
						["Author"] = "Ditador-Azralon",
						["Name"] = "Aura Reorder [Plater]",
						["Desc"] = "Reorder buffs and debuffs following the settings set in the constructor.",
						["Hooks"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auraContainers = {unitFrame.BuffFrame.PlaterBuffList}\n    \n    if (Plater.db.profile.buffs_on_aura2) then\n        auraContainers [2] = unitFrame.BuffFrame2.PlaterBuffList\n    end\n    \n    for containerID = 1, #auraContainers do\n        \n        local auraContainer = auraContainers [containerID]\n        local aurasShown = {}\n        local aurasDuplicated = {}\n        \n        --build the list of auras shown in the buff frame and check for each aura priority\n        --also check if the consolidate (stack) auras with the same name is enabled\n        for index, auraIcon in ipairs (auraContainer) do\n            if (auraIcon:IsShown()) then\n                if (envTable.consolidadeRepeatedAuras) then\n                    --is this aura already shown?\n                    local iconShownIndex = aurasDuplicated [auraIcon.SpellName]\n                    if (iconShownIndex) then\n                        --get the table with information about the shown icon\n                        local auraShownTable = aurasShown [iconShownIndex]\n                        --get the icon already in the table\n                        local icon = auraShownTable[1]\n                        --increase the amount of stacks\n                        auraShownTable[3] = auraShownTable[3] + 1\n                        \n                        --check if the remaining time of the icon already added in the table is lower than the current\n                        if (auraIcon.RemainingTime > icon.RemainingTime) then\n                            --replace the icon for the icon with bigger duration\n                            auraShownTable[1] = auraIcon\n                            icon:Hide()\n                        else\n                            auraIcon:Hide()\n                        end\n                    else    \n                        local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                        tinsert (aurasShown, {auraIcon, priority, 1}) --icon frame, priority, stack amount\n                        aurasDuplicated [auraIcon.SpellName] = #aurasShown\n                    end\n                else\n                    --not stacking similar auras\n                    local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                    tinsert (aurasShown, {auraIcon, priority})\n                    \n                end           \n            end\n        end\n        \n        --sort auras by priority\n        table.sort (aurasShown, DetailsFramework.SortOrder2)\n        \n        local growDirection\n        if (containerID == 1) then --debuff container\n            growDirection = Plater.db.profile.aura_grow_direction\n            --force to grow to right if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 3\n            end\n            -- \"Left\", \"Center\", \"Right\" - 1  2  3\n            \n        elseif (containerID == 2) then --buff container\n            growDirection = Plater.db.profile.aura2_grow_direction\n            --force to grow to left if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 1\n            end\n            \n        end\n        \n        local padding = envTable.padding\n        local framersPerRow = envTable.maxAurasPerRow + 1\n        local horizontalLength = (-padding or 0)\n        \n        --first icon is where the row starts\n        local firstIcon = aurasShown[1] and aurasShown[1][1]\n        \n        if (firstIcon) then\n            local anchorPoint = firstIcon:GetParent() --anchor point is the BuffFrame\n            anchorPoint:SetSize (1, 1)\n            \n            --> left to right\n            if (growDirection == 3) then\n                --> iterate among all aura icons\n                for i = 1, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == 1) then\n                        auraIcon:SetPoint (\"bottomleft\", anchorPoint, \"bottomleft\", 0, 0)\n                    elseif (i % framersPerRow == 0) then\n                        auraIcon:SetPoint (\"bottomleft\", firstIcon, \"topleft\", 0, envTable.rowPadding or 0)\n                        framersPerRow = framersPerRow + framersPerRow\n                    else\n                        auraIcon:SetPoint (\"topleft\", aurasShown [i-1][1], \"topright\", padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                    \n                    horizontalLength = horizontalLength + auraIcon:GetWidth() + padding\n                end\n                \n                --right to left\n            elseif (growDirection == 1) then\n                --> iterate among all aura icons\n                for i = 1, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == 1) then\n                        auraIcon:SetPoint (\"bottomright\", anchorPoint, \"bottomright\", 0, 0)\n                    elseif (i % framersPerRow == 0) then\n                        auraIcon:SetPoint (\"bottomright\", firstIcon, \"topright\", 0, envTable.rowPadding or 0)\n                        framersPerRow = framersPerRow + framersPerRow\n                    else\n                        auraIcon:SetPoint (\"topright\", aurasShown [i-1][1], \"topleft\", -padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                    \n                    horizontalLength = horizontalLength + auraIcon:GetWidth() + padding\n                end                    \n            end\n            \n            --set the size of the buff frame\n            anchorPoint:SetWidth (horizontalLength)\n            anchorPoint:SetHeight (firstIcon:GetHeight())\n            \n        end\n    end\nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --ATTENTION: after enabling this script, you may have to adjust the anchor point at the Buff Settings tab\n    \n    --space between each aura icon\n    envTable.padding = 2\n    \n    --space between each row of icons\n    envTable.rowPadding = 12\n    \n    --amount of icons in the row, it'll breakline and start a new row after reach the threshold\n    envTable.maxAurasPerRow = 5\n    \n    --stack auras of the same name that arent stacked by default from the game\n    envTable.consolidadeRepeatedAuras = true    \n    \n    --which auras goes first, assign a value (any number), bigger value goes first\n    envTable.priority = {\n        [\"Vampiric Touch\"] = 50,\n        [\"Shadow Word: Pain\"] = 22,\n        [\"Mind Flay\"] = 5,\n    }\n    \nend \n\n\n\n\n",
						},
						["PlaterCore"] = 1,
						["version"] = -1,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["race"] = {
							},
							["pvptalent"] = {
							},
							["role"] = {
							},
							["affix"] = {
							},
							["encounter_ids"] = {
							},
							["spec"] = {
							},
						},
						["LastHookEdited"] = "",
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_reorder",
						["semver"] = "",
					}, -- [12]
				},
				["aura_x_offset"] = 0,
				["first_run3"] = true,
				["captured_spells"] = {
					[264689] = {
						["event"] = "SPELL_AURA_APPLIED",
						["type"] = "DEBUFF",
						["source"] = "Wingzjk",
						["npcID"] = 0,
					},
					[186401] = {
						["event"] = "SPELL_AURA_APPLIED",
						["type"] = "BUFF",
						["source"] = "Lôuk",
						["npcID"] = 0,
					},
					[328136] = {
						["event"] = "SPELL_AURA_APPLIED",
						["type"] = "BUFF",
						["source"] = "Lôuk",
						["npcID"] = 0,
					},
					[272903] = {
						["event"] = "SPELL_AURA_APPLIED",
						["type"] = "BUFF",
						["source"] = "Wingzjk",
						["npcID"] = 0,
					},
					[52127] = {
						["event"] = "SPELL_AURA_APPLIED",
						["type"] = "BUFF",
						["source"] = "Jukéz",
						["npcID"] = 0,
					},
					[31884] = {
						["event"] = "SPELL_AURA_APPLIED",
						["type"] = "BUFF",
						["source"] = "Wingzjk",
						["npcID"] = 0,
					},
					[43308] = {
						["event"] = "SPELL_AURA_APPLIED",
						["type"] = "BUFF",
						["source"] = "Jukéz",
						["npcID"] = 0,
					},
					[270661] = {
						["event"] = "SPELL_AURA_APPLIED",
						["type"] = "BUFF",
						["source"] = "Wingzjk",
						["npcID"] = 0,
					},
					[465] = {
						["event"] = "SPELL_AURA_APPLIED",
						["type"] = "BUFF",
						["source"] = "Wingzjk",
						["npcID"] = 0,
					},
					[294966] = {
						["event"] = "SPELL_AURA_APPLIED",
						["type"] = "BUFF",
						["source"] = "Wingzjk",
						["npcID"] = 0,
					},
					[269279] = {
						["event"] = "SPELL_AURA_APPLIED",
						["type"] = "BUFF",
						["source"] = "Lôuk",
						["npcID"] = 0,
					},
					[24723] = {
						["event"] = "SPELL_AURA_APPLIED",
						["type"] = "BUFF",
						["source"] = "Jukéz",
						["npcID"] = 0,
					},
					[172010] = {
						["event"] = "SPELL_AURA_APPLIED",
						["type"] = "BUFF",
						["source"] = "Jukéz",
						["npcID"] = 0,
					},
					[164273] = {
						["event"] = "SPELL_AURA_APPLIED",
						["type"] = "BUFF",
						["source"] = "Selixa",
						["npcID"] = 0,
					},
				},
				["OptionsPanelDB"] = {
					["PlaterOptionsPanelFrame"] = {
						["scale"] = 1,
					},
				},
				["ui_parent_scale_tune"] = 1.406249965948519,
				["aura2_y_offset"] = 5,
				["login_counter"] = 1,
				["number_region_first_run"] = true,
				["patch_version"] = 12,
				["script_auto_imported"] = {
					["Cast - Small Alert"] = 4,
					["Unit - Important"] = 5,
					["Aura - Buff Alert"] = 4,
					["Cast - Very Important"] = 2,
					["Explosion Affix M+"] = 3,
					["Aura - Debuff Alert"] = 3,
					["Cast - Frontal Cone"] = 2,
					["Fixate"] = 3,
					["Aura - Blink Time Left"] = 1,
					["Cast - Big Alert"] = 5,
					["Fixate On You"] = 2,
				},
				["aura_y_offset"] = 5,
			},
			[key] = {
				["target_shady_combat_only"] = false,
				["script_data"] = {
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = false --change to true to change the color\n    envTable.NameplateColor = \"pink\"\n    envTable.NameplateSizeOffset = 6 --increase the nameplate height by this value\n    envTable.GlowAlpha = 0.5 --amount of alpha in the outside glow effect\n    \n    --create a glow effect around the nameplate\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar, envTable.NameplateColor)\n    envTable.glowEffect:SetOffset (-27, 25, 9, -11)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() --\n    \n    --set the glow effect alpha\n    envTable.glowEffect:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n--[=[\nUsing spellIDs for multi-language support\n\n135029 - A Knot of Snakes (Temple of Sethraliss)\n135388 - A Knot of Snakes (Temple of Sethraliss)\n134612 - Grasping Tentacles (Shrine of the Storm)\n133361 - Wasting Servant (Waycrest Manor)\n136330 - Soul Thorns (Waycrest Manor)\n130896 - Blackout Barrel (Freehold)\n129758 - Irontide Grenadier (Freehold)\n131009 - Spirit of Gold (Atal`Dazar)\n--]=]",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \nend\n\n\n",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \nend\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
						["Time"] = 1586435139,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)    \n    --change the nameplate color to this if allowed\n    envTable.CanChangeNameplateColor = false --change to true to change the color\n    envTable.NameplateColor = \"pink\"\n    envTable.NameplateSizeOffset = 6 --increase the nameplate height by this value\n    envTable.GlowAlpha = 0.5 --amount of alpha in the outside glow effect\n    \n    --create a glow effect around the nameplate\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar, envTable.NameplateColor)\n    envTable.glowEffect:SetOffset (-27, 25, 9, -11)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() --\n    \n    --set the glow effect alpha\n    envTable.glowEffect:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n--[=[\nUsing spellIDs for multi-language support\n\n135029 - A Knot of Snakes (Temple of Sethraliss)\n135388 - A Knot of Snakes (Temple of Sethraliss)\n134612 - Grasping Tentacles (Shrine of the Storm)\n133361 - Wasting Servant (Waycrest Manor)\n136330 - Soul Thorns (Waycrest Manor)\n130896 - Blackout Barrel (Freehold)\n129758 - Irontide Grenadier (Freehold)\n131009 - Spirit of Gold (Atal`Dazar)\n--]=]",
						["Icon"] = 135996,
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    --restore the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)    \n    \nend\n\n\n",
						["Revision"] = 159,
						["Author"] = "Izimode-Azralon",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \nend\n\n\n",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can change the nameplate color\n    if (envTable.CanChangeNameplateColor) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n",
						["Name"] = "Unit - Important [Plater]",
						["PlaterCore"] = 1,
						["Enabled"] = true,
						["NpcNames"] = {
							"135029", -- [1]
							"134388", -- [2]
							"134612", -- [3]
							"133361", -- [4]
							"136330", -- [5]
							"130896", -- [6]
							"129758", -- [7]
							"Healing Tide Totem", -- [8]
							"131009", -- [9]
						},
						["SpellIds"] = {
						},
						["Desc"] = "Highlight a nameplate of an important Add. Add the unit name or NpcID into the trigger box to add more.",
					}, -- [1]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self)\n    \nend",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Hide()\n    \nend",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Show()\n    \nend",
						["ScriptType"] = 1,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
						["Time"] = 1581355344,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.buffIconGlow = envTable.buffIconGlow or Plater.CreateIconGlow (self)\n    \nend",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Hide()\n    \nend",
						["Revision"] = 401,
						["Author"] = "Tercioo-Sylvanas",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.buffIconGlow:Show()\n    \nend",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \n    \nend",
						["Name"] = "Aura - Buff Alert [Plater]",
						["PlaterCore"] = 1,
						["Enabled"] = true,
						["NpcNames"] = {
						},
						["SpellIds"] = {
							275826, -- [1]
							272888, -- [2]
							272659, -- [3]
							267901, -- [4]
							267830, -- [5]
							265393, -- [6]
						},
						["Desc"] = "Add the buff name in the trigger box.",
					}, -- [2]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.8 --0.8\n    local CONFIG_BORDER_GLOW_ALPHA = 0.3 --0.3\n    local CONFIG_SHAKE_DURATION = 0.2 --0.2\n    local CONFIG_SHAKE_AMPLITUDE = 5 --5\n    \n    --create a glow effect in the border of the cast bar\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (self)\n    envTable.glowEffect:SetOffset (-32, 30, 7, -9)\n    envTable.glowEffect:SetAlpha (CONFIG_BORDER_GLOW_ALPHA)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, CONFIG_SHAKE_DURATION, CONFIG_SHAKE_AMPLITUDE, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))    \n    \n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)\n    fadeOut:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = CONFIG_SHAKE_AMPLITUDE\n    envTable.FrameShake.OriginalDuration = CONFIG_SHAKE_DURATION  \n    \nend",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \nend\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["Time"] = 1583332051,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.8 --0.8\n    local CONFIG_BORDER_GLOW_ALPHA = 0.3 --0.3\n    local CONFIG_SHAKE_DURATION = 0.2 --0.2\n    local CONFIG_SHAKE_AMPLITUDE = 5 --5\n    \n    --create a glow effect in the border of the cast bar\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (self)\n    envTable.glowEffect:SetOffset (-32, 30, 7, -9)\n    envTable.glowEffect:SetAlpha (CONFIG_BORDER_GLOW_ALPHA)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+40, self:GetHeight()+20, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, 1)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, CONFIG_SHAKE_DURATION, CONFIG_SHAKE_AMPLITUDE, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))    \n    \n    \n    --update the config for the flash here so it wont need a /reload\n    fadeIn:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)\n    fadeOut:SetDuration (CONFIG_BACKGROUND_FLASH_DURATION/2)    \n    \n    --update the config for the skake here so it wont need a /reload\n    envTable.FrameShake.OriginalAmplitude = CONFIG_SHAKE_AMPLITUDE\n    envTable.FrameShake.OriginalDuration = CONFIG_SHAKE_DURATION  \n    \nend",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Hide()\n    \n    envTable.BackgroundFlash:Stop()\n    \n    unitFrame:StopFrameShake (envTable.FrameShake)    \n    \nend\n\n\n",
						["Revision"] = 399,
						["Author"] = "Bombad�o-Azralon",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    \n    envTable.BackgroundFlash:Play()\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \nend\n\n\n",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["Name"] = "Cast - Very Important [Plater]",
						["PlaterCore"] = 1,
						["Enabled"] = true,
						["NpcNames"] = {
						},
						["SpellIds"] = {
							257785, -- [1]
							267237, -- [2]
							266951, -- [3]
							267273, -- [4]
							267433, -- [5]
							263066, -- [6]
							255577, -- [7]
							255371, -- [8]
							275671, -- [9]
							315932, -- [10]
						},
						["Desc"] = "Highlight a very important cast applying several effects into the Cast Bar. Add spell in the Add Trigger field.",
					}, -- [3]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.debuffIconGlow = envTable.debuffIconGlow or Plater.CreateIconGlow (self)\n    \nend\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Hide()\n    \nend\n\n\n",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Show()\n    \nend\n\n\n",
						["ScriptType"] = 1,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["Time"] = 1581355344,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --creates a glow around the icon\n    envTable.debuffIconGlow = envTable.debuffIconGlow or Plater.CreateIconGlow (self)\n    \nend\n\n\n",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Hide()\n    \nend\n\n\n",
						["Revision"] = 234,
						["Author"] = "Tercioo-Sylvanas",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.debuffIconGlow:Show()\n    \nend\n\n\n",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["Name"] = "Aura - Debuff Alert [Plater]",
						["PlaterCore"] = 1,
						["Enabled"] = true,
						["NpcNames"] = {
						},
						["SpellIds"] = {
						},
						["Desc"] = "Add the debuff name in the trigger box.",
					}, -- [4]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --https://www.wowhead.com/spell=253583/fiery-enchant\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = \"darkorange\"\n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.4\n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = 5\n    \n    \n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, 0.2, 5, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()        \n    \nend\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    --restore the cast bar to its original height\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n        envTable.OriginalHeight = nil\n    end\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \nend\n\n\n\n\n\n",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \nend\n\n\n\n\n\n\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["Time"] = 1583332048,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --https://www.wowhead.com/spell=253583/fiery-enchant\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --castbar color (when can be interrupted)\n    envTable.CastbarColor = \"darkorange\"\n    --flash duration\n    local CONFIG_BACKGROUND_FLASH_DURATION = 0.4\n    --add this value to the cast bar height\n    envTable.CastBarHeightAdd = 5\n    \n    \n    \n    --create a fast flash above the cast bar\n    envTable.FullBarFlash = envTable.FullBarFlash or Plater.CreateFlash (self, 0.05, 1, \"white\")\n    \n    --create a camera shake for the nameplate\n    envTable.FrameShake = Plater:CreateFrameShake (unitFrame, 0.2, 5, 35, false, false, 0, 1, 0.05, 0.1, Plater.GetPoints (unitFrame))\n    \n    --create a texture to use for a flash behind the cast bar\n    local backGroundFlashTexture = Plater:CreateImage (self, [[Interface\\ACHIEVEMENTFRAME\\UI-Achievement-Alert-Glow]], self:GetWidth()+60, self:GetHeight()+50, \"background\", {0, 400/512, 0, 170/256})\n    backGroundFlashTexture:SetBlendMode (\"ADD\")\n    backGroundFlashTexture:SetPoint (\"center\", self, \"center\")\n    backGroundFlashTexture:Hide()\n    \n    --create the animation hub to hold the flash animation sequence\n    envTable.BackgroundFlash = envTable.BackgroundFlash or Plater:CreateAnimationHub (backGroundFlashTexture, \n        function()\n            backGroundFlashTexture:Show()\n        end,\n        function()\n            backGroundFlashTexture:Hide()\n        end\n    )\n    \n    --create the flash animation sequence\n    local fadeIn = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 1, CONFIG_BACKGROUND_FLASH_DURATION/2, 0, .75)\n    local fadeOut = Plater:CreateAnimation (envTable.BackgroundFlash, \"ALPHA\", 2, CONFIG_BACKGROUND_FLASH_DURATION/2, 1, 0)    \n    --envTable.BackgroundFlash:Play() --envTable.BackgroundFlash:Stop()        \n    \nend\n\n\n",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end    \n    \n    --restore the cast bar to its original height\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n        envTable.OriginalHeight = nil\n    end\n    \n    --stop the camera shake\n    unitFrame:StopFrameShake (envTable.FrameShake)\n    \n    envTable.FullBarFlash:Stop()\n    envTable.BackgroundFlash:Stop()\n    \nend\n\n\n\n\n\n",
						["Revision"] = 582,
						["Author"] = "Tercioo-Sylvanas",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --don't execute on battlegrounds and arenas\n    if (Plater.ZoneInstanceType == \"arena\" or Plater.ZoneInstanceType == \"pvp\") then\n        return\n    end\n    \n    --play flash animations\n    envTable.FullBarFlash:Play()\n    \n    --restoring the default size (not required since it already restore in the hide script)\n    if (envTable.OriginalHeight) then\n        self:SetHeight (envTable.OriginalHeight)\n    end\n    \n    --increase the cast bar size\n    local height = self:GetHeight()\n    envTable.OriginalHeight = height\n    \n    self:SetHeight (height + envTable.CastBarHeightAdd)\n    \n    Plater.SetCastBarBorderColor (self, 1, .2, .2, 0.4)\n    \n    unitFrame:PlayFrameShake (envTable.FrameShake)\n    \n    --set the color of the cast bar to dark orange (only if can be interrupted)\n    --Plater auto set this color to default when a new cast starts, no need to reset this value at OnHide.    \n    if (envTable._CanInterrupt) then\n        self:SetStatusBarColor (Plater:ParseColors (envTable.CastbarColor))\n    end\n    \n    envTable.BackgroundFlash:Play()\n    \nend\n\n\n\n\n\n\n\n\n",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["Name"] = "Cast - Big Alert [Plater]",
						["PlaterCore"] = 1,
						["Enabled"] = true,
						["NpcNames"] = {
						},
						["SpellIds"] = {
							258153, -- [1]
							258313, -- [2]
							257069, -- [3]
							274569, -- [4]
							278020, -- [5]
							261635, -- [6]
							272700, -- [7]
							280404, -- [8]
							268030, -- [9]
							265368, -- [10]
							263891, -- [11]
							264520, -- [12]
							265407, -- [13]
							278567, -- [14]
							278602, -- [15]
							258128, -- [16]
							257791, -- [17]
							258938, -- [18]
							265089, -- [19]
							272183, -- [20]
							256060, -- [21]
							257397, -- [22]
							257899, -- [23]
							269972, -- [24]
							270901, -- [25]
							270492, -- [26]
							268129, -- [27]
							268709, -- [28]
							263215, -- [29]
							268797, -- [30]
							262540, -- [31]
							262554, -- [32]
							253517, -- [33]
							255041, -- [34]
							252781, -- [35]
							250368, -- [36]
							258777, -- [37]
							317165, -- [38]
						},
						["Desc"] = "Flash, Bounce and Red Color the CastBar border when when an important cast is happening. Add spell in the Add Trigger field.",
					}, -- [5]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = 0.6\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    \n    \nend\n\n\n\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \nend\n\n\n",
						["Time"] = 1583332050,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (you may need /reload if some configs isn't applied immediately)\n    \n    --flash duration\n    local CONFIG_FLASH_DURATION = 0.6\n    \n    --manually create a new texture for the flash animation\n    if (not envTable.SmallFlashTexture) then\n        envTable.SmallFlashTexture = envTable.SmallFlashTexture or Plater:CreateImage (unitFrame.castBar)\n        envTable.SmallFlashTexture:SetColorTexture (1, 1, 1)\n        envTable.SmallFlashTexture:SetAllPoints()\n    end\n    \n    --manually create a flash animation using the framework\n    if (not envTable.SmallFlashAnimationHub) then \n        \n        local onPlay = function()\n            envTable.SmallFlashTexture:Show()\n        end\n        \n        local onFinished = function()\n            envTable.SmallFlashTexture:Hide()\n        end\n        \n        local animationHub = Plater:CreateAnimationHub (envTable.SmallFlashTexture, onPlay, onFinished)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 1, CONFIG_FLASH_DURATION/2, 0, .6)\n        Plater:CreateAnimation (animationHub, \"Alpha\", 2, CONFIG_FLASH_DURATION/2, 1, 0)\n        \n        envTable.SmallFlashAnimationHub = animationHub\n    end\n    \n    \n    \nend\n\n\n\n\n\n\n\n",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Stop()\n    \nend\n\n\n",
						["Revision"] = 380,
						["Author"] = "Tercioo-Sylvanas",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.SmallFlashAnimationHub:Play()\n    \nend\n\n\n",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    \nend\n\n\n",
						["Name"] = "Cast - Small Alert [Plater]",
						["PlaterCore"] = 1,
						["Enabled"] = true,
						["NpcNames"] = {
						},
						["SpellIds"] = {
							275192, -- [1]
							265912, -- [2]
							274438, -- [3]
							268317, -- [4]
							268375, -- [5]
							276767, -- [6]
							264105, -- [7]
							265876, -- [8]
							270464, -- [9]
							266106, -- [10]
							272180, -- [11]
							278961, -- [12]
							278755, -- [13]
							265468, -- [14]
							256405, -- [15]
							256897, -- [16]
							264101, -- [17]
							280604, -- [18]
							268702, -- [19]
							281621, -- [20]
							262515, -- [21]
							255824, -- [22]
							253583, -- [23]
							250096, -- [24]
						},
						["Desc"] = "Flashes the Cast Bar when a spell in the trigger list is Cast. Add spell in the Add Trigger field.",
					}, -- [6]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color to set the nameplate\n    envTable.NameplateColor = \"gray\"\n    \nend\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["ScriptType"] = 1,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --only change the nameplate color in combat\n    if (InCombatLockdown()) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n\n\n",
						["Time"] = 1581355377,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color to set the nameplate\n    envTable.NameplateColor = \"gray\"\n    \nend\n\n\n",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_invalid",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["Revision"] = 112,
						["Author"] = "Izimode-Azralon",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --only change the nameplate color in combat\n    if (InCombatLockdown()) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end\n    \nend\n\n\n\n\n\n\n",
						["Name"] = "Aura - Invalidate Unit [Plater]",
						["PlaterCore"] = 1,
						["Enabled"] = true,
						["NpcNames"] = {
						},
						["SpellIds"] = {
							261265, -- [1]
							261266, -- [2]
							271590, -- [3]
						},
						["Desc"] = "When an aura makes the unit invulnarable and you don't want to attack it. Add spell in the Add Trigger field.",
					}, -- [7]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    do\n        \n        --change the nameplate color to this color\n        --can use color names: \"red\", \"yellow\"\n        --can use color hex: \"#FF0000\", \"#FFFF00\"\n        --con use color table: {1, 0, 0}, {1, 1, 0}\n        \n        envTable.Color = \"blue\"\n        \n        --if true, it'll replace the health info with the unit name\n        envTable.ReplaceHealthWithName = false\n        \n        --use flash when the unit is shown in the screen\n        envTable.FlashNameplate = true\n        \n    end\n    \n    --private:\n    do\n        --create a flash for when the unit if shown\n        envTable.smallFlash = envTable.smallFlash or Plater.CreateFlash (unitFrame.healthBar, 0.15, 1, envTable.Color)\n        \n    end\n    \nend\n\n--[=[\n\nNpc IDS:\n\n141851: Spawn of G'Huun on Mythic Dungeons\n\n\n--]=]\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --make plater refresh the nameplate color\n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallFlash:Stop()\n    \nend\n\n\n",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
						["ScriptType"] = 1,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --adjust the nameplate color\n    Plater.SetNameplateColor (unitFrame, envTable.Color)\n    \n    --check if can replace the health amount with the unit name\n    if (envTable.ReplaceHealthWithName) then\n        \n        local healthPercent = format (\"%.1f\", unitFrame.healthBar.CurrentHealth / unitFrame.healthBar.CurrentHealthMax *100)\n        \n        unitFrame.healthBar.lifePercent:SetText (unitFrame.namePlateUnitName .. \"  (\" .. healthPercent  .. \"%)\")\n        \n    end\n    \nend\n\n\n",
						["Time"] = 1586435143,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    do\n        \n        --change the nameplate color to this color\n        --can use color names: \"red\", \"yellow\"\n        --can use color hex: \"#FF0000\", \"#FFFF00\"\n        --con use color table: {1, 0, 0}, {1, 1, 0}\n        \n        envTable.Color = \"blue\"\n        \n        --if true, it'll replace the health info with the unit name\n        envTable.ReplaceHealthWithName = false\n        \n        --use flash when the unit is shown in the screen\n        envTable.FlashNameplate = true\n        \n    end\n    \n    --private:\n    do\n        --create a flash for when the unit if shown\n        envTable.smallFlash = envTable.smallFlash or Plater.CreateFlash (unitFrame.healthBar, 0.15, 1, envTable.Color)\n        \n    end\n    \nend\n\n--[=[\n\nNpc IDS:\n\n141851: Spawn of G'Huun on Mythic Dungeons\n\n\n--]=]\n\n\n\n\n",
						["Icon"] = 135024,
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --make plater refresh the nameplate color\n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallFlash:Stop()\n    \nend\n\n\n",
						["Revision"] = 76,
						["Author"] = "Izimode-Azralon",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --adjust the nameplate color\n    Plater.SetNameplateColor (unitFrame, envTable.Color)\n    \n    --check if can replace the health amount with the unit name\n    if (envTable.ReplaceHealthWithName) then\n        \n        local healthPercent = format (\"%.1f\", unitFrame.healthBar.CurrentHealth / unitFrame.healthBar.CurrentHealthMax *100)\n        \n        unitFrame.healthBar.lifePercent:SetText (unitFrame.namePlateUnitName .. \"  (\" .. healthPercent  .. \"%)\")\n        \n    end\n    \nend\n\n\n",
						["Name"] = "Color Change [Plater]",
						["PlaterCore"] = 1,
						["Enabled"] = true,
						["NpcNames"] = {
							"Iron-willed Enforcer", -- [1]
						},
						["SpellIds"] = {
						},
						["Desc"] = "Add a unitID or unit name in 'Add Trigger' entry. See the constructor script for options.",
					}, -- [8]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = true --set to 'false' to disable blinks\n        envTable.GlowEnabled = true --set to 'false' to disable glows\n        envTable.ChangeNameplateColor = true; --set to 'true' to enable nameplate color change\n        envTable.TimeLeftToBlink = 4.5; --in seconds, affects the blink effect only\n        envTable.BlinkSpeed = 1.0; --time to complete a blink loop\n        envTable.BlinkColor = \"white\"; --color of the blink\n        envTable.BlinkMaxAlpha = 0.50; --max transparency in the animation loop (1.0 is full opaque)\n        envTable.NameplateColor = \"darkred\"; --nameplate color if ChangeNameplateColor is true\n        \n        --text color\n        envTable.TimerColorEnabled = true --set to 'false' to disable changes in the color of the time left text\n        envTable.TimeLeftWarning = 8.0; --in seconds, affects the color of the text\n        envTable.TimeLeftCritical = 3.0; --in seconds, affects the color of the text    \n        envTable.TextColor_Warning = \"yellow\"; --color when the time left entered in a warning zone\n        envTable.TextColor_Critical = \"red\"; --color when the time left is critical\n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        \n        envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
						["ScriptType"] = 1,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
						["Time"] = 1583332036,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings (require a /reload after editing any setting)\n    do\n        --blink and glow\n        envTable.BlinkEnabled = true --set to 'false' to disable blinks\n        envTable.GlowEnabled = true --set to 'false' to disable glows\n        envTable.ChangeNameplateColor = true; --set to 'true' to enable nameplate color change\n        envTable.TimeLeftToBlink = 4.5; --in seconds, affects the blink effect only\n        envTable.BlinkSpeed = 1.0; --time to complete a blink loop\n        envTable.BlinkColor = \"white\"; --color of the blink\n        envTable.BlinkMaxAlpha = 0.50; --max transparency in the animation loop (1.0 is full opaque)\n        envTable.NameplateColor = \"darkred\"; --nameplate color if ChangeNameplateColor is true\n        \n        --text color\n        envTable.TimerColorEnabled = true --set to 'false' to disable changes in the color of the time left text\n        envTable.TimeLeftWarning = 8.0; --in seconds, affects the color of the text\n        envTable.TimeLeftCritical = 3.0; --in seconds, affects the color of the text    \n        envTable.TextColor_Warning = \"yellow\"; --color when the time left entered in a warning zone\n        envTable.TextColor_Critical = \"red\"; --color when the time left is critical\n        \n        --list of spellIDs to ignore\n        envTable.IgnoredSpellID = {\n            [12] = true, --use a simple comma here\n            [13] = true,\n        }\n    end\n    \n    \n    --private\n    do\n        envTable.blinkTexture = Plater:CreateImage (self, \"\", 1, 1, \"overlay\")\n        envTable.blinkTexture:SetPoint ('center', 0, 0)\n        envTable.blinkTexture:Hide()\n        \n        local onPlay = function()\n            envTable.blinkTexture:Show() \n            envTable.blinkTexture.color = envTable.BlinkColor\n        end\n        local onStop = function()\n            envTable.blinkTexture:Hide()  \n        end\n        envTable.blinkAnimation = Plater:CreateAnimationHub (envTable.blinkTexture, onPlay, onStop)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 1, envTable.BlinkSpeed / 2, 0, envTable.BlinkMaxAlpha)\n        Plater:CreateAnimation (envTable.blinkAnimation, \"ALPHA\", 2, envTable.BlinkSpeed / 2, envTable.BlinkMaxAlpha, 0)\n        \n        envTable.glowEffect = envTable.glowEffect or Plater.CreateIconGlow (self)\n        --envTable.glowEffect:Show() --envTable.glowEffect:Hide()\n        \n    end\n    \nend\n\n\n\n\n",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_blink",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.blinkAnimation:Stop()\n    envTable.blinkTexture:Hide()\n    envTable.blinkAnimation:Stop()\n    envTable.glowEffect:Stop()\n    Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\nend\n\n\n",
						["Revision"] = 167,
						["Author"] = "Izimode-Azralon",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.blinkTexture:SetSize (self:GetSize())\n    \nend\n\n\n",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    local timeLeft = envTable._RemainingTime\n    \n    --check if the spellID isn't being ignored\n    if (envTable.IgnoredSpellID [envTable._SpellID]) then\n        return\n    end\n    \n    --check the time left and start or stop the blink animation and also check if the time left is > zero\n    if ((envTable.BlinkEnabled or envTable.GlowEnabled) and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftToBlink) then\n            --blink effect\n            if (envTable.BlinkEnabled) then\n                if (not envTable.blinkAnimation:IsPlaying()) then\n                    envTable.blinkAnimation:Play()\n                end\n            end\n            --glow effect\n            if (envTable.GlowEnabled) then\n                envTable.glowEffect:Show()\n            end\n            --nameplate color\n            if (envTable.ChangeNameplateColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n            end\n        else\n            --blink effect\n            if (envTable.blinkAnimation:IsPlaying()) then\n                envTable.blinkAnimation:Stop()\n            end\n            --glow effect\n            if (envTable.GlowEnabled and envTable.glowEffect:IsShown()) then\n                envTable.glowEffect:Hide()\n            end\n        end\n    end\n    \n    --timer color\n    if (envTable.TimerColorEnabled and timeLeft > 0) then\n        if (timeLeft < envTable.TimeLeftCritical) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Critical)\n        elseif (timeLeft < envTable.TimeLeftWarning) then\n            Plater:SetFontColor (self.Cooldown.Timer, envTable.TextColor_Warning)        \n        else\n            Plater:SetFontColor (self.Cooldown.Timer, Plater.db.profile.aura_timer_text_color)\n        end\n    end\n    \nend",
						["Name"] = "Aura - Blink by Time Left [Plater]",
						["PlaterCore"] = 1,
						["Enabled"] = false,
						["NpcNames"] = {
						},
						["SpellIds"] = {
						},
						["Desc"] = "Blink, change the number and nameplate color. Add the debuffs int he trigger box. Set settings on constructor script.",
					}, -- [9]
					{
						["ConstructorCode"] = "--gray lines are comments and doesn't affect the code\n\n--1) add the aura you want by typing its name or spellID into the \"Add Trigger\" and click the \"Add\" button.\n--2) the border will use the default color set below, to a custom color type aura name and the color you want in the BorderColorByAura table.\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --default color if the aura name isn't found in the Color By Aura table below\n    envTable.DefaultBorderColor = \"orange\"\n    \n    --transparency, affect all borders\n    envTable.BorderAlpha = 1.0\n    \n    --add the aura name and the color, \n    envTable.BorderColorByAura = {\n        \n        --examples:\n        --[\"Aura Name\"] = \"yellow\", --using regular aura name | using the name of the color\n        --[\"aura name\"] = \"#FFFF00\", --using lower case in the aura name |using html #hex for the color\n        --[54214] = {1, 1, 0}, --using the spellID instead of the name | using rgb table (0 to 1) for the color\n        --color table uses zero to one values: 255 = 1.0, 127 = 0.5, orange color = {1, 0.7, 0}\n        \n        --add your custom border colors below:\n        \n        [\"Aura Name\"] = {1, .5, 0}, --example to copy/paste\n        \n    }\n    \n    \nend\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --reset the border color\n    self:SetBackdropBorderColor (0, 0, 0, 0)\n    \nend\n\n\n",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the aura name in lower case\n    local auraLowerName = string.lower (envTable._SpellName)\n    \n    --attempt to get a custom color added by the user in the constructor script\n    local hasCustomBorderColor = envTable.BorderColorByAura [auraLowerName] or envTable.BorderColorByAura [envTable._SpellName] or envTable.BorderColorByAura [envTable._SpellID]\n    \n    --save the custom color\n    envTable.CustomBorderColor = hasCustomBorderColor\n    \nend\n\n\n",
						["ScriptType"] = 1,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the custom color added by the user or the default color\n    local color = envTable.CustomBorderColor or envTable.DefaultBorderColor\n    --parse the color since it can be a color name, hex or color table\n    local r, g, b = DetailsFramework:ParseColors (color)\n    \n    --set the border color\n    self:SetBackdropBorderColor (r, g, b, envTable.BorderAlpha)\n    \nend\n\n\n\n\n",
						["Time"] = 1571333938,
						["Temp_ConstructorCode"] = "--gray lines are comments and doesn't affect the code\n\n--1) add the aura you want by typing its name or spellID into the \"Add Trigger\" and click the \"Add\" button.\n--2) the border will use the default color set below, to a custom color type aura name and the color you want in the BorderColorByAura table.\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --default color if the aura name isn't found in the Color By Aura table below\n    envTable.DefaultBorderColor = \"orange\"\n    \n    --transparency, affect all borders\n    envTable.BorderAlpha = 1.0\n    \n    --add the aura name and the color, \n    envTable.BorderColorByAura = {\n        \n        --examples:\n        --[\"Aura Name\"] = \"yellow\", --using regular aura name | using the name of the color\n        --[\"aura name\"] = \"#FFFF00\", --using lower case in the aura name |using html #hex for the color\n        --[54214] = {1, 1, 0}, --using the spellID instead of the name | using rgb table (0 to 1) for the color\n        --color table uses zero to one values: 255 = 1.0, 127 = 0.5, orange color = {1, 0.7, 0}\n        \n        --add your custom border colors below:\n        \n        [\"Aura Name\"] = {1, .5, 0}, --example to copy/paste\n        \n    }\n    \n    \nend\n\n\n\n\n",
						["Icon"] = 133006,
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --reset the border color\n    self:SetBackdropBorderColor (0, 0, 0, 0)\n    \nend\n\n\n",
						["Revision"] = 46,
						["Author"] = "Izimode-Azralon",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the aura name in lower case\n    local auraLowerName = string.lower (envTable._SpellName)\n    \n    --attempt to get a custom color added by the user in the constructor script\n    local hasCustomBorderColor = envTable.BorderColorByAura [auraLowerName] or envTable.BorderColorByAura [envTable._SpellName] or envTable.BorderColorByAura [envTable._SpellID]\n    \n    --save the custom color\n    envTable.CustomBorderColor = hasCustomBorderColor\n    \nend\n\n\n",
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the custom color added by the user or the default color\n    local color = envTable.CustomBorderColor or envTable.DefaultBorderColor\n    --parse the color since it can be a color name, hex or color table\n    local r, g, b = DetailsFramework:ParseColors (color)\n    \n    --set the border color\n    self:SetBackdropBorderColor (r, g, b, envTable.BorderAlpha)\n    \nend\n\n\n\n\n",
						["Name"] = "Aura - Border Color [Plater]",
						["PlaterCore"] = 1,
						["Enabled"] = false,
						["SpellIds"] = {
						},
						["Desc"] = "Add a border to an aura icon. Add the aura into the Add Trigger entry. You can customize the icon color at the constructor script.",
						["NpcNames"] = {
						},
					}, -- [10]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);\nend\n\n--[=[\n\n\n--]=]",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount.text = \"\" .. UnitPower (unitId);\nend\n\n\n",
						["Time"] = 1586435149,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount = Plater:CreateLabel (unitFrame, \"\", 16, \"silver\");\n    envTable.EnergyAmount:SetPoint (\"bottom\", unitFrame, \"top\", 0, 18);\nend\n\n--[=[\n\n\n--]=]",
						["Icon"] = 136048,
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Hide()\nend\n\n\n",
						["Revision"] = 133,
						["Author"] = "Celian-Sylvanas",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount:Show()\nend\n\n\n",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.EnergyAmount.text = \"\" .. UnitPower (unitId);\nend\n\n\n",
						["Name"] = "UnitPower [Plater]",
						["PlaterCore"] = 1,
						["Enabled"] = true,
						["NpcNames"] = {
							"Guardian of Yogg-Saron", -- [1]
						},
						["SpellIds"] = {
						},
						["Desc"] = "Show the energy amount above the nameplate",
					}, -- [11]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.movingArrow = envTable.movingArrow or Plater:CreateImage (self, [[Interface\\PETBATTLES\\PetBattle-StatIcons]], 16, self:GetHeight(), \"background\", {0, 15/32, 18/32, 30/32})\n    \n    envTable.movingArrow:SetAlpha (0.275)\n    --envTable.movingArrow:SetDesaturated (true)\n    \n    envTable.movingAnimation = envTable.movingAnimation or Plater:CreateAnimationHub (envTable.movingArrow, \n        function() \n            envTable.movingArrow:Show() \n            envTable.movingArrow:SetPoint(\"left\", 0, 0)\n        end, \n        function() envTable.movingArrow:Hide() end)\n    \n    envTable.movingAnimation:SetLooping (\"REPEAT\")\n    \n    local animation = Plater:CreateAnimation (envTable.movingAnimation, \"translation\", 1, 0.2, self:GetWidth()-16, 0)\n    \n    \n    \nend\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Stop()\nend\n\n\n",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Play()\nend\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "		function (self, unitId, unitFrame, envTable)\n			\n		end\n	",
						["Time"] = 1583332049,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.movingArrow = envTable.movingArrow or Plater:CreateImage (self, [[Interface\\PETBATTLES\\PetBattle-StatIcons]], 16, self:GetHeight(), \"background\", {0, 15/32, 18/32, 30/32})\n    \n    envTable.movingArrow:SetAlpha (0.275)\n    --envTable.movingArrow:SetDesaturated (true)\n    \n    envTable.movingAnimation = envTable.movingAnimation or Plater:CreateAnimationHub (envTable.movingArrow, \n        function() \n            envTable.movingArrow:Show() \n            envTable.movingArrow:SetPoint(\"left\", 0, 0)\n        end, \n        function() envTable.movingArrow:Hide() end)\n    \n    envTable.movingAnimation:SetLooping (\"REPEAT\")\n    \n    local animation = Plater:CreateAnimation (envTable.movingAnimation, \"translation\", 1, 0.2, self:GetWidth()-16, 0)\n    \n    \n    \nend\n\n\n",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\cast_bar",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Stop()\nend\n\n\n",
						["Revision"] = 177,
						["Author"] = "Izimode-Azralon",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.movingAnimation:Play()\nend\n\n\n",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "		function (self, unitId, unitFrame, envTable)\n			\n		end\n	",
						["Name"] = "Cast - Frontal Cone [Plater]",
						["PlaterCore"] = 1,
						["Enabled"] = true,
						["NpcNames"] = {
						},
						["SpellIds"] = {
							255952, -- [1]
							257426, -- [2]
							274400, -- [3]
							272609, -- [4]
							269843, -- [5]
							269029, -- [6]
							272827, -- [7]
							269266, -- [8]
							263912, -- [9]
							264923, -- [10]
							258864, -- [11]
							256955, -- [12]
							265540, -- [13]
							260793, -- [14]
							270003, -- [15]
							270507, -- [16]
							257337, -- [17]
							268415, -- [18]
							275907, -- [19]
							268865, -- [20]
							260669, -- [21]
							260280, -- [22]
							253239, -- [23]
							265541, -- [24]
							250258, -- [25]
						},
						["Desc"] = "Does an animation for casts that affect the frontal area of the enemy. Add spell in the Add Trigger field.",
					}, -- [12]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \nend\n\n\n\n\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Show();\n    envTable.FixateIcon:Show();\n    \nend\n\n\n",
						["ScriptType"] = 1,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n    end    \nend\n\n\n",
						["Time"] = 1583331418,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.BuffFrame, \"top\", 0, 10);    \n    \n    envTable.FixateIcon = Plater:CreateImage (unitFrame, 236188, 16, 16, \"overlay\");\n    envTable.FixateIcon:SetPoint (\"bottom\", envTable.FixateTarget, \"top\", 0, 4);    \n    \nend\n\n\n\n\n\n\n\n\n",
						["Icon"] = 1029718,
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Hide()\n    envTable.FixateIcon:Hide()\nend\n\n\n",
						["Revision"] = 191,
						["Author"] = "Celian-Sylvanas",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:Show();\n    envTable.FixateIcon:Show();\n    \nend\n\n\n",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    local targetName = UnitName (unitId .. \"target\");\n    if (targetName) then\n        local _, class = UnitClass (unitId .. \"target\");\n        targetName = Plater.SetTextColorByClass (unitId .. \"target\", targetName);\n        envTable.FixateTarget.text = targetName;\n    end    \nend\n\n\n",
						["Name"] = "Fixate [Plater]",
						["PlaterCore"] = 1,
						["Enabled"] = true,
						["NpcNames"] = {
						},
						["SpellIds"] = {
							272584, -- [1]
							244653, -- [2]
						},
						["Desc"] = "Show above the nameplate who is the player fixated",
					}, -- [13]
					{
						["ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [268074] = \"Dark Purpose\", --G'huun Mythic Add\n        [260954] = \"Iron Gaze\", --Sergeant Bainbridge - Siege of Boralus\n        [257739] = \"Blind Rage\", --Blacktooth Scrapper - Freehold\n        [257314] = \"Black Powder Bomb\", --Irontide Grenadier - Freehold\n        [266107] = \"Thirst For Blood\", --Feral Bloodswarmer - The Underrot\n        [257582] = \"Raging Gaze\", --Earthrager - The MOTHERLODE!!\n        [262377] = \"Seek and Destroy\", --Crawler Mine - The MOTHERLODE!!\n        [257407] = \"Pursuit\", --Rezan - Atal'Dazar\n        --[] = \"\" --       \n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Time"] = 1581355341,
						["Temp_ConstructorCode"] = "--todo: add npc ids for multilanguage support\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.TextAboveNameplate = \"** On You **\"\n    envTable.NameplateColor = \"green\"\n    \n    --label to show the text above the nameplate\n    envTable.FixateTarget = Plater:CreateLabel (unitFrame);\n    envTable.FixateTarget:SetPoint (\"bottom\", unitFrame.healthBar, \"top\", 0, 30);\n    \n    --the spell casted by the npc in the trigger list needs to be in the list below as well\n    local spellList = {\n        [268074] = \"Dark Purpose\", --G'huun Mythic Add\n        [260954] = \"Iron Gaze\", --Sergeant Bainbridge - Siege of Boralus\n        [257739] = \"Blind Rage\", --Blacktooth Scrapper - Freehold\n        [257314] = \"Black Powder Bomb\", --Irontide Grenadier - Freehold\n        [266107] = \"Thirst For Blood\", --Feral Bloodswarmer - The Underrot\n        [257582] = \"Raging Gaze\", --Earthrager - The MOTHERLODE!!\n        [262377] = \"Seek and Destroy\", --Crawler Mine - The MOTHERLODE!!\n        [257407] = \"Pursuit\", --Rezan - Atal'Dazar\n        --[] = \"\" --       \n        \n    }\n    \n    --build the list with localized spell names\n    envTable.FixateDebuffs = {}\n    for spellID, enUSSpellName in pairs (spellList) do\n        local localizedSpellName = GetSpellInfo (spellID)\n        envTable.FixateDebuffs [localizedSpellName or enUSSpellName] = true\n    end\n    \n    --debug - smuggled crawg\n    envTable.FixateDebuffs [\"Jagged Maw\"] = true\n    \nend\n\n--[=[\nNpcIDs:\n136461: Spawn of G'huun (mythic uldir G'huun)\n\n--]=]\n\n\n\n\n",
						["Icon"] = 841383,
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.FixateTarget:SetText (\"\")\n    envTable.FixateTarget:Hide()\n    \n    envTable.IsFixated = false\n    \n    Plater.RefreshNameplateColor (unitFrame)\nend\n\n\n",
						["Revision"] = 197,
						["Author"] = "Tecno-Azralon",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \nend\n\n\n",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --swap this to true when it is fixated\n    local isFixated = false\n    \n    --check the debuffs the player has and see if any of these debuffs has been placed by this unit\n    for debuffId = 1, 40 do\n        local name, texture, count, debuffType, duration, expirationTime, caster = UnitDebuff (\"player\", debuffId)\n        \n        --cancel the loop if there's no more debuffs on the player\n        if (not name) then \n            break \n        end\n        \n        --check if the owner of the debuff is this unit\n        if (envTable.FixateDebuffs [name] and caster and UnitIsUnit (caster, unitId)) then\n            --the debuff the player has, has been placed by this unit, set the name above the unit name\n            envTable.FixateTarget:SetText (envTable.TextAboveNameplate)\n            envTable.FixateTarget:Show()\n            Plater.SetNameplateColor (unitFrame,  envTable.NameplateColor)\n            isFixated = true\n            \n            if (not envTable.IsFixated) then\n                envTable.IsFixated = true\n                Plater.FlashNameplateBody (unitFrame, \"fixate\", .2)\n            end\n        end\n        \n    end\n    \n    --check if the nameplate color is changed but isn't fixated any more\n    if (not isFixated and envTable.IsFixated) then\n        --refresh the nameplate color\n        Plater.RefreshNameplateColor (unitFrame)\n        --reset the text\n        envTable.FixateTarget:SetText (\"\")\n        \n        envTable.IsFixated = false\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Name"] = "Fixate On You [Plater]",
						["PlaterCore"] = 1,
						["Enabled"] = false,
						["NpcNames"] = {
							"smuggled crawg", -- [1]
							"sergeant bainbridge", -- [2]
							"blacktooth scrapper", -- [3]
							"irontide grenadier", -- [4]
							"feral bloodswarmer", -- [5]
							"earthrager", -- [6]
							"crawler mine", -- [7]
							"rezan", -- [8]
							"136461", -- [9]
						},
						["SpellIds"] = {
							"spawn of g'huun", -- [1]
							"smuggled crawg", -- [2]
							"sergeant bainbridge", -- [3]
							"blacktooth scrapper", -- [4]
							"irontide grenadier", -- [5]
							"feral bloodswarmer", -- [6]
							"earthrager", -- [7]
							"crawler mine", -- [8]
							"rezan", -- [9]
						},
						["Desc"] = "When an enemy places a debuff and starts to chase you. This script changes the nameplate color and place your name above the nameplate as well.",
					}, -- [14]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    do\n        \n        --change the nameplate color to this color\n        --can use color names: \"red\", \"yellow\"\n        --can use color hex: \"#FF0000\", \"#FFFF00\"\n        --con use color table: {1, 0, 0}, {1, 1, 0}\n        \n        envTable.Color = \"green\"\n        \n        --if true, it'll replace the health info with the unit name\n        envTable.ReplaceHealthWithName = false\n        \n        --use flash when the unit is shown in the screen\n        envTable.FlashNameplate = true\n        \n    end\n    \n    --private:\n    do\n        --create a flash for when the unit if shown\n        envTable.smallFlash = envTable.smallFlash or Plater.CreateFlash (unitFrame.healthBar, 0.15, 1, envTable.Color)\n        \n    end\n    \nend\n\n--[=[\n\nNpc IDS:\n\n141851: Spawn of G'Huun on Mythic Dungeons\n\n\n--]=]\n\n\n\n\nPlater.SetNameplateSize (unitFrame, width, height)Plater.SetNameplateColor (unitFrame, color)Plater.SetNameplateSize (unitFrame, width, height)Plater.SetNameplateColor (unitFrame, color)",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --make plater refresh the nameplate color\n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallFlash:Stop()\n    \nend\n\n\n",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    PlaySoundFile(\"569593\",  \"Master\")\n    \nend\n\n\n\n\n\n\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    Plater.SetNameplateColor (unitFrame, \"green\")\n    \n    \n    \nend\n\n\n",
						["Time"] = 1586435148,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    do\n        \n        --change the nameplate color to this color\n        --can use color names: \"red\", \"yellow\"\n        --can use color hex: \"#FF0000\", \"#FFFF00\"\n        --con use color table: {1, 0, 0}, {1, 1, 0}\n        \n        envTable.Color = \"green\"\n        \n        --if true, it'll replace the health info with the unit name\n        envTable.ReplaceHealthWithName = false\n        \n        --use flash when the unit is shown in the screen\n        envTable.FlashNameplate = true\n        \n    end\n    \n    --private:\n    do\n        --create a flash for when the unit if shown\n        envTable.smallFlash = envTable.smallFlash or Plater.CreateFlash (unitFrame.healthBar, 0.15, 1, envTable.Color)\n        \n    end\n    \nend\n\n--[=[\n\nNpc IDS:\n\n141851: Spawn of G'Huun on Mythic Dungeons\n\n\n--]=]\n\n\n\n\nPlater.SetNameplateSize (unitFrame, width, height)Plater.SetNameplateColor (unitFrame, color)Plater.SetNameplateSize (unitFrame, width, height)Plater.SetNameplateColor (unitFrame, color)",
						["Icon"] = 135024,
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --make plater refresh the nameplate color\n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallFlash:Stop()\n    \nend\n\n\n",
						["Revision"] = 145,
						["Author"] = "Izimode-Azralon",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    PlaySoundFile(\"569593\",  \"Master\")\n    \nend\n\n\n\n\n\n\n\n\n",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    Plater.SetNameplateColor (unitFrame, \"green\")\n    \n    \n    \nend\n\n\n",
						["Name"] = "Algan Color",
						["PlaterCore"] = 1,
						["Enabled"] = false,
						["NpcNames"] = {
							"Wayward Algan", -- [1]
							"Lost Algan", -- [2]
						},
						["SpellIds"] = {
						},
						["Desc"] = "Add a unitID or unit name in 'Add Trigger' entry. See the constructor script for options.",
					}, -- [15]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    --insert code here\n    \nend",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    --insert code here\n    Plater.RefreshNameplateColor (unitFrame)\nend",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    --insert code here\n    \nend\n\n\n",
						["ScriptType"] = 1,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    --insert code here\n    local health = UnitHealth(unitId)\n    local healthMax = UnitHealthMax(unitId)\n    local pct = health/healthMax\n    local stacks = envTable._StackCount\n    local stackPct = stacks/30\n    \n    if  (stacks<20 and stackPct-0.2<pct) or stacks<10 then\n        Plater.SetNameplateColor (unitFrame, 0,0,1)\n    else        \n        Plater.RefreshNameplateColor (unitFrame)\n    end\n    \n    \n    \nend",
						["Time"] = 1586435148,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    --insert code here\n    \nend",
						["Icon"] = 1129420,
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    --insert code here\n    Plater.RefreshNameplateColor (unitFrame)\nend",
						["Revision"] = 83,
						["Author"] = "Nnogga-Tarren Mill",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    --insert code here\n    \nend\n\n\n",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    --insert code here\n    local health = UnitHealth(unitId)\n    local healthMax = UnitHealthMax(unitId)\n    local pct = health/healthMax\n    local stacks = envTable._StackCount\n    local stackPct = stacks/30\n    \n    if  (stacks<20 and stackPct-0.2<pct) or stacks<10 then\n        Plater.SetNameplateColor (unitFrame, 0,0,1)\n    else        \n        Plater.RefreshNameplateColor (unitFrame)\n    end\n    \n    \n    \nend",
						["Name"] = "Zaqun Stacks Low",
						["PlaterCore"] = 1,
						["Enabled"] = true,
						["NpcNames"] = {
						},
						["SpellIds"] = {
							300635, -- [1]
						},
						["Desc"] = "",
					}, -- [16]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = 3\n    envTable.GlowAlpha = .45\n    envTable.ShowArrow = true\n    envTable.ArrowAlpha = .45    \n    envTable.HealthBarColor = \"blue\"\n    \n    --custom frames\n    --envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    --envTable.glowEffect:SetOffset (-27, 25, 6, -8)\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 32\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\CastingBar\\UI-CastingBar-Spark]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = 8\n    envTable.topArrow.height = 8\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    --envTable.glowEffect:Hide()\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    -- envTable.glowEffect:Show()\n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 32\n    \n    --envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \n    \nend\n\n\n\n\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-16, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \n    --update the health bar color coloring from yellow to red\n    --Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    \n    Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\n    --envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n\n",
						["Time"] = 1586015698,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = 3\n    envTable.GlowAlpha = .45\n    envTable.ShowArrow = true\n    envTable.ArrowAlpha = .45    \n    envTable.HealthBarColor = \"blue\"\n    \n    --custom frames\n    --envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    --envTable.glowEffect:SetOffset (-27, 25, 6, -8)\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 32\n    envTable.overlaySpark.height = 36\n    envTable.overlaySpark.alpha = .9\n    envTable.overlaySpark.texture = [[Interface\\CastingBar\\UI-CastingBar-Spark]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = 8\n    envTable.topArrow.height = 8\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 2, 0.075, 1, 1, 0.95, 0.95)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend\n\n\n\n\n\n\n\n",
						["Icon"] = 2175503,
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    --envTable.glowEffect:Hide()\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight)\nend\n\n\n",
						["Revision"] = 356,
						["Author"] = "Bombad�o-Azralon",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    -- envTable.glowEffect:Show()\n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    unitFrame.healthBar:SetHeight (nameplateHeight + envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 32\n    \n    --envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \n    \nend\n\n\n\n\n\n\n",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-16, 0)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100) - 4, 2 )\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \n    --update the health bar color coloring from yellow to red\n    --Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    \n    Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\n    --envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n\n",
						["Name"] = "Explosion Affix M+ [Plater]",
						["PlaterCore"] = 1,
						["Enabled"] = false,
						["NpcNames"] = {
						},
						["SpellIds"] = {
							240446, -- [1]
							273577, -- [2]
						},
						["Desc"] = "Apply several animations when the explosion orb cast starts on a Mythic Dungeon with Explosion Affix",
					}, -- [17]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    do\n        \n        --change the nameplate color to this color\n        --can use color names: \"red\", \"yellow\"\n        --can use color hex: \"#FF0000\", \"#FFFF00\"\n        --con use color table: {1, 0, 0}, {1, 1, 0}\n        \n        envTable.Color = \"yellow\"\n        \n        --if true, it'll replace the health info with the unit name\n        envTable.ReplaceHealthWithName = false\n        \n        --use flash when the unit is shown in the screen\n        envTable.FlashNameplate = true\n        \n    end\n    \n    --private:\n    do\n        --create a flash for when the unit if shown\n        envTable.smallFlash = envTable.smallFlash or Plater.CreateFlash (unitFrame.healthBar, 0.15, 1, envTable.Color)\n        \n    end\n    \nend\n\n--[=[\n\nNpc IDS:\n\n141851: Spawn of G'Huun on Mythic Dungeons\n\n\n--]=]\n\n\n\n\n",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --make plater refresh the nameplate color\n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallFlash:Stop()\n    \nend\n\n\n",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
						["ScriptType"] = 3,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --adjust the nameplate color\n    Plater.SetNameplateColor (unitFrame, envTable.Color)\n    \n    --check if can replace the health amount with the unit name\n    if (envTable.ReplaceHealthWithName) then\n        \n        local healthPercent = format (\"%.1f\", unitFrame.healthBar.CurrentHealth / unitFrame.healthBar.CurrentHealthMax *100)\n        \n        unitFrame.healthBar.lifePercent:SetText (unitFrame.namePlateUnitName .. \"  (\" .. healthPercent  .. \"%)\")\n        \n    end\n    \nend\n\n\n",
						["Time"] = 1586435146,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    do\n        \n        --change the nameplate color to this color\n        --can use color names: \"red\", \"yellow\"\n        --can use color hex: \"#FF0000\", \"#FFFF00\"\n        --con use color table: {1, 0, 0}, {1, 1, 0}\n        \n        envTable.Color = \"yellow\"\n        \n        --if true, it'll replace the health info with the unit name\n        envTable.ReplaceHealthWithName = false\n        \n        --use flash when the unit is shown in the screen\n        envTable.FlashNameplate = true\n        \n    end\n    \n    --private:\n    do\n        --create a flash for when the unit if shown\n        envTable.smallFlash = envTable.smallFlash or Plater.CreateFlash (unitFrame.healthBar, 0.15, 1, envTable.Color)\n        \n    end\n    \nend\n\n--[=[\n\nNpc IDS:\n\n141851: Spawn of G'Huun on Mythic Dungeons\n\n\n--]=]\n\n\n\n\n",
						["Icon"] = 135024,
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --make plater refresh the nameplate color\n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallFlash:Stop()\n    \nend\n\n\n",
						["Revision"] = 84,
						["Author"] = "Izimode-Azralon",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if can flash the nameplate\n    if (envTable.FlashNameplate) then\n        envTable.smallFlash:Play()\n    end\n    \nend\n\n\n\n\n\n\n\n\n",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --adjust the nameplate color\n    Plater.SetNameplateColor (unitFrame, envTable.Color)\n    \n    --check if can replace the health amount with the unit name\n    if (envTable.ReplaceHealthWithName) then\n        \n        local healthPercent = format (\"%.1f\", unitFrame.healthBar.CurrentHealth / unitFrame.healthBar.CurrentHealthMax *100)\n        \n        unitFrame.healthBar.lifePercent:SetText (unitFrame.namePlateUnitName .. \"  (\" .. healthPercent  .. \"%)\")\n        \n    end\n    \nend\n\n\n",
						["Name"] = "Color Change [Plater]",
						["PlaterCore"] = 1,
						["Enabled"] = true,
						["NpcNames"] = {
							"Spellbound Ritualist", -- [1]
						},
						["SpellIds"] = {
						},
						["Desc"] = "Add a unitID or unit name in 'Add Trigger' entry. See the constructor script for options.",
					}, -- [18]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["OnHideCode"] = "		function (self, unitId, unitFrame, envTable, scriptTable)\n			--insert code here\n			\n		end\n	",
						["Temp_OnShowCode"] = "		function (self, unitId, unitFrame, envTable, scriptTable)\n			--insert code here\n			\n		end\n	",
						["ScriptType"] = 1,
						["UpdateCode"] = "		function (self, unitId, unitFrame, envTable, scriptTable)\n			--insert code here\n			\n		end\n	",
						["Time"] = 1583331173,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable, scriptTable)\n    --insert code here\n    \nend\n\n\n",
						["NpcNames"] = {
						},
						["Temp_OnHideCode"] = "		function (self, unitId, unitFrame, envTable, scriptTable)\n			--insert code here\n			\n		end\n	",
						["Revision"] = 2,
						["Author"] = "Fragdh-Mythic Dungeon Heroes - EU",
						["Initialization"] = "		function (scriptTable)\n			--insert code here\n			\n		end\n	",
						["OnShowCode"] = "		function (self, unitId, unitFrame, envTable, scriptTable)\n			--insert code here\n			\n		end\n	",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "		function (self, unitId, unitFrame, envTable, scriptTable)\n			--insert code here\n			\n		end\n	",
						["Name"] = "New Script",
						["PlaterCore"] = 1,
						["Enabled"] = false,
						["Temp_Initialization"] = "		function (scriptTable)\n			--insert code here\n			\n		end\n	",
						["SpellIds"] = {
						},
						["Desc"] = "",
					}, -- [19]
					{
						["ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = 2.5\n    envTable.GlowAlpha = 1\n    envTable.ShowArrow = true\n    envTable.ArrowAlpha = 1    \n    envTable.HealthBarColor = \"blue\"\n    \n    --custom frames\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    envTable.glowEffect:SetOffset (-26, 25, 10, -13)\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 32\n    envTable.overlaySpark.alpha = 1\n    envTable.overlaySpark.texture = [[Interface\\CastingBar\\UI-CastingBar-Spark]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = 15\n    envTable.topArrow.height = 15\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend",
						["OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.glowEffect:Hide()\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --decrease the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    local nameplateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat [1]\n    Plater.SetNameplateSize (unitFrame, nameplateWidth, nameplateHeight)\nend\n\n\n",
						["Temp_OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    local nameplateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat [1]\n    Plater.SetNameplateSize (unitFrame, nameplateWidth, nameplateHeight*envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 60\n    \n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["ScriptType"] = 2,
						["UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the health bar color coloring from yellow to red\n    -- Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    --Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-8, -2)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-6, 2)\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \nend\n\n\n",
						["Time"] = 1586015742,
						["Temp_ConstructorCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.NameplateSizeOffset = 2.5\n    envTable.GlowAlpha = 1\n    envTable.ShowArrow = true\n    envTable.ArrowAlpha = 1    \n    envTable.HealthBarColor = \"blue\"\n    \n    --custom frames\n    envTable.glowEffect = envTable.glowEffect or Plater.CreateNameplateGlow (unitFrame.healthBar)\n    --envTable.glowEffect:Show() --envTable.glowEffect:Hide() \n    envTable.glowEffect:SetOffset (-26, 25, 10, -13)\n    \n    --creates the spark to show the cast progress inside the health bar\n    envTable.overlaySpark = envTable.overlaySpark or Plater:CreateImage (unitFrame.healthBar)\n    envTable.overlaySpark:SetBlendMode (\"ADD\")\n    envTable.overlaySpark.width = 16\n    envTable.overlaySpark.height = 32\n    envTable.overlaySpark.alpha = 1\n    envTable.overlaySpark.texture = [[Interface\\CastingBar\\UI-CastingBar-Spark]]\n    \n    envTable.topArrow = envTable.topArrow or Plater:CreateImage (unitFrame.healthBar)\n    envTable.topArrow:SetBlendMode (\"ADD\")\n    envTable.topArrow.width = 15\n    envTable.topArrow.height = 15\n    envTable.topArrow.alpha = envTable.ArrowAlpha\n    envTable.topArrow.texture = [[Interface\\BUTTONS\\Arrow-Down-Up]]\n    \n    --scale animation\n    envTable.smallScaleAnimation = envTable.smallScaleAnimation or Plater:CreateAnimationHub (unitFrame.healthBar)\n    Plater:CreateAnimation (envTable.smallScaleAnimation, \"SCALE\", 1, 0.075, 1, 1, 1.08, 1.08)    \n    --envTable.smallScaleAnimation:Play() --envTable.smallScaleAnimation:Stop()\n    \nend",
						["Icon"] = "INTERFACE\\ICONS\\INV_wildfireBomb",
						["Temp_OnHideCode"] = "function (self, unitId, unitFrame, envTable)\n    envTable.glowEffect:Hide()\n    \n    envTable.overlaySpark:Hide()\n    envTable.topArrow:Hide()\n    \n    Plater.RefreshNameplateColor (unitFrame)\n    \n    envTable.smallScaleAnimation:Stop()\n    \n    --decrease the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    local nameplateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat [1]\n    Plater.SetNameplateSize (unitFrame, nameplateWidth, nameplateHeight)\nend\n\n\n",
						["Revision"] = 840,
						["Author"] = "Bombad�o-Azralon",
						["OnShowCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.glowEffect:Show()\n    envTable.overlaySpark:Show()\n    \n    if (envTable.ShowArrow) then\n        envTable.topArrow:Show()\n    end\n    \n    Plater.FlashNameplateBorder (unitFrame, 0.05)   \n    Plater.FlashNameplateBody (unitFrame, \"\", 0.075)\n    \n    envTable.smallScaleAnimation:Play()\n    \n    --increase the nameplate size\n    local nameplateHeight = Plater.db.profile.plate_config.enemynpc.health_incombat [2]\n    local nameplateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat [1]\n    Plater.SetNameplateSize (unitFrame, nameplateWidth, nameplateHeight*envTable.NameplateSizeOffset)\n    \n    envTable.overlaySpark.height = nameplateHeight + 60\n    \n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						["Prio"] = 99,
						["Temp_UpdateCode"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the health bar color coloring from yellow to red\n    -- Plater.SetNameplateColor (unitFrame, max (envTable._CastPercent/100, .66), abs (envTable._CastPercent/100 - 1), 0, 1)\n    --Plater.SetNameplateColor (unitFrame, envTable.HealthBarColor)\n    envTable.glowEffect.Texture:SetAlpha (envTable.GlowAlpha)\n    \n    --update the percent\n    envTable.overlaySpark:SetPoint (\"left\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-8, -2)\n    \n    envTable.topArrow:SetPoint (\"bottomleft\", unitFrame.healthBar, \"topleft\", unitFrame.healthBar:GetWidth() * (envTable._CastPercent / 100)-6, 2)\n    \n    --forces the script to update on a 60Hz base\n    self.ThrottleUpdate = 0.016\n    \nend\n\n\n",
						["Name"] = "M+ Explosive [Plater]",
						["PlaterCore"] = 1,
						["Enabled"] = false,
						["NpcNames"] = {
						},
						["SpellIds"] = {
							240446, -- [1]
						},
						["Desc"] = "Apply several animations when the explosion orb cast starts on a Mythic Dungeon with Explosion Affix",
					}, -- [20]
				},
				["url"] = "https://wago.io/cfHuh8PGV/2",
				["cast_statusbar_fadein_time"] = 0.0099999997764826,
				["aura2_y_offset"] = 0.099990844726563,
				["castbar_framelevel"] = 0,
				["buffs_on_aura2"] = true,
				["cast_statusbar_color_nointerrupt"] = {
					1, -- [1]
					0, -- [2]
					0.12156862745098, -- [3]
					0.96000000089407, -- [4]
				},
				["first_run2"] = true,
				["npc_cache"] = {
					["83681"] = {
						"Buzzing Venomfly", -- [1]
						"Ashran", -- [2]
					},
					["129527"] = {
						"Bilge Rat Buccaneer", -- [1]
						"Freehold", -- [2]
					},
					["56862"] = {
						"Drunken Hozen Brawler", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["139677"] = {
						"Depth-Caller", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["136208"] = {
						"Stromgarde Arbalest", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["138471"] = {
						"Obsidian Wyrmguard", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["146320"] = {
						"Prelate Za'lan", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["138623"] = {
						"Amathet Archer", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["126642"] = {
						"Sandyback Crab", -- [1]
						"Siege of Boralus", -- [2]
					},
					["104246"] = {
						"Duskwatch Guard", -- [1]
						"Court of Stars", -- [2]
					},
					["135240"] = {
						"Soul Essence", -- [1]
						"Waycrest Manor", -- [2]
					},
					["140327"] = {
						"Queen Stonehusk", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["155768"] = {
						"Squallbinder Mal'ur", -- [1]
						"The Eternal Palace", -- [2]
					},
					["137969"] = {
						"Interment Construct", -- [1]
						"Kings' Rest", -- [2]
					},
					["148622"] = {
						"Echo of Kimbul", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["79082"] = {
						"Mind Fungus", -- [1]
						"Highmaul", -- [2]
					},
					["76796"] = {
						"Heavy Spear", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["138559"] = {
						"Forgotten One", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["44261"] = {
						"Sharptalon Eagle", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["135002"] = {
						"Demonic Tyrant", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["123272"] = {
						"Saltfur Fish-Sticker", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["155098"] = {
						"Rexxar", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["24396"] = {
						"Forest Frog", -- [1]
						"Zul'Aman", -- [2]
					},
					["156523"] = {
						"Maut", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["118703"] = {
						"Felborne Botanist", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["137882"] = {
						"Northfold Arbalest", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["23597"] = {
						"Amani'shi Guardian", -- [1]
						"Zul'Aman", -- [2]
					},
					["148623"] = {
						"Echo of Gonk", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["97185"] = {
						"The Grimewalker", -- [1]
						"Maw of Souls", -- [2]
					},
					["140798"] = {
						"Cragcaw", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["61928"] = {
						"Sik'thik Guardian", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["101438"] = {
						"Vileshard Chunk", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["99645"] = {
						"Shadowmoon Technician", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["138557"] = {
						"Living Corruption", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["138837"] = {
						"Zara'thik Ambershaper", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["162508"] = {
						"Anubisath Sentinel", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["139486"] = {
						"Skycrack", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["151833"] = {
						"Wandering Soul", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["148624"] = {
						"Echo of Pa'ku", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["36597"] = {
						"The Lich King", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["129369"] = {
						"Irontide Raider", -- [1]
						"Siege of Boralus", -- [2]
					},
					["140447"] = {
						"Demolishing Terror", -- [1]
						"Siege of Boralus", -- [2]
					},
					["138830"] = {
						"Thorvast, Guided by the Stars", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["22847"] = {
						"Ashtongue Primalist", -- [1]
						"Black Temple", -- [2]
					},
					["83692"] = {
						"Panthran Pride", -- [1]
						"Ashran", -- [2]
					},
					["139468"] = {
						"Spineripper Ku-Kon", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["144300"] = {
						"Mechagon Citizen", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["139411"] = {
						"Many-Fangs", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["155813"] = {
						"Court Attendant", -- [1]
						"The Eternal Palace", -- [2]
					},
					["159308"] = {
						"Zealous Adherent", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["138843"] = {
						"Wingleader Srak'ik", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["135048"] = {
						"Gorestained Piglet", -- [1]
						"Waycrest Manor", -- [2]
					},
					["146890"] = {
						"Fleshrot Runeweaver", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["42692"] = {
						"Stonecore Bruiser", -- [1]
						"The Stonecore", -- [2]
					},
					["152311"] = {
						"Zanj'ir Myrmidon", -- [1]
						"The Eternal Palace", -- [2]
					},
					["148569"] = {
						"Breakwater Elemental", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["155767"] = {
						"Grul'taj", -- [1]
						"The Eternal Palace", -- [2]
					},
					["149535"] = {
						"Icebound Image", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["138624"] = {
						"Amathet Champion", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["153130"] = {
						"Greater Void Elemental", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["68174"] = {
						"Unbound Nightlord", -- [1]
						"Pursuing the Black Harvest", -- [2]
					},
					["11668"] = {
						"Firelord", -- [1]
						"Molten Core", -- [2]
					},
					["108359"] = {
						"Volatile Scorpid", -- [1]
						"The Nighthold", -- [2]
					},
					["158328"] = {
						"Il'gynoth", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["151028"] = {
						"Thornstalker Nydora", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["114526"] = {
						"Ghostly Understudy", -- [1]
						"Return to Karazhan", -- [2]
					},
					["132918"] = {
						"Spitefin Raider", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["158056"] = {
						"Rat", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["131574"] = {
						"Shimmerfin", -- [1]
						"The Eternal Palace", -- [2]
					},
					["140106"] = {
						"Deathsting Broodwatcher", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["130644"] = {
						"Daggertooth", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["157255"] = {
						"Aqir Drone", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["136890"] = {
						"Iron Orkas", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["161241"] = {
						"Voidweaver Mal'thir", -- [1]
						"Atal'Dazar", -- [2]
					},
					["139472"] = {
						"Stone-Lord Qinsho", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["135924"] = {
						"Molten Fury", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["141167"] = {
						"Lightbound Dragoon", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["129015"] = {
						"Southsea Third Mate", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["69791"] = {
						"Longwoman", -- [1]
						"Waycrest Manor", -- [2]
					},
					["155686"] = {
						"Azsh'ari Venomwatcher", -- [1]
						"The Eternal Palace", -- [2]
					},
					["151755"] = {
						"Shadehound", -- [1]
						"Emerald Dream - HoA Scenario", -- [2]
					},
					["78801"] = {
						"Darkshard Acidback", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["139813"] = {
						"Senior Producer Gixi", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["148673"] = {
						"Vessel of Bwonsamdi", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["59808"] = {
						"Shado-Pan Stormbringer", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["139438"] = {
						"Soul-Bringer Togan", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140152"] = {
						"Rotclaw Mauler", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["100393"] = {
						"Dread Felbat", -- [1]
						"The Arcway", -- [2]
					},
					["61339"] = {
						"Glintrok Oracle", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["146731"] = {
						"Zombie Dust Totem", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["59518"] = {
						"Bloated Brew Alemental", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["61216"] = {
						"Glintrok Hexxer", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["140377"] = {
						"Duneshell Harvester", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["139429"] = {
						"Stonebound Warrior", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["160405"] = {
						"Angry Treant Chair Spirit", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["138467"] = {
						"Obsidian Dragonkin", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["132919"] = {
						"Spitefin Behemoth", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["6500"] = {
						"PiouPiou", -- [1]
						"Eye of the Storm", -- [2]
					},
					["126919"] = {
						"Irontide Stormcaller", -- [1]
						"Freehold", -- [2]
					},
					["144611"] = {
						"Coralback Scuttler", -- [1]
						"The Eternal Palace", -- [2]
					},
					["111004"] = {
						"Gelatinized Decay", -- [1]
						"The Emerald Nightmare", -- [2]
					},
					["41948"] = {
						"Chromatic Prototype", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["129989"] = {
						"Irontide Powdershot", -- [1]
						"Siege of Boralus", -- [2]
					},
					["138446"] = {
						"Fathom-Caller Zelissa", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["138827"] = {
						"Bodalf the Strong", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["130299"] = {
						"Droplet", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["150139"] = {
						"K'thxx the Void Hunter", -- [1]
						"Uldir Scenario", -- [2]
					},
					["138831"] = {
						"Horvuld Oceanscythe", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["136823"] = {
						"Gulan Brute", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["135720"] = {
						"Moon-Touched Huntress", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["157366"] = {
						"Void Hunter", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["85705"] = {
						"Overgrown Jungleweed", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["138818"] = {
						"Bloodwake Warbringer", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["91000"] = {
						"Vileshard Hulk", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["136330"] = {
						"Soul Thorns", -- [1]
						"Waycrest Manor", -- [2]
					},
					["157613"] = {
						"Maw of Drest'agath", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["61243"] = {
						"Gekkan", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["138985"] = {
						"Old Grmgl", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["146253"] = {
						"Brother Joseph", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["140456"] = {
						"Bramblefur Musken", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["132893"] = {
						"Fire Spirit", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["136049"] = {
						"Algenon", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["138466"] = {
						"Obsidian Whelp", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["145242"] = {
						"Scalefiend", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["131089"] = {
						"Shadowblade Stalker", -- [1]
						"Atal'Dazar", -- [2]
					},
					["137059"] = {
						"Headshrinker Gaha", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["150396"] = {
						"Aerial Unit R-21/X", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["97172"] = {
						"Saltsea Droplet", -- [1]
						"Eye of Azshara", -- [2]
					},
					["140988"] = {
						"Steelshred", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["102232"] = {
						"Rockbound Trapper", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["147933"] = {
						"Geoactive Azershard", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["147374"] = {
						"Barrier", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["157231"] = {
						"Shad'har the Insatiable", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["128455"] = {
						"T'lonja", -- [1]
						"Atal'Dazar", -- [2]
					},
					["145976"] = {
						"Stonehide Bull", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["126205"] = {
						"Profit-O-Matic", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["136186"] = {
						"Tidesage Spiritualist", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["134173"] = {
						"Animated Droplet", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["136821"] = {
						"Gulan Sharphorn", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["138426"] = {
						"Fogsail Pirate", -- [1]
						"Siege of Boralus", -- [2]
					},
					["39626"] = {
						"Crimsonborne Warlord", -- [1]
						"Grim Batol", -- [2]
					},
					["138560"] = {
						"Faceless Horror", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["105706"] = {
						"Priestess of Misery", -- [1]
						"The Arcway", -- [2]
					},
					["22959"] = {
						"Spellbound Attendant", -- [1]
						"Black Temple", -- [2]
					},
					["146889"] = {
						"Fleshrot Deathwalker", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["43614"] = {
						"Lockmaw", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["133666"] = {
						"Dizzy's Decoy", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["136050"] = {
						"Gorestream", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["56927"] = {
						"Hozen Party Animal", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["140561"] = {
						"Brimstone Pup", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["140069"] = {
						"Rustpelt Wolf", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["148582"] = {
						"Stormbound Guardian", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["159266"] = {
						"Portal Master", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["140113"] = {
						"Venomlash", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["56395"] = {
						"Shado-Pan Novice", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["157150"] = {
						"Thomas Westmill", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["138986"] = {
						"Borgl the Seeker", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["144949"] = {
						"Canopy Stalker", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["101995"] = {
						"Festerface", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["148442"] = {
						"Gnomish Commando", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["140540"] = {
						"Kindleweb Clutchkeeper", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["158567"] = {
						"Tormented Kor'kron Annihilator", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["98384"] = {
						"Razormouth", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["127124"] = {
						"Freehold Barhand", -- [1]
						"Freehold", -- [2]
					},
					["157441"] = {
						"Void Wraith", -- [1]
						"Blackwing Descent Scenario", -- [2]
					},
					["138635"] = {
						"Commander Husan", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["111075"] = {
						"Chaotoid", -- [1]
						"The Nighthold", -- [2]
					},
					["139480"] = {
						"Stonebound Protector", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140986"] = {
						"Acidic Burrower", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["136869"] = {
						"Oomgut Ambusher", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["123818"] = {
						"Surf Darter", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["139430"] = {
						"Zaliz' Eternal Hound", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["157268"] = {
						"Crawling Corruption", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["139460"] = {
						"Stonebound Earthweaver", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["80411"] = {
						"Iron Marksman", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["135234"] = {
						"Diseased Mastiff", -- [1]
						"Waycrest Manor", -- [2]
					},
					["45467"] = {
						"Trogg Dweller", -- [1]
						"Grim Batol", -- [2]
					},
					["140453"] = {
						"Bramblefur Herdleader", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["158168"] = {
						"Dark Disciple", -- [1]
						"Halls of Origination", -- [2]
					},
					["155917"] = {
						"Azsh'ari Stormcaller", -- [1]
						"The Eternal Palace", -- [2]
					},
					["139875"] = {
						"Hollow Widow", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["154174"] = {
						"Horrific Summoner", -- [1]
						"The Eternal Palace", -- [2]
					},
					["91332"] = {
						"Stoneclaw Hunter", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["134947"] = {
						"Bristlethorn Broodqueen", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["150168"] = {
						"Toxic Monstrosity", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["151978"] = {
						"Waterstrider", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["132835"] = {
						"Dreadfang Snake", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["138393"] = {
						"Biter", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["138567"] = {
						"Shathhoth the Punisher", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["122086"] = {
						"Slitherblade Ironscale", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["23339"] = {
						"Illidari Heartseeker", -- [1]
						"Black Temple", -- [2]
					},
					["138980"] = {
						"Muckfin Raider", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["131431"] = {
						"Safety Inspection Bot", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["140334"] = {
						"Nightscale Coilfang", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["102584"] = {
						"Malignant Defiler", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["48338"] = {
						"Mine Bunny", -- [1]
						"Deadmines", -- [2]
					},
					["135235"] = {
						"Spectral Beastmaster", -- [1]
						"Kings' Rest", -- [2]
					},
					["138971"] = {
						"Zian-Ti Serpent", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["43537"] = {
						"Stonecore Earthshaper", -- [1]
						"The Stonecore", -- [2]
					},
					["156642"] = {
						"Enthralled Laborer", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["143985"] = {
						"Absorb-o-Tron", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["153141"] = {
						"Endless Hunger Totem", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["43324"] = {
						"Cho'gall", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["49681"] = {
						"Foe Reaper 5000", -- [1]
						"Deadmines", -- [2]
					},
					["141171"] = {
						"Lightbound Bulwark", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["140078"] = {
						"Knucklebump Gorilla", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["139406"] = {
						"Hassan the Bloody Scale", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["19668"] = {
						"Shadowfiend", -- [1]
						"The Eternal Palace", -- [2]
					},
					["140694"] = {
						"Gorgejaw the Glutton", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140058"] = {
						"Grizzlefur Patriarch", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["143306"] = {
						"Majestic Penguin", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["123271"] = {
						"Saltfur Stick-Thrower", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["138988"] = {
						"Mrgl-Eye", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["101075"] = {
						"Wormspeaker Devout", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["138569"] = {
						"Harbinger Vor'zzyx", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["144246"] = {
						"K.U.-J.0.", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["163836"] = {
						"Psychophage", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["11666"] = {
						"Firewalker", -- [1]
						"Molten Core", -- [2]
					},
					["152835"] = {
						"Crystalized Azerite", -- [1]
						"The Maelstrom - Heart of Azeroth", -- [2]
					},
					["131729"] = {
						"Lyco", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["156161"] = {
						"Inquisitor Gnshal", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["68096"] = {
						"Ashtongue Primalist", -- [1]
						"Pursuing the Black Harvest", -- [2]
					},
					["78001"] = {
						"Cloudburst Totem", -- [1]
						"Crucible of Storms", -- [2]
					},
					["144942"] = {
						"Spark Bot", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["130521"] = {
						"Freehold Deckhand", -- [1]
						"Freehold", -- [2]
					},
					["146901"] = {
						"Maniacal Apothecary", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["97678"] = {
						"Aranasi Broodmother", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["134899"] = {
						"Venomfang Lurker", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["42808"] = {
						"Stonecore Flayer", -- [1]
						"The Stonecore", -- [2]
					},
					["134069"] = {
						"Vol'zith the Whisperer", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["135706"] = {
						"Bilge Rat Looter", -- [1]
						"Tol Dagor", -- [2]
					},
					["62795"] = {
						"Sik'thik Warden", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["161573"] = {
						"Disciple of the Prophet", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["92350"] = {
						"Understone Drudge", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["147218"] = {
						"Spirit of Gold", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["48417"] = {
						"Defias Blood Wizard", -- [1]
						"Deadmines", -- [2]
					},
					["146880"] = {
						"Gholvran the Cryptic", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140269"] = {
						"Ulu'tale", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["146104"] = {
						"Living Bomb", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["138839"] = {
						"Zara'thik Deathsinger", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["118704"] = {
						"Dul'zak", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["139344"] = {
						"Drakani Death-Defiler", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["139398"] = {
						"Mirelurk Assassin", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["134916"] = {
						"Trapdoor Hunter", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["59552"] = {
						"The Crybaby Hozen", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["58108"] = {
						"Krik'thik Infiltrator", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["144972"] = {
						"Kaldorei Huntress", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["138434"] = {
						"Spitefin Tempest Witch", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140949"] = {
						"Kor'gall, Greatson of Kor'gall", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["159309"] = {
						"Leeching Parasite", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["99664"] = {
						"Restless Soul", -- [1]
						"Black Rook Hold", -- [2]
					},
					["136880"] = {
						"Bristlemane Quilboar", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["144776"] = {
						"Airyn Swiftfeet", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["142324"] = {
						"Bluefin Dolphin", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["139384"] = {
						"Slitherblade Striker", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["154347"] = {
						"Void-Twisted Corruptor", -- [1]
						"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
					},
					["153059"] = {
						"Aethanel", -- [1]
						"The Eternal Palace", -- [2]
					},
					["132797"] = {
						"Pinegraze Calf", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["76146"] = {
						"Grand Defense Construct", -- [1]
						"Skyreach", -- [2]
					},
					["149344"] = {
						"Fury Imbued Azerite", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["148998"] = {
						"Furious Guardian Spirit", -- [1]
						"Zandalari Treasury", -- [2]
					},
					["140689"] = {
						"Dreadfang Slitherer", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["129318"] = {
						"Sandskitter Crab", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["138507"] = {
						"Warlord Ultriss", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["98206"] = {
						"General Xakal", -- [1]
						"The Arcway", -- [2]
					},
					["135046"] = {
						"Crawmog", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["140361"] = {
						"Darkshadow the Omen", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["154550"] = {
						"Amathet Sun Priest", -- [1]
						"Halls of Origination", -- [2]
					},
					["159510"] = {
						"Eye of the Depths", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["123286"] = {
						"Southsea Gambler", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["126094"] = {
						"Slitherblade Wavecaller", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["100532"] = {
						"Bloodtainted Burster", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["80422"] = {
						"Iron Marksman", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["150712"] = {
						"Trixie Tazer", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["112739"] = {
						"Shadowy Overfiend", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["101839"] = {
						"Risen Companion", -- [1]
						"Black Rook Hold", -- [2]
					},
					["79462"] = {
						"Blinding Solar Flare", -- [1]
						"Skyreach", -- [2]
					},
					["163612"] = {
						"Voidspawn Annihilator", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["122968"] = {
						"Yazma", -- [1]
						"Atal'Dazar", -- [2]
					},
					["138505"] = {
						"Evolved Clutch-Warden", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["61453"] = {
						"Mu'Shiba", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["140829"] = {
						"Autumnbreeze", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["143215"] = {
						"Orca", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["48442"] = {
						"Mining Monkey", -- [1]
						"Deadmines", -- [2]
					},
					["140362"] = {
						"Shimmerwing", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["101549"] = {
						"Arcane Minion", -- [1]
						"Black Rook Hold", -- [2]
					},
					["140843"] = {
						"Air Spirit", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["155433"] = {
						"Void-Touched Emissary", -- [1]
						"Freehold", -- [2]
					},
					["131677"] = {
						"Heartsbane Runeweaver", -- [1]
						"Waycrest Manor", -- [2]
					},
					["146862"] = {
						"Mistscorn Subjugator", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["131356"] = {
						"Jungle Stalker", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["146899"] = {
						"Ashen Deathguard", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["138636"] = {
						"Prince Abari", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["144296"] = {
						"Spider Tank", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["66413"] = {
						"Yeasty Brew Alemental", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["146755"] = {
						"Slavering Skullcleaver", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["42717"] = {
						"Wolf", -- [1]
						"Kings' Rest", -- [2]
					},
					["138387"] = {
						"Mangol", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["114633"] = {
						"Spectral Valet", -- [1]
						"Return to Karazhan", -- [2]
					},
					["138561"] = {
						"Faceless Mindlasher", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["45062"] = {
						"Oathsworn Scorpid Keeper", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["155432"] = {
						"Enchanted Emissary", -- [1]
						"Freehold", -- [2]
					},
					["140975"] = {
						"Youngercraw", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["59751"] = {
						"Shado-Pan Warden", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["98280"] = {
						"Risen Arcanist", -- [1]
						"Black Rook Hold", -- [2]
					},
					["139002"] = {
						"Wildlands Totemic", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["140660"] = {
						"Big-Horn", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["129553"] = {
						"Dinomancer Kish'o", -- [1]
						"Atal'Dazar", -- [2]
					},
					["66652"] = {
						"Lesser Volatile Energy", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["140684"] = {
						"Crushstomp", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["136862"] = {
						"Orgo", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["22957"] = {
						"Priestess of Dementia", -- [1]
						"Black Temple", -- [2]
					},
					["140864"] = {
						"Gigglefit", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["138828"] = {
						"Berhild the Fierce", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["76154"] = {
						"Skyreach Raven Whisperer", -- [1]
						"Skyreach", -- [2]
					},
					["136892"] = {
						"Brutalsnout", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["144881"] = {
						"Rescued Refugee", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["139225"] = {
						"Evergrove Keeper", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["135648"] = {
						"Driftcoat", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140902"] = {
						"Vog'rish, the Ascended", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["136848"] = {
						"Sandscalp Soothsayer", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["139464"] = {
						"Zian-Ti Howler", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["45063"] = {
						"Bonesnapper Scorpid", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["11502"] = {
						"Ragnaros", -- [1]
						"Molten Core", -- [2]
					},
					["76946"] = {
						"Faultline", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["140336"] = {
						"Nightscale Wind Serpent", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["160663"] = {
						"Essence of Nightmare", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["123276"] = {
						"Saltfur Sandrunner", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["150653"] = {
						"Blackwater Behemoth", -- [1]
						"The Eternal Palace", -- [2]
					},
					["151476"] = {
						"Blastatron X-80", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["156795"] = {
						"SI:7 Informant", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["56511"] = {
						"Corrupt Living Water", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["140669"] = {
						"Rockmane Howler", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["144948"] = {
						"Leatherwing Hunter", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["135496"] = {
						"Cami Cogwizzle", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["82733"] = {
						"Night-Twisted Shadowsworn", -- [1]
						"Highmaul", -- [2]
					},
					["132904"] = {
						"Sandscalp Villager", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["151901"] = {
						"Restless Spirit", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138220"] = {
						"Blighted Malice", -- [1]
						"Thros, The Blighted Lands", -- [2]
					},
					["139284"] = {
						"Plague Doctor", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["119103"] = {
						"Sable Enforcer", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["160404"] = {
						"Angry Bear Rug Spirit", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["135263"] = {
						"Ashvane Spotter", -- [1]
						"Siege of Boralus", -- [2]
					},
					["59546"] = {
						"The Talking Fish", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["58810"] = {
						"Fragment of Hatred", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["56865"] = {
						"Aqua Dancer", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["98810"] = {
						"Wrathguard Bladelord", -- [1]
						"Black Rook Hold", -- [2]
					},
					["76865"] = {
						"Beastlord Darmac", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["78832"] = {
						"Grom'kar Man-at-Arms", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["59605"] = {
						"Sodden Hozen Brawler", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["134390"] = {
						"Sand-crusted Striker", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["45001"] = {
						"Enslaved Bandit", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["144850"] = {
						"Darkscale Siren", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["23400"] = {
						"Illidari Archon", -- [1]
						"Black Temple", -- [2]
					},
					["45122"] = {
						"Oathsworn Captain", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["134948"] = {
						"Thicket Stalker", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["80677"] = {
						"Iron Journeyman", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["119923"] = {
						"Helblaze Soulmender", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["118834"] = {
						"Fel Portal Guardian", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["114542"] = {
						"Ghostly Philanthropist", -- [1]
						"Return to Karazhan", -- [2]
					},
					["136295"] = {
						"Sunken Denizen", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["136470"] = {
						"Refreshment Vendor", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["84151"] = {
						"Chimère", -- [1]
						"Isle of Conquest", -- [2]
					},
					["134063"] = {
						"Brother Ironhull", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["40290"] = {
						"Crimsonborne Seer", -- [1]
						"Grim Batol", -- [2]
					},
					["140100"] = {
						"Warsnort", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["123289"] = {
						"Sparkleshell Deathclaw", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["155691"] = {
						"Zanj'ir Wrangler", -- [1]
						"The Eternal Palace", -- [2]
					},
					["148522"] = {
						"Ice Block", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["77067"] = {
						"Gorgrond Python", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["130622"] = {
						"Squallshaper Auran", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["15936"] = {
						"Heigan the Unclean", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["140685"] = {
						"Elderhorn", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["141166"] = {
						"Lightbound Vigilant", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["44819"] = {
						"Siamat", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["129758"] = {
						"Irontide Grenadier", -- [1]
						"Freehold", -- [2]
					},
					["146869"] = {
						"Gyrum the Virulent", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["140062"] = {
						"Diremaul", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["146872"] = {
						"Kachota the Exiled", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["123290"] = {
						"Sparkleshell Clacker", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["119748"] = {
						"JOChEn", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["97259"] = {
						"Blazing Hydra Spawn", -- [1]
						"Eye of Azshara", -- [2]
					},
					["139405"] = {
						"Wavebringer Sezzes'an", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["122076"] = {
						"Snow Orb", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["151841"] = {
						"Burgthok the Herald", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["68176"] = {
						"Unbound Centurion", -- [1]
						"Pursuing the Black Harvest", -- [2]
					},
					["136858"] = {
						"Jan'li", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140180"] = {
						"Brutalgore", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["59460"] = {
						"Hopling", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["140426"] = {
						"Moonbeard", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["138338"] = {
						"Reanimated Guardian", -- [1]
						"The Underrot", -- [2]
					},
					["39392"] = {
						"Faceless Corruptor", -- [1]
						"Grim Batol", -- [2]
					},
					["140424"] = {
						"Scythehorn", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["146245"] = {
						"Skitterwing", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["54507"] = {
						"Time-Twisted Scourge Beast", -- [1]
						"End Time", -- [2]
					},
					["81224"] = {
						"Bladespire Sorcerer", -- [1]
						"Highmaul", -- [2]
					},
					["139758"] = {
						"Annie Two-Pistols", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["133588"] = {
						"Automatic Explosive Ejector", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["129470"] = {
						"Deepsea Crab", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["122846"] = {
						"Leftovers", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["59835"] = {
						"Krik'thik Swarmer", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["126190"] = {
						"Zian-Ti Brutalizer", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["140838"] = {
						"Mischievous Flood", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["148610"] = {
						"Druid of the Branch", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["139809"] = {
						"Venture Acquisitions Specialist", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["83689"] = {
						"Sharpclaw Hunter", -- [1]
						"Ashran", -- [2]
					},
					["155156"] = {
						"Jaina Proudmoore", -- [1]
						"The Eternal Palace", -- [2]
					},
					["146188"] = {
						"Firesting Dominator", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["144876"] = {
						"Apetagonizer 3000", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["161437"] = {
						"Explosive Scarab", -- [1]
						"Atal'Dazar", -- [2]
					},
					["140983"] = {
						"Frostbore Burster", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["134911"] = {
						"Darkhollow Widow", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["140338"] = {
						"Clutch Guardian Jinka'lo", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["162716"] = {
						"Spellbound Ritualist", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["132745"] = {
						"Frostscale Wanderer", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["138495"] = {
						"Twilight Commander", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["145337"] = {
						"Sandclaw Crab", -- [1]
						"The Eternal Palace", -- [2]
					},
					["69946"] = {
						"Narco", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["22954"] = {
						"Illidari Fearbringer", -- [1]
						"Black Temple", -- [2]
					},
					["140262"] = {
						"Runehoof Doe", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["144785"] = {
						"Nagtar Wolfsbane", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["146652"] = {
						"Bolstered Deathguard", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["134802"] = {
						"Razorback", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["146367"] = {
						"Char'golm", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["111528"] = {
						"Deathroot Ancient", -- [1]
						"The Emerald Nightmare", -- [2]
					},
					["134338"] = {
						"Tidesage Enforcer", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["91001"] = {
						"Tarspitter Lurker", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["138987"] = {
						"Muckfin High Oracle", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["162717"] = {
						"Sinister Soulcarver", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["48440"] = {
						"Mining Monkey", -- [1]
						"Deadmines", -- [2]
					},
					["139412"] = {
						"Gashasz", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["138493"] = {
						"Minion of Zul", -- [1]
						"Kings' Rest", -- [2]
					},
					["42721"] = {
						"Raptor", -- [1]
						"Waycrest Manor", -- [2]
					},
					["133379"] = {
						"Adderis", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["155873"] = {
						"Darkcast Annihilator", -- [1]
						"The Eternal Palace", -- [2]
					},
					["23030"] = {
						"Dragonmaw Sky Stalker", -- [1]
						"Black Temple", -- [2]
					},
					["151917"] = {
						"Tar'al Bonespitter", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140860"] = {
						"Cliffracer", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["126682"] = {
						"Saltfin Swimmer", -- [1]
						"Siege of Boralus", -- [2]
					},
					["122984"] = {
						"Dazar'ai Colossus", -- [1]
						"Atal'Dazar", -- [2]
					},
					["144829"] = {
						"Thundercroak", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["155951"] = {
						"Ruffer", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["139811"] = {
						"Venture Sub-Lead", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["159768"] = {
						"Deresh of the Nothingness", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["136224"] = {
						"Stromgarde Spellweaver", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["77557"] = {
						"Admiral Gar'an", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["78491"] = {
						"Brackenspore", -- [1]
						"Highmaul", -- [2]
					},
					["132743"] = {
						"Flamescale Wavebreaker", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["139807"] = {
						"Venture Surveyor", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["135971"] = {
						"Faithless Conscript", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["140250"] = {
						"Pinegraze Stag", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["88902"] = {
						"Mol'dana Two-Blade", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["22873"] = {
						"Coilskar General", -- [1]
						"Black Temple", -- [2]
					},
					["157275"] = {
						"Darkwhisper Disciple", -- [1]
						"Blackwing Descent Scenario", -- [2]
					},
					["136047"] = {
						"Iceheart", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["101476"] = {
						"Molten Charskin", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["101398"] = {
						"Psyfiend", -- [1]
						"Eye of the Storm", -- [2]
					},
					["157349"] = {
						"Void Boar", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["137061"] = {
						"Suluz Wind-Tamer", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["136203"] = {
						"Danath Trollbane", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["147895"] = {
						"Rezani Disciple", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["137838"] = {
						"Rampaging Owlbeast", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["100527"] = {
						"Dreadfire Imp", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["91786"] = {
						"Gritslime Snail", -- [1]
						"Eye of Azshara", -- [2]
					},
					["83690"] = {
						"Panthran Witchdoctor", -- [1]
						"Ashran", -- [2]
					},
					["47244"] = {
						"Mírabelle", -- [1]
						"Isle of Conquest", -- [2]
					},
					["147868"] = {
						"Frenzied Saurid", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["93349"] = {
						"Viina", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["123291"] = {
						"Sparkleshell Crab", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["68175"] = {
						"Unbound Bonemender", -- [1]
						"Pursuing the Black Harvest", -- [2]
					},
					["140060"] = {
						"Grizzlefur Bear", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["416"] = {
						"Jaktog", -- [1]
						"Crucible of Storms", -- [2]
					},
					["56792"] = {
						"Figment of Doubt", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["156143"] = {
						"Voidcrazed Hulk", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["134616"] = {
						"Krolusk Pup", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["136870"] = {
						"Oomgut Champion", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["159219"] = {
						"Umbral Seer", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["141282"] = {
						"Kul Tiran Footman", -- [1]
						"Siege of Boralus", -- [2]
					},
					["48502"] = {
						"Defias Enforcer", -- [1]
						"Deadmines", -- [2]
					},
					["61146"] = {
						"Black Ox Statue", -- [1]
						"Crucible of Storms", -- [2]
					},
					["136846"] = {
						"Sandscalp Blood Drinker", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["149098"] = {
						"Maiev Shadowsong", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["157356"] = {
						"Extractor Thelsara", -- [1]
						"Blackwing Descent Scenario", -- [2]
					},
					["118714"] = {
						"Hellblaze Temptress", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["141172"] = {
						"Lightbound Battlemage", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["76945"] = {
						"Ironcrusher", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["39870"] = {
						"Twilight Firecatcher", -- [1]
						"Grim Batol", -- [2]
					},
					["22885"] = {
						"Dragon Turtle", -- [1]
						"Black Temple", -- [2]
					},
					["121711"] = {
						"Bilespray Lasher", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["135647"] = {
						"Ituakee", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["145067"] = {
						"Shadefeather Hatchling", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["148120"] = {
						"Kul Tiran Marine", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["152033"] = {
						"Inconspicuous Plant", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["98677"] = {
						"Rook Spiderling", -- [1]
						"Black Rook Hold", -- [2]
					},
					["120651"] = {
						"Explosives", -- [1]
						"Atal'Dazar", -- [2]
					},
					["140091"] = {
						"Snowhoof", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["40291"] = {
						"Azureborne Seer", -- [1]
						"Grim Batol", -- [2]
					},
					["42691"] = {
						"Stonecore Rift Conjurer", -- [1]
						"The Stonecore", -- [2]
					},
					["140663"] = {
						"Mountain Lord Grum", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140970"] = {
						"Cragburster", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["114803"] = {
						"Spectral Stable Hand", -- [1]
						"Return to Karazhan", -- [2]
					},
					["98965"] = {
						"Kur'talos Ravencrest", -- [1]
						"Black Rook Hold", -- [2]
					},
					["140980"] = {
						"Jadescale Worm", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["151630"] = {
						"Void Ichor", -- [1]
						"Crucible of Storms", -- [2]
					},
					["135770"] = {
						"Veteran Sergeant Slayde", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["56863"] = {
						"Sleepy Hozen Brawler", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["130435"] = {
						"Addled Thug", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["122265"] = {
						"Saltfur Smasher", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["129373"] = {
						"Dockhound Packmaster", -- [1]
						"Siege of Boralus", -- [2]
					},
					["134423"] = {
						"Abyss Dweller", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["134798"] = {
						"Abyss Crawler", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["40167"] = {
						"Twilight Beguiler", -- [1]
						"Grim Batol", -- [2]
					},
					["34775"] = {
						"Demolisher", -- [1]
						"Isle of Conquest", -- [2]
					},
					["144831"] = {
						"Colossal Spadefoot", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["146401"] = {
						"Darkscale Dig-Slave", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["100250"] = {
						"Binder Ashioi", -- [1]
						"Eye of Azshara", -- [2]
					},
					["146900"] = {
						"Shambling Deadeye", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["128649"] = {
						"Sergeant Bainbridge", -- [1]
						"Siege of Boralus", -- [2]
					},
					["151098"] = {
						"Shadowy Appendage", -- [1]
						"Crucible of Storms", -- [2]
					},
					["163746"] = {
						"Walkie Shockie X1", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["140850"] = {
						"Frolicsome Soilkin", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["145603"] = {
						"Goblin Harvester", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["138558"] = {
						"Faceless One", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["139219"] = {
						"Nasira Morningfrost", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["102335"] = {
						"Portal Guardian", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["60447"] = {
						"Krik'thik Saboteur", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["144680"] = {
						"Frida Ironbellows", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["132885"] = {
						"Air Elemental", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["154555"] = {
						"Amathet Artificer", -- [1]
						"Halls of Origination", -- [2]
					},
					["61910"] = {
						"Resin Flake", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["126832"] = {
						"Skycap'n Kragg", -- [1]
						"Freehold", -- [2]
					},
					["46379"] = {
						"Vicious Thug", -- [1]
						"Stormwind Stockade", -- [2]
					},
					["136076"] = {
						"Agitated Nimbus", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["23775"] = {
						"Head of the Horseman", -- [1]
						"Scarlet Monastery", -- [2]
					},
					["157475"] = {
						"Synthesis Growth", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["133593"] = {
						"Expert Technician", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["133007"] = {
						"Unbound Abomination", -- [1]
						"The Underrot", -- [2]
					},
					["141284"] = {
						"Kul Tiran Wavetender", -- [1]
						"Siege of Boralus", -- [2]
					},
					["141285"] = {
						"Kul Tiran Marksman", -- [1]
						"Siege of Boralus", -- [2]
					},
					["140098"] = {
						"Vicious Scarhide", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["149556"] = {
						"Eternal Enforcer", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["39954"] = {
						"Twilight Shadow Weaver", -- [1]
						"Grim Batol", -- [2]
					},
					["136856"] = {
						"Cinderhorn", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["146756"] = {
						"Energized Storm", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["140828"] = {
						"Morningdew", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["22846"] = {
						"Ashtongue Stormcaller", -- [1]
						"Black Temple", -- [2]
					},
					["135931"] = {
						"Ashstone", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["151041"] = {
						"Etruvis the Vassal", -- [1]
						"Crucible of Storms", -- [2]
					},
					["155634"] = {
						"Bound Storm", -- [1]
						"The Eternal Palace", -- [2]
					},
					["33510"] = {
						"Spirit Beast", -- [1]
						"Kings' Rest", -- [2]
					},
					["78233"] = {
						"Darkshard Crystalback", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["146485"] = {
						"Nevara Nightshade", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["137097"] = {
						"Valorcall Spellweaver", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["126928"] = {
						"Irontide Corsair", -- [1]
						"Freehold", -- [2]
					},
					["148119"] = {
						"Furious Merchant", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["136735"] = {
						"Ashvane Marine", -- [1]
						"Tol Dagor", -- [2]
					},
					["130404"] = {
						"Vermin Trapper", -- [1]
						"Freehold", -- [2]
					},
					["140435"] = {
						"Greyfur", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["151872"] = {
						"Grip of Horror", -- [1]
						"Emerald Dream - HoA Scenario", -- [2]
					},
					["140563"] = {
						"Brimstone Tracker", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["155158"] = {
						"First Arcanist Thalyssra", -- [1]
						"The Eternal Palace", -- [2]
					},
					["69792"] = {
						"Longwoman", -- [1]
						"Waycrest Manor", -- [2]
					},
					["155645"] = {
						"Walkie Shockie X2", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["138823"] = {
						"Bloodwake Wayfinder", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["151801"] = {
						"Amathet Zealot", -- [1]
						"Halls of Origination", -- [2]
					},
					["138481"] = {
						"Chromitus", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["138432"] = {
						"Tidemistress Nessa", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["40484"] = {
						"Erudax", -- [1]
						"Grim Batol", -- [2]
					},
					["128967"] = {
						"Ashvane Sniper", -- [1]
						"Siege of Boralus", -- [2]
					},
					["137474"] = {
						"King Timalji", -- [1]
						"Kings' Rest", -- [2]
					},
					["134389"] = {
						"Venomous Ophidian", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["140683"] = {
						"Darkfur the Smasher", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["136855"] = {
						"Molten Vordo", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["151881"] = {
						"Abyssal Commander Sivara", -- [1]
						"The Eternal Palace", -- [2]
					},
					["140977"] = {
						"Jadescale Gnasher", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["140325"] = {
						"Stonehusk Scarab", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140359"] = {
						"Thunderhawk Devourer", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["132923"] = {
						"Coldlight Murloc", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["97200"] = {
						"Seacursed Soulkeeper", -- [1]
						"Maw of Souls", -- [2]
					},
					["23576"] = {
						"Nalorakk", -- [1]
						"Zul'Aman", -- [2]
					},
					["86275"] = {
						"Gorian Enforcer", -- [1]
						"Highmaul", -- [2]
					},
					["140341"] = {
						"Cloudscraper", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["135719"] = {
						"Duskrunner", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["157365"] = {
						"Crackling Stalker", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["139536"] = {
						"Zara'thik Drone", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["146813"] = {
						"Gunther the Gray", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["26027"] = {
						"Ray", -- [1]
						"Waycrest Manor", -- [2]
					},
					["155273"] = {
						"Garval the Vanquisher", -- [1]
						"The Eternal Palace", -- [2]
					},
					["152939"] = {
						"Boundless Corruption", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["98770"] = {
						"Wrathguard Felblade", -- [1]
						"The Arcway", -- [2]
					},
					["138981"] = {
						"Muckfin Oracle", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["151029"] = {
						"Thornspeaker Tavery", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["147537"] = {
						"Treasury Protector", -- [1]
						"Zandalari Treasury", -- [2]
					},
					["98696"] = {
						"Illysanna Ravencrest", -- [1]
						"Black Rook Hold", -- [2]
					},
					["77231"] = {
						"Enforcer Sorka", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["145185"] = {
						"Gnomercy 4.U.", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["140332"] = {
						"Chitterbore", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["142511"] = {
						"Exarch Orelis", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["158774"] = {
						"Broken Citizen", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["138105"] = {
						"Veteran of Stromgarde", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["159320"] = {
						"Amahtet", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["146238"] = {
						"Blacksting", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["137627"] = {
						"Constricting Terror", -- [1]
						"Siege of Boralus", -- [2]
					},
					["144683"] = {
						"Ra'wani Kanae", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["135329"] = {
						"Matron Bryndle", -- [1]
						"Waycrest Manor", -- [2]
					},
					["140768"] = {
						"Guuru the Mountain-Breaker", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["157612"] = {
						"Eye of Drest'agath", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["127497"] = {
						"Ashvane Warden", -- [1]
						"Tol Dagor", -- [2]
					},
					["131849"] = {
						"Crazed Marksman", -- [1]
						"Waycrest Manor", -- [2]
					},
					["138468"] = {
						"Obsidian Flamecaller", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["22955"] = {
						"Charming Courtesan", -- [1]
						"Black Temple", -- [2]
					},
					["55659"] = {
						"Wild Imp", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["147614"] = {
						"Dark Iron Primalist", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["138563"] = {
						"Vudax", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["149353"] = {
						"Incandescent Azergem Crystalback", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["98761"] = {
						"Shredlock", -- [1]
						"Maw of Souls", -- [2]
					},
					["138308"] = {
						"Ook-Aak", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["144249"] = {
						"Omega Buster", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["131527"] = {
						"Lord Waycrest", -- [1]
						"Waycrest Manor", -- [2]
					},
					["138429"] = {
						"Spitefin Tidebinder", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["34028"] = {
						"dpsnobrain", -- [1]
						"Kings' Rest", -- [2]
					},
					["146855"] = {
						"Akina", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["129826"] = {
						"Brineshell Snapclaw", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["156575"] = {
						"Dark Inquisitor Xanesh", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["77182"] = {
						"Oregorger", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["159416"] = {
						"Spiked Tentacle", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["97182"] = {
						"Night Watch Mariner", -- [1]
						"Maw of Souls", -- [2]
					},
					["118718"] = {
						"Book of Eternal Winter", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["158092"] = {
						"Fallen Heartpiercer", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["146940"] = {
						"Primordial Mindbender", -- [1]
						"Crucible of Storms", -- [2]
					},
					["124352"] = {
						"Kunzen Stalker", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["132126"] = {
						"Gilded Priestess", -- [1]
						"Atal'Dazar", -- [2]
					},
					["58807"] = {
						"Vestige of Hatred", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["143758"] = {
						"Brewer Ahna", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["148613"] = {
						"Commander Broadside", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["157442"] = {
						"Gaze of Madness", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["152987"] = {
						"Faceless Willbreaker", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["22884"] = {
						"Leviathan", -- [1]
						"Black Temple", -- [2]
					},
					["147440"] = {
						"Blazing Fireguard", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["130655"] = {
						"Bobby Howlis", -- [1]
						"Tol Dagor", -- [2]
					},
					["87771"] = {
						"Slagshop Worker", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["76309"] = {
						"Grand Defense Construct", -- [1]
						"Skyreach", -- [2]
					},
					["145033"] = {
						"Arctic Hunter", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["147497"] = {
						"Prelate Akk'al", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["139389"] = {
						"Steelscale Volshasis", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["114288"] = {
						"Skeletal Warrior", -- [1]
						"Maw of Souls", -- [2]
					},
					["139347"] = {
						"Berserker Gola", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["139471"] = {
						"Bugan the Flesh-Crusher", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["129830"] = {
						"Clackclaw the Behemoth", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["121567"] = {
						"Pucki", -- [1]
						"Isle of Conquest", -- [2]
					},
					["150292"] = {
						"Mechagon Cavalry", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["146678"] = {
						"Ancient Protector", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["138513"] = {
						"Vyrantion", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["95772"] = {
						"Frenzied Nightclaw", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["132913"] = {
						"Island Ettin", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["57080"] = {
						"Corrupted Scroll", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["132746"] = {
						"Frostscale Broodmother", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["129000"] = {
						"Southsea Brawler", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["130245"] = {
						"Zandalari Juggernaut", -- [1]
						"Zul'Aman", -- [2]
					},
					["114264"] = {
						"Midnight", -- [1]
						"Return to Karazhan", -- [2]
					},
					["132051"] = {
						"Blood Tick", -- [1]
						"The Underrot", -- [2]
					},
					["135763"] = {
						"Voidling", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["102273"] = {
						"Doomguard Infiltrator", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["139818"] = {
						"Security Officer Durk", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["139003"] = {
						"Wildlands Warrior", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["161562"] = {
						"General Shar'az", -- [1]
						"Halls of Origination", -- [2]
					},
					["137614"] = {
						"Demolishing Terror", -- [1]
						"Siege of Boralus", -- [2]
					},
					["138646"] = {
						"Kvaldir Mistcaller", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["136044"] = {
						"Venomswell", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["140094"] = {
						"Mudsnout Thornback", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["134214"] = {
						"Riftblade Kelain", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["127049"] = {
						"Drywhisker Surveyor", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["146906"] = {
						"Festering Hulk", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["155689"] = {
						"Zanj'ir Gladiator", -- [1]
						"The Eternal Palace", -- [2]
					},
					["140374"] = {
						"Hive Guardian Yx'nil", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["48522"] = {
						"Defias Pirate", -- [1]
						"Deadmines", -- [2]
					},
					["129550"] = {
						"Bilge Rat Padfoot", -- [1]
						"Freehold", -- [2]
					},
					["138063"] = {
						"Posh Vacationer", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["157467"] = {
						"Void Ascendant", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["138984"] = {
						"Scarscale", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["104277"] = {
						"Legion Hound", -- [1]
						"Court of Stars", -- [2]
					},
					["47297"] = {
						"Lumbering Oaf", -- [1]
						"Deadmines", -- [2]
					},
					["139340"] = {
						"Icetusk Necromancer", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["58198"] = {
						"Shado-Pan Disciple", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["77893"] = {
						"Grasping Earth", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["39956"] = {
						"Twilight Enforcer", -- [1]
						"Grim Batol", -- [2]
					},
					["139474"] = {
						"Qor-Xin the Earth-Caller", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["135930"] = {
						"Lavarok", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["99956"] = {
						"Fel-Infused Fury", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["158411"] = {
						"Unstable Servant", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["164189"] = {
						"Horrific Figment", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["136353"] = {
						"Colossal Tentacle", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["138309"] = {
						"Nibnub", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["151581"] = {
						"Horrific Vision", -- [1]
						"The Eternal Palace", -- [2]
					},
					["59522"] = {
						"Sudsy Brew Alemental", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["129827"] = {
						"Brineshell Crusher", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138374"] = {
						"Sand Fur", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["152089"] = {
						"Thrall", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["153196"] = {
						"Scrapbone Grunter", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["58964"] = {
						"Shirmek", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["87761"] = {
						"Dungeoneer's Training Dummy", -- [1]
						"FW Horde Garrison Level 3", -- [2]
					},
					["140794"] = {
						"Scartalon", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["135834"] = {
						"Vile Cloud", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["139673"] = {
						"Many-Teeth", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["158781"] = {
						"Shredded Psyche", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["129640"] = {
						"Snarling Dockhound", -- [1]
						"Siege of Boralus", -- [2]
					},
					["140619"] = {
						"Coastal Fathomjaw", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["139529"] = {
						"Muklai", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140292"] = {
						"Snowfur Alpha", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["97285"] = {
						"Wind Rush Totem", -- [1]
						"The Eternal Palace", -- [2]
					},
					["103217"] = {
						"Crystalline Scorpid", -- [1]
						"The Nighthold", -- [2]
					},
					["91003"] = {
						"Rokmora", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["132742"] = {
						"Flamescale Strider", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["144833"] = {
						"Whiptongue", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["152159"] = {
						"Zoatroid", -- [1]
						"The Eternal Palace", -- [2]
					},
					["97170"] = {
						"Hatecoil Wavebinder", -- [1]
						"Eye of Azshara", -- [2]
					},
					["153060"] = {
						"Cyranus", -- [1]
						"The Eternal Palace", -- [2]
					},
					["76884"] = {
						"Cruelfang", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["134058"] = {
						"Galecaller Faye", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["56884"] = {
						"Corrupted Taran Zhu", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["136181"] = {
						"Volcano", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["135562"] = {
						"Venomous Ophidian", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["152833"] = {
						"Azerite Giant", -- [1]
						"The Maelstrom - Heart of Azeroth", -- [2]
					},
					["139360"] = {
						"Risen Icetusk Brute", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140168"] = {
						"Elder Chest-Thump", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["104278"] = {
						"Felbound Enforcer", -- [1]
						"Court of Stars", -- [2]
					},
					["138842"] = {
						"Ta'kil the Resonator", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["106787"] = {
						"Bitterbrine Slave", -- [1]
						"Eye of Azshara", -- [2]
					},
					["136160"] = {
						"King Dazar", -- [1]
						"Kings' Rest", -- [2]
					},
					["160699"] = {
						"Angry Mailemental", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["47720"] = {
						"Camel", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["150195"] = {
						"Gnome-Eating Slime", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["136297"] = {
						"Forgotten Denizen", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["32517"] = {
						"Xirips", -- [1]
						"The Eternal Palace", -- [2]
					},
					["151960"] = {
						"Suntouched Acolyte", -- [1]
						"Halls of Origination", -- [2]
					},
					["126181"] = {
						"Ramut the Black", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140443"] = {
						"Muskflank Charger", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["97720"] = {
						"Blightshard Skitter", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["133848"] = {
						"Encyclopedia Antagonistica", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["140431"] = {
						"Craghoof Goat", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["59726"] = {
						"Peril", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["144976"] = {
						"Forsaken Deathguard", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["139352"] = {
						"Death-Caller Majuli", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["77687"] = {
						"Grom'kar Man-at-Arms", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["140982"] = {
						"Icecracker", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["145064"] = {
						"Blaze", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["106059"] = {
						"Warp Shade", -- [1]
						"The Arcway", -- [2]
					},
					["80071"] = {
						"Bladespire Sorcerer", -- [1]
						"Highmaul", -- [2]
					},
					["139431"] = {
						"Guardian of Tombs", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140264"] = {
						"Runehoof Calf", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["150276"] = {
						"Heavy Scrapbot", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["139393"] = {
						"Mirelurk Clutchguard", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["137405"] = {
						"Gripping Terror", -- [1]
						"Siege of Boralus", -- [2]
					},
					["157594"] = {
						"Lesser Void Elemental", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["139110"] = {
						"Spark Channeler", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["136865"] = {
						"Uzan the Sandreaver", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["102398"] = {
						"Blazing Infernal", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["56930"] = {
						"Krik'thik Swarm Bringer", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["144951"] = {
						"Palefur Devourer", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["133436"] = {
						"Venture Co. Skyscorcher", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["150547"] = {
						"Scrapbone Grunter", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["134150"] = {
						"Runecarver Sorn", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["135043"] = {
						"Vicious Vicejaw", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["148262"] = {
						"Tidewater Elemental", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["139348"] = {
						"Baga the Frostshield", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["130638"] = {
						"Vicejaw Crocolisk", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["136254"] = {
						"Stromgarde Knight", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["39381"] = {
						"Crimsonborne Guardian", -- [1]
						"Grim Batol", -- [2]
					},
					["102400"] = {
						"Eredar Shadow Mender", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["135894"] = {
						"Fire Elemental", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["149354"] = {
						"Monstrous Azergem Crystalback", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["76094"] = {
						"Sun Trinket", -- [1]
						"Skyreach", -- [2]
					},
					["83628"] = {
						"Lunarfall Goren", -- [1]
						"SMV Alliance Garrison Level 3", -- [2]
					},
					["140760"] = {
						"Earthliving Giant", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["59479"] = {
						"Yan-Zhu the Uncasked", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["58803"] = {
						"Residual Hatred", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["140673"] = {
						"Ragesnarl", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["131728"] = {
						"Raul the Tenacious", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["156130"] = {
						"Lesser Zoatroid", -- [1]
						"The Eternal Palace", -- [2]
					},
					["78933"] = {
						"Herald of Sunrise", -- [1]
						"Skyreach", -- [2]
					},
					["156145"] = {
						"Burrowing Appendage", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["134388"] = {
						"A Knot of Snakes", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["87515"] = {
						"Iron Flame Binder", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["144977"] = {
						"Forsaken Deadshot", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["96759"] = {
						"Helya", -- [1]
						"Maw of Souls", -- [2]
					},
					["136083"] = {
						"Forgotten Denizen", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["156650"] = {
						"Dark Manifestation", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["155872"] = {
						"Trapped Saurok", -- [1]
						"Mogu'shan Scenario", -- [2]
					},
					["140839"] = {
						"Water Spirit", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["50815"] = {
						"Rogi", -- [1]
						"The Eternal Palace", -- [2]
					},
					["126848"] = {
						"Captain Eudora", -- [1]
						"Freehold", -- [2]
					},
					["138187"] = {
						"Grotesque Horror", -- [1]
						"The Underrot", -- [2]
					},
					["154612"] = {
						"Unleashed Nightmare", -- [1]
						"The Eternal Palace", -- [2]
					},
					["151649"] = {
						"Defense Bot Mk I", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["140670"] = {
						"Hulking Rockmane", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["48266"] = {
						"Defias Cannon", -- [1]
						"Deadmines", -- [2]
					},
					["146845"] = {
						"Jared the Jagged", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["135322"] = {
						"The Golden Serpent", -- [1]
						"Kings' Rest", -- [2]
					},
					["49493"] = {
						"Nightmare Skitterling", -- [1]
						"Deadmines", -- [2]
					},
					["54191"] = {
						"Risen Ghoul", -- [1]
						"End Time", -- [2]
					},
					["135246"] = {
						"\"Stabby\" Lottie", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["48441"] = {
						"Mining Monkey", -- [1]
						"Deadmines", -- [2]
					},
					["142999"] = {
						"Rhonin", -- [1]
						"Thros, The Blighted Lands", -- [2]
					},
					["113321"] = {
						"Shambling Hungerer", -- [1]
						"The Nighthold", -- [2]
					},
					["138626"] = {
						"Amathet Zealot", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["138982"] = {
						"Muckfin Murloc", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["101414"] = {
						"Saltscale Skulker", -- [1]
						"Eye of Azshara", -- [2]
					},
					["139416"] = {
						"Volshas", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["137449"] = {
						"Dust Devil", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140845"] = {
						"Playful Gust", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["136845"] = {
						"Sandscalp Axe Thrower", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138389"] = {
						"Smasha", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["45377"] = {
						"Augh", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["102302"] = {
						"Portal Keeper", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["161334"] = {
						"Gnashing Terror", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["132999"] = {
						"Nexus-Lord Ashaal", -- [1]
						"Icecrown Citadel", -- [2]
					},
					["131825"] = {
						"Sister Briar", -- [1]
						"Waycrest Manor", -- [2]
					},
					["140097"] = {
						"Great Dirtbelly", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["98759"] = {
						"Vicious Manafang", -- [1]
						"The Arcway", -- [2]
					},
					["140849"] = {
						"Pernicious Stonekin", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138845"] = {
						"Commander Jo'vak", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["98706"] = {
						"Commander Shemdah'sohn", -- [1]
						"Black Rook Hold", -- [2]
					},
					["67093"] = {
						"Sik'thik Battle-Mender", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["133870"] = {
						"Diseased Lasher", -- [1]
						"The Underrot", -- [2]
					},
					["160341"] = {
						"Sewer Beastling", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["133990"] = {
						"Scrimshaw Gutter", -- [1]
						"Siege of Boralus", -- [2]
					},
					["153401"] = {
						"K'thir Dominator", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["99200"] = {
						"Dresaron", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["149352"] = {
						"Jeweled Azergem Crystalback", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["79200"] = {
						"Blackrock Forge Specialist", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["23403"] = {
						"Illidari Assassin", -- [1]
						"Black Temple", -- [2]
					},
					["100362"] = {
						"Grasping Tentacle", -- [1]
						"Maw of Souls", -- [2]
					},
					["140427"] = {
						"Craghoof Herdfather", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["129526"] = {
						"Bilge Rat Swabby", -- [1]
						"Freehold", -- [2]
					},
					["146650"] = {
						"Champion Sentinel", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["147745"] = {
						"The Indomitable", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["26024"] = {
						"Dragonhawk", -- [1]
						"Kings' Rest", -- [2]
					},
					["47739"] = {
						"\"Captain\" Cookie", -- [1]
						"Deadmines", -- [2]
					},
					["146247"] = {
						"White Death", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["134806"] = {
						"Bloodsnapper", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138369"] = {
						"Footbomb Hooligan", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["140271"] = {
						"Severhorn", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["139469"] = {
						"Zu-Xan of Thunder", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["101991"] = {
						"Nightmare Dweller", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["139457"] = {
						"Stonebound Quilen", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["151658"] = {
						"Strider Tonk", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["148221"] = {
						"Risen Hulk", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["157452"] = {
						"Nightmare Antigen", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["152162"] = {
						"Void-Twisted Skystriker", -- [1]
						"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
					},
					["139269"] = {
						"Gloom Horror", -- [1]
						"Waycrest Manor", -- [2]
					},
					["147829"] = {
						"Rastari Beastmaster", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["62982"] = {
						"Mindbender", -- [1]
						"Isle of Conquest", -- [2]
					},
					["76306"] = {
						"Grand Defense Construct", -- [1]
						"Skyreach", -- [2]
					},
					["102095"] = {
						"Risen Lancer", -- [1]
						"Black Rook Hold", -- [2]
					},
					["135649"] = {
						"Clawflurry", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["144975"] = {
						"Forsaken Lancer", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["148667"] = {
						"Rastari Punisher", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["147411"] = {
						"Blightguard Captain Thedric", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["47162"] = {
						"Glubtok", -- [1]
						"Deadmines", -- [2]
					},
					["160990"] = {
						"Image of Absolution", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["146884"] = {
						"Warlord Hjelskard", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["139799"] = {
						"Ironhull Apprentice", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["141074"] = {
						"Kor'gall Defector", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["98963"] = {
						"Blazing Imp", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["88288"] = {
						"Dungeoneer's Training Dummy", -- [1]
						"FW Horde Garrison Level 3", -- [2]
					},
					["132877"] = {
						"Dankscale", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["158171"] = {
						"Faceless Destroyer", -- [1]
						"Halls of Origination", -- [2]
					},
					["144796"] = {
						"High Tinker Mekkatorque", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["11982"] = {
						"Magmadar", -- [1]
						"Molten Core", -- [2]
					},
					["160249"] = {
						"Spike Tentacle", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["139386"] = {
						"Forked-Tongue", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["141173"] = {
						"Lightbound Blademaster", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["131864"] = {
						"Gorak Tul", -- [1]
						"Waycrest Manor", -- [2]
					},
					["134158"] = {
						"Shadow-Borne Champion", -- [1]
						"Kings' Rest", -- [2]
					},
					["158315"] = {
						"Eye of Chaos", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["54923"] = {
						"Infinite Warden", -- [1]
						"End Time", -- [2]
					},
					["129529"] = {
						"Blacktooth Scrapper", -- [1]
						"Freehold", -- [2]
					},
					["131670"] = {
						"Heartsbane Vinetwister", -- [1]
						"Waycrest Manor", -- [2]
					},
					["138888"] = {
						"Bloodwake Soothsayer", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["148443"] = {
						"Defense-A-Bot", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["22960"] = {
						"Dragonmaw Wyrmcaller", -- [1]
						"Black Temple", -- [2]
					},
					["138436"] = {
						"Lord Coilfin", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["144830"] = {
						"Yaz'za the Devourer", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["153755"] = {
						"Naeno Megacrash", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["59794"] = {
						"Krik'thik Disruptor", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["22956"] = {
						"Sister of Pain", -- [1]
						"Black Temple", -- [2]
					},
					["146116"] = {
						"Needleback Forager", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["99649"] = {
						"Dreadlord Mendacius", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["139868"] = {
						"Voru'kar Nerubian", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["138444"] = {
						"General Vesparak", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["144757"] = {
						"Edgard Shadeclaw", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["56731"] = {
						"Habanero Brew", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["155953"] = {
						"C'Thuffer", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["97163"] = {
						"Cursed Falke", -- [1]
						"Maw of Souls", -- [2]
					},
					["144638"] = {
						"Grong the Revenant", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["139414"] = {
						"Mire Priest Vassz", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140300"] = {
						"Ripshread", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["135715"] = {
						"Ferocious Nightsaber", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["42695"] = {
						"Stonecore Sentry", -- [1]
						"The Stonecore", -- [2]
					},
					["113998"] = {
						"Mightstone Breaker", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["139202"] = {
						"Verdant Tender", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["39625"] = {
						"General Umbriss", -- [1]
						"Grim Batol", -- [2]
					},
					["145298"] = {
						"Feral Hungerer", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["161218"] = {
						"Aqir Crusher", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["139006"] = {
						"Wildlands Furbolg", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["134768"] = {
						"Sandskitter the Relentless", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["127490"] = {
						"Knight Captain Valyri", -- [1]
						"Tol Dagor", -- [2]
					},
					["163712"] = {
						"Dying Voidspawn", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["140070"] = {
						"Bloodscent the Tracker", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["114629"] = {
						"Spectral Retainer", -- [1]
						"Return to Karazhan", -- [2]
					},
					["138443"] = {
						"Scaleguard Buleth", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["155656"] = {
						"Misha", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["78978"] = {
						"Darkshard Gnasher", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["130012"] = {
						"Irontide Ravager", -- [1]
						"Freehold", -- [2]
					},
					["135130"] = {
						"Siege Tower", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["50058"] = {
						"Terrorpene", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["80526"] = {
						"Stubborn Ironhoof", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["42696"] = {
						"Stonecore Warbringer", -- [1]
						"The Stonecore", -- [2]
					},
					["155810"] = {
						"Frozen Sentry", -- [1]
						"The Eternal Palace", -- [2]
					},
					["135643"] = {
						"Ren'kiri", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["127799"] = {
						"Dazar'ai Honor Guard", -- [1]
						"Atal'Dazar", -- [2]
					},
					["161173"] = {
						"Abyssal Watcher", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["87780"] = {
						"Slagshop Brute", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["36633"] = {
						"Ice Sphere", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["80048"] = {
						"Vul'gor", -- [1]
						"Highmaul", -- [2]
					},
					["56472"] = {
						"Fragrant Lotus", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["126095"] = {
						"Vyliss", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["104676"] = {
						"Waning Time Particle", -- [1]
						"The Nighthold", -- [2]
					},
					["140630"] = {
						"Ornate Puffer", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["131824"] = {
						"Sister Solena", -- [1]
						"Waycrest Manor", -- [2]
					},
					["126845"] = {
						"Captain Jolly", -- [1]
						"Freehold", -- [2]
					},
					["135247"] = {
						"Varigg", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["53140"] = {
						"Son of Flame", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["157449"] = {
						"Sinister Soulcarver", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["118706"] = {
						"Necrotic Spiderling", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["99192"] = {
						"Shade of Xavius", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["131545"] = {
						"Lady Waycrest", -- [1]
						"Waycrest Manor", -- [2]
					},
					["147936"] = {
						"Azergem Shardback", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["134144"] = {
						"Living Current", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["153531"] = {
						"Aqir Bonecrusher", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["144169"] = {
						"Ashvane Commander", -- [1]
						"Siege of Boralus", -- [2]
					},
					["148617"] = {
						"Akunda the Devout", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["161244"] = {
						"Blood of the Corruptor", -- [1]
						"Atal'Dazar", -- [2]
					},
					["122965"] = {
						"Vol'kaal", -- [1]
						"Atal'Dazar", -- [2]
					},
					["159275"] = {
						"Portal Keeper", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["100248"] = {
						"Ritualist Lesha", -- [1]
						"Eye of Azshara", -- [2]
					},
					["140800"] = {
						"Cloudwing the Killthief", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["56678"] = {
						"Jade Staff", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["134769"] = {
						"Jagged Claw", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["140769"] = {
						"Goldenvein", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["127111"] = {
						"Irontide Oarsman", -- [1]
						"Freehold", -- [2]
					},
					["79093"] = {
						"Skyreach Sun Talon", -- [1]
						"Skyreach", -- [2]
					},
					["150169"] = {
						"Toxic Lurker", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["137473"] = {
						"Guard Captain Atu", -- [1]
						"Kings' Rest", -- [2]
					},
					["140354"] = {
						"Brightscale Wind Serpent", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["126215"] = {
						"Zian-Ti Darkweaver", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["146871"] = {
						"Matriarch Nas'naya", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["140677"] = {
						"Hulking Frostbeard", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["157812"] = {
						"Billibub Cogspinner", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["131821"] = {
						"Faceless Maiden", -- [1]
						"Waycrest Manor", -- [2]
					},
					["140429"] = {
						"Drifthopper the Swift", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["44926"] = {
						"Oathsworn Wanderer", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["61634"] = {
						"Commander Vo'jak", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["154619"] = {
						"Watcher Aum-ka", -- [1]
						"Halls of Origination", -- [2]
					},
					["34944"] = {
						"Keep Cannon", -- [1]
						"Isle of Conquest", -- [2]
					},
					["48418"] = {
						"Defias Envoker", -- [1]
						"Deadmines", -- [2]
					},
					["138068"] = {
						"Posh Vacationer", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["139391"] = {
						"Darkwave Assassin", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["138512"] = {
						"Thorisiona", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["11665"] = {
						"Lava Annihilator", -- [1]
						"Molten Core", -- [2]
					},
					["132530"] = {
						"Kul Tiran Vanguard", -- [1]
						"Siege of Boralus", -- [2]
					},
					["146131"] = {
						"Bartok the Burrower", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["105876"] = {
						"Enchanted Broodling", -- [1]
						"The Arcway", -- [2]
					},
					["144836"] = {
						"Spikey", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["152364"] = {
						"Radiance of Azshara", -- [1]
						"The Eternal Palace", -- [2]
					},
					["23501"] = {
						"Hans", -- [1]
						"The Eternal Palace", -- [2]
					},
					["102430"] = {
						"Tarspitter Slug", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["114289"] = {
						"Skeletal Sorcerer", -- [1]
						"Maw of Souls", -- [2]
					},
					["91005"] = {
						"Naraxas", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["75964"] = {
						"Ranjit", -- [1]
						"Skyreach", -- [2]
					},
					["135925"] = {
						"Pyroblaze", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["149337"] = {
						"Coalesced Azerite", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["155616"] = {
						"Zanj'ir Brute", -- [1]
						"The Eternal Palace", -- [2]
					},
					["91008"] = {
						"Rockbound Pelter", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["56762"] = {
						"Yu'lon", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["61436"] = {
						"Sik'thik Bladedancer", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["131818"] = {
						"Marked Sister", -- [1]
						"Waycrest Manor", -- [2]
					},
					["98732"] = {
						"Plagued Rat", -- [1]
						"The Arcway", -- [2]
					},
					["138972"] = {
						"Zian-Ti Cloudbreaker", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140981"] = {
						"Gnashing Horror", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["138628"] = {
						"Amathet Priest", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["161953"] = {
						"Inimot, the Radiant Blade", -- [1]
						"Halls of Origination", -- [2]
					},
					["159578"] = {
						"Exposed Synapse", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["131492"] = {
						"Devout Blood Priest", -- [1]
						"The Underrot", -- [2]
					},
					["23582"] = {
						"Amani'shi Tribesman", -- [1]
						"Zul'Aman", -- [2]
					},
					["54700"] = {
						"Time-Twisted Nightsaber", -- [1]
						"End Time", -- [2]
					},
					["85711"] = {
						"Aquatic Technician", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["136270"] = {
						"Captain Nials", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["129996"] = {
						"Irontide Cleaver", -- [1]
						"Siege of Boralus", -- [2]
					},
					["158588"] = {
						"Gamon", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["160291"] = {
						"Ashwalker Assassin", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["131727"] = {
						"Fenrae the Cunning", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["134789"] = {
						"Monstrous Spineclaw", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["134939"] = {
						"Bristlethorn Maneater", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["138447"] = {
						"Battle-Maiden Salaria", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["147439"] = {
						"Molten Hound", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["131685"] = {
						"Runic Disciple", -- [1]
						"Waycrest Manor", -- [2]
					},
					["144842"] = {
						"Tide Crawler", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["136871"] = {
						"Oomgut Shaman", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["160183"] = {
						"Void Fanatic", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["161293"] = {
						"Neglected Guild Bank", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["134912"] = {
						"Violet Creeper", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["129471"] = {
						"Deepsea Sandcrawler", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["61213"] = {
						"Krik'thik Conscript", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["130241"] = {
						"Zandalari Archon", -- [1]
						"Zul'Aman", -- [2]
					},
					["141061"] = {
						"Servant of Thros", -- [1]
						"Thros, The Blighted Lands", -- [2]
					},
					["146103"] = {
						"Living Bomb", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["43778"] = {
						"Foe Reaper 5000", -- [1]
						"Deadmines", -- [2]
					},
					["137517"] = {
						"Ashvane Destroyer", -- [1]
						"Siege of Boralus", -- [2]
					},
					["140075"] = {
						"Canus", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["144998"] = {
						"Death Specter", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["138851"] = {
						"Soul Hunter", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["44577"] = {
						"General Husam", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["138485"] = {
						"Nuzoriak the Experimenter", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["124583"] = {
						"Garnetback Worm", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["135760"] = {
						"7th Legion Marine", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["138824"] = {
						"Halfid Ironeye", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["44982"] = {
						"Neferset Darkcaster", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["138887"] = {
						"Bloodwake Mystic", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140267"] = {
						"Greathorn Uwanu", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["136721"] = {
						"Circle Spellweaver", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["98919"] = {
						"Seacursed Swiftblade", -- [1]
						"Maw of Souls", -- [2]
					},
					["140301"] = {
						"Scarpaw", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["144789"] = {
						"Ranah Saberclaw", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["157709"] = {
						"Dreliana", -- [1]
						"Blackwing Descent Scenario", -- [2]
					},
					["39962"] = {
						"Twilight Stormbreaker", -- [1]
						"Grim Batol", -- [2]
					},
					["40306"] = {
						"Twilight Armsmaster", -- [1]
						"Grim Batol", -- [2]
					},
					["95072"] = {
						"Greater Earth Elemental", -- [1]
						"Isle of Conquest", -- [2]
					},
					["138016"] = {
						"Darokk", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["155090"] = {
						"Anodized Coilbearer", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["151688"] = {
						"Melonsmasher", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["140425"] = {
						"Surefoot", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138465"] = {
						"Ashvane Cannoneer", -- [1]
						"Siege of Boralus", -- [2]
					},
					["135839"] = {
						"Swampgas", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["136891"] = {
						"Tuskbreaker the Scarred", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["56732"] = {
						"Liu Flameheart", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["139387"] = {
						"Nassa the Cold-Blooded", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["157253"] = {
						"Ka'zir", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["54952"] = {
						"Brittle Ghoul", -- [1]
						"End Time", -- [2]
					},
					["144944"] = {
						"Thirsting Bloodsucker", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["145898"] = {
						"Anointed Disciple", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["146370"] = {
						"Dark Iron Vanguard", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["155930"] = {
						"Deephive Chosen", -- [1]
						"Mogu'shan Scenario", -- [2]
					},
					["156131"] = {
						"Zanj'ir Myrmidon", -- [1]
						"The Eternal Palace", -- [2]
					},
					["159632"] = {
						"Cultist Shadowblade", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["140337"] = {
						"Nightscale Hatchling", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["139397"] = {
						"Mirelurk Lurker", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["146553"] = {
						"Kul Tiran Strongarm", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["144827"] = {
						"Bogbelcher", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["62633"] = {
						"Sik'thik Builder", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["140248"] = {
						"Moonchaser the Swift", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["49495"] = {
						"Chattering Horror", -- [1]
						"Deadmines", -- [2]
					},
					["162238"] = {
						"Darkwhisper Cultist", -- [1]
						"Blackwing Descent Scenario", -- [2]
					},
					["139654"] = {
						"Dampscale Mudskipper", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["126216"] = {
						"Zian-Ti Destroyer", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["130485"] = {
						"Mechanized Peacekeeper", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["134417"] = {
						"Deepsea Ritualist", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["157451"] = {
						"Iron-Willed Enforcer", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["145928"] = {
						"Skavis Nightstalker", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["145307"] = {
						"Forsaken Laborer", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["139005"] = {
						"Wildlands Tracker", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["130765"] = {
						"Jungle Stalker Cub", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["130912"] = {
						"Shadowblade Razi", -- [1]
						"Atal'Dazar", -- [2]
					},
					["129602"] = {
						"Irontide Enforcer", -- [1]
						"Freehold", -- [2]
					},
					["158285"] = {
						"Tinkered Shieldbot", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["140183"] = {
						"Old Muckhide", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["145047"] = {
						"Forsaken Blight Thrower", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["145616"] = {
						"King Rastakhan", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["140992"] = {
						"Corpseburster", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["134284"] = {
						"Fallen Deathspeaker", -- [1]
						"The Underrot", -- [2]
					},
					["140857"] = {
						"Jadeflare", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["148118"] = {
						"Caravan Brutosaur", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["45379"] = {
						"Augh", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["134041"] = {
						"Infected Peasant", -- [1]
						"Waycrest Manor", -- [2]
					},
					["61245"] = {
						"Capacitor Totem", -- [1]
						"Isle of Conquest", -- [2]
					},
					["158284"] = {
						"Craggle Wobbletop", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["101679"] = {
						"Dreadsoul Poisoner", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["100354"] = {
						"Grasping Tentacle", -- [1]
						"Maw of Souls", -- [2]
					},
					["61448"] = {
						"Sik'thik Soldier", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["138840"] = {
						"Zara'thik Impaler", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["120527"] = {
						"Syaith", -- [1]
						"Isle of Conquest", -- [2]
					},
					["140691"] = {
						"Giant Dreadfang", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["61029"] = {
						"Primal Fire Elemental", -- [1]
						"The Eternal Palace", -- [2]
					},
					["138820"] = {
						"Bloodwake Vrykul", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["145035"] = {
						"Swifttail Courser", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138645"] = {
						"Kvaldir Soulflayer", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["56589"] = {
						"Striker Ga'dok", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["140672"] = {
						"Dusthide the Mangy", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["134895"] = {
						"Ironweb Weaver", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["135717"] = {
						"Wild Nightsaber", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["44898"] = {
						"Pygmy Firebreather", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["139475"] = {
						"Jade-Formed Bonesnapper", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["151613"] = {
						"Anti-Personnel Squirrel", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["140101"] = {
						"Swampwallow", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["127503"] = {
						"Overseer Korgus", -- [1]
						"Tol Dagor", -- [2]
					},
					["139203"] = {
						"Verdant Treant", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["157337"] = {
						"Spawn of Shad'har", -- [1]
						"Blackwing Descent Scenario", -- [2]
					},
					["122088"] = {
						"Slitherblade Skulker", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["130011"] = {
						"Irontide Buccaneer", -- [1]
						"Freehold", -- [2]
					},
					["150293"] = {
						"Mechagon Prowler", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["23394"] = {
						"Promenade Sentinel", -- [1]
						"Black Temple", -- [2]
					},
					["139197"] = {
						"Verdant Lasher", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["61242"] = {
						"Glintrok Ironhide", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["139691"] = {
						"Brineshell Squallshaper", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["135923"] = {
						"Hound of Gazzran", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["138849"] = {
						"Hivelord Vix'ick", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["91007"] = {
						"Dargrul", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["134418"] = {
						"Drowned Depthbringer", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["152809"] = {
						"Alx'kov the Infested", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["134893"] = {
						"Ironweb Spider", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["139670"] = {
						"Morgok", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["144957"] = {
						"Shali'i", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["139858"] = {
						"Voru'kar Infector", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["118723"] = {
						"Gazerax", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["98370"] = {
						"Ghostly Councilor", -- [1]
						"Black Rook Hold", -- [2]
					},
					["134800"] = {
						"Hardened Snapjaw", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["91790"] = {
						"Mak'rana Siltwalker", -- [1]
						"Eye of Azshara", -- [2]
					},
					["154565"] = {
						"Loyal Myrmidon", -- [1]
						"The Eternal Palace", -- [2]
					},
					["122963"] = {
						"Rezan", -- [1]
						"Atal'Dazar", -- [2]
					},
					["59778"] = {
						"Krik'thik Striker", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["149346"] = {
						"Suffused Azerite", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["61387"] = {
						"Quilen Guardian", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["135204"] = {
						"Spectral Hex Priest", -- [1]
						"Kings' Rest", -- [2]
					},
					["136885"] = {
						"Bristlemane Bramble-Weaver", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["138564"] = {
						"Kshuun", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["154524"] = {
						"K'thir Mindcarver", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["161229"] = {
						"Aqir Venomweaver", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["162331"] = {
						"Corrupted Neuron", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["97043"] = {
						"Seacursed Slaver", -- [1]
						"Maw of Souls", -- [2]
					},
					["132879"] = {
						"Crystalline Giant", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["135239"] = {
						"Spectral Witch Doctor", -- [1]
						"Kings' Rest", -- [2]
					},
					["114284"] = {
						"Elfyra", -- [1]
						"Return to Karazhan", -- [2]
					},
					["155354"] = {
						"Azshara's Indomitable", -- [1]
						"The Eternal Palace", -- [2]
					},
					["130575"] = {
						"Wandering Axebeak", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["145903"] = {
						"Darkforged Crusader", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["138103"] = {
						"Stromgarde Arbalest", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["91794"] = {
						"Saltscale Lurker", -- [1]
						"Eye of Azshara", -- [2]
					},
					["140559"] = {
						"Volcanor", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["147571"] = {
						"Pa'kura Priestess", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["91785"] = {
						"Wandering Shellback", -- [1]
						"Eye of Azshara", -- [2]
					},
					["58965"] = {
						"Azatik", -- [1]
						"Waycrest Manor", -- [2]
					},
					["144824"] = {
						"Slimeskin Toad", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["130421"] = {
						"Serpent Ward", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["151850"] = {
						"Commander Dilik", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138464"] = {
						"Ashvane Deckhand", -- [1]
						"Siege of Boralus", -- [2]
					},
					["65317"] = {
						"Xiang", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["152324"] = {
						"Aldwin Laughlin", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["130640"] = {
						"Vicejaw Sawtooth", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["80409"] = {
						"Markog Aba'dir", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["161124"] = {
						"Urg'roth, Breaker of Heroes", -- [1]
						"Atal'Dazar", -- [2]
					},
					["123001"] = {
						"Dark Water", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["139664"] = {
						"Dampscale Terrorfin", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["140071"] = {
						"Old One-Fang", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["151689"] = {
						"Clawfoot the Leaper", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["123275"] = {
						"Saltfur Hozen", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["91796"] = {
						"Skrog Wavecrasher", -- [1]
						"Eye of Azshara", -- [2]
					},
					["122971"] = {
						"Dazar'ai Juggernaut", -- [1]
						"Atal'Dazar", -- [2]
					},
					["144839"] = {
						"Whitetail Doe", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["153541"] = {
						"Slavemaster Ul'rok", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["134602"] = {
						"Shrouded Fang", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["133556"] = {
						"Razak Ironsides", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["155900"] = {
						"Zsal'iss", -- [1]
						"The Eternal Palace", -- [2]
					},
					["145934"] = {
						"Ivan the Mad", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["150142"] = {
						"Scrapbone Trashtosser", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["139043"] = {
						"Tidestriker Ocho", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["134612"] = {
						"Grasping Tentacles", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["152331"] = {
						"Captain Lancy Revshon", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["135903"] = {
						"Manifestation of the Deep", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["126983"] = {
						"Harlan Sweete", -- [1]
						"Freehold", -- [2]
					},
					["39854"] = {
						"Azureborne Guardian", -- [1]
						"Grim Batol", -- [2]
					},
					["157419"] = {
						"Void-Twisted Whelp", -- [1]
						"Blackwing Descent Scenario", -- [2]
					},
					["155763"] = {
						"Darkweaver Kar'dress", -- [1]
						"The Eternal Palace", -- [2]
					},
					["43430"] = {
						"Stonecore Berserker", -- [1]
						"The Stonecore", -- [2]
					},
					["140249"] = {
						"Slatehide", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["131407"] = {
						"Venture Goon", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["141565"] = {
						"Kul Tiran Footman", -- [1]
						"Siege of Boralus", -- [2]
					},
					["31146"] = {
						"Raider's Training Dummy", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["130087"] = {
						"Irontide Raider", -- [1]
						"Tol Dagor", -- [2]
					},
					["138439"] = {
						"Slitherqueen Valla", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["59801"] = {
						"Krik'thik Wind Shaper", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["119000"] = {
						"Dreadbeard", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["102272"] = {
						"Felguard Destroyer", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["155275"] = {
						"Tideshaper Korvess", -- [1]
						"The Eternal Palace", -- [2]
					},
					["158373"] = {
						"Roberto Pupellyverbos", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["129469"] = {
						"Deepsea Crawler", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["131858"] = {
						"Thornguard", -- [1]
						"Waycrest Manor", -- [2]
					},
					["135765"] = {
						"Torrent Totem", -- [1]
						"Kings' Rest", -- [2]
					},
					["140674"] = {
						"Deephowl", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140657"] = {
						"Craghorn Behemoth", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["156146"] = {
						"Voidbound Shieldbearer", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["146107"] = {
						"Living Bomb", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["150295"] = {
						"Tank Buster MK1", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["149400"] = {
						"Royal Dreadguard", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["34919"] = {
						"7th Legion Infantry", -- [1]
						"Isle of Conquest", -- [2]
					},
					["161273"] = {
						"Abyssal Spawn", -- [1]
						"Chamber of Heart - Scenario", -- [2]
					},
					["140428"] = {
						"Chasm-Jumper", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["131731"] = {
						"Sown Lasher", -- [1]
						"Waycrest Manor", -- [2]
					},
					["140632"] = {
						"Scaleback Snapper", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["151886"] = {
						"Detached Thought", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140858"] = {
						"Pyrekin", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["162715"] = {
						"Fanatical Cultist", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["140861"] = {
						"Duster", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["156820"] = {
						"Dod", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["138825"] = {
						"Ingathora Blood-Drinker", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["162764"] = {
						"Twisted Appendage", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["139403"] = {
						"Arassaz the Invader", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["139390"] = {
						"Scaleguard Sarrisz", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["52409"] = {
						"Ragnaros", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["78116"] = {
						"Elementale dell'Acqua", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["139433"] = {
						"Sister of Anguish", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["129214"] = {
						"Coin-Operated Crowd Pummeler", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["147957"] = {
						"Azerchrysalis", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["69712"] = {
						"Ji-Kun", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["161312"] = {
						"Crushing Tendril", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["61338"] = {
						"Glintrok Skulker", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["76102"] = {
						"Air Familiar", -- [1]
						"Skyreach", -- [2]
					},
					["139223"] = {
						"Verdant Dryad", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["146759"] = {
						"Treasury Protector", -- [1]
						"Zandalari Treasury", -- [2]
					},
					["139346"] = {
						"Soul-Speaker Galani", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["149591"] = {
						"Rastari Marksman", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["147032"] = {
						"Nathanos Blightcaller", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["39900"] = {
						"Enslaved Rock Elemental", -- [1]
						"Grim Batol", -- [2]
					},
					["75976"] = {
						"Low-Born Arakkoa", -- [1]
						"Skyreach", -- [2]
					},
					["139539"] = {
						"Tavok, Hammer of the Empress", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["138847"] = {
						"Battle-Mender Ka'vaz", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["132921"] = {
						"Tidemistress Sser'ah", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["24180"] = {
						"Amani'shi Protector", -- [1]
						"Zul'Aman", -- [2]
					},
					["163678"] = {
						"Clotted Corruption", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["134828"] = {
						"Aqualing", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["136884"] = {
						"Bristlethorn Battleguard", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["138484"] = {
						"Obsidian Prophet", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["130024"] = {
						"Soggy Shiprat", -- [1]
						"Freehold", -- [2]
					},
					["138391"] = {
						"Norko the Thrower", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["46382"] = {
						"Petty Criminal", -- [1]
						"Stormwind Stockade", -- [2]
					},
					["114712"] = {
						"Runecarver Slave", -- [1]
						"Maw of Souls", -- [2]
					},
					["146847"] = {
						"Summoner Laniella", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["79463"] = {
						"Radiant Supernova", -- [1]
						"Skyreach", -- [2]
					},
					["62360"] = {
						"Corrupt Droplet", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["144956"] = {
						"Razorbite", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["127879"] = {
						"Shieldbearer of Zul", -- [1]
						"Atal'Dazar", -- [2]
					},
					["158371"] = {
						"Zardeth of the Black Claw", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["144955"] = {
						"Zal'zi the Bloodgorged", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["134139"] = {
						"Shrine Templar", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["47296"] = {
						"Helix Gearbreaker", -- [1]
						"Deadmines", -- [2]
					},
					["51052"] = {
						"Gib the Banana-Hoarder", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["44976"] = {
						"Neferset Plaguebringer", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["53189"] = {
						"Molten Elemental", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["99644"] = {
						"Felguard Annihilator", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["148607"] = {
						"Kal'ia Pa'kuaya", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["124159"] = {
						"Lumbering Leo", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["140272"] = {
						"Forest-Strider", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["136051"] = {
						"Fathomus", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["132807"] = {
						"Zian-Ti Quilen", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["146910"] = {
						"Fleshrot Plaguetalon", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["136889"] = {
						"Razorcaller Tuk", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["123210"] = {
						"Seabreeze Gull", -- [1]
						"Freehold", -- [2]
					},
					["98900"] = {
						"Wyrmtongue Trickster", -- [1]
						"Black Rook Hold", -- [2]
					},
					["42810"] = {
						"Crystalspawn Giant", -- [1]
						"The Stonecore", -- [2]
					},
					["141566"] = {
						"Scrimshaw Gutter", -- [1]
						"Siege of Boralus", -- [2]
					},
					["95939"] = {
						"Skrog Tidestomper", -- [1]
						"Eye of Azshara", -- [2]
					},
					["139881"] = {
						"Broodwatcher Taldim-Ra", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["131318"] = {
						"Elder Leaxa", -- [1]
						"The Underrot", -- [2]
					},
					["158478"] = {
						"Corruption Tumor", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["139538"] = {
						"Wall-Breaker Ha'vik", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138841"] = {
						"Zara'thik Battlesinger", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["134796"] = {
						"King Spineclaw", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["136989"] = {
						"Newstead Militia", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["136847"] = {
						"Sandscalp Shadow Hunter", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["156641"] = {
						"Enthralled Weaponsmith", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["19622"] = {
						"Kael'thas Sunstrider", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["151058"] = {
						"Bubbling Blood", -- [1]
						"Crucible of Storms", -- [2]
					},
					["138647"] = {
						"Hjana Fogbringer", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["134900"] = {
						"Venomfang Spider", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["162664"] = {
						"Aqir Swarmer", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["146885"] = {
						"Foulshriek", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["126093"] = {
						"Slitherblade Saurok", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["140990"] = {
						"Bonescale Spitter", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["58812"] = {
						"Hateful Essence", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["22898"] = {
						"Supremus", -- [1]
						"Black Temple", -- [2]
					},
					["105636"] = {
						"Understone Drudge", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["146102"] = {
						"Living Bomb", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["104300"] = {
						"Shadow Mistress", -- [1]
						"Court of Stars", -- [2]
					},
					["157461"] = {
						"Mycelial Cyst", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["140974"] = {
						"Eldercraw", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["49674"] = {
						"Helix Gearbreaker", -- [1]
						"Deadmines", -- [2]
					},
					["102282"] = {
						"Lord Malgath", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["135961"] = {
						"Deepstone Crusher", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["129928"] = {
						"Irontide Powdershot", -- [1]
						"Siege of Boralus", -- [2]
					},
					["147098"] = {
						"Spirit of Xuen", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["144974"] = {
						"Forsaken Alchemist", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["139470"] = {
						"Serpent Master Xisho", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["135716"] = {
						"Nightsaber Hunter", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["161502"] = {
						"Ravenous Fleshfiend", -- [1]
						"Atal'Dazar", -- [2]
					},
					["135819"] = {
						"Living Tornado", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["135552"] = {
						"Deathtouched Slaver", -- [1]
						"Waycrest Manor", -- [2]
					},
					["151679"] = {
						"Stinkfur Thumper", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["138219"] = {
						"Blighted Haunter", -- [1]
						"Thros, The Blighted Lands", -- [2]
					},
					["138627"] = {
						"Amathet Hierophant", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["126847"] = {
						"Captain Raoul", -- [1]
						"Freehold", -- [2]
					},
					["12076"] = {
						"Lava Elemental", -- [1]
						"Molten Core", -- [2]
					},
					["81518"] = {
						"Boneyard Tunneler", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["140546"] = {
						"Broodqueen Vyl'tilac", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138838"] = {
						"Zara'thik Mantid", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140171"] = {
						"Mistfur", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["127757"] = {
						"Reanimated Honor Guard", -- [1]
						"Atal'Dazar", -- [2]
					},
					["118713"] = {
						"Felstrider Orbcaster", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["35189"] = {
						"Gozzie", -- [1]
						"Crucible of Storms", -- [2]
					},
					["129547"] = {
						"Blacktooth Knuckleduster", -- [1]
						"Freehold", -- [2]
					},
					["154552"] = {
						"Amathet Zealot", -- [1]
						"Halls of Origination", -- [2]
					},
					["134216"] = {
						"Shadeweaver Zarra", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["144954"] = {
						"Bloodgorger", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["154175"] = {
						"Horrific Summoner", -- [1]
						"The Eternal Palace", -- [2]
					},
					["100249"] = {
						"Channeler Varisz", -- [1]
						"Eye of Azshara", -- [2]
					},
					["61946"] = {
						"Harthak Stormcaller", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["136836"] = {
						"Shadowbreaker Urzula", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["154685"] = {
						"Echo of Delirium", -- [1]
						"The Eternal Palace", -- [2]
					},
					["155706"] = {
						"Yox'ith", -- [1]
						"Mogu'shan Scenario", -- [2]
					},
					["156884"] = {
						"Essence of Vita", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["138503"] = {
						"Overseer of Twilight", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["133482"] = {
						"Crawler Mine", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["127119"] = {
						"Freehold Deckhand", -- [1]
						"Freehold", -- [2]
					},
					["145223"] = {
						"Thunderscale Adolescent", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["163978"] = {
						"Darkwhisper Cultist", -- [1]
						"Blackwing Descent Scenario", -- [2]
					},
					["152718"] = {
						"Alleria Windrunner", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["105915"] = {
						"Nightborne Reclaimer", -- [1]
						"The Arcway", -- [2]
					},
					["136006"] = {
						"Rowdy Reveler", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["39890"] = {
						"Twilight Earthshaper", -- [1]
						"Grim Batol", -- [2]
					},
					["61670"] = {
						"Sik'thik Demolisher", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["153285"] = {
						"Training Dummy", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["118642"] = {
						"Dreadwing", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["136905"] = {
						"Forward Lookout", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["56439"] = {
						"Sha of Doubt", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["138890"] = {
						"Dargulf the Spirit-Seeker", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["141283"] = {
						"Kul Tiran Halberd", -- [1]
						"Siege of Boralus", -- [2]
					},
					["157813"] = {
						"Sprite Jumpsprocket", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["119157"] = {
						"Felguard", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["145644"] = {
						"Bwonsamdi", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["150297"] = {
						"Mechagon Renormalizer", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["153119"] = {
						"Lesser Void Elemental", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["123146"] = {
						"Torn Spirit", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["161571"] = {
						"Anubisath Sentinel", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["76132"] = {
						"Soaring Chakram Master", -- [1]
						"Skyreach", -- [2]
					},
					["80719"] = {
						"Iron Smith", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["155684"] = {
						"Depthcaller Xith'el", -- [1]
						"Mogu'shan Scenario", -- [2]
					},
					["133944"] = {
						"Aspix", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["146409"] = {
						"Lady Jaina Proudmoore", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["148618"] = {
						"Archdruid Andrenius", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["47626"] = {
						"Admiral Ripsnarl", -- [1]
						"Deadmines", -- [2]
					},
					["137579"] = {
						"Unbound Azerite", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["150250"] = {
						"Pistonhead Blaster", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["139044"] = {
						"Wavemender Asha", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["131112"] = {
						"Cutwater Striker", -- [1]
						"Tol Dagor", -- [2]
					},
					["128435"] = {
						"Toxic Saurid", -- [1]
						"Atal'Dazar", -- [2]
					},
					["138487"] = {
						"Obsidian Wing-Spreader", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["136688"] = {
						"Fanatical Driller", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["135231"] = {
						"Spectral Brute", -- [1]
						"Kings' Rest", -- [2]
					},
					["100529"] = {
						"Hatespawn Slime", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["138979"] = {
						"Muckfin Tidecaller", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["104918"] = {
						"Vigilant Duskwatch", -- [1]
						"Court of Stars", -- [2]
					},
					["157238"] = {
						"Prophet Skitra", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["136859"] = {
						"Bloodscalp", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["138978"] = {
						"Gargantuan Muckfin", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["160904"] = {
						"Image of Absolution", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["129552"] = {
						"Monzumi", -- [1]
						"Atal'Dazar", -- [2]
					},
					["131410"] = {
						"Gargantuan Venomscale", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["102368"] = {
						"Felguard Destroyer", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["132819"] = {
						"Rustpelt Pup", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["145040"] = {
						"Llorin the Clever", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["43934"] = {
						"Soul Fragment", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["135724"] = {
						"Brushstalker", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["157256"] = {
						"Aqir Darter", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["139042"] = {
						"Spearmaster Kashai", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["96247"] = {
						"Vileshard Crawler", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["48445"] = {
						"Oaf Lackey", -- [1]
						"Deadmines", -- [2]
					},
					["98954"] = {
						"Felsworn Myrmidon", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["58960"] = {
						"Метаросе", -- [1]
						"Isle of Conquest", -- [2]
					},
					["139651"] = {
						"Coldlight Deepseer", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["114671"] = {
						"Fragmented Time Particle", -- [1]
						"The Nighthold", -- [2]
					},
					["156818"] = {
						"Wrathion", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["148488"] = {
						"Unliving Augur", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["137486"] = {
						"Queen Patlaa", -- [1]
						"Kings' Rest", -- [2]
					},
					["48419"] = {
						"Defias Miner", -- [1]
						"Deadmines", -- [2]
					},
					["140296"] = {
						"Dampfur the Musky", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["149611"] = {
						"Apetagonizer 3000", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["153532"] = {
						"Aqir Mindhunter", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["56541"] = {
						"Master Snowdrift", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["154727"] = {
						"Sun Prophet Tenhamen", -- [1]
						"Halls of Origination", -- [2]
					},
					["135169"] = {
						"Spirit Drain Totem", -- [1]
						"The Underrot", -- [2]
					},
					["146859"] = {
						"Enslaved Rock Elemental", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["149331"] = {
						"Luminous Azerite", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["141174"] = {
						"Exarch Orelis", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["138642"] = {
						"Kvaldir Reaver", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["151676"] = {
						"Stinkfur Hooligan", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["61445"] = {
						"Haiyan the Unstoppable", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["140968"] = {
						"Garnetback Striker", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["110340"] = {
						"Zouziner", -- [1]
						"Waycrest Manor", -- [2]
					},
					["155278"] = {
						"Shimmerskin Pufferfish", -- [1]
						"The Eternal Palace", -- [2]
					},
					["147955"] = {
						"Georb", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["56747"] = {
						"Gu Cloudstrike", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["77692"] = {
						"Kromog", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["148614"] = {
						"Kul Tiran Cannoneer", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["76116"] = {
						"Diving Chakram Spinner", -- [1]
						"Skyreach", -- [2]
					},
					["147202"] = {
						"Animated Azershard", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["146837"] = {
						"Treasury Sentinel", -- [1]
						"Zandalari Treasury", -- [2]
					},
					["96584"] = {
						"Immoliant Fury", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["140358"] = {
						"Sorrowcall", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["105720"] = {
						"Understone Drudge", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["91793"] = {
						"Seaspray Crab", -- [1]
						"Eye of Azshara", -- [2]
					},
					["48278"] = {
						"Mining Monkey", -- [1]
						"Deadmines", -- [2]
					},
					["98435"] = {
						"Unstable Oozeling", -- [1]
						"The Arcway", -- [2]
					},
					["123274"] = {
						"Saltfur Brawler", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["78932"] = {
						"Driving Gale-Caller", -- [1]
						"Skyreach", -- [2]
					},
					["148631"] = {
						"Unexploded Ordnance", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["127486"] = {
						"Ashvane Officer", -- [1]
						"Tol Dagor", -- [2]
					},
					["138648"] = {
						"Sigrid the Shroud-Weaver", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["149338"] = {
						"Volatile Azerite", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["146492"] = {
						"Phantom of Rage", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["11672"] = {
						"Core Rager", -- [1]
						"Molten Core", -- [2]
					},
					["139035"] = {
						"Razorfin Aqualyte", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["134174"] = {
						"Shadow-Borne Witch Doctor", -- [1]
						"Kings' Rest", -- [2]
					},
					["138515"] = {
						"Endalion", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["61947"] = {
						"Kargesh Ribcrusher", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["126918"] = {
						"Irontide Crackshot", -- [1]
						"Freehold", -- [2]
					},
					["149569"] = {
						"Dazari Worshipper", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["59051"] = {
						"Strife", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["146436"] = {
						"Tempting Siren", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["157604"] = {
						"Crawling Corruption", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["138990"] = {
						"Urgl the Blind", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["22876"] = {
						"Coilskar Soothsayer", -- [1]
						"Black Temple", -- [2]
					},
					["137204"] = {
						"Hoodoo Hexer", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["133389"] = {
						"Galvazzt", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["156653"] = {
						"Coagulated Horror", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["140693"] = {
						"Hisskarath", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["138889"] = {
						"Uvuld the Forseer", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["99541"] = {
						"Risen Skulker", -- [1]
						"Eye of the Storm", -- [2]
					},
					["118719"] = {
						"Wyrmtongue Scavenger", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["136837"] = {
						"Venomancer Ant'su", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["12264"] = {
						"Shazzrah", -- [1]
						"Molten Core", -- [2]
					},
					["146843"] = {
						"Spiked Ghoul", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["46375"] = {
						"Rowdy Troublemaker", -- [1]
						"Stormwind Stockade", -- [2]
					},
					["147105"] = {
						"Solid Ice", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["101437"] = {
						"Burning Geode", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["139432"] = {
						"Lu'si", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["139692"] = {
						"Brineshell Elder", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["140692"] = {
						"Bloodbore", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138631"] = {
						"Pathfinder Qadim", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["144692"] = {
						"Anathos Firecaller", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["49541"] = {
						"Vanessa VanCleef", -- [1]
						"Deadmines", -- [2]
					},
					["123285"] = {
						"Southsea Swabbie", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["54123"] = {
						"Echo of Sylvanas", -- [1]
						"End Time", -- [2]
					},
					["124581"] = {
						"Spineshell Snapper", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["102287"] = {
						"Emberhusk Dominator", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["133345"] = {
						"Feckless Assistant", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["155693"] = {
						"Subdued Brute", -- [1]
						"The Eternal Palace", -- [2]
					},
					["146870"] = {
						"Spellbinder Ohnazae", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["125828"] = {
						"Kattè", -- [1]
						"Atal'Dazar", -- [2]
					},
					["130243"] = {
						"Zandalari Hierophant", -- [1]
						"Zul'Aman", -- [2]
					},
					["140294"] = {
						"Snowfur Wolf", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["139657"] = {
						"Coldlight Shorestriker", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["144807"] = {
						"Ravenous Stalker", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["138992"] = {
						"Muckfin Puddlejumper", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["148665"] = {
						"Rastari Royal Guard", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["146653"] = {
						"Champion Huntress", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["44234"] = {
						"Vicious Leech", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["130319"] = {
						"Slitherblade Phalanx", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["139661"] = {
						"Dampscale Forager", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["152816"] = {
						"Stormling", -- [1]
						"The Eternal Palace", -- [2]
					},
					["10737"] = {
						"Slack", -- [1]
						"Waycrest Manor", -- [2]
					},
					["144232"] = {
						"Rowdy Reveler", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["84233"] = {
						"Thrashtalon Vulture", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["140386"] = {
						"Topaz Borer", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["140085"] = {
						"Pinegraze Greatstag", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["114584"] = {
						"Phantom Crew", -- [1]
						"Return to Karazhan", -- [2]
					},
					["146831"] = {
						"Kul Tiran Stormbringer", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["102566"] = {
						"Grimhorn the Enslaver", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["140147"] = {
						"Great Ursu", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["69943"] = {
						"Sorelion", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["129788"] = {
						"Irontide Bonesaw", -- [1]
						"Freehold", -- [2]
					},
					["140343"] = {
						"Razorwing", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["79092"] = {
						"Fungal Flesh-Eater", -- [1]
						"Highmaul", -- [2]
					},
					["59494"] = {
						"Yeasty Brew Alemental", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["138470"] = {
						"Obsidian Drake", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["102672"] = {
						"Nythendra", -- [1]
						"The Emerald Nightmare", -- [2]
					},
					["139045"] = {
						"Speaker Juchi", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["135932"] = {
						"Volcanar", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["137057"] = {
						"Gurthani the Elder", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["140454"] = {
						"Many-Braids the Elder", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["155845"] = {
						"Crushing Depths", -- [1]
						"The Eternal Palace", -- [2]
					},
					["118804"] = {
						"Domatrax", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["105682"] = {
						"Felguard Destroyer", -- [1]
						"The Arcway", -- [2]
					},
					["100364"] = {
						"Spirit of Vengeance", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["146442"] = {
						"Grunt", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["140123"] = {
						"Weaponmaster Halu", -- [1]
						"Kings' Rest", -- [2]
					},
					["113536"] = {
						"Emberhusk Dominator", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["106786"] = {
						"Bitterbrine Slave", -- [1]
						"Eye of Azshara", -- [2]
					},
					["153092"] = {
						"Venna Seastorm", -- [1]
						"The Eternal Palace", -- [2]
					},
					["99801"] = {
						"Destructor Tentacle", -- [1]
						"Maw of Souls", -- [2]
					},
					["111563"] = {
						"Duskwatch Guard", -- [1]
						"Court of Stars", -- [2]
					},
					["156837"] = {
						"Valeera Sanguinar", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["136483"] = {
						"Ashvane Deckhand", -- [1]
						"Siege of Boralus", -- [2]
					},
					["146110"] = {
						"Waxing Moon", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138568"] = {
						"Shuk'shuguun the Subjugator", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140436"] = {
						"Snorthoof", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["127485"] = {
						"Bilge Rat Looter", -- [1]
						"Tol Dagor", -- [2]
					},
					["135366"] = {
						"Blacktooth Arsonist", -- [1]
						"Tol Dagor", -- [2]
					},
					["139097"] = {
						"Sandswept Marksman", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["95861"] = {
						"Hatecoil Oracle", -- [1]
						"Eye of Azshara", -- [2]
					},
					["142413"] = {
						"Wisp", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["137092"] = {
						"Valorcall Faithful", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["140324"] = {
						"Stonehusk Harvester", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["132740"] = {
						"Venomscale Hydra", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["161335"] = {
						"Void Horror", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["146119"] = {
						"Needleback Brute", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["140108"] = {
						"Deathsting Scorpid", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["135958"] = {
						"Malachite", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["130918"] = {
						"Archelion Great Turtle", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["76097"] = {
						"Solar Familiar", -- [1]
						"Skyreach", -- [2]
					},
					["139357"] = {
						"Icetusk Shambler", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138829"] = {
						"Ingel the Cunning", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["137062"] = {
						"Blood-Hunter Akal", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["14465"] = {
						"Alliance Battle Standard", -- [1]
						"Isle of Conquest", -- [2]
					},
					["104273"] = {
						"Jazshariu", -- [1]
						"Court of Stars", -- [2]
					},
					["139420"] = {
						"Bog Defender Vaszash", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["158041"] = {
						"N'Zoth the Corruptor", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["146949"] = {
						"Sputtering Fleshrender", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["40269"] = {
						"Enslaved Thunder Spirit", -- [1]
						"Grim Batol", -- [2]
					},
					["148611"] = {
						"Yoru'cha", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["123288"] = {
						"Southsea Cannoneer", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["147928"] = {
						"Geoscatter", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["23584"] = {
						"Amani Bear", -- [1]
						"Zul'Aman", -- [2]
					},
					["119930"] = {
						"Dreadwing", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["108624"] = {
						"Turtle", -- [1]
						"Kings' Rest", -- [2]
					},
					["114541"] = {
						"Spectral Patron", -- [1]
						"Return to Karazhan", -- [2]
					},
					["133935"] = {
						"Animated Guardian", -- [1]
						"Kings' Rest", -- [2]
					},
					["11664"] = {
						"Flamewaker Elite", -- [1]
						"Molten Core", -- [2]
					},
					["130436"] = {
						"Off-Duty Laborer", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["29264"] = {
						"Spirit Wolf", -- [1]
						"Isle of Conquest", -- [2]
					},
					["151836"] = {
						"Void Horror", -- [1]
						"Emerald Dream - HoA Scenario", -- [2]
					},
					["135044"] = {
						"Shredmaw the Voracious", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["148584"] = {
						"Archmage Mordent Evenshade", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["133627"] = {
						"Tally Zapnabber", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["114634"] = {
						"Undying Servant", -- [1]
						"Return to Karazhan", -- [2]
					},
					["129366"] = {
						"Bilge Rat Buccaneer", -- [1]
						"Siege of Boralus", -- [2]
					},
					["135646"] = {
						"Bloodstripe the Render", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["68098"] = {
						"Ashtongue Worker", -- [1]
						"Pursuing the Black Harvest", -- [2]
					},
					["147026"] = {
						"Forsaken Bilespitter", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["140545"] = {
						"Broodqueen Flareanae", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138576"] = {
						"Faceless Tendril", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["162718"] = {
						"Iron-Willed Enforcer", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["139343"] = {
						"Icetusk Drudge", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["58456"] = {
						"Wolf", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["53006"] = {
						"Spirit Link Totem", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["143002"] = {
						"Kirin Tor Invoker", -- [1]
						"Thros, The Blighted Lands", -- [2]
					},
					["143753"] = {
						"Vazun Starspeaker", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["102395"] = {
						"Infiltrator Assassin", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["158376"] = {
						"Psychus", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["22855"] = {
						"Illidari Nightlord", -- [1]
						"Black Temple", -- [2]
					},
					["156949"] = {
						"Armsmaster Terenson", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["138440"] = {
						"Lady Assana", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["135644"] = {
						"Dawnstalker", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["141170"] = {
						"Lightbound Sharpshooter", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["157439"] = {
						"Fury of N'Zoth", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["21362"] = {
						"Phoenix", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["56658"] = {
						"Corrupt Droplet", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["132299"] = {
						"Angry Treant", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["156406"] = {
						"Voidbound Honor Guard", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["136831"] = {
						"Witherbranch Witch Doctor", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["144637"] = {
						"Grong", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["54544"] = {
						"Echo of Tyrande", -- [1]
						"End Time", -- [2]
					},
					["139678"] = {
						"Shoal-Walker", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140978"] = {
						"Doomtunnel", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["102269"] = {
						"Felstalker Ravener", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["147967"] = {
						"7th Legion Marine", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["134821"] = {
						"Vilegaze Petrifier", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["130909"] = {
						"Fetid Maggot", -- [1]
						"The Underrot", -- [2]
					},
					["140290"] = {
						"S.H.E.E.P.", -- [1]
						"Isle of Conquest", -- [2]
					},
					["140662"] = {
						"Elder Greatfur", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["42845"] = {
						"Rock Borer", -- [1]
						"The Stonecore", -- [2]
					},
					["142949"] = {
						"Theramore Citizen", -- [1]
						"Thros, The Blighted Lands", -- [2]
					},
					["48447"] = {
						"Monstrous Parrot", -- [1]
						"Deadmines", -- [2]
					},
					["127477"] = {
						"Saltwater Snapper", -- [1]
						"Tol Dagor", -- [2]
					},
					["144248"] = {
						"Head Machinist Sparkflux", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["61340"] = {
						"Glintrok Hexxer", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["65402"] = {
						"Gurthan Swiftblade", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["139218"] = {
						"Life-Tender Olvarius", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["140855"] = {
						"Trickle", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["157368"] = {
						"Velinaria", -- [1]
						"Blackwing Descent Scenario", -- [2]
					},
					["105419"] = {
						"Dire Basilisk", -- [1]
						"Eye of the Storm", -- [2]
					},
					["155760"] = {
						"Tank Buster MK2", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["115226"] = {
						"Ravenian", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["151612"] = {
						"Amathet Sun Priest", -- [1]
						"Halls of Origination", -- [2]
					},
					["68204"] = {
						"Unbound Rogue", -- [1]
						"Pursuing the Black Harvest", -- [2]
					},
					["155271"] = {
						"Abyssal Spearhunter", -- [1]
						"The Eternal Palace", -- [2]
					},
					["113537"] = {
						"Emberhusk Dominator", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["132901"] = {
						"Gulan Yaungol", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["22874"] = {
						"Coilskar Harpooner", -- [1]
						"Black Temple", -- [2]
					},
					["118716"] = {
						"Bilespray Lasher", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["131863"] = {
						"Raal the Gluttonous", -- [1]
						"Waycrest Manor", -- [2]
					},
					["58826"] = {
						"Zao Sunseeker", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["140355"] = {
						"Brightscale Screecher", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["79587"] = {
						"BIGklaus", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["129370"] = {
						"Irontide Waveshaper", -- [1]
						"Siege of Boralus", -- [2]
					},
					["37799"] = {
						"Vile Spirit", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["140659"] = {
						"Ragestomp", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["148164"] = {
						"Boomshot Specialist", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["146740"] = {
						"Mag'har Beastlord", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["140643"] = {
						"Ferocious Craghorn", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["97264"] = {
						"Hatecoil Shellbreaker", -- [1]
						"Eye of Azshara", -- [2]
					},
					["98426"] = {
						"Unstable Ooze", -- [1]
						"The Arcway", -- [2]
					},
					["116550"] = {
						"Spectral Patron", -- [1]
						"Return to Karazhan", -- [2]
					},
					["135248"] = {
						"Briona the Bloodthirsty", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["138019"] = {
						"Kul Tiran Vanguard", -- [1]
						"Siege of Boralus", -- [2]
					},
					["134823"] = {
						"Unbreakable Crystalspine", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["131411"] = {
						"Venomscale Monitor", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["45097"] = {
						"Oathsworn Tamer", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["138431"] = {
						"Tidemistress Najula", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["40270"] = {
						"Twilight Thundercaller", -- [1]
						"Grim Batol", -- [2]
					},
					["140835"] = {
						"Scheming Flame", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["140038"] = {
						"Abyssal Eel", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["157609"] = {
						"K'thir Mindcarver", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["147621"] = {
						"Dark Iron Vanguard", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["120405"] = {
						"Dreadwing", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["140432"] = {
						"Craghoof Leaper", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["151096"] = {
						"Fellnase", -- [1]
						"Ashran", -- [2]
					},
					["128434"] = {
						"Feasting Skyscreamer", -- [1]
						"Atal'Dazar", -- [2]
					},
					["140973"] = {
						"Bore Tunneler", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["44045"] = {
						"Darkened Creation", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["140114"] = {
						"Clatterclaw", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["137626"] = {
						"Demolishing Terror", -- [1]
						"Siege of Boralus", -- [2]
					},
					["134994"] = {
						"Spectral Headhunter", -- [1]
						"Kings' Rest", -- [2]
					},
					["76087"] = {
						"Defense Construct", -- [1]
						"Skyreach", -- [2]
					},
					["140385"] = {
						"Gemshell Broodkeeper", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["161745"] = {
						"Hepthys", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["140154"] = {
						"Rotclaw Patriarch", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138427"] = {
						"Spitefin Harpooner", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["124350"] = {
						"Kunzen Crusher", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["62005"] = {
						"Beast", -- [1]
						"Eye of the Storm", -- [2]
					},
					["140392"] = {
						"Direbore of the Thousand Tunnels", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["56766"] = {
						"Volatile Energy", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["120770"] = {
						"Felguard Destroyer", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["23337"] = {
						"Illidari Centurion", -- [1]
						"Black Temple", -- [2]
					},
					["139388"] = {
						"Zess'ez", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["123269"] = {
						"Kook", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["144952"] = {
						"Hookfang", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["81315"] = {
						"Iron Crack-Shot", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["119169"] = {
						"Fulminating Lasher", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["79303"] = {
						"Adorned Bladetalon", -- [1]
						"Skyreach", -- [2]
					},
					["61623"] = {
						"Sap Globule", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["133660"] = {
						"BomBot 9000", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["139038"] = {
						"Kaihu", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["139351"] = {
						"Shadowspeaker Angolo", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["48279"] = {
						"Goblin Overseer", -- [1]
						"Deadmines", -- [2]
					},
					["138061"] = {
						"Venture Co. Longshoreman", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["129699"] = {
						"Ludwig Von Tortollan", -- [1]
						"Freehold", -- [2]
					},
					["99307"] = {
						"Skjal", -- [1]
						"Maw of Souls", -- [2]
					},
					["98425"] = {
						"Unstable Amalgamation", -- [1]
						"The Arcway", -- [2]
					},
					["136011"] = {
						"Bloodstone", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["105699"] = {
						"Mana Saber", -- [1]
						"Court of Stars", -- [2]
					},
					["131383"] = {
						"Sporecaller Zancha", -- [1]
						"The Underrot", -- [2]
					},
					["12018"] = {
						"Majordomo Executus", -- [1]
						"Molten Core", -- [2]
					},
					["130635"] = {
						"Stonefury", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["152236"] = {
						"Lady Ashvane", -- [1]
						"The Eternal Palace", -- [2]
					},
					["91782"] = {
						"Hatecoil Crusher", -- [1]
						"Eye of Azshara", -- [2]
					},
					["65414"] = {
						"Ethereal Sha", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["139224"] = {
						"Dryad Grove-Tender", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["148199"] = {
						"Screeching Phantasm", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["61699"] = {
						"Sik'thik Amberwing", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["137026"] = {
						"Newstead Hound", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["81114"] = {
						"Gronnling Laborer", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["133912"] = {
						"Bloodsworn Defiler", -- [1]
						"The Underrot", -- [2]
					},
					["138064"] = {
						"Posh Vacationer", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["136010"] = {
						"Faceted Earthbreaker", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["132837"] = {
						"Beach Strider", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["23402"] = {
						"Illidari Battle-mage", -- [1]
						"Black Temple", -- [2]
					},
					["157450"] = {
						"Spellbound Ritualist", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["134894"] = {
						"Ironweb Spinner", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["120016"] = {
						"Necrotic Spiderling", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["139039"] = {
						"Eso the Fathom-Hunter", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["48421"] = {
						"Defias Overseer", -- [1]
						"Deadmines", -- [2]
					},
					["95888"] = {
						"Cordana Felsong", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["12099"] = {
						"Firesworn", -- [1]
						"Molten Core", -- [2]
					},
					["149341"] = {
						"Vitrified Azerite", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["139674"] = {
						"Deepscale", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138349"] = {
						"Vengeful Ghost", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["56890"] = {
						"Krik'thik Infiltrator", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["129232"] = {
						"Mogul Razdunk", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["140444"] = {
						"Muskflank Bull", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["151752"] = {
						"Voidswarm", -- [1]
						"Emerald Dream - HoA Scenario", -- [2]
					},
					["144759"] = {
						"Keeper Dagda", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["162719"] = {
						"Void Ascendant", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["124580"] = {
						"Grotto Terrapin", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["59426"] = {
						"Bopper", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["147344"] = {
						"Opulence", -- [1]
						"Zandalari Treasury", -- [2]
					},
					["96587"] = {
						"Felsworn Infester", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["148716"] = {
						"Risen Soul", -- [1]
						"The Underrot", -- [2]
					},
					["139658"] = {
						"Coldlight Murkdweller", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["159417"] = {
						"Demented Knife-Twister", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["48505"] = {
						"Defias Shadowguard", -- [1]
						"Deadmines", -- [2]
					},
					["61337"] = {
						"Glintrok Ironhide", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["154744"] = {
						"Toxic Monstrosity", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["144825"] = {
						"Toxinbelly Croaker", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["22963"] = {
						"Bonechewer Worker", -- [1]
						"Black Temple", -- [2]
					},
					["149441"] = {
						"Frozen Ballista", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["130653"] = {
						"Wanton Sapper", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["76973"] = {
						"Hans'gar", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["139892"] = {
						"Voru'kar Swarmling", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["147958"] = {
						"Geoactive Refraction", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["134617"] = {
						"Krolusk Hatchling", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["134797"] = {
						"Ocean Recluse", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["157254"] = {
						"Tek'ris", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["85748"] = {
						"Iron Mauler", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["129367"] = {
						"Bilge Rat Tempest", -- [1]
						"Siege of Boralus", -- [2]
					},
					["139806"] = {
						"Venture Demolitions Expert", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["136012"] = {
						"Mountanus the Immovable", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["105921"] = {
						"Nightborne Spellsword", -- [1]
						"The Arcway", -- [2]
					},
					["151674"] = {
						"Stinkfur Hopling", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["145053"] = {
						"Eldritch Abomination", -- [1]
						"Crucible of Storms", -- [2]
					},
					["137233"] = {
						"Plague Toad", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["146960"] = {
						"Shambling Deadeye", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["135736"] = {
						"Gore", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["34924"] = {
						"High Commander Halford Wyrmbane", -- [1]
						"Isle of Conquest", -- [2]
					},
					["133463"] = {
						"Venture Co. War Machine", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["136826"] = {
						"Gulan Firespeaker", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["128631"] = {
						"Tidal Clickshell", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["22939"] = {
						"Temple Concubine", -- [1]
						"Black Temple", -- [2]
					},
					["136825"] = {
						"Gulan Oathguard", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["139036"] = {
						"Razorfin Javelineer", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["40268"] = {
						"Twilight War-Mage", -- [1]
						"Grim Batol", -- [2]
					},
					["140344"] = {
						"Sky Viper", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["11671"] = {
						"Core Hound", -- [1]
						"Molten Core", -- [2]
					},
					["139413"] = {
						"Mirelurk Oasis-Speaker", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["135989"] = {
						"Shieldbearer of Zul", -- [1]
						"Atal'Dazar", -- [2]
					},
					["164188"] = {
						"Horrific Figment", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["42188"] = {
						"Ozruk", -- [1]
						"The Stonecore", -- [2]
					},
					["87719"] = {
						"Ogron Hauler", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["139001"] = {
						"Wildlands Ursa", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["132713"] = {
						"Mogul Razdunk", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["137012"] = {
						"Newstead Huntsman", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["140841"] = {
						"Snickering Ripple", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["139680"] = {
						"Lightless Hunter", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["91006"] = {
						"Rockback Gnasher", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["140675"] = {
						"Den Mother Mugo", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["146326"] = {
						"Headhunter Gal'wana", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["139808"] = {
						"Venture Oaf", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["148243"] = {
						"Fallen Disciple", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["124354"] = {
						"Kunzen Hunter", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["139392"] = {
						"Mirelurk Saurok", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["149351"] = {
						"Rhodochrosite", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["131123"] = {
						"Enchanted Tiki Mask", -- [1]
						"Atal'Dazar", -- [2]
					},
					["151876"] = {
						"Wandering Spirit", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["147932"] = {
						"Agitated Azershard", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["12098"] = {
						"Sulfuron Harbinger", -- [1]
						"Molten Core", -- [2]
					},
					["54320"] = {
						"banthalos", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["114544"] = {
						"Skeletal Usher", -- [1]
						"Return to Karazhan", -- [2]
					},
					["154554"] = {
						"Amathet Guardian", -- [1]
						"Halls of Origination", -- [2]
					},
					["59461"] = {
						"Hopling", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["134283"] = {
						"Anchorite Lanna", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["59800"] = {
						"Krik'thik Rager", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["136984"] = {
						"Reban", -- [1]
						"Kings' Rest", -- [2]
					},
					["152910"] = {
						"Queen Azshara", -- [1]
						"The Eternal Palace", -- [2]
					},
					["97173"] = {
						"Restless Tides", -- [1]
						"Eye of Azshara", -- [2]
					},
					["133079"] = {
						"Newstead Farmhand", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["58856"] = {
						"Haunting Sha", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["49532"] = {
						"Enraged Worgen", -- [1]
						"Deadmines", -- [2]
					},
					["139353"] = {
						"Unliving Champion", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["56637"] = {
						"Ook-Ook", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["140259"] = {
						"Runehoof Greatstag", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["40953"] = {
						"Khaaphom", -- [1]
						"Grim Batol", -- [2]
					},
					["56754"] = {
						"Azure Serpent", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["139459"] = {
						"Stonebound Soldier", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["144822"] = {
						"Golden Flametongue", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["124259"] = {
						"Jungle Tiger", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["127480"] = {
						"Stinging Parasite", -- [1]
						"Tol Dagor", -- [2]
					},
					["145977"] = {
						"Mammoth Stonehide", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["147588"] = {
						"Treasury Defender", -- [1]
						"Zandalari Treasury", -- [2]
					},
					["119724"] = {
						"Tidal Surger", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["159224"] = {
						"Gryth'ax the Executioner", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["122986"] = {
						"Wild Skyscreamer", -- [1]
						"Atal'Dazar", -- [2]
					},
					["133384"] = {
						"Merektha", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["139417"] = {
						"Rotwood the Cursed", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["44704"] = {
						"Minion of Siamat", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["100713"] = {
						"Rockbait Fisher", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["104275"] = {
						"Imacu'tya", -- [1]
						"Court of Stars", -- [2]
					},
					["108360"] = {
						"Acidmaw Scorpid", -- [1]
						"The Nighthold", -- [2]
					},
					["151027"] = {
						"Thornguard Burton", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["135045"] = {
						"Spinesnapper", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["151839"] = {
						"Restless Soul", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["155871"] = {
						"Voidbound Terror", -- [1]
						"The Eternal Palace", -- [2]
					},
					["40272"] = {
						"Ascended Rockbreaker", -- [1]
						"Grim Batol", -- [2]
					},
					["133852"] = {
						"Living Rot", -- [1]
						"The Underrot", -- [2]
					},
					["130489"] = {
						"Dazarian Stalker", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["139626"] = {
						"Dredged Sailor", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["24175"] = {
						"Amani'shi Lookout", -- [1]
						"Zul'Aman", -- [2]
					},
					["97087"] = {
						"Valarjar Champion", -- [1]
						"Halls of Valor", -- [2]
					},
					["138652"] = {
						"Tide-Cursed Mistress", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["99366"] = {
						"Taintheart Summoner", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["130621"] = {
						"Squallshaper Bryson", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["144693"] = {
						"Manceroy Flamefist", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["132920"] = {
						"Shadow Serpent", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["126101"] = {
						"Duskcoat Huntress", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["153244"] = {
						"Oblivion Elemental", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["149311"] = {
						"Shandris Feathermoon", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["98203"] = {
						"Ivanyr", -- [1]
						"The Arcway", -- [2]
					},
					["138498"] = {
						"Twilight Drake", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["92610"] = {
						"Understone Drummer", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["151059"] = {
						"Eternal Guardian", -- [1]
						"Crucible of Storms", -- [2]
					},
					["119977"] = {
						"Stranglevine Lasher", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["102246"] = {
						"Anub'esset", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["145061"] = {
						"Screeching Nightwing", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["150137"] = {
						"Faceless Subduer", -- [1]
						"Uldir Scenario", -- [2]
					},
					["140834"] = {
						"Laughing Blaze", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["134786"] = {
						"Spineclaw Sandsnapper", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["150160"] = {
						"Scrapbone Bully", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["146111"] = {
						"Twenty Points", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["147787"] = {
						"7th Legion Battlemage", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["147378"] = {
						"Treasury Protector", -- [1]
						"Zandalari Treasury", -- [2]
					},
					["139034"] = {
						"Razorfin Impaler", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["59459"] = {
						"Hopling", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["140773"] = {
						"Deepsea Tidecrusher", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["143009"] = {
						"Daelin Proudmoore", -- [1]
						"Thros, The Blighted Lands", -- [2]
					},
					["140620"] = {
						"South Sea Stinger", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["135241"] = {
						"Bilge Rat Pillager", -- [1]
						"Siege of Boralus", -- [2]
					},
					["102253"] = {
						"Understone Demolisher", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["98081"] = {
						"Bellowing Idol", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["144299"] = {
						"Workshop Defender", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["44980"] = {
						"Neferset Theurgist", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["140068"] = {
						"Rustpelt Snarler", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["134795"] = {
						"Veiled Hermit", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["132910"] = {
						"Bristlemane Squealer", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["144295"] = {
						"Mechagon Mechanic", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["134909"] = {
						"Chittering Spindleweb", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["137058"] = {
						"Hexxer Magoda", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["68173"] = {
						"Freed Imp", -- [1]
						"Pursuing the Black Harvest", -- [2]
					},
					["136250"] = {
						"Hoodoo Hexer", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["139760"] = {
						"Head Navigator Franklin", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["125977"] = {
						"Reanimation Totem", -- [1]
						"Atal'Dazar", -- [2]
					},
					["134822"] = {
						"Gritplate Matriarch", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["48521"] = {
						"Defias Squallshaper", -- [1]
						"Deadmines", -- [2]
					},
					["135759"] = {
						"Earthwall Totem", -- [1]
						"Kings' Rest", -- [2]
					},
					["144755"] = {
						"Zaxasj the Speaker", -- [1]
						"Crucible of Storms", -- [2]
					},
					["98521"] = {
						"Lord Etheldrin Ravencrest", -- [1]
						"Black Rook Hold", -- [2]
					},
					["139759"] = {
						"Mutineer Jalia", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["140681"] = {
						"Gurudu The Gorge", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["23694"] = {
						"Pulsing Pumpkin", -- [1]
						"Scarlet Monastery", -- [2]
					},
					["130027"] = {
						"Ashvane Marine", -- [1]
						"Tol Dagor", -- [2]
					},
					["76310"] = {
						"Grand Defense Construct", -- [1]
						"Skyreach", -- [2]
					},
					["140564"] = {
						"Brimstone Lavamaw", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["76376"] = {
						"Skyreach Arcanologist", -- [1]
						"Skyreach", -- [2]
					},
					["140678"] = {
						"Frostbeard Howler", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["157602"] = {
						"Drest'agath", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["142947"] = {
						"Theramore Citizen", -- [1]
						"Thros, The Blighted Lands", -- [2]
					},
					["163841"] = {
						"Amalgamation of Flesh", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["144782"] = {
						"Brother Bruen", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["138388"] = {
						"Kung", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["140437"] = {
						"Slow Olo", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["59551"] = {
						"Bopper", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["149144"] = {
						"Jaina's Tide Elemental", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["140846"] = {
						"Impish Breeze", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["98205"] = {
						"Corstilax", -- [1]
						"The Arcway", -- [2]
					},
					["76267"] = {
						"Solar Zealot", -- [1]
						"Skyreach", -- [2]
					},
					["145975"] = {
						"Stonehide Buck", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["136833"] = {
						"Witherbranch Venom Priest", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["122967"] = {
						"Priestess Alun'za", -- [1]
						"Atal'Dazar", -- [2]
					},
					["139394"] = {
						"Mirelurk Bog Priest", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["100820"] = {
						"Spirit Wolf", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["114262"] = {
						"Attumen the Huntsman", -- [1]
						"Return to Karazhan", -- [2]
					},
					["160061"] = {
						"Crawling Corruption", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["138479"] = {
						"Obsidian Overlord", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140553"] = {
						"Broodqueen Shuzasz", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["137443"] = {
						"Friar Farshire", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["155619"] = {
						"Zanj'ir Honor Guard", -- [1]
						"The Eternal Palace", -- [2]
					},
					["105651"] = {
						"Dreadborne Seer", -- [1]
						"The Arcway", -- [2]
					},
					["161408"] = {
						"Malicious Growth", -- [1]
						"The Underrot", -- [2]
					},
					["59598"] = {
						"Lesser Sha", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["65612"] = {
						"Minka", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["140558"] = {
						"Inferno Terror", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["86613"] = {
						"Fungal Flesh-Eater", -- [1]
						"Highmaul", -- [2]
					},
					["140658"] = {
						"Bristlefur", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["49850"] = {
						"Defias Enforcer", -- [1]
						"Deadmines", -- [2]
					},
					["138836"] = {
						"Zara'thik Swarmguard", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["151902"] = {
						"Vile Spirit", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["148615"] = {
						"Div'yane", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["48262"] = {
						"Ogre Bodyguard", -- [1]
						"Deadmines", -- [2]
					},
					["86612"] = {
						"Spore Shooter", -- [1]
						"Highmaul", -- [2]
					},
					["134157"] = {
						"Shadow-Borne Warrior", -- [1]
						"Kings' Rest", -- [2]
					},
					["118712"] = {
						"Felstrider Enforcer", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["144849"] = {
						"Darkscale Scout", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["97365"] = {
						"Seacursed Mistmender", -- [1]
						"Maw of Souls", -- [2]
					},
					["96754"] = {
						"Harbaron", -- [1]
						"Maw of Souls", -- [2]
					},
					["145195"] = {
						"Dredge Fleet Destroyer", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["140450"] = {
						"Dunu the Blind", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["146816"] = {
						"Sir Barton Brigham", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["124489"] = {
						"Highlands Lumberjack", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["128652"] = {
						"Viq'Goth", -- [1]
						"Siege of Boralus", -- [2]
					},
					["49852"] = {
						"Defias Shadowguard", -- [1]
						"Deadmines", -- [2]
					},
					["149617"] = {
						"Death Specter", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["138506"] = {
						"Crimsonscale", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["139690"] = {
						"Brineshell Seacaller", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["61442"] = {
						"Kuai the Brute", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["105629"] = {
						"Wyrmtongue Scavenger", -- [1]
						"The Arcway", -- [2]
					},
					["118690"] = {
						"Wrathguard Invader", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["146109"] = {
						"Midnight Charger", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["132820"] = {
						"Mudsnout Piglet", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["76877"] = {
						"Gruul", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["136828"] = {
						"Witherbranch Warrior", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["56877"] = {
						"Raigonn", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["39961"] = {
						"Enslaved Water Spirit", -- [1]
						"Grim Batol", -- [2]
					},
					["156866"] = {
						"Ra-den", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["43917"] = {
						"Rock Borer", -- [1]
						"The Stonecore", -- [2]
					},
					["11658"] = {
						"Molten Giant", -- [1]
						"Molten Core", -- [2]
					},
					["152704"] = {
						"Crawling Corruption", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["149635"] = {
						"Blooming Protector", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["56765"] = {
						"Destroying Sha", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["130896"] = {
						"Blackout Barrel", -- [1]
						"Freehold", -- [2]
					},
					["76974"] = {
						"Franzok", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["146854"] = {
						"Stella Darkpaw", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["157447"] = {
						"Fanatical Cultist", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["23682"] = {
						"Headless Horseman", -- [1]
						"Scarlet Monastery", -- [2]
					},
					["118175"] = {
						"Storm Elemental", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["53231"] = {
						"Lava Scion", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["91783"] = {
						"Hatecoil Stormweaver", -- [1]
						"Eye of Azshara", -- [2]
					},
					["136830"] = {
						"Witherbranch Headhunter", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["140270"] = {
						"Wilderbuck", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["56631"] = {
						"Hopling", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["152396"] = {
						"Guardian of Azeroth", -- [1]
						"Isle of Conquest", -- [2]
					},
					["22949"] = {
						"Gathios the Shatterer", -- [1]
						"Black Temple", -- [2]
					},
					["158158"] = {
						"Forge-Guard Hurrul", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["139041"] = {
						"Aquamancer Lushu", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["140072"] = {
						"Direprowl the Ravager", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140383"] = {
						"Jeweled Scarab", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["146770"] = {
						"Druid of the Claw", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["49815"] = {
						"Shale Spider", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["145129"] = {
						"Deathguard Champion", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["145402"] = {
						"Frenzied Wildheart", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["87521"] = {
						"Iron Slag-Shaper", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["22917"] = {
						"Illidan Stormrage", -- [1]
						"Black Temple", -- [2]
					},
					["135830"] = {
						"Galefury", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["146828"] = {
						"Feral Pup", -- [1]
						"Havenswood (Islands 2)", -- [2]
					},
					["146866"] = {
						"Enslaved Frost Elemental", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["138819"] = {
						"Bloodwake Marauder", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["145211"] = {
						"Thunderscale Whelpling", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["56906"] = {
						"Saboteur Kip'tilak", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["138575"] = {
						"General Shuul'aqar", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["136860"] = {
						"Tracker Vu'ka", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["91789"] = {
						"Lady Hatecoil", -- [1]
						"Eye of Azshara", -- [2]
					},
					["48229"] = {
						"Kobold Digger", -- [1]
						"Deadmines", -- [2]
					},
					["140076"] = {
						"Knucklebump Silverback", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["134804"] = {
						"Timeless Runeback", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["135959"] = {
						"Quakestomp the Rumbler", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["97269"] = {
						"Hatecoil Crestrider", -- [1]
						"Eye of Azshara", -- [2]
					},
					["76778"] = {
						"Life-Pact Familiar", -- [1]
						"Skyreach", -- [2]
					},
					["152988"] = {
						"Faceless Shadowcaller", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["95766"] = {
						"Crazed Razorbeak", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["127048"] = {
						"Drywhisker Digger", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["43286"] = {
						"Crystal Shard", -- [1]
						"The Stonecore", -- [2]
					},
					["129372"] = {
						"Blacktar Bomber", -- [1]
						"Siege of Boralus", -- [2]
					},
					["54688"] = {
						"Time-Twisted Nightsaber", -- [1]
						"End Time", -- [2]
					},
					["139339"] = {
						"Icetusk Defender", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["147965"] = {
						"Volatile Azerite", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["153090"] = {
						"Lady Venomtongue", -- [1]
						"The Eternal Palace", -- [2]
					},
					["40320"] = {
						"Valiona", -- [1]
						"Grim Batol", -- [2]
					},
					["140836"] = {
						"Brightfire", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["146493"] = {
						"Phantom of Slaughter", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["139345"] = {
						"Deathwhisperer Kulu", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["159425"] = {
						"Occult Shadowmender", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["150859"] = {
						"Za'qul", -- [1]
						"The Eternal Palace", -- [2]
					},
					["151659"] = {
						"Rocket Tonk", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["100216"] = {
						"Hatecoil Wrangler", -- [1]
						"Eye of Azshara", -- [2]
					},
					["98533"] = {
						"Foul Mother", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["56895"] = {
						"Weak Spot", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["140844"] = {
						"Zephis", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["135962"] = {
						"Crag Rager", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["43658"] = {
						"Frenzied Crocolisk", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["140439"] = {
						"Muskflank Herdleader", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["102446"] = {
						"Fel Lord Betrug", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["138475"] = {
						"Tyrantion", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["59820"] = {
						"Pandaren Cannoneer", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["132922"] = {
						"Enslaved Murloc", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["59555"] = {
						"Haunting Sha", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["131445"] = {
						"Block Warden", -- [1]
						"Tol Dagor", -- [2]
					},
					["139695"] = {
						"Swipeclaw", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["155628"] = {
						"Azsh'ari Oracle", -- [1]
						"The Eternal Palace", -- [2]
					},
					["140384"] = {
						"Jeweled Broodwatcher", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["139666"] = {
						"Orgl the Totemic", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["153022"] = {
						"Snang", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["140442"] = {
						"Muskflank Yak", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["126422"] = {
						"Coralback Scuttler", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["136714"] = {
						"Hulking Laborer", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["149339"] = {
						"Permeated Azerite", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["137835"] = {
						"Vicious Black Bear", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["132802"] = {
						"Craghorn Yeti", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["134799"] = {
						"Fathomclaw", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["155276"] = {
						"Bursting Cragfish", -- [1]
						"The Eternal Palace", -- [2]
					},
					["146850"] = {
						"Grand Master Ulrich", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["152669"] = {
						"Void Globule", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["158367"] = {
						"Basher Tentacle", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["144690"] = {
						"Mestrah", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["152852"] = {
						"Pashmar the Fanatical", -- [1]
						"The Eternal Palace", -- [2]
					},
					["150165"] = {
						"Slime Elemental", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["22952"] = {
						"Veras Darkshadow", -- [1]
						"Black Temple", -- [2]
					},
					["118705"] = {
						"Nal'asha", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["132532"] = {
						"Kul Tiran Marksman", -- [1]
						"Siege of Boralus", -- [2]
					},
					["136854"] = {
						"Baruun Flinthoof", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["134060"] = {
						"Lord Stormsong", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["136878"] = {
						"Headbang", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["140059"] = {
						"Grizzlefur Mauler", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["95920"] = {
						"Animated Storm", -- [1]
						"Eye of Azshara", -- [2]
					},
					["144837"] = {
						"Darkshore Stag", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["138968"] = {
						"Zian-Ti Ironmaw", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["130318"] = {
						"Slitherblade Prophet", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["138392"] = {
						"Bono", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["61056"] = {
						"Primal Earth Elemental", -- [1]
						"Crucible of Storms", -- [2]
					},
					["53021"] = {
						"Amani'shi Peon", -- [1]
						"Zul'Aman", -- [2]
					},
					["140266"] = {
						"Broken-Horn the Ancient", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["44922"] = {
						"Oathsworn Axemaster", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["96028"] = {
						"Wrath of Azshara", -- [1]
						"Eye of Azshara", -- [2]
					},
					["76143"] = {
						"Rukhran", -- [1]
						"Skyreach", -- [2]
					},
					["144168"] = {
						"Ashvane Destroyer", -- [1]
						"Siege of Boralus", -- [2]
					},
					["138570"] = {
						"Herald Razzaqi", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["147225"] = {
						"Azerite Extractor", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["147835"] = {
						"Rastari Alpha", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["140979"] = {
						"Greatfangs", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["151579"] = {
						"Shield Generator", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["74962"] = {
						"Stoneshamble Basilisk", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["104818"] = {
						"Ancestral Protection Totem", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["128921"] = {
						"Duskcoat Tiger", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["151638"] = {
						"Crazed Earth Rager", -- [1]
						"Neltharion's Lair - HoA Scenario", -- [2]
					},
					["158690"] = {
						"Cultist Tormenter", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["148921"] = {
						"Kaldorei Glaive Thrower", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["161895"] = {
						"Thing From Beyond", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["139669"] = {
						"Shaman Garmr", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["22877"] = {
						"Coilskar Wrangler", -- [1]
						"Black Temple", -- [2]
					},
					["133430"] = {
						"Venture Co. Mastermind", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["56912"] = {
						"Krik'thik Engulfer", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["140984"] = {
						"Frostbore Worm", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["144245"] = {
						"South Sea Glider", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["132056"] = {
						"Venture Co. Skyscorcher", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["130025"] = {
						"Irontide Thug", -- [1]
						"Tol Dagor", -- [2]
					},
					["140273"] = {
						"Runehoof Denkeeper", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140797"] = {
						"Corpseharvest", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["114802"] = {
						"Spectral Journeyman", -- [1]
						"Return to Karazhan", -- [2]
					},
					["144301"] = {
						"Living Waste", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["142953"] = {
						"Theramore Citizen", -- [1]
						"Thros, The Blighted Lands", -- [2]
					},
					["138565"] = {
						"My'lyth", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["140161"] = {
						"Duneburrower", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["95771"] = {
						"Dreadsoul Ruiner", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["130400"] = {
						"Irontide Crusher", -- [1]
						"Freehold", -- [2]
					},
					["11673"] = {
						"Ancient Core Hound", -- [1]
						"Molten Core", -- [2]
					},
					["139341"] = {
						"Icetusk Shadowcaster", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["146905"] = {
						"Deranged Plaguefiend", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["134905"] = {
						"Shadeweb Huntress", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140160"] = {
						"Boilhide the Raging", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["161286"] = {
						"Dark Ritualist", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["139395"] = {
						"Mirelurk Bogtender", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["16236"] = {
						"Eye Stalk", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["152512"] = {
						"Stormwraith", -- [1]
						"The Eternal Palace", -- [2]
					},
					["140389"] = {
						"Tunnel-Keeper Ky'nyx", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140096"] = {
						"Mudsnout Boar", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["146876"] = {
						"Machitu the Brutal", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["139679"] = {
						"Argl", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["99188"] = {
						"Waterlogged Soul Guard", -- [1]
						"Maw of Souls", -- [2]
					},
					["149000"] = {
						"Baleful Guardian Spirit", -- [1]
						"Zandalari Treasury", -- [2]
					},
					["127381"] = {
						"Silt Crab", -- [1]
						"Tol Dagor", -- [2]
					},
					["118801"] = {
						"Imp", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["146911"] = {
						"Fleshrot Blighthound", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["11661"] = {
						"Flamewaker", -- [1]
						"Molten Core", -- [2]
					},
					["158279"] = {
						"Haywire Clockwork Rocket Bot", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["12101"] = {
						"Lava Surger", -- [1]
						"Molten Core", -- [2]
					},
					["102404"] = {
						"Stoneclaw Grubmaster", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["145132"] = {
						"Veteran Deathguard", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["140690"] = {
						"Dreadfang Viper", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["43612"] = {
						"High Prophet Barim", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["136045"] = {
						"Crushtide", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["138482"] = {
						"Kaluriak the Alchemist", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["120556"] = {
						"Dreadwing", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["136844"] = {
						"Sandscalp Warrior", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["146596"] = {
						"Darkscale Myrmidon", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["132491"] = {
						"Kul Tiran Marksman", -- [1]
						"Siege of Boralus", -- [2]
					},
					["139467"] = {
						"Qinsu the Granite Fist", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["142587"] = {
						"Devouring Maggot", -- [1]
						"Waycrest Manor", -- [2]
					},
					["80534"] = {
						"Ornery Ironhoof", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["129828"] = {
						"Brineshell Clacker", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["60208"] = {
						"Hopling", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["135975"] = {
						"Off-Duty Laborer", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["144747"] = {
						"Pa'ku's Aspect", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["129600"] = {
						"Bilge Rat Brinescale", -- [1]
						"Freehold", -- [2]
					},
					["138643"] = {
						"Kvaldir Berserker", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["140449"] = {
						"Thickflank", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["43014"] = {
						"Imp", -- [1]
						"The Stonecore", -- [2]
					},
					["139860"] = {
						"Voru'kar Skitterer", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["130639"] = {
						"Vicejaw Chomper", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["49670"] = {
						"Glubtok", -- [1]
						"Deadmines", -- [2]
					},
					["144765"] = {
						"Asithra Diresong", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["129374"] = {
						"Scrimshaw Enforcer", -- [1]
						"Siege of Boralus", -- [2]
					},
					["136713"] = {
						"Highlands Laborer", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["116549"] = {
						"Backup Singer", -- [1]
						"Return to Karazhan", -- [2]
					},
					["152135"] = {
						"Void-Twisted Spellweaver", -- [1]
						"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
					},
					["126424"] = {
						"Coralback Surfcrawler", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["48451"] = {
						"Ol' Beaky", -- [1]
						"Deadmines", -- [2]
					},
					["61247"] = {
						"Glintrok Greenhorn", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["150397"] = {
						"King Mechagon", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["44895"] = {
						"Augh", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["129599"] = {
						"Cutwater Knife Juggler", -- [1]
						"Freehold", -- [2]
					},
					["102583"] = {
						"Fel Scorcher", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["157607"] = {
						"Faceless Shadowcaller", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["136864"] = {
						"Uguu the Feared", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["102336"] = {
						"Portal Keeper", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["144293"] = {
						"Waste Processing Unit", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["47403"] = {
						"Defias Reaper", -- [1]
						"Deadmines", -- [2]
					},
					["158565"] = {
						"Naros", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["123293"] = {
						"Royal Sand Crab", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["157620"] = {
						"Prophet Skitra", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["98691"] = {
						"Risen Scout", -- [1]
						"Black Rook Hold", -- [2]
					},
					["90998"] = {
						"Blightshard Shaper", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["146844"] = {
						"Olfkrig the Indentured", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["139946"] = {
						"Heart Guardian", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["134935"] = {
						"Mother Vishis", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["77128"] = {
						"Pack Beast", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["127484"] = {
						"Jes Howlis", -- [1]
						"Tol Dagor", -- [2]
					},
					["140777"] = {
						"Gemshard Colossus", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["154470"] = {
						"Shandris Feathermoon", -- [1]
						"The Eternal Palace", -- [2]
					},
					["139342"] = {
						"Icetusk Warrior", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140661"] = {
						"Valethunder", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["132170"] = {
						"Striped Pacu", -- [1]
						"The Eternal Palace", -- [2]
					},
					["18128"] = {
						"Sporebat", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["104247"] = {
						"Duskwatch Arcanist", -- [1]
						"Court of Stars", -- [2]
					},
					["140112"] = {
						"Stonelash", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["146757"] = {
						"Dark Executor", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["157158"] = {
						"Cultist Slavedriver", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["146864"] = {
						"Mistscorn Earthbinder", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["162828"] = {
						"Corrosive Digester", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["103344"] = {
						"Oakheart", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["136207"] = {
						"Stromgarde Defender", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["143425"] = {
						"Echo of Garrosh Hellscream", -- [1]
						"Siege of Orgrimmar - Mag'har Orc Unlock Scenario", -- [2]
					},
					["146840"] = {
						"Skeleton Guardian", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["129371"] = {
						"Riptide Shredder", -- [1]
						"Siege of Boralus", -- [2]
					},
					["77477"] = {
						"Marak the Blooded", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["111463"] = {
						"HadP", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["149358"] = {
						"Colossal Azergem Crystalback", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["137940"] = {
						"Safety Shark", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["134993"] = {
						"Mchimba the Embalmer", -- [1]
						"Kings' Rest", -- [2]
					},
					["150143"] = {
						"Scrapbone Grinder", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["43622"] = {
						"Corrupting Adherent", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["146956"] = {
						"Ashen Deathguard", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["91797"] = {
						"King Deepbeard", -- [1]
						"Eye of Azshara", -- [2]
					},
					["61398"] = {
						"Xin the Weaponmaster", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["161746"] = {
						"Ossirat", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["21212"] = {
						"Lady Vashj", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["59519"] = {
						"Stout Brew Alemental", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["63508"] = {
						"Xuen", -- [1]
						"Waycrest Manor", -- [2]
					},
					["12119"] = {
						"Flamewaker Protector", -- [1]
						"Molten Core", -- [2]
					},
					["140995"] = {
						"Ruinstalker", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["150253"] = {
						"Weaponized Crawler", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["137484"] = {
						"King A'akul", -- [1]
						"Kings' Rest", -- [2]
					},
					["146875"] = {
						"Valimok the Vicious", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["139663"] = {
						"Dampscale Reedweaver", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["157354"] = {
						"Vexiona", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["131974"] = {
						"Lieutenant Valen", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["138846"] = {
						"Amberwinged Mindsinger", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["126451"] = {
						"Crushclaw", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["131009"] = {
						"Spirit of Gold", -- [1]
						"Atal'Dazar", -- [2]
					},
					["80676"] = {
						"Iron Flametwister", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["140382"] = {
						"Jeweled Harvester", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["105703"] = {
						"Mana Wyrm", -- [1]
						"Court of Stars", -- [2]
					},
					["99358"] = {
						"Rotheart Dryad", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["40357"] = {
						"Invoked Flaming Spirit", -- [1]
						"Grim Batol", -- [2]
					},
					["129016"] = {
						"Southsea Musketeer", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["78714"] = {
						"Kargath Bladefist", -- [1]
						"Highmaul", -- [2]
					},
					["138247"] = {
						"Irontide Marauder", -- [1]
						"Siege of Boralus", -- [2]
					},
					["61240"] = {
						"Glintrok Skulker", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["155708"] = {
						"Tentacle", -- [1]
						"Mogu'shan Scenario", -- [2]
					},
					["100531"] = {
						"Bloodtainted Fury", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["151657"] = {
						"Bomb Tonk", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["129548"] = {
						"Blacktooth Brute", -- [1]
						"Freehold", -- [2]
					},
					["136840"] = {
						"Zoga", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["144826"] = {
						"Man-Eater", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["76253"] = {
						"Dread Raven Hatchling", -- [1]
						"Skyreach", -- [2]
					},
					["138255"] = {
						"Ashvane Spotter", -- [1]
						"Siege of Boralus", -- [2]
					},
					["149356"] = {
						"Enraged Azergem Crystalback", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["45259"] = {
						"Servant of Siamat", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["143011"] = {
						"Sandy Perch", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["146907"] = {
						"Risen Marksman", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["137103"] = {
						"Blood Visage", -- [1]
						"The Underrot", -- [2]
					},
					["140084"] = {
						"Crushknuckle", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["145372"] = {
						"Wild Mooncaller", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["149349"] = {
						"Calcified Azerite", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["144772"] = {
						"Lady Tamakeen", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["43438"] = {
						"Corborus", -- [1]
						"The Stonecore", -- [2]
					},
					["140455"] = {
						"Bramblefur Calf", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["160420"] = {
						"Angry Book Spirit", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["138433"] = {
						"Tidemistress Vessana", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["135895"] = {
						"Blazing Spark", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["142986"] = {
						"King Varian Wrynn", -- [1]
						"Thros, The Blighted Lands", -- [2]
					},
					["41095"] = {
						"Twilight Drake", -- [1]
						"Grim Batol", -- [2]
					},
					["146848"] = {
						"Eerie Conglomeration", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["144973"] = {
						"Kaldorei Sentinel", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["84860"] = {
						"Iron Earthbinder", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["104251"] = {
						"Duskwatch Sentry", -- [1]
						"Court of Stars", -- [2]
					},
					["22056"] = {
						"Coilfang Strider", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["139476"] = {
						"Stonebound Monstrosity", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["134898"] = {
						"Venomfang Recluse", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["12056"] = {
						"Baron Geddon", -- [1]
						"Molten Core", -- [2]
					},
					["61392"] = {
						"Harthak Flameseeker", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["142948"] = {
						"Theramore Citizen", -- [1]
						"Thros, The Blighted Lands", -- [2]
					},
					["138641"] = {
						"Kvaldir Dreadbringer", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["23581"] = {
						"Amani'shi Medicine Man", -- [1]
						"Zul'Aman", -- [2]
					},
					["54920"] = {
						"Infinite Suppressor", -- [1]
						"End Time", -- [2]
					},
					["140854"] = {
						"Flow", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["146835"] = {
						"Ghoul", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["134791"] = {
						"Luminous Crawler", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["140457"] = {
						"Bramblefur Grazer", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["34607"] = {
						"Nerubian Burrower", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["156980"] = {
						"Essence of Void", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["146832"] = {
						"Necromancer Disciple", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["58319"] = {
						"Lesser Sha", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["144160"] = {
						"Chopper Redhook", -- [1]
						"Siege of Boralus", -- [2]
					},
					["139349"] = {
						"Grave-Caller Muja", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["140697"] = {
						"Vile Asp", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["133734"] = {
						"Rune Scribe Lusaris", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["128551"] = {
						"Irontide Mastiff", -- [1]
						"Freehold", -- [2]
					},
					["140260"] = {
						"Runehoof Courser", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["131847"] = {
						"Waycrest Reveler", -- [1]
						"Waycrest Manor", -- [2]
					},
					["140086"] = {
						"Pinegraze Courser", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["137511"] = {
						"Bilge Rat Cutthroat", -- [1]
						"Siege of Boralus", -- [2]
					},
					["56473"] = {
						"Flying Snow", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["140434"] = {
						"Craghoof Rockhorn", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["154682"] = {
						"Echo of Fear", -- [1]
						"The Eternal Palace", -- [2]
					},
					["22950"] = {
						"High Nethermancer Zerevor", -- [1]
						"Black Temple", -- [2]
					},
					["126423"] = {
						"Coralback Crab", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["140562"] = {
						"Brimstone Hound", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["96657"] = {
						"Blade Dancer Illianna", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["136347"] = {
						"Tidesage Initiate", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["97119"] = {
						"Shroud Hound", -- [1]
						"Maw of Souls", -- [2]
					},
					["133972"] = {
						"Heavy Cannon", -- [1]
						"Tol Dagor", -- [2]
					},
					["79208"] = {
						"Blackrock Enforcer", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["137051"] = {
						"Ancient Mindbender", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["144993"] = {
						"Crazed Thistlebear", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["140371"] = {
						"Egg-Tender Ny'xik", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["133835"] = {
						"Feral Bloodswarmer", -- [1]
						"The Underrot", -- [2]
					},
					["140333"] = {
						"Steelshell", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["98733"] = {
						"Withered Fiend", -- [1]
						"The Arcway", -- [2]
					},
					["151900"] = {
						"Horrific Summoner", -- [1]
						"The Eternal Palace", -- [2]
					},
					["150818"] = {
						"Disturbed Blood Globule", -- [1]
						"Uldir Scenario", -- [2]
					},
					["98949"] = {
						"Smashspite the Hateful", -- [1]
						"Black Rook Hold", -- [2]
					},
					["23028"] = {
						"Bonechewer Taskmaster", -- [1]
						"Black Temple", -- [2]
					},
					["140369"] = {
						"Cryptseeker", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["139355"] = {
						"Guran the Frostblade", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["146829"] = {
						"Undying Guardian", -- [1]
						"Crucible of Storms", -- [2]
					},
					["157137"] = {
						"Terror Tendril", -- [1]
						"Halls of Origination", -- [2]
					},
					["139410"] = {
						"Visz the Silent Blade", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["158343"] = {
						"Organ of Corruption", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["158452"] = {
						"Mindtwist Tendril", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["148432"] = {
						"Thunderaan's Fury Totem", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["87229"] = {
						"Iron Blood Mage", -- [1]
						"Highmaul", -- [2]
					},
					["132803"] = {
						"Rockmane Wendigo", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140544"] = {
						"Kindleweb Skitterer", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["146834"] = {
						"Necromancer Master", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["135838"] = {
						"Grimebreeze", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["95887"] = {
						"Glazer", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["145399"] = {
						"Wild Starcaller", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["62348"] = {
						"Sik'thik Soldier", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["122089"] = {
						"Slitherblade Oracle", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["145273"] = {
						"The Hand of In'zashi", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["139675"] = {
						"Fathom-Seeker", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["72895"] = {
						"Burning Berserker", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["136868"] = {
						"Oomgut Scrapper", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["21364"] = {
						"Phoenix Egg", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["140682"] = {
						"Glacierfist", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["136824"] = {
						"Gulan Flamecaller", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["68151"] = {
						"Essence of Order", -- [1]
						"Pursuing the Black Harvest", -- [2]
					},
					["126100"] = {
						"Duskcoat Prowler", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["131617"] = {
						"Groundskeeper Lilith", -- [1]
						"Waycrest Manor", -- [2]
					},
					["139676"] = {
						"Wave-Speaker Ormrg", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138307"] = {
						"Smashface", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["134364"] = {
						"Faithless Tender", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["88314"] = {
						"Dungeoneer's Training Dummy", -- [1]
						"SMV Alliance Garrison Level 3", -- [2]
					},
					["159303"] = {
						"Monstrous Behemoth", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["138473"] = {
						"Stygia", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["136829"] = {
						"Witherbranch Axe Thrower", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["131823"] = {
						"Sister Malady", -- [1]
						"Waycrest Manor", -- [2]
					},
					["143020"] = {
						"Gorak Tul", -- [1]
						"Thros, The Blighted Lands", -- [2]
					},
					["140335"] = {
						"Nightscale Screecher", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["22883"] = {
						"Aqueous Spawn", -- [1]
						"Black Temple", -- [2]
					},
					["77476"] = {
						"Iron Crack-Shot", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["156577"] = {
						"Therum Deepforge", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["155797"] = {
						"Animated Guardian", -- [1]
						"Mogu'shan Scenario", -- [2]
					},
					["136000"] = {
						"Beryllus", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["152866"] = {
						"Hardened Azerite", -- [1]
						"The Maelstrom - Heart of Azeroth", -- [2]
					},
					["23889"] = {
						"Amani'shi Savage", -- [1]
						"Zul'Aman", -- [2]
					},
					["139004"] = {
						"Wildlands Shaman", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["138504"] = {
						"General Drakkarion", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["136881"] = {
						"Bristlemane Pathfinder", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["136214"] = {
						"Windspeaker Heldis", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["153065"] = {
						"Voidbound Ravager", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["104295"] = {
						"Blazing Imp", -- [1]
						"Court of Stars", -- [2]
					},
					["160416"] = {
						"Angry Ale Barrel Spirit", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["99033"] = {
						"Helarjar Mistcaller", -- [1]
						"Maw of Souls", -- [2]
					},
					["145041"] = {
						"Swifttail Stalker", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["150190"] = {
						"HK-8 Aerial Oppression Unit", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["120371"] = {
						"Helblaze Imp", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["33502"] = {
						"Core Hound", -- [1]
						"Waycrest Manor", -- [2]
					},
					["140083"] = {
						"Kula the Thunderer", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["128928"] = {
						"Crab Egg", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["136100"] = {
						"Sunken Denizen", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["34564"] = {
						"Anub'arak", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["135475"] = {
						"Kula the Butcher", -- [1]
						"Kings' Rest", -- [2]
					},
					["140440"] = {
						"Bloodfur the Gorer", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["146860"] = {
						"Mistscorn Marauder", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["140799"] = {
						"Driftstalker", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["140695"] = {
						"Albino Dreadfang", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140151"] = {
						"Rotclaw Cub", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["157605"] = {
						"Burrowing Appendage", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["134801"] = {
						"Cracked-Shell", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["140329"] = {
						"Vy'lix the Corpse-Mauler", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["79068"] = {
						"Iron Grunt", -- [1]
						"Highmaul", -- [2]
					},
					["146106"] = {
						"Living Bomb", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["132868"] = {
						"Congealed Azerite", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["56764"] = {
						"Consuming Sha", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["56719"] = {
						"Sha of Violence", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["107114"] = {
						"Tormenting Orb", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["136592"] = {
						"Flynn Fairwind", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["130028"] = {
						"Ashvane Priest", -- [1]
						"Tol Dagor", -- [2]
					},
					["139354"] = {
						"Butun the Boneripper", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["103225"] = {
						"Acidmaw Scorpid", -- [1]
						"The Nighthold", -- [2]
					},
					["76266"] = {
						"High Sage Viryx", -- [1]
						"Skyreach", -- [2]
					},
					["23397"] = {
						"Illidari Blood Lord", -- [1]
						"Black Temple", -- [2]
					},
					["129305"] = {
						"Rapacious Fathomjaw", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["162305"] = {
						"Aqir Heartpiercer", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["140153"] = {
						"Rotclaw Bear", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["148200"] = {
						"Restless Bones", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["155685"] = {
						"Deephive Soldier", -- [1]
						"Mogu'shan Scenario", -- [2]
					},
					["151742"] = {
						"Void-Twisted Invader", -- [1]
						"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
					},
					["137064"] = {
						"Valorcall Marksman", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["98208"] = {
						"Advisor Vandros", -- [1]
						"The Arcway", -- [2]
					},
					["131812"] = {
						"Heartsbane Soulcharmer", -- [1]
						"Waycrest Manor", -- [2]
					},
					["135007"] = {
						"Orb Guardian", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["138562"] = {
						"Void Maggot", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["151056"] = {
						"Varanq'ul the Mighty", -- [1]
						"Crucible of Storms", -- [2]
					},
					["98207"] = {
						"Nal'tira", -- [1]
						"The Arcway", -- [2]
					},
					["140989"] = {
						"Bonescale Worm", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["99365"] = {
						"Taintheart Stalker", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["137713"] = {
						"Big Money Crab", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["134764"] = {
						"Clattershell", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["149355"] = {
						"Aberrant Azergem Crystalback", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["12259"] = {
						"Gehennas", -- [1]
						"Molten Core", -- [2]
					},
					["139662"] = {
						"Dampscale Raincaller", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["130584"] = {
						"Gorespike", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["49539"] = {
						"James Harrington", -- [1]
						"Deadmines", -- [2]
					},
					["34776"] = {
						"Siege Engine", -- [1]
						"Isle of Conquest", -- [2]
					},
					["39873"] = {
						"Twilight Wyrmcaller", -- [1]
						"Grim Batol", -- [2]
					},
					["96756"] = {
						"Ymiron, the Fallen King", -- [1]
						"Maw of Souls", -- [2]
					},
					["159405"] = {
						"Aqir Scarab", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["126969"] = {
						"Trothak", -- [1]
						"Freehold", -- [2]
					},
					["118700"] = {
						"Felblight Stalker", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["136882"] = {
						"Bristlemane Defender", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["134787"] = {
						"Spineclaw Crab", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["104218"] = {
						"Advisor Melandrus", -- [1]
						"Court of Stars", -- [2]
					},
					["111081"] = {
						"Fulminant", -- [1]
						"The Nighthold", -- [2]
					},
					["22875"] = {
						"Coilskar Sea-Caller", -- [1]
						"Black Temple", -- [2]
					},
					["146112"] = {
						"Inkfur Behemoth", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["146945"] = {
						"Swarming Voidspawn", -- [1]
						"Crucible of Storms", -- [2]
					},
					["59487"] = {
						"Bubble Shield", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["87448"] = {
						"Ironworker", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["144767"] = {
						"Gonk's Aspect", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["134137"] = {
						"Temple Attendant", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["151918"] = {
						"Raz'kah of the North", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138375"] = {
						"Smoos", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["75975"] = {
						"Skyreach Overlord", -- [1]
						"Skyreach", -- [2]
					},
					["138486"] = {
						"Aluriak", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["63106"] = {
						"Sik'thik Swarmer", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["146256"] = {
						"Laminaria", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["138469"] = {
						"Obsidian Scalebane", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["144840"] = {
						"Mottled Fawn", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["150254"] = {
						"Scraphound", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["134793"] = {
						"Glowspine", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["58959"] = {
						"Zeppik", -- [1]
						"The Eternal Palace", -- [2]
					},
					["155612"] = {
						"Azsh'ari Channeler", -- [1]
						"The Eternal Palace", -- [2]
					},
					["124351"] = {
						"Kunzen Boneripper", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["61701"] = {
						"Sik'thik Warrior", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["104274"] = {
						"Baalgar the Watchful", -- [1]
						"Court of Stars", -- [2]
					},
					["133738"] = {
						"Astralite Visara", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["151785"] = {
						"Void-Twisted Wyrmkiller", -- [1]
						"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
					},
					["137458"] = {
						"Rotting Spore", -- [1]
						"The Underrot", -- [2]
					},
					["133943"] = {
						"Minion of Zul", -- [1]
						"Kings' Rest", -- [2]
					},
					["139804"] = {
						"Venture Inspector", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["129208"] = {
						"Dread Captain Lockwood", -- [1]
						"Siege of Boralus", -- [2]
					},
					["17252"] = {
						"Krimnixx", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["149508"] = {
						"Ice Blocked Nathanos", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["134686"] = {
						"Mature Krolusk", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["138516"] = {
						"Twilight Evolutionist", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["152834"] = {
						"Azerite Skitterer", -- [1]
						"The Maelstrom - Heart of Azeroth", -- [2]
					},
					["129227"] = {
						"Azerokk", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["130335"] = {
						"Gritplate Crystaleye", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["135365"] = {
						"Matron Alma", -- [1]
						"Waycrest Manor", -- [2]
					},
					["12100"] = {
						"Lava Reaver", -- [1]
						"Molten Core", -- [2]
					},
					["48450"] = {
						"Sunwing Squawker", -- [1]
						"Deadmines", -- [2]
					},
					["140376"] = {
						"Duneshell Scarab", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140339"] = {
						"Vale Terror", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["59545"] = {
						"The Golden Beetle", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["107435"] = {
						"Suspicious Noble", -- [1]
						"Court of Stars", -- [2]
					},
					["148195"] = {
						"Hateful Shade", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["78981"] = {
						"Iron Gunnery Sergeant", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["122973"] = {
						"Dazar'ai Confessor", -- [1]
						"Atal'Dazar", -- [2]
					},
					["86611"] = {
						"Mind Fungus", -- [1]
						"Highmaul", -- [2]
					},
					["138991"] = {
						"Grrl", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["135837"] = {
						"Cyclonic Lieutenant", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["153526"] = {
						"Aqir Swarmer", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["139537"] = {
						"Zara'thik Kunchong", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["59819"] = {
						"Artillery", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["61485"] = {
						"General Pa'valak", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["152325"] = {
						"Rebecca Laughlin", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["85241"] = {
						"Night-Twisted Brute", -- [1]
						"Highmaul", -- [2]
					},
					["36701"] = {
						"Raging Spirit", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["40448"] = {
						"Twilight Enforcer", -- [1]
						"Grim Batol", -- [2]
					},
					["134767"] = {
						"Deathclaw Egg-Mother", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["8889"] = {
						"Anvilrage Overseer", -- [1]
						"Blackrock Depths", -- [2]
					},
					["129231"] = {
						"Rixxa Fluxflame", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["145001"] = {
						"Lanara Moonshade", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["65522"] = {
						"Bubble Shield", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["139671"] = {
						"Sharkslayer Mugluk", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["151916"] = {
						"Zaegra Sharpaxe", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["56706"] = {
						"Krik'thik Bombardier", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["102372"] = {
						"Felhound Mage Slayer", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["139681"] = {
						"Bleakfin", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["78351"] = {
						"Uktar", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["140609"] = {
						"Ravenous Mako", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["139659"] = {
						"Dampscale Oracle", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["136005"] = {
						"Rowdy Reveler", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["160182"] = {
						"Void Initiate", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["153377"] = {
						"Goop", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["139761"] = {
						"Deckmaster O'Rourke", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["146113"] = {
						"Thunderhoof", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["135474"] = {
						"Thistle Acolyte", -- [1]
						"Waycrest Manor", -- [2]
					},
					["77252"] = {
						"Ore Crate", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["157825"] = {
						"Crazed Tormenter", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["140370"] = {
						"Corpsefeaster", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["150251"] = {
						"Pistonhead Mechanic", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["98970"] = {
						"Latosius", -- [1]
						"Black Rook Hold", -- [2]
					},
					["140357"] = {
						"Venomreaver", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["152009"] = {
						"Malfunctioning Scrapbot", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["130298"] = {
						"Water Elemental", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["44897"] = {
						"Pygmy Scout", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["48756"] = {
						"Hooked Net", -- [1]
						"Grim Batol", -- [2]
					},
					["131311"] = {
						"Unleashed Azerite", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["155723"] = {
						"Swarmguard Kzaz", -- [1]
						"Mogu'shan Scenario", -- [2]
					},
					["137716"] = {
						"Bottom Feeder", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["139698"] = {
						"Clattercraw the Oracle", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["129879"] = {
						"Irontide Cleaver", -- [1]
						"Siege of Boralus", -- [2]
					},
					["114801"] = {
						"Spectral Apprentice", -- [1]
						"Return to Karazhan", -- [2]
					},
					["155738"] = {
						"Rallying Banner", -- [1]
						"The Eternal Palace", -- [2]
					},
					["128651"] = {
						"Hadal Darkfathom", -- [1]
						"Siege of Boralus", -- [2]
					},
					["122970"] = {
						"Shadowblade Stalker", -- [1]
						"Atal'Dazar", -- [2]
					},
					["146874"] = {
						"Windcaller Mariah", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["39390"] = {
						"Twilight Drake", -- [1]
						"Grim Batol", -- [2]
					},
					["146114"] = {
						"Surging Winds", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["145865"] = {
						"Worgen Musketeer", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["130581"] = {
						"Sand-Eye", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["98756"] = {
						"Arcane Anomaly", -- [1]
						"The Arcway", -- [2]
					},
					["131817"] = {
						"Cragmaw the Infested", -- [1]
						"The Underrot", -- [2]
					},
					["139462"] = {
						"Stonebound Shale-Speaker", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["139442"] = {
						"Backbreaker Zukan", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["124349"] = {
						"Kunzen Leafeater", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["113128"] = {
						"Withered Skulker", -- [1]
						"The Nighthold", -- [2]
					},
					["148962"] = {
						"Ravenous Stalker", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["140159"] = {
						"Dreadgrowl the Pustulent", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138651"] = {
						"Sylveria Reefcaller", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["134056"] = {
						"Aqu'sirr", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["76814"] = {
						"Flamebender Ka'graz", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["140378"] = {
						"Duneshell Broodwatcher", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140251"] = {
						"Pinegraze Buck", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["45378"] = {
						"Augh", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["140298"] = {
						"Gol'kun the Vicious", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["147561"] = {
						"Forsaken Blightspreader", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["32485"] = {
						"King Krush", -- [1]
						"Ashran", -- [2]
					},
					["134908"] = {
						"Bloodfang", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["138002"] = {
						"Scrimshaw Gutter", -- [1]
						"Siege of Boralus", -- [2]
					},
					["45065"] = {
						"Tol'vir Merchant", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["146105"] = {
						"Living Bomb", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["122605"] = {
						"Recently Petrified Foe", -- [1]
						"Havenswood (Islands 2)", -- [2]
					},
					["84859"] = {
						"Iron Cleaver", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["135192"] = {
						"Honored Raptor", -- [1]
						"Kings' Rest", -- [2]
					},
					["42428"] = {
						"Devout Follower", -- [1]
						"The Stonecore", -- [2]
					},
					["5913"] = {
						"Tremor Totem", -- [1]
						"Crucible of Storms", -- [2]
					},
					["138497"] = {
						"Twilight Scalesworn", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["151145"] = {
						"Ténor", -- [1]
						"Eye of the Storm", -- [2]
					},
					["48284"] = {
						"Mining Powder", -- [1]
						"Deadmines", -- [2]
					},
					["124353"] = {
						"Kunzen Hozen", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["135723"] = {
						"Moonclaw", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["144286"] = {
						"Asset Manager", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["140181"] = {
						"Cragtusk", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140987"] = {
						"Fleshmelter the Insatiable", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["85564"] = {
						"Jungle Axebeak", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["59547"] = {
						"Jiang", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["17968"] = {
						"Archimonde", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["130788"] = {
						"Taghira", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["61945"] = {
						"Gurthan Iron Maw", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["138438"] = {
						"Tidereaver Steelfang", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["131667"] = {
						"Soulbound Goliath", -- [1]
						"Waycrest Manor", -- [2]
					},
					["158136"] = {
						"Inquisitor Darkspeak", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["147827"] = {
						"7th Legion Marine", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["140696"] = {
						"Da'zu the Feared", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["22848"] = {
						"Storm Fury", -- [1]
						"Black Temple", -- [2]
					},
					["140560"] = {
						"Blazeseeker", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["98926"] = {
						"Shadow Hunter", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["138195"] = {
						"Servant of Thros", -- [1]
						"Thros, The Blighted Lands", -- [2]
					},
					["121571"] = {
						"BringBackWoD", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["135258"] = {
						"Irontide Marauder", -- [1]
						"Siege of Boralus", -- [2]
					},
					["41376"] = {
						"Nefarian", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["155277"] = {
						"Gorjesh the Smasher", -- [1]
						"The Eternal Palace", -- [2]
					},
					["134940"] = {
						"Bristlethorn Piercer", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["134514"] = {
						"Abyssal Cultist", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["883"] = {
						"Deer", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["155859"] = {
						"Vizja'ra", -- [1]
						"The Eternal Palace", -- [2]
					},
					["139757"] = {
						"Sureshot Johnson", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["139694"] = {
						"Mordshell", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["126169"] = {
						"Jungle King Runtu", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["136190"] = {
						"Shadowy Rift", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["146882"] = {
						"Gargantuan Blighthound", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["139667"] = {
						"Seer Grglok", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["77487"] = {
						"Grom'kar Firemender", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["151685"] = {
						"Stinkfur Denmother", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["153335"] = {
						"Potent Spark", -- [1]
						"The Eternal Palace", -- [2]
					},
					["158035"] = {
						"Magister Umbric", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["61567"] = {
						"Vizier Jin'bak", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["22887"] = {
						"High Warlord Naj'entus", -- [1]
						"Black Temple", -- [2]
					},
					["77605"] = {
						"Whirling Dervish", -- [1]
						"Skyreach", -- [2]
					},
					["140863"] = {
						"Rubywind Prankster", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140066"] = {
						"Axeclaw", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140077"] = {
						"Knucklebump Stomper", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["157483"] = {
						"Ysedra the Darkener", -- [1]
						"Halls of Origination", -- [2]
					},
					["135406"] = {
						"Animated Gold", -- [1]
						"Kings' Rest", -- [2]
					},
					["147830"] = {
						"Rastari Flamespeaker", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["140064"] = {
						"Bloodsoaked Grizzlefur", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["144754"] = {
						"Fa'thuul the Feared", -- [1]
						"Crucible of Storms", -- [2]
					},
					["135645"] = {
						"Elder Pridemother", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["148483"] = {
						"Ancestral Avenger", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["137029"] = {
						"Ordnance Specialist", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["146246"] = {
						"Ovix the Toxic", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["139672"] = {
						"Gibberfin", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["151147"] = {
						"Hati", -- [1]
						"The Eternal Palace", -- [2]
					},
					["140991"] = {
						"Marrowbore", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["146746"] = {
						"Honorbound Conqueror", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["131785"] = {
						"Buzzing Drone", -- [1]
						"Tol Dagor", -- [2]
					},
					["132760"] = {
						"Plains Creeper", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["137487"] = {
						"Skeletal Hunting Raptor", -- [1]
						"Kings' Rest", -- [2]
					},
					["155618"] = {
						"Zanj'ir Huntress", -- [1]
						"The Eternal Palace", -- [2]
					},
					["81318"] = {
						"Iron Gunnery Sergeant", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["144294"] = {
						"Mechagon Tinkerer", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["44981"] = {
						"Oathsworn Skinner", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["140155"] = {
						"Rabid Rotclaw", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["152703"] = {
						"Walkie Shockie X1", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["134251"] = {
						"Seneschal M'bara", -- [1]
						"Kings' Rest", -- [2]
					},
					["133963"] = {
						"Test Subject", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["133585"] = {
						"Dizzy Dina", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["139867"] = {
						"Voru'kar Venomancer", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["39909"] = {
						"Azureborne Warlord", -- [1]
						"Grim Batol", -- [2]
					},
					["154758"] = {
						"Toxic Monstrosity", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["135049"] = {
						"Dreadwing Raven", -- [1]
						"Waycrest Manor", -- [2]
					},
					["138989"] = {
						"Saltfin", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["150159"] = {
						"King Gobbamak", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["158375"] = {
						"Corruptor Tentacle", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["153527"] = {
						"Aqir Swarmleader", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["90997"] = {
						"Mightstone Breaker", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["138254"] = {
						"Irontide Powdershot", -- [1]
						"Siege of Boralus", -- [2]
					},
					["145267"] = {
						"AzerMEK Mk. II", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["95885"] = {
						"Tirathon Saltheril", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["156132"] = {
						"Azsh'ari Witch", -- [1]
						"The Eternal Palace", -- [2]
					},
					["134024"] = {
						"Devouring Maggot", -- [1]
						"Waycrest Manor", -- [2]
					},
					["140297"] = {
						"Nok-arak", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["132755"] = {
						"Breakbeak Scavenger", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["146322"] = {
						"Siegebreaker Roka", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["130522"] = {
						"Freehold Shipmate", -- [1]
						"Freehold", -- [2]
					},
					["126092"] = {
						"Slitherblade Gladiator", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["138281"] = {
						"Faceless Corruptor", -- [1]
						"The Underrot", -- [2]
					},
					["138566"] = {
						"Nyl'sozz", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["136835"] = {
						"Kin'toga Beastbane", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["161815"] = {
						"K'thir Voidcaller", -- [1]
						"Chamber of Heart - Scenario", -- [2]
					},
					["145851"] = {
						"Kaldorei Hippogryph Rider", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["24207"] = {
						"Army of the Dead", -- [1]
						"Eye of the Storm", -- [2]
					},
					["22878"] = {
						"Aqueous Lord", -- [1]
						"Black Temple", -- [2]
					},
					["137830"] = {
						"Pallid Gorger", -- [1]
						"Waycrest Manor", -- [2]
					},
					["136976"] = {
						"T'zala", -- [1]
						"Kings' Rest", -- [2]
					},
					["158140"] = {
						"Frenzied Rat", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["157603"] = {
						"Void Globule", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["136888"] = {
						"Dirt-Speaker Barrul", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["134437"] = {
						"Medic Bot", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["146491"] = {
						"Phantom of Retribution", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["106785"] = {
						"Bitterbrine Slave", -- [1]
						"Eye of Azshara", -- [2]
					},
					["91792"] = {
						"Stormwake Hydra", -- [1]
						"Eye of Azshara", -- [2]
					},
					["139466"] = {
						"Cobalt Stoneguard", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["151325"] = {
						"Alarm-o-Bot", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["39450"] = {
						"Trogg Dweller", -- [1]
						"Grim Batol", -- [2]
					},
					["136863"] = {
						"Great Mota", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["61929"] = {
						"Sik'thik Amber-Weaver", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["134991"] = {
						"Sandfury Stonefist", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["138660"] = {
						"Mist Hound", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["118717"] = {
						"Helblaze Imp", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["146143"] = {
						"Razorspike", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["161198"] = {
						"Warpweaver Dushar", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["157486"] = {
						"Horrific Hemorrhage", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["11663"] = {
						"Flamewaker Healer", -- [1]
						"Molten Core", -- [2]
					},
					["147948"] = {
						"Coagulated Azerite", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["59804"] = {
						"Gripping Hatred", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["95886"] = {
						"Ash'Golm", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["135472"] = {
						"Zanazal the Wise", -- [1]
						"Kings' Rest", -- [2]
					},
					["47404"] = {
						"Defias Watcher", -- [1]
						"Deadmines", -- [2]
					},
					["159764"] = {
						"Jesh'ra", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["137067"] = {
						"Valorcall Defender", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["155434"] = {
						"Emissary of the Tides", -- [1]
						"Freehold", -- [2]
					},
					["138437"] = {
						"Szerris the Invader", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["162303"] = {
						"Aqir Swarmkeeper", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["56448"] = {
						"Wise Mari", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["103673"] = {
						"Darkglare", -- [1]
						"Isle of Conquest", -- [2]
					},
					["122969"] = {
						"Zanchuli Witch-Doctor", -- [1]
						"Atal'Dazar", -- [2]
					},
					["146686"] = {
						"Cowled Plaguebringer", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["157700"] = {
						"Agustus Moulaine", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["146657"] = {
						"Veteran Sentinel", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["22964"] = {
						"Sister of Pleasure", -- [1]
						"Black Temple", -- [2]
					},
					["138472"] = {
						"Obsidian Captain", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["22997"] = {
						"Flame of Azzinoth", -- [1]
						"Black Temple", -- [2]
					},
					["137516"] = {
						"Ashvane Invader", -- [1]
						"Siege of Boralus", -- [2]
					},
					["57109"] = {
						"Minion of Doubt", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["131726"] = {
						"Gunnolf the Ferocious", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["158286"] = {
						"Reprogrammed Warbot", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["102104"] = {
						"Enslaved Shieldmaiden", -- [1]
						"Maw of Souls", -- [2]
					},
					["133361"] = {
						"Wasting Servant", -- [1]
						"Waycrest Manor", -- [2]
					},
					["138501"] = {
						"Twilight Whelp", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138489"] = {
						"Shadow of Zul", -- [1]
						"Kings' Rest", -- [2]
					},
					["140458"] = {
						"Bramblefur Bull", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["139040"] = {
						"Deep Oracle Unani", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["48230"] = {
						"Ogre Henchman", -- [1]
						"Deadmines", -- [2]
					},
					["142950"] = {
						"Theramore Citizen", -- [1]
						"Thros, The Blighted Lands", -- [2]
					},
					["160871"] = {
						"Possessed Package", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["140099"] = {
						"Thundersnort the Loud", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["129559"] = {
						"Cutwater Duelist", -- [1]
						"Freehold", -- [2]
					},
					["146863"] = {
						"Mistscorn Ravager", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["146760"] = {
						"Mighty Guardian Spirit", -- [1]
						"Zandalari Treasury", -- [2]
					},
					["148621"] = {
						"Jek'kwa", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["155919"] = {
						"Stormling", -- [1]
						"The Eternal Palace", -- [2]
					},
					["141939"] = {
						"Ashvane Spotter", -- [1]
						"Siege of Boralus", -- [2]
					},
					["146244"] = {
						"Stinging Fiend", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["1863"] = {
						"Sythea", -- [1]
						"Isle of Conquest", -- [2]
					},
					["145065"] = {
						"Fledgling Nightwing", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["161243"] = {
						"Samh'rek, Beckoner of Chaos", -- [1]
						"Atal'Dazar", -- [2]
					},
					["140360"] = {
						"Sunback", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["114632"] = {
						"Spectral Attendant", -- [1]
						"Return to Karazhan", -- [2]
					},
					["76307"] = {
						"Grand Defense Construct", -- [1]
						"Skyreach", -- [2]
					},
					["131436"] = {
						"Chosen Blood Matron", -- [1]
						"The Underrot", -- [2]
					},
					["105617"] = {
						"Eredar Chaosbringer", -- [1]
						"The Arcway", -- [2]
					},
					["139399"] = {
						"Mirelurk Basher", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["152699"] = {
						"Voidbound Berserker", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["11667"] = {
						"Flameguard", -- [1]
						"Molten Core", -- [2]
					},
					["130334"] = {
						"Gritplate Gazer", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["155657"] = {
						"Huffer", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["146140"] = {
						"Quilldozer", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["145932"] = {
						"Celestra Brightmoon", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["151639"] = {
						"Crazed Gyreworm", -- [1]
						"Neltharion's Lair - HoA Scenario", -- [2]
					},
					["98693"] = {
						"Shackled Servitor", -- [1]
						"Maw of Souls", -- [2]
					},
					["139415"] = {
						"Slitherscale", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["127019"] = {
						"Training Dummy", -- [1]
						"Freehold", -- [2]
					},
					["140107"] = {
						"Deathsting Lasher", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["95779"] = {
						"Festerhide Grizzly", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["22947"] = {
						"Mother Shahraz", -- [1]
						"Black Temple", -- [2]
					},
					["138483"] = {
						"Obsidian Monstrosity", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["98792"] = {
						"Wyrmtongue Scavenger", -- [1]
						"Black Rook Hold", -- [2]
					},
					["162933"] = {
						"Thought Harvester", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["162306"] = {
						"Aqir Drone", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["127106"] = {
						"Irontide Officer", -- [1]
						"Freehold", -- [2]
					},
					["157811"] = {
						"Lilliam Sparkspindle", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["138844"] = {
						"Ya'vik the Imperial Blade", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["147924"] = {
						"Geoshard", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["132864"] = {
						"Juvenile Knucklebump", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["138630"] = {
						"Cleric Izzad", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["122266"] = {
						"Spineshell Turtle", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["111112"] = {
						"Ebulliant", -- [1]
						"The Nighthold", -- [2]
					},
					["152874"] = {
						"Vez'okk the Lightless", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["126449"] = {
						"Siltspitter", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["136893"] = {
						"Groundshaker Aggan", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["76794"] = {
						"Overheated Cinder Wolf", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["146365"] = {
						"Blazing Fireguard", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["97097"] = {
						"Helarjar Champion", -- [1]
						"Maw of Souls", -- [2]
					},
					["144970"] = {
						"Kaldorei Archer", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["151812"] = {
						"Detect-o-Bot", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["126291"] = {
						"Alliance Footman", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["146881"] = {
						"Soothsayer Brinvulf", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["152332"] = {
						"Lara Moore", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["138441"] = {
						"Songstress of the Deep", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["134012"] = {
						"Taskmaster Askari", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["42333"] = {
						"High Priestess Azil", -- [1]
						"The Stonecore", -- [2]
					},
					["139655"] = {
						"Coldlight Seer", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["98275"] = {
						"Risen Archer", -- [1]
						"Black Rook Hold", -- [2]
					},
					["98728"] = {
						"Acidic Bile", -- [1]
						"The Arcway", -- [2]
					},
					["105952"] = {
						"Withered Manawraith", -- [1]
						"The Arcway", -- [2]
					},
					["10981"] = {
						"Loup", -- [1]
						"Eye of the Storm", -- [2]
					},
					["59684"] = {
						"Hozen Party Animal", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["98813"] = {
						"Bloodscent Felhound", -- [1]
						"Black Rook Hold", -- [2]
					},
					["152313"] = {
						"Dreadcoil Hulk", -- [1]
						"The Eternal Palace", -- [2]
					},
					["138650"] = {
						"Tide-Lost Champion", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["146187"] = {
						"Firesting Dominator", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["61444"] = {
						"Ming the Cunning", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["42859"] = {
						"Stosszahn", -- [1]
						"Ashran", -- [2]
					},
					["98243"] = {
						"Soul-Torn Champion", -- [1]
						"Black Rook Hold", -- [2]
					},
					["146769"] = {
						"Druid of the Claw", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["146240"] = {
						"AzerMEK Beam Target", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["151862"] = {
						"Spiritwalker Fe'sal", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["48351"] = {
						"Mine Bunny", -- [1]
						"Deadmines", -- [2]
					},
					["138499"] = {
						"Twilight Dragonkin", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138510"] = {
						"Twilight Doomcaller", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["146893"] = {
						"Fleshrot Mystic", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["54432"] = {
						"Murozond", -- [1]
						"End Time", -- [2]
					},
					["100539"] = {
						"Taintheart Deadeye", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["161813"] = {
						"K'thir Assassin", -- [1]
						"Chamber of Heart - Scenario", -- [2]
					},
					["130026"] = {
						"Bilge Rat Seaspeaker", -- [1]
						"Tol Dagor", -- [2]
					},
					["142951"] = {
						"Theramore Citizen", -- [1]
						"Thros, The Blighted Lands", -- [2]
					},
					["122263"] = {
						"Spineshell Snapjaw", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["68139"] = {
						"Suffering Soul Fragment", -- [1]
						"Pursuing the Black Harvest", -- [2]
					},
					["145224"] = {
						"Thunderscale Drake", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["136549"] = {
						"Ashvane Cannoneer", -- [1]
						"Siege of Boralus", -- [2]
					},
					["135817"] = {
						"Zephyr", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["134739"] = {
						"Purification Construct", -- [1]
						"Kings' Rest", -- [2]
					},
					["97171"] = {
						"Hatecoil Arcanist", -- [1]
						"Eye of Azshara", -- [2]
					},
					["134331"] = {
						"King Rahu'ai", -- [1]
						"Kings' Rest", -- [2]
					},
					["99728"] = {
						"Grimguard", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["128547"] = {
						"Летучая мышь", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["77559"] = {
						"Solar Magnifier", -- [1]
						"Skyreach", -- [2]
					},
					["22951"] = {
						"Lady Malande", -- [1]
						"Black Temple", -- [2]
					},
					["139530"] = {
						"Earth-Wrought Siegebreaker", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["148254"] = {
						"Frost Shard", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["163947"] = {
						"Psychophage", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["22962"] = {
						"Priestess of Delight", -- [1]
						"Black Temple", -- [2]
					},
					["140345"] = {
						"Stormscreech", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["59873"] = {
						"Corrupt Living Water", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["134805"] = {
						"Wandering Behemoth", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["95769"] = {
						"Mindshattered Screecher", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["136246"] = {
						"Stromgarde Faithful", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["145304"] = {
						"Feral Strangler", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["139700"] = {
						"Brineshell Sea Shaman", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["148441"] = {
						"Gnomish Gyro-Engineer", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["146178"] = {
						"Azurespine", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["161812"] = {
						"Faceless Ruiner", -- [1]
						"Chamber of Heart - Scenario", -- [2]
					},
					["145026"] = {
						"Swifttail Scavenger", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["144860"] = {
						"Sira Moonwarden", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["117193"] = {
						"Agronox", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["41073"] = {
						"Twilight Armsmaster", -- [1]
						"Grim Batol", -- [2]
					},
					["146883"] = {
						"Houndmaster Angvold", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["139407"] = {
						"Fangterror", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["95947"] = {
						"Mak'rana Hardshell", -- [1]
						"Eye of Azshara", -- [2]
					},
					["146833"] = {
						"Necromancer Conjurer", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["140158"] = {
						"Bilesoaked Rotclaw", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["146892"] = {
						"Fleshrot Marauder", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["144244"] = {
						"The Platinum Pummeler", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["161251"] = {
						"Cultist Sycophant", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["85225"] = {
						"Gorian Sorcerer", -- [1]
						"Highmaul", -- [2]
					},
					["56876"] = {
						"Krik'thik Sapper", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["138477"] = {
						"Talonguard Vrykiss", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["148194"] = {
						"Icy Barrier", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["140451"] = {
						"Doting Calfmother", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["162030"] = {
						"Darkwhisper Ritualist", -- [1]
						"Blackwing Descent Scenario", -- [2]
					},
					["154240"] = {
						"Azshara's Devoted", -- [1]
						"The Eternal Palace", -- [2]
					},
					["140065"] = {
						"Muskhide", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["137880"] = {
						"Northfold Defender", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["56717"] = {
						"Hoptallus", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["69964"] = {
						"Kanrethad Ebonlocke", -- [1]
						"Pursuing the Black Harvest", -- [2]
					},
					["140993"] = {
						"Darktunnel Ambusher", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["59521"] = {
						"Bubbling Brew Alemental", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["140063"] = {
						"Smashmaw the Man-Eater", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["54511"] = {
						"Time-Twisted Geist", -- [1]
						"End Time", -- [2]
					},
					["150249"] = {
						"Pistonhead Scrapper", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["159633"] = {
						"Cultist Executioner", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["154469"] = {
						"First Arcanist Thalyssra", -- [1]
						"The Eternal Palace", -- [2]
					},
					["139668"] = {
						"Wavebinder Gorgl", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["145030"] = {
						"Arctic Poacher", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140976"] = {
						"Bore Worm", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["163708"] = {
						"Umbral Gatekeeper", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["138821"] = {
						"Bloodwake Warmaiden", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["156794"] = {
						"SI:7 Light-Hunter", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["146856"] = {
						"Ashen Raider", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["136883"] = {
						"Bristlemane Thorncaller", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["44260"] = {
						"Venomfang Crocolisk", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["118244"] = {
						"LightningPaw", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["102263"] = {
						"Skorpyron", -- [1]
						"The Nighthold", -- [2]
					},
					["129786"] = {
						"Brineshell Makrura", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["145303"] = {
						"Kaldorei Glaive Thrower", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["142336"] = {
						"Pygmy Octopus", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138644"] = {
						"Kvaldir Cursewalker", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["128650"] = {
						"Chopper Redhook", -- [1]
						"Siege of Boralus", -- [2]
					},
					["137068"] = {
						"Valorcall Cavalry", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["24179"] = {
						"Amani'shi Wind Walker", -- [1]
						"Zul'Aman", -- [2]
					},
					["155952"] = {
						"Suffer", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["147825"] = {
						"7th Legion Medic", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["137625"] = {
						"Demolishing Terror", -- [1]
						"Siege of Boralus", -- [2]
					},
					["114251"] = {
						"Galindre", -- [1]
						"Return to Karazhan", -- [2]
					},
					["157904"] = {
						"Aqir Scarab", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["144071"] = {
						"Irontide Waveshaper", -- [1]
						"Siege of Boralus", -- [2]
					},
					["79466"] = {
						"Initiate of the Rising Sun", -- [1]
						"Skyreach", -- [2]
					},
					["140792"] = {
						"Breakbeak Bonepicker", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["34605"] = {
						"Swarm Scarab", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["134807"] = {
						"Ancient Spineshell", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["151144"] = {
						"Hati", -- [1]
						"The Eternal Palace", -- [2]
					},
					["151854"] = {
						"Deathseeker Loshok", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140092"] = {
						"Longstrider", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140541"] = {
						"Kindleweb Creeper", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["152128"] = {
						"Orgozoa", -- [1]
						"The Eternal Palace", -- [2]
					},
					["146852"] = {
						"Konrad the Enslaver", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["158437"] = {
						"Fallen Taskmaster", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["134915"] = {
						"Trapdoor Ambusher", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["139396"] = {
						"Mirelurk Guardian", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["145274"] = {
						"Yalat's Bulwark", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["133605"] = {
						"Escaped Convict", -- [1]
						"Tol Dagor", -- [2]
					},
					["123270"] = {
						"Chef Gru", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["139473"] = {
						"Stone Machinist Nu-Xin", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["147495"] = {
						"Rastari Enforcer", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["148244"] = {
						"Fallen Disciple", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["143971"] = {
						"Kor'gall Agitator", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["152836"] = {
						"Azerite Borer", -- [1]
						"The Maelstrom - Heart of Azeroth", -- [2]
					},
					["145039"] = {
						"Snowstalker", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["139032"] = {
						"Razorfin Waveguard", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["132481"] = {
						"Kul Tiran Vanguard", -- [1]
						"Siege of Boralus", -- [2]
					},
					["150146"] = {
						"Scrapbone Shaman", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["136832"] = {
						"Witherbranch Berserker", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["145060"] = {
						"Monstrous Shadefeather", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["134286"] = {
						"Archmage Tamuura", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["45269"] = {
						"Servant of Siamat", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["138428"] = {
						"Spitefin Myrmidon", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["16056"] = {
						"Diseased Maggot", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["155161"] = {
						"Shandris Feathermoon", -- [1]
						"The Eternal Palace", -- [2]
					},
					["138430"] = {
						"Fogsail Cannoneer", -- [1]
						"Siege of Boralus", -- [2]
					},
					["157608"] = {
						"Faceless Willbreaker", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["59104"] = {
						"Hirsch", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["146894"] = {
						"Fleshrot Cabalist", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140452"] = {
						"Pikehorn the Sleeper", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["132892"] = {
						"Giddyleaf", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["155629"] = {
						"Azsh'ari Stormbinder", -- [1]
						"The Eternal Palace", -- [2]
					},
					["134005"] = {
						"Shalebiter", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["145371"] = {
						"Uu'nat", -- [1]
						"Crucible of Storms", -- [2]
					},
					["146895"] = {
						"Fleshrot Vandal", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["139445"] = {
						"Tumat", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["76141"] = {
						"Araknath", -- [1]
						"Skyreach", -- [2]
					},
					["111071"] = {
						"Pulsauron", -- [1]
						"The Nighthold", -- [2]
					},
					["151610"] = {
						"Amathet Guardian", -- [1]
						"Halls of Origination", -- [2]
					},
					["134932"] = {
						"Vileweb Broodqueen", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["139350"] = {
						"Anaha Witherbreath", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["146857"] = {
						"Honorbound Conqueror", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["76145"] = {
						"Grand Defense Construct", -- [1]
						"Skyreach", -- [2]
					},
					["92387"] = {
						"Drums of War", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["130661"] = {
						"Venture Co. Earthshaper", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["86607"] = {
						"Iron Flame Technician", -- [1]
						"Highmaul", -- [2]
					},
					["161140"] = {
						"Bwemba", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["139949"] = {
						"Plague Doctor", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["96480"] = {
						"Viletongue Belcher", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["48906"] = {
						"Blaze of the Heavens", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["49267"] = {
						"Crystal Shard", -- [1]
						"The Stonecore", -- [2]
					},
					["127315"] = {
						"Reanimation Totem", -- [1]
						"Atal'Dazar", -- [2]
					},
					["147498"] = {
						"Prelate Jakit", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["139421"] = {
						"Gekkaz Moss-Scaled", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["144231"] = {
						"Rowdy Reveler", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["56713"] = {
						"Master Snowdrift", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["139884"] = {
						"Prophet Doom-Ra", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["139814"] = {
						"Merger Specialist Huzzle", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["146186"] = {
						"Firesting Warrior", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["155814"] = {
						"Eldritch Understudy", -- [1]
						"The Eternal Palace", -- [2]
					},
					["91004"] = {
						"Ularogg Cragshaper", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["132849"] = {
						"Grizzlefur Cub", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140268"] = {
						"Ano Forest-Keeper", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["103224"] = {
						"Volatile Scorpid", -- [1]
						"The Nighthold", -- [2]
					},
					["151681"] = {
						"Shorttail the Chucker", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["118724"] = {
						"Helblaze Felbringer", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["135999"] = {
						"Heliodor", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["76205"] = {
						"Blooded Bladefeather", -- [1]
						"Skyreach", -- [2]
					},
					["87520"] = {
						"Animated Slag", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["26028"] = {
						"Bird of Prey", -- [1]
						"Kings' Rest", -- [2]
					},
					["96512"] = {
						"Archdruid Glaidalis", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["152722"] = {
						"Fallen Voidspeaker", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["85562"] = {
						"Skittering Doomstinger", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["113197"] = {
						"Understone Drudge", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["150773"] = {
						"Shimmerskin Pufferfish", -- [1]
						"The Eternal Palace", -- [2]
					},
					["112741"] = {
						"Wrathguard Decimator", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["139805"] = {
						"Mechanical Guardhound", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["147935"] = {
						"Azergem Crawler", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["145000"] = {
						"Lancer-Captain Blaer", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["69947"] = {
						"Tyktarmen", -- [1]
						"The Eternal Palace", -- [2]
					},
					["135642"] = {
						"Duskcoat Tiger Cub", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["134215"] = {
						"Duskrunner Lorinas", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["49045"] = {
						"Augh", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["131669"] = {
						"Jagged Hound", -- [1]
						"Waycrest Manor", -- [2]
					},
					["140795"] = {
						"Dunecircler the Bleak", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["48420"] = {
						"Defias Digger", -- [1]
						"Deadmines", -- [2]
					},
					["146886"] = {
						"Hrolskald the Fetid", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["138649"] = {
						"Vulf Stormshore", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["151068"] = {
						"Tentacled Voidpriest", -- [1]
						"Crucible of Storms", -- [2]
					},
					["81270"] = {
						"Gorian Guardsman", -- [1]
						"Highmaul", -- [2]
					},
					["147376"] = {
						"Barrier", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["62358"] = {
						"Corrupt Droplet", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["131408"] = {
						"Venture Muscle", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["76906"] = {
						"Operator Thogar", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["39405"] = {
						"Crimsonborne Seer", -- [1]
						"Grim Batol", -- [2]
					},
					["139461"] = {
						"Stonebound Rockmaw", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["159767"] = {
						"Sanguimar", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["139862"] = {
						"Voru'kar Spitter", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["138822"] = {
						"Bloodwake Harpooner", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["132741"] = {
						"Flamescale Hydra", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["150136"] = {
						"Faceless Render", -- [1]
						"Uldir Scenario", -- [2]
					},
					["140263"] = {
						"Runehoof Stag", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["132887"] = {
						"Deathsting Hatchling", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["102351"] = {
						"Mana Wyrm", -- [1]
						"The Arcway", -- [2]
					},
					["120779"] = {
						"Helblaze Felbringer", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["156133"] = {
						"Dreadcoil Hulk", -- [1]
						"The Eternal Palace", -- [2]
					},
					["140996"] = {
						"Deepbore", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140073"] = {
						"Rabidmaw", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["139444"] = {
						"Necrolord Zian", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["59752"] = {
						"Shado-Pan Ambusher", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["131402"] = {
						"Underrot Tick", -- [1]
						"The Underrot", -- [2]
					},
					["1860"] = {
						"Thokjuk", -- [1]
						"Isle of Conquest", -- [2]
					},
					["128923"] = {
						"Sha'khee", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["146744"] = {
						"Ashen Enforcer", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["139812"] = {
						"Venture Producer", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["114804"] = {
						"Spectral Charger", -- [1]
						"Return to Karazhan", -- [2]
					},
					["140680"] = {
						"Frozenhorn Rampager", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["135892"] = {
						"Unleashed Inferno", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["130333"] = {
						"Gritplate Basilisk", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["144733"] = {
						"Deathguard Captain Vandel", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["144784"] = {
						"Charg \"The Boisterous\"", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["134691"] = {
						"Static-charged Dervish", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["22881"] = {
						"Aqueous Surger", -- [1]
						"Black Temple", -- [2]
					},
					["146867"] = {
						"Mistscorn Sharphorn", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["54512"] = {
						"Time-Twisted Sentinel", -- [1]
						"End Time", -- [2]
					},
					["68205"] = {
						"Unbound Succubus", -- [1]
						"Pursuing the Black Harvest", -- [2]
					},
					["56924"] = {
						"Inflamed Hozen Brawler", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["138579"] = {
						"Giant Claw Tentacle", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["80708"] = {
						"Iron Taskmaster", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["98177"] = {
						"Glayvianna Soulrender", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["140074"] = {
						"Sharptooth", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140095"] = {
						"Mudsnout Gorer", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["56763"] = {
						"Regenerating Sha", -- [1]
						"Shado-Pan Monastery", -- [2]
					},
					["149334"] = {
						"Tectonic Azerite", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["136849"] = {
						"Sandscalp Berserker", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["54435"] = {
						"Kattè", -- [1]
						"End Time", -- [2]
					},
					["146887"] = {
						"Ghern the Rancid", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["149312"] = {
						"Ferocious Swiftclaw", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["138511"] = {
						"Azurescale", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["147370"] = {
						"Bladeguard Kaja", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["85131"] = {
						"Jared V. Hellstrike", -- [1]
						"Ashran", -- [2]
					},
					["68129"] = {
						"Ashtongue Shaman", -- [1]
						"Pursuing the Black Harvest", -- [2]
					},
					["139425"] = {
						"Crazed Incubator", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["159312"] = {
						"Living Blood", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["98173"] = {
						"Mystic Ssa'veh", -- [1]
						"Eye of Azshara", -- [2]
					},
					["152312"] = {
						"Azsh'ari Witch", -- [1]
						"The Eternal Palace", -- [2]
					},
					["155586"] = {
						"Arathor Ancestor", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["138634"] = {
						"Prophet Lapisa", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["132744"] = {
						"Frostscale Hydra", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["151840"] = {
						"Vile Soul", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["139660"] = {
						"Dampscale Murloc", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["157610"] = {
						"K'thir Dominator", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["149406"] = {
						"Kaldorei Dark Ranger", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["153194"] = {
						"Briny Bubble", -- [1]
						"The Eternal Palace", -- [2]
					},
					["151653"] = {
						"Void Tentacle", -- [1]
						"Uldir Scenario", -- [2]
					},
					["65310"] = {
						"Turnip Punching Bag", -- [1]
						"Freehold", -- [2]
					},
					["139652"] = {
						"Coldlight Coastrunner", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["133432"] = {
						"Venture Co. Alchemist", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["139701"] = {
						"Brineshell Minor Oracle", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["65362"] = {
						"Minion of Doubt", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["145058"] = {
						"Shadefeather Raven", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["133685"] = {
						"Befouled Spirit", -- [1]
						"The Underrot", -- [2]
					},
					["138848"] = {
						"Blade-Dancer Zorlak", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["161217"] = {
						"Aqir Skitterer", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["137989"] = {
						"Embalming Fluid", -- [1]
						"Kings' Rest", -- [2]
					},
					["146849"] = {
						"Spirit Master Rowena", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140182"] = {
						"Trampleleaf the Jungle Quake", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["136887"] = {
						"Needlemane", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["157333"] = {
						"Darkwhisper Cultist", -- [1]
						"Blackwing Descent Scenario", -- [2]
					},
					["137881"] = {
						"Northfold Knight", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["153064"] = {
						"Overzealous Hulk", -- [1]
						"The Eternal Palace", -- [2]
					},
					["153881"] = {
						"Conversion Totem", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["126099"] = {
						"Duskcoat Den-Mother", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["139443"] = {
						"Spinebender Kuntai", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["146072"] = {
						"Shredder Technician", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["146371"] = {
						"Dark Iron Primalist", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["159321"] = {
						"Khateph", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["44977"] = {
						"Neferset Torturer", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["140441"] = {
						"Muskflank Calf", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["151798"] = {
						"Vexiona", -- [1]
						"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
					},
					["45096"] = {
						"Tamed Tol'vir Prowler", -- [1]
						"Grim Batol", -- [2]
					},
					["43662"] = {
						"Unbound Earth Rager", -- [1]
						"The Stonecore", -- [2]
					},
					["149558"] = {
						"Jaina's Tide Elemental", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["26125"] = {
						"Stoneleaper", -- [1]
						"Eye of the Storm", -- [2]
					},
					["140671"] = {
						"Feralclaw the Rager", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["136834"] = {
						"Scalper Bazuulu", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["140061"] = {
						"Grizzlefur Den-Mother", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140430"] = {
						"Craghoof Bounder", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["151754"] = {
						"Void Haunt", -- [1]
						"Emerald Dream - HoA Scenario", -- [2]
					},
					["139338"] = {
						"Icetusk Prophet", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["144170"] = {
						"Ashvane Sniper", -- [1]
						"Siege of Boralus", -- [2]
					},
					["44924"] = {
						"Oathsworn Myrmidon", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["54701"] = {
						"Time-Twisted Huntress", -- [1]
						"End Time", -- [2]
					},
					["62205"] = {
						"Wing Leader Ner'onok", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["140102"] = {
						"Razorhog", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["68140"] = {
						"Hungering Soul Fragment", -- [1]
						"Pursuing the Black Harvest", -- [2]
					},
					["130488"] = {
						"Mech Jockey", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["146853"] = {
						"Kefolkis the Unburied", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["23580"] = {
						"Amani'shi Warbringer", -- [1]
						"Zul'Aman", -- [2]
					},
					["98366"] = {
						"Ghostly Retainer", -- [1]
						"Black Rook Hold", -- [2]
					},
					["140542"] = {
						"Kindleweb Spider", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["140299"] = {
						"Ghostfang", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["136822"] = {
						"Gulan Spear Thrower", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["79505"] = {
						"Solar Flare", -- [1]
						"Skyreach", -- [2]
					},
					["139419"] = {
						"High Oracle Asayza", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140547"] = {
						"Broodqueen Cindrix", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["138500"] = {
						"Twilight Scalesister", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140090"] = {
						"Ana'tashe", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["105715"] = {
						"Watchful Inquisitor", -- [1]
						"Court of Stars", -- [2]
					},
					["152853"] = {
						"Silivaz the Zealous", -- [1]
						"The Eternal Palace", -- [2]
					},
					["2630"] = {
						"Earthbind Totem", -- [1]
						"Isle of Conquest", -- [2]
					},
					["137160"] = {
						"Valorcall Engineer", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["56718"] = {
						"Hopper", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["61434"] = {
						"Sik'thik Vanguard", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["139810"] = {
						"Venture Middle Manager", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["146366"] = {
						"Molten Hound", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["122972"] = {
						"Dazar'ai Augur", -- [1]
						"Atal'Dazar", -- [2]
					},
					["139656"] = {
						"Coldlight Oracle", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["144691"] = {
						"Ma'ra Grimfang", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["148272"] = {
						"Crankshot Flame Turret", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["143622"] = {
						"Wild Imp", -- [1]
						"Dalaran Sewers", -- [2]
					},
					["134232"] = {
						"Hired Assassin", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["158157"] = {
						"Overlord Mathias Shaw", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["138509"] = {
						"Spellbinder Ulura", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["138502"] = {
						"Naroviak Wyrm-Bender", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["140985"] = {
						"Acidic Worm", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["163690"] = {
						"Shath'Yar Scribe", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["155094"] = {
						"Mechagon Trooper", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["141169"] = {
						"Lightbound Warpriest", -- [1]
						"Gorgrond - Mag'har Scenario", -- [2]
					},
					["56929"] = {
						"Krik'thik Protectorate", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["117194"] = {
						"Thrashbite the Scornful", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["16057"] = {
						"Rotting Maggot", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["145927"] = {
						"Starcaller Ellana", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["161416"] = {
						"Aqir Shadowcrafter", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["44896"] = {
						"Pygmy Brute", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["135699"] = {
						"Ashvane Jailer", -- [1]
						"Tol Dagor", -- [2]
					},
					["133557"] = {
						"Razak Ironsides", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["138370"] = {
						"Horko", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["131819"] = {
						"Coven Diviner", -- [1]
						"Waycrest Manor", -- [2]
					},
					["104415"] = {
						"Chronomatic Anomaly", -- [1]
						"The Nighthold", -- [2]
					},
					["108361"] = {
						"Crystalline Scorpid", -- [1]
						"The Nighthold", -- [2]
					},
					["68206"] = {
						"Unbound Shivarra", -- [1]
						"Pursuing the Black Harvest", -- [2]
					},
					["78583"] = {
						"Dominator Turret", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["137478"] = {
						"Queen Wasi", -- [1]
						"Kings' Rest", -- [2]
					},
					["140438"] = {
						"Old Longtooth", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["102094"] = {
						"Risen Swordsman", -- [1]
						"Black Rook Hold", -- [2]
					},
					["105704"] = {
						"Arcane Manifestation", -- [1]
						"Court of Stars", -- [2]
					},
					["77337"] = {
						"Aknor Steelbringer", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["143001"] = {
						"Kirin Tor Invoker", -- [1]
						"Thros, The Blighted Lands", -- [2]
					},
					["138508"] = {
						"Unbreakable Vortax", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["134904"] = {
						"Nightlurker", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["135470"] = {
						"Aka'ali the Conqueror", -- [1]
						"Kings' Rest", -- [2]
					},
					["140093"] = {
						"Pinegraze Fawnmother", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["135254"] = {
						"Irontide Raider", -- [1]
						"Tol Dagor", -- [2]
					},
					["146134"] = {
						"Speedy", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["134941"] = {
						"Bristlethorn Spider", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["151739"] = {
						"Ma'haat the Indomitable", -- [1]
						"Neltharion's Lair - HoA Scenario", -- [2]
					},
					["140353"] = {
						"Brightscale Coilfang", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["130437"] = {
						"Mine Rat", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["140067"] = {
						"Rustpelt Alpha", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["145305"] = {
						"Feral Hulk", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["138100"] = {
						"Stromgarde Footman", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["49854"] = {
						"Defias Blood Wizard", -- [1]
						"Deadmines", -- [2]
					},
					["157614"] = {
						"Tentacle of Drest'agath", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["59520"] = {
						"Fizzy Brew Alemental", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["153091"] = {
						"Serena Scarscale", -- [1]
						"The Eternal Palace", -- [2]
					},
					["140087"] = {
						"Pinegraze Doe", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["139037"] = {
						"Razorfin Jinyu", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["44932"] = {
						"Oathsworn Pathfinder", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["104217"] = {
						"Talixae Flamewreath", -- [1]
						"Court of Stars", -- [2]
					},
					["146873"] = {
						"Murderous Tempest", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["129832"] = {
						"Krack", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["138442"] = {
						"Wavebreaker", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["137485"] = {
						"Bloodsworn Agent", -- [1]
						"Kings' Rest", -- [2]
					},
					["138066"] = {
						"Posh Vacationer", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["141938"] = {
						"Ashvane Sniper", -- [1]
						"Siege of Boralus", -- [2]
					},
					["140148"] = {
						"Rampaging Grizzlefur", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["136391"] = {
						"Heart Guardian", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["99360"] = {
						"Vilethorn Blossom", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["134936"] = {
						"Kil'tilac", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["131587"] = {
						"Bewitched Captain", -- [1]
						"Waycrest Manor", -- [2]
					},
					["138514"] = {
						"Athiona", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138556"] = {
						"Tainted Ooze", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["138102"] = {
						"Stromgarde Priest", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["136990"] = {
						"Cursed Ankali", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["144963"] = {
						"Kimbul's Aspect", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["41040"] = {
						"Twisted Visage", -- [1]
						"Grim Batol", -- [2]
					},
					["145850"] = {
						"Gilnean Defuser", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["144941"] = {
						"Akunda's Aspect", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["138629"] = {
						"Vicar Djosa", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["98368"] = {
						"Ghostly Protector", -- [1]
						"Black Rook Hold", -- [2]
					},
					["150222"] = {
						"Gunker", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["161510"] = {
						"Mindrend Tentacle", -- [1]
						"Atal'Dazar", -- [2]
					},
					["122090"] = {
						"Sarashas the Pillager", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["104270"] = {
						"Guardian Construct", -- [1]
						"Court of Stars", -- [2]
					},
					["155791"] = {
						"Horrific Shrieker", -- [1]
						"The Eternal Palace", -- [2]
					},
					["142000"] = {
						"Haunting Tendril", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["56636"] = {
						"Commander Ri'mok", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["152326"] = {
						"Kyra Boucher", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["160937"] = {
						"Night Terror", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["140373"] = {
						"Queen Duneshell", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["102781"] = {
						"Fel Bat Pup", -- [1]
						"Black Rook Hold", -- [2]
					},
					["139817"] = {
						"Chief Engineer Zazzy", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["153097"] = {
						"Voidbound Shaman", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["98035"] = {
						"Dreadstalker", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["104215"] = {
						"Patrol Captain Gerdo", -- [1]
						"Court of Stars", -- [2]
					},
					["101074"] = {
						"Hatespawn Whelpling", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["138659"] = {
						"Risen Hound", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["155869"] = {
						"Shirakess Shadowcaster", -- [1]
						"The Eternal Palace", -- [2]
					},
					["146827"] = {
						"Feral Dog", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["129598"] = {
						"Freehold Pack Mule", -- [1]
						"Freehold", -- [2]
					},
					["3527"] = {
						"Healing Stream Totem", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["149336"] = {
						"Basaltic Azerite", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["138826"] = {
						"Leikneir the Brave", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140631"] = {
						"South Sea Ray", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["134990"] = {
						"Charged Dust Devil", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["105451"] = {
						"Counterstrike Totem", -- [1]
						"Isle of Conquest", -- [2]
					},
					["139199"] = {
						"Verdant Spitter", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["155764"] = {
						"Rak'sha the Swift", -- [1]
						"The Eternal Palace", -- [2]
					},
					["156089"] = {
						"Aqir Venomweaver", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["140322"] = {
						"Stonehusk Broodwatcher", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["42789"] = {
						"Stonecore Magmalord", -- [1]
						"The Stonecore", -- [2]
					},
					["149335"] = {
						"Tumultuous Azerite", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["12118"] = {
						"Lucifron", -- [1]
						"Molten Core", -- [2]
					},
					["147896"] = {
						"Zandalari Crusader", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["139755"] = {
						"First Mate McNally", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["138445"] = {
						"Duke Szzull", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["148893"] = {
						"Tormented Soul", -- [1]
						"The Underrot", -- [2]
					},
					["145059"] = {
						"Cunning Nightwing", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["148894"] = {
						"Lost Soul", -- [1]
						"The Underrot", -- [2]
					},
					["138969"] = {
						"Zian-Ti Spirit", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["96015"] = {
						"Inquisitor Tormentorum", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["103381"] = {
						"Jailer Cage", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["150154"] = {
						"Saurolisk Bonenipper", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["140387"] = {
						"Jeweled Queen", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140082"] = {
						"Gibb", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["91787"] = {
						"Cove Seagull", -- [1]
						"Eye of Azshara", -- [2]
					},
					["36609"] = {
						"Val'kyr Shadowguard", -- [1]
						"Caverns of Time - Anniversary", -- [2]
					},
					["140847"] = {
						"Earth Spirit", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["131666"] = {
						"Coven Thornshaper", -- [1]
						"Waycrest Manor", -- [2]
					},
					["22869"] = {
						"Illidari Boneslicer", -- [1]
						"Black Temple", -- [2]
					},
					["135721"] = {
						"Asha'ne", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["79467"] = {
						"Adept of the Dawn", -- [1]
						"Skyreach", -- [2]
					},
					["100526"] = {
						"Tormented Bloodseeker", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["162647"] = {
						"Willing Sacrifice", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["151859"] = {
						"Tomb Scarab", -- [1]
						"Halls of Origination", -- [2]
					},
					["98406"] = {
						"Embershard Scorpion", -- [1]
						"Neltharion's Lair", -- [2]
					},
					["56915"] = {
						"Sun", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["130620"] = {
						"Frostfencer Seraphi", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["140842"] = {
						"Ebb", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["135893"] = {
						"Burning Emberguard", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["134766"] = {
						"Wavespitter", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["105705"] = {
						"Bound Energy", -- [1]
						"Court of Stars", -- [2]
					},
					["139756"] = {
						"Cutthroat Sheila", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["120374"] = {
						"Felguard Destroyer", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["140293"] = {
						"Snowfur Snarler", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["155680"] = {
						"Deephive Summoner", -- [1]
						"Mogu'shan Scenario", -- [2]
					},
					["82698"] = {
						"Night-Twisted Devout", -- [1]
						"Highmaul", -- [2]
					},
					["154663"] = {
						"Gnome-Eating Droplet", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["139337"] = {
						"Icetusk Blood-Drinker", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140088"] = {
						"Stonehorn the Charger", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["59464"] = {
						"Hopper", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["91808"] = {
						"Serpentrix", -- [1]
						"Eye of Azshara", -- [2]
					},
					["130307"] = {
						"Unstable Typhoon", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["149360"] = {
						"Hulking Azerite", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["136249"] = {
						"Guardian Elemental", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["127488"] = {
						"Ashvane Flamecaster", -- [1]
						"Tol Dagor", -- [2]
					},
					["138632"] = {
						"Guardian Asuda", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["132050"] = {
						"Huntmaster Theodore", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["159305"] = {
						"Maddened Conscript", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["39892"] = {
						"Enslaved Burning Ember", -- [1]
						"Grim Batol", -- [2]
					},
					["80423"] = {
						"Thunderlord Beast-Tender", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["147968"] = {
						"Agitated Azerite", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["135818"] = {
						"Gust Soldier", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["11988"] = {
						"Golemagg the Incinerator", -- [1]
						"Molten Core", -- [2]
					},
					["134701"] = {
						"Blood Effigy", -- [1]
						"The Underrot", -- [2]
					},
					["12057"] = {
						"Garr", -- [1]
						"Molten Core", -- [2]
					},
					["145123"] = {
						"Myara Nightsong", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["162417"] = {
						"Anubisath Sentinel", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["59458"] = {
						"Hopling", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["133836"] = {
						"Reanimated Guardian", -- [1]
						"The Underrot", -- [2]
					},
					["148625"] = {
						"Echo of Krag'wa", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["137060"] = {
						"Dunecaster Mu'na", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["417"] = {
						"Sloozhem", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["135764"] = {
						"Explosive Totem", -- [1]
						"Kings' Rest", -- [2]
					},
					["140372"] = {
						"Hive Guardian Ksh'ix", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["139400"] = {
						"Mirelurk Rivercaller", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["144971"] = {
						"Druid of the Branch", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["155899"] = {
						"Sak'ja", -- [1]
						"The Eternal Palace", -- [2]
					},
					["129601"] = {
						"Cutwater Harpooner", -- [1]
						"Freehold", -- [2]
					},
					["139439"] = {
						"Duskbinder Zuun", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["134599"] = {
						"Imbued Stormcaller", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["38453"] = {
						"Arcturis", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["158146"] = {
						"Fallen Riftwalker", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["127482"] = {
						"Sewer Vicejaw", -- [1]
						"Tol Dagor", -- [2]
					},
					["122284"] = {
						"Greater Jungle Stalker", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["134280"] = {
						"Vindicator Baatul", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["130791"] = {
						"Khut'een", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["136861"] = {
						"Duskstalker Kuli", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["120366"] = {
						"Hellblaze Temptress", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["123287"] = {
						"Southsea Swashbuckler", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["136264"] = {
						"Half-Finished Mummy", -- [1]
						"Kings' Rest", -- [2]
					},
					["76874"] = {
						"Dreadwing", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["136665"] = {
						"Ashvane Spotter", -- [1]
						"Tol Dagor", -- [2]
					},
					["91784"] = {
						"Warlord Parjesh", -- [1]
						"Eye of Azshara", -- [2]
					},
					["23542"] = {
						"Amani'shi Axe Thrower", -- [1]
						"Zul'Aman", -- [2]
					},
					["54699"] = {
						"Time-Twisted Nightsaber", -- [1]
						"End Time", -- [2]
					},
					["59553"] = {
						"The Songbird Queen", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["136643"] = {
						"Azerite Extractor", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["136043"] = {
						"Brackish", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["135722"] = {
						"Twilight Prowler", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["159514"] = {
						"Blood of Ny'alotha", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["86609"] = {
						"Iron Warmaster", -- [1]
						"Highmaul", -- [2]
					},
					["130301"] = {
						"Shadow Hunter Ju'loa", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["140676"] = {
						"Gigantic Stoneback", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["151898"] = {
						"Stinkfur Hopling", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["138625"] = {
						"Amathet Enforcer", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["144996"] = {
						"Visage from Beyond", -- [1]
						"Crucible of Storms", -- [2]
					},
					["134946"] = {
						"Great Huntsman", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["130338"] = {
						"Dustfang", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["61239"] = {
						"Glintrok Oracle", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["140089"] = {
						"Gloamhoof the Elder", -- [1]
						"Snowblossom Village (Islands 3)", -- [2]
					},
					["11669"] = {
						"Flame Imp", -- [1]
						"Molten Core", -- [2]
					},
					["139422"] = {
						"Scaled Krolusk Tamer", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["135929"] = {
						"Baron Blazehollow", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["84841"] = {
						"Iron Dockworker", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["149343"] = {
						"Frenzy Imbued Azerite", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["128969"] = {
						"Ashvane Commander", -- [1]
						"Siege of Boralus", -- [2]
					},
					["126429"] = {
						"Encrusted Coralback", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["146963"] = {
						"Shortufse Sapper", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["135846"] = {
						"Sand-Crusted Striker", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["59544"] = {
						"The Nodding Tiger", -- [1]
						"Temple of the Jade Serpent", -- [2]
					},
					["135761"] = {
						"Thundering Totem", -- [1]
						"Kings' Rest", -- [2]
					},
					["135964"] = {
						"Rumbling Earth", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["136003"] = {
						"Gravellus", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["143763"] = {
						"Lieutenant Elda", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["151773"] = {
						"Junkyard D.0.G.", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["138983"] = {
						"Muckfin Tidehunter", -- [1]
						"Whispering Reef (Islands 10)", -- [2]
					},
					["122264"] = {
						"Elder Spineshell", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["138101"] = {
						"Stromgarde Sorceress", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["40177"] = {
						"Forgemaster Throngus", -- [1]
						"Grim Batol", -- [2]
					},
					["145261"] = {
						"Opulence", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["148619"] = {
						"Echo of Akunda", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["138970"] = {
						"Vengeful Spirit", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["137585"] = {
						"Earthgrab Totem", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["140679"] = {
						"Frostbeard Wendigo", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["135829"] = {
						"Dustwind", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["80400"] = {
						"Iron Assembly Warden", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["136541"] = {
						"Bile Oozeling", -- [1]
						"Waycrest Manor", -- [2]
					},
					["140156"] = {
						"Vilemaw", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["140295"] = {
						"Snowfur Pup", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["56875"] = {
						"Krik'thik Demolisher", -- [1]
						"Gate of the Setting Sun", -- [2]
					},
					["129802"] = {
						"Earthrager", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["40166"] = {
						"Enslaved Gronn Brute", -- [1]
						"Grim Batol", -- [2]
					},
					["151845"] = {
						"Lieutenant N'ot", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["147938"] = {
						"Azergem Crystalback", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["59764"] = {
						"Healing Tide Totem", -- [1]
						"The Eternal Palace", -- [2]
					},
					["138653"] = {
						"Hosvir of the Rotting Hull", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["146118"] = {
						"Territorial Needleback", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["144303"] = {
						"G.U.A.R.D.", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["81117"] = {
						"Karnor the Cruel", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["81197"] = {
						"Iron Raider", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["136934"] = {
						"Weapons Tester", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["139463"] = {
						"Stonebound Annihilator", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["139800"] = {
						"Galecaller Apprentice", -- [1]
						"Shrine of the Storm", -- [2]
					},
					["148907"] = {
						"Prismatic Image", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["153760"] = {
						"Enthralled Footman", -- [1]
						"Horrific Vision of Stormwind", -- [2]
					},
					["114626"] = {
						"Forlorn Spirit", -- [1]
						"Return to Karazhan", -- [2]
					},
					["152479"] = {
						"Void-Twisted Whelp", -- [1]
						"Eastern Kingdoms - Vermillion Redoubt - HoA Scenario", -- [2]
					},
					["127479"] = {
						"The Sand Queen", -- [1]
						"Tol Dagor", -- [2]
					},
					["158327"] = {
						"Crackling Shard", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["136838"] = {
						"Zgordo the Brutalizer", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["162432"] = {
						"Awakened Terror", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["139870"] = {
						"Voru'kar Swarmguard", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["97677"] = {
						"Barbed Spiderling", -- [1]
						"Vault of the Wardens", -- [2]
					},
					["100943"] = {
						"Earthen Wall Totem", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["158169"] = {
						"Devout Disciple", -- [1]
						"Halls of Origination", -- [2]
					},
					["139033"] = {
						"Razorfin Watershaper", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["137521"] = {
						"Irontide Powdershot", -- [1]
						"Siege of Boralus", -- [2]
					},
					["155920"] = {
						"Azsh'ari Galeblade", -- [1]
						"The Eternal Palace", -- [2]
					},
					["130582"] = {
						"Despondent Scallywag", -- [1]
						"Tol Dagor", -- [2]
					},
					["134629"] = {
						"Scaled Krolusk Rider", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["135167"] = {
						"Spectral Berserker", -- [1]
						"Kings' Rest", -- [2]
					},
					["87760"] = {
						"Training Dummy", -- [1]
						"FW Horde Garrison Level 3", -- [2]
					},
					["146753"] = {
						"Kul Tiran Marine", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["136991"] = {
						"Blood-Hunter Dazal'ai", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["137321"] = {
						"Knight of Arathor", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["155272"] = {
						"Blackwater Oracle", -- [1]
						"The Eternal Palace", -- [2]
					},
					["45007"] = {
						"Enslaved Bandit", -- [1]
						"Lost City of the Tol'vir", -- [2]
					},
					["91781"] = {
						"Hatecoil Warrior", -- [1]
						"Eye of Azshara", -- [2]
					},
					["146861"] = {
						"Slavering Skullcleaver", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["56867"] = {
						"Fiery Trickster", -- [1]
						"Stormstout Brewery", -- [2]
					},
					["162534"] = {
						"Anubisath Sentinel", -- [1]
						"Ny'alotha, the Waking City", -- [2]
					},
					["136841"] = {
						"Thu'zun the Vile", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["102397"] = {
						"Wrathlord Bulwark", -- [1]
						"Assault on Violet Hold", -- [2]
					},
					["11662"] = {
						"Flamewaker Priest", -- [1]
						"Molten Core", -- [2]
					},
					["99359"] = {
						"Rotheart Keeper", -- [1]
						"Darkheart Thicket", -- [2]
					},
					["126185"] = {
						"Zian-Ti Shadowcaster", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["114624"] = {
						"Arcane Warden", -- [1]
						"Return to Karazhan", -- [2]
					},
					["80791"] = {
						"Grom'kar Man-at-Arms", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["135926"] = {
						"Smolderheart", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["138654"] = {
						"Vestar of the Tattered Sail", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["130325"] = {
						"Deepsea Viseclaw", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["134788"] = {
						"Spineclaw Rockshell", -- [1]
						"Jorundall (Islands 7)", -- [2]
					},
					["102375"] = {
						"Runecarver Slave", -- [1]
						"Maw of Souls", -- [2]
					},
					["147033"] = {
						"Brynja", -- [1]
						"8.1 Darkshore Scenario", -- [2]
					},
					["131850"] = {
						"Maddened Survivalist", -- [1]
						"Waycrest Manor", -- [2]
					},
					["118176"] = {
						"Thundershock", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["133663"] = {
						"Fanatical Headhunter", -- [1]
						"The Underrot", -- [2]
					},
					["141495"] = {
						"Kul Tiran Footman", -- [1]
						"Siege of Boralus", -- [2]
					},
					["123292"] = {
						"Sparkleshell Pincher", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["136139"] = {
						"Mechanized Peacekeeper", -- [1]
						"The MOTHERLODE!!", -- [2]
					},
					["134914"] = {
						"Trapdoor Spider", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["102788"] = {
						"Felspite Dominator", -- [1]
						"Black Rook Hold", -- [2]
					},
					["148940"] = {
						"Kaldorei Chimaera", -- [1]
						"Warfronts Darkshore - Horde", -- [2]
					},
					["124927"] = {
						"Jun-Ti", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["135718"] = {
						"Nightsaber Cub", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["147828"] = {
						"7th Legion Cavalier", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["89"] = {
						"Infernal", -- [1]
						"The Eternal Palace", -- [2]
					},
					["137442"] = {
						"High Sorceress Marala", -- [1]
						"Warfronts Arathi - Horde", -- [2]
					},
					["144298"] = {
						"Defense Bot Mk III", -- [1]
						"Operation: Mechagon", -- [2]
					},
					["155688"] = {
						"Azsh'ari Frostbinder", -- [1]
						"The Eternal Palace", -- [2]
					},
					["87841"] = {
						"Grom'kar Firemender", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["135245"] = {
						"Bilge Rat Demolisher", -- [1]
						"Siege of Boralus", -- [2]
					},
					["148290"] = {
						"Crazed Crankshot Engineer", -- [1]
						"Warfronts Darkshore - Alliance", -- [2]
					},
					["98363"] = {
						"Grasping Tentacle", -- [1]
						"Maw of Souls", -- [2]
					},
					["103130"] = {
						"Timeless Wraith", -- [1]
						"The Arcway", -- [2]
					},
					["129517"] = {
						"Reanimated Raptor", -- [1]
						"Atal'Dazar", -- [2]
					},
					["138577"] = {
						"Crushing Tentacle", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["131586"] = {
						"Banquet Steward", -- [1]
						"Waycrest Manor", -- [2]
					},
					["43391"] = {
						"Millhouse Manastorm", -- [1]
						"The Stonecore", -- [2]
					},
					["87411"] = {
						"Workshop Guardian", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["119978"] = {
						"Fulminating Lasher", -- [1]
						"Cathedral of Eternal Night", -- [2]
					},
					["148797"] = {
						"Magus of the Dead", -- [1]
						"Eye of the Storm", -- [2]
					},
					["78352"] = {
						"Battle Medic Rogg", -- [1]
						"Blackrock Foundry", -- [2]
					},
					["153943"] = {
						"Decimator Shiq'voth", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["153942"] = {
						"Annihilator Lak'hal", -- [1]
						"Horrific Vision of Orgrimmar", -- [2]
					},
					["146552"] = {
						"Kul Tiran Tideweaver", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["43214"] = {
						"Slabhide", -- [1]
						"The Stonecore", -- [2]
					},
					["61389"] = {
						"Kargesh Highguard", -- [1]
						"Mogu'shan Palace", -- [2]
					},
					["33776"] = {
						"Geist", -- [1]
						"Isle of Conquest", -- [2]
					},
					["114625"] = {
						"Phantom Guest", -- [1]
						"Return to Karazhan", -- [2]
					},
					["134794"] = {
						"Darklurker", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["147069"] = {
						"Spirit of Xuen", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["146139"] = {
						"Goldspine", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["136839"] = {
						"Mrogan", -- [1]
						"Skittering Hollow (Islands 5)", -- [2]
					},
					["11659"] = {
						"Molten Destroyer", -- [1]
						"Molten Core", -- [2]
					},
					["138496"] = {
						"Twilight Drakonaar", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["137591"] = {
						"Healing Tide Totem", -- [1]
						"Kings' Rest", -- [2]
					},
					["131585"] = {
						"Enthralled Guard", -- [1]
						"Waycrest Manor", -- [2]
					},
					["40319"] = {
						"Drahga Shadowburner", -- [1]
						"Grim Batol", -- [2]
					},
					["40273"] = {
						"Ascended Waterlasher", -- [1]
						"Grim Batol", -- [2]
					},
					["134600"] = {
						"Sandswept Marksman", -- [1]
						"Temple of Sethraliss", -- [2]
					},
					["62632"] = {
						"Sik'thik Engineer", -- [1]
						"Siege of Niuzao Temple", -- [2]
					},
					["155860"] = {
						"Shirakess Voidreaper", -- [1]
						"The Eternal Palace", -- [2]
					},
					["79469"] = {
						"Whirling Dervish", -- [1]
						"Skyreach", -- [2]
					},
					["133733"] = {
						"Moonscythe Pelani", -- [1]
						"Verdant Wilds (Islands 8)", -- [2]
					},
					["138633"] = {
						"Brother Maat", -- [1]
						"The Rotting Mire (Islands 9)", -- [2]
					},
					["22853"] = {
						"Illidari Defiler", -- [1]
						"Black Temple", -- [2]
					},
					["140356"] = {
						"Brightscale Hatchling", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["149359"] = {
						"Azerite Behemoth", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
					["146766"] = {
						"Greater Serpent Totem", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["146251"] = {
						"Sister Katherine", -- [1]
						"Battle of Dazar'alor", -- [2]
					},
					["146185"] = {
						"Firesting Drone", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["135052"] = {
						"Blight Toad", -- [1]
						"Waycrest Manor", -- [2]
					},
					["136886"] = {
						"Banner-Bearer Koral", -- [1]
						"Un'gol Ruins (Islands 1)", -- [2]
					},
					["135963"] = {
						"Earth Elemental", -- [1]
						"Crestfall (Islands 11)", -- [2]
					},
					["124582"] = {
						"Chasm-Hunter", -- [1]
						"The Dread Chain (Islands 4)", -- [2]
					},
					["146838"] = {
						"Brittle Skeleton", -- [1]
						"Molten Cay (Islands 6)", -- [2]
					},
				},
				["aura_grow_direction"] = 1,
				["indicator_anchor"] = {
					["x"] = 0,
				},
				["health_selection_overlay_alpha"] = 0.1,
				["minor_height_scale"] = 0.99999994039536,
				["aura_padding"] = 0,
				["last_news_time"] = 1583244397,
				["aura_width2"] = 19,
				["aura_stack_size"] = 9,
				["aura_border_colors"] = {
					["is_buff"] = {
						nil, -- [1]
						0, -- [2]
						0, -- [3]
					},
				},
				["extra_icon_anchor"] = {
					["y"] = -2,
					["x"] = -4.2600021362305,
				},
				["use_playerclass_color"] = false,
				["range_check_alpha"] = 0.50244373083115,
				["semver"] = "2.0.1",
				["aura_frame2_anchor"] = {
					["y"] = 0.099990844726563,
					["x"] = -0.5,
					["side"] = 1,
				},
				["aura_alpha"] = 1,
				["auto_toggle_friendly"] = {
					["cities"] = false,
					["world"] = false,
				},
				["indicator_faction"] = false,
				["extra_icon_height"] = 20,
				["transparency_behavior"] = 4,
				["debuff_show_cc_border"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					0.76000000536442, -- [4]
				},
				["extra_icon_width"] = 21,
				["health_statusbar_texture"] = "ElvUI Norm",
				["hook_auto_imported"] = {
					["Reorder Nameplate"] = 4,
					["Targetting Alpha"] = 3,
					["Dont Have Aura"] = 1,
					["Players Targetting Amount"] = 4,
					["Color Automation"] = 1,
					["Bwonsamdi Reaping"] = 1,
					["Execute Range"] = 1,
					["Jaina Encounter"] = 6,
					["Blockade Encounter"] = 1,
					["Cast Bar Icon Config"] = 2,
					["Extra Border"] = 2,
					["Combo Points"] = 3,
					["Hide Neutral Units"] = 1,
					["Target Color"] = 3,
					["Aura Reorder"] = 2,
					["Attacking Specific Unit"] = 1,
				},
				["minor_width_scale"] = 0.99999994039536,
				["castbar_target_text_size"] = 7,
				["captured_spells"] = {
					[279956] = {
						["source"] = "Luckydemon",
						["type"] = "DEBUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[298431] = {
						["source"] = "Crassas",
						["type"] = "BUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[278350] = {
						["source"] = "Crassas",
						["type"] = "DEBUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[328136] = {
						["source"] = "Necroa",
						["type"] = "BUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[260057] = {
						["source"] = "Priest of Gonk",
						["type"] = "BUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 131809,
					},
					[5740] = {
						["source"] = "Crassas",
						["event"] = "SPELL_CAST_SUCCESS",
						["npcID"] = 0,
					},
					[268854] = {
						["source"] = "Luckydemon",
						["type"] = "BUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[22703] = {
						["type"] = "DEBUFF",
						["source"] = "Crassas",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[277706] = {
						["type"] = "BUFF",
						["source"] = "Crassas",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[227723] = {
						["source"] = "Crassas",
						["type"] = "BUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[264571] = {
						["source"] = "Crassas",
						["type"] = "BUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[2580] = {
						["event"] = "SPELL_AURA_APPLIED",
						["type"] = "BUFF",
						["source"] = "Luckydemon",
						["npcID"] = 0,
					},
					[268887] = {
						["source"] = "Luckydemon",
						["type"] = "BUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[980] = {
						["source"] = "Crassas",
						["type"] = "DEBUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[303380] = {
						["type"] = "BUFF",
						["source"] = "Crassas",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[152108] = {
						["source"] = "Crassas",
						["event"] = "SPELL_CAST_SUCCESS",
						["npcID"] = 0,
					},
					[279913] = {
						["type"] = "BUFF",
						["source"] = "Crassas",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[300761] = {
						["type"] = "BUFF",
						["source"] = "Crassas",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[108366] = {
						["source"] = "Crassas",
						["type"] = "BUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[273836] = {
						["source"] = "Crassas",
						["type"] = "DEBUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[295367] = {
						["type"] = "DEBUFF",
						["source"] = "Crassas",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[1122] = {
						["source"] = "Crassas",
						["event"] = "SPELL_CAST_SUCCESS",
						["npcID"] = 0,
					},
					[146739] = {
						["source"] = "Crassas",
						["type"] = "DEBUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[157736] = {
						["type"] = "DEBUFF",
						["source"] = "Crassas",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[287660] = {
						["type"] = "BUFF",
						["source"] = "Crassas",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[1490] = {
						["source"] = "Luckydemon",
						["type"] = "DEBUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[43308] = {
						["source"] = "Crassas",
						["type"] = "BUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[29722] = {
						["source"] = "Crassas",
						["event"] = "SPELL_CAST_SUCCESS",
						["npcID"] = 0,
					},
					[279902] = {
						["source"] = "Luckydemon",
						["type"] = "BUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[268956] = {
						["source"] = "Crassas",
						["type"] = "BUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[19483] = {
						["type"] = "BUFF",
						["source"] = "Infernal",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 89,
					},
					[275429] = {
						["type"] = "BUFF",
						["source"] = "Crassas",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[300693] = {
						["source"] = "Crassas",
						["type"] = "BUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[324536] = {
						["source"] = "Crassas",
						["event"] = "SPELL_CAST_SUCCESS",
						["npcID"] = 0,
					},
					[234153] = {
						["source"] = "Crassas",
						["event"] = "SPELL_CAST_SUCCESS",
						["npcID"] = 0,
					},
					[117828] = {
						["type"] = "BUFF",
						["source"] = "Crassas",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[266087] = {
						["type"] = "BUFF",
						["source"] = "Crassas",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[260070] = {
						["source"] = "Pa'kura Priest",
						["type"] = "BUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 131834,
					},
					[260069] = {
						["source"] = "Priest of Gonk",
						["type"] = "BUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 131809,
					},
					[285496] = {
						["source"] = "Crassas",
						["type"] = "BUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[295248] = {
						["type"] = "BUFF",
						["source"] = "Crassas",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[172] = {
						["source"] = "Crassas",
						["event"] = "SPELL_CAST_SUCCESS",
						["npcID"] = 0,
					},
					[316099] = {
						["source"] = "Crassas",
						["type"] = "DEBUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[266030] = {
						["type"] = "BUFF",
						["source"] = "Crassas",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[195072] = {
						["source"] = "Luckydemon",
						["event"] = "SPELL_CAST_SUCCESS",
						["npcID"] = 0,
					},
					[2383] = {
						["event"] = "SPELL_AURA_APPLIED",
						["type"] = "BUFF",
						["source"] = "Luckydemon",
						["npcID"] = 0,
					},
					[185123] = {
						["source"] = "Luckydemon",
						["event"] = "SPELL_CAST_SUCCESS",
						["npcID"] = 0,
					},
					[17962] = {
						["source"] = "Crassas",
						["event"] = "SPELL_CAST_SUCCESS",
						["npcID"] = 0,
					},
					[686] = {
						["source"] = "Crassas",
						["event"] = "SPELL_CAST_SUCCESS",
						["npcID"] = 0,
					},
					[348] = {
						["source"] = "Crassas",
						["event"] = "SPELL_CAST_SUCCESS",
						["npcID"] = 0,
					},
					[186401] = {
						["source"] = "Necroa",
						["type"] = "BUFF",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[131347] = {
						["source"] = "Luckydemon",
						["event"] = "SPELL_CAST_SUCCESS",
						["npcID"] = 0,
					},
					[303344] = {
						["type"] = "BUFF",
						["source"] = "Crassas",
						["event"] = "SPELL_AURA_APPLIED",
						["npcID"] = 0,
					},
					[48181] = {
						["source"] = "Crassas",
						["event"] = "SPELL_CAST_SUCCESS",
						["npcID"] = 0,
					},
					[278736] = {
						["event"] = "SPELL_AURA_APPLIED",
						["type"] = "BUFF",
						["source"] = "Luckydemon",
						["npcID"] = 0,
					},
				},
				["aura_frame1_anchor"] = {
					["y"] = 0.099990844726563,
					["x"] = 0.5,
					["side"] = 7,
				},
				["indicator_rare"] = false,
				["aura_show_important"] = false,
				["aura_height"] = 14,
				["cast_statusbar_bgtexture"] = "ElvUI Norm",
				["aura2_x_offset"] = -0.5,
				["target_indicator"] = "NONE",
				["saved_cvars"] = {
					["ShowClassColorInNameplate"] = "1",
					["nameplateOverlapV"] = "0.9",
					["ShowNamePlateLoseAggroFlash"] = "1",
					["nameplateShowEnemyMinus"] = "1",
					["nameplatePersonalShowAlways"] = "0",
					["nameplateMotionSpeed"] = "0.05",
					["nameplateShowSelf"] = "0",
					["nameplateShowFriendlyTotems"] = "0",
					["nameplatePersonalHideDelaySeconds"] = "0.2",
					["nameplateShowFriendlyPets"] = "0",
					["nameplateShowFriendlyNPCs"] = "0",
					["nameplateSelectedScale"] = "1.15",
					["nameplatePersonalShowInCombat"] = "1",
					["nameplatePersonalShowWithTarget"] = "0",
					["nameplateGlobalScale"] = "1",
					["nameplateSelfTopInset"] = "0.5",
					["nameplateResourceOnTarget"] = "0",
					["nameplateMotion"] = "1",
					["nameplateOtherTopInset"] = "0.085",
					["nameplateShowAll"] = "1",
					["nameplateMaxDistance"] = "100",
					["nameplateShowFriendlyMinions"] = "0",
					["nameplateSelfScale"] = "1",
					["nameplateSelfBottomInset"] = "0.2",
					["nameplateOccludedAlphaMult"] = "1",
					["nameplateShowFriendlyGuardians"] = "0",
					["NamePlateHorizontalScale"] = "1",
					["nameplateSelfAlpha"] = "1",
					["nameplateMinScale"] = "1",
					["nameplateShowEnemyMinions"] = "1",
					["NamePlateVerticalScale"] = "1",
				},
				["login_counter"] = 10995,
				["extra_icon_caster_name"] = false,
				["aura_cooldown_show_swipe"] = false,
				["bossmod_aura_height"] = 15,
				["aura_stack_font"] = "Expressway",
				["OptionsPanelDB"] = {
					["PlaterOptionsPanelFrame"] = {
						["scale"] = 1,
					},
				},
				["target_highlight_texture"] = "Interface\\AddOns\\Plater\\images\\selection_indicator6",
				["aura_timer_text_color"] = {
					nil, -- [1]
					0.96470588235294, -- [2]
					0.92549019607843, -- [3]
				},
				["hover_highlight_alpha"] = 0.59999996423721,
				["plate_config"] = {
					["player"] = {
						["spellpercent_text_font"] = "10089",
						["level_text_size"] = 11,
						["cast"] = {
							115, -- [1]
							8, -- [2]
						},
						["spellpercent_text_anchor"] = {
							["x"] = 2,
							["side"] = 5,
						},
						["healthbar_enabled"] = false,
						["big_actorname_text_shadow_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["level_text_font"] = "10089",
						["percent_text_color"] = {
							0.93725490196078, -- [1]
							0.97647058823529, -- [2]
							1, -- [3]
						},
						["actorname_text_font"] = "10089",
						["big_actorname_text_shadow_color_offset"] = {
							1, -- [1]
							-1, -- [2]
						},
						["power_percent_text_size"] = 8,
						["all_names"] = true,
						["big_actortitle_text_outline"] = "OUTLINE",
						["actorname_text_spacing"] = 12,
						["quest_color_enemy"] = {
							1, -- [1]
							0.369, -- [2]
							0, -- [3]
						},
						["big_actortitle_text_font"] = "10089",
						["spellpercent_text_size"] = 11,
						["big_actortitle_text_shadow_color_offset"] = {
							1, -- [1]
							-1, -- [2]
						},
						["cast_incombat"] = {
							115, -- [1]
							8, -- [2]
						},
						["mana_incombat"] = {
							100, -- [1]
							4, -- [2]
						},
						["spellname_text_anchor"] = {
							["side"] = 3,
						},
						["big_actortitle_text_shadow_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["big_actortitle_text_size"] = 10,
						["spellname_text_size"] = 12,
						["spellname_text_font"] = "10089",
						["big_actorname_text_outline"] = "OUTLINE",
						["quest_color_neutral"] = {
							1, -- [1]
							0.65, -- [2]
							0, -- [3]
						},
						["actorname_text_size"] = 13,
						["percent_text_enabled"] = false,
						["actorname_text_anchor"] = {
							["y"] = 1,
							["side"] = 1,
						},
						["spellpercent_text_enabled"] = false,
						["percent_text_font"] = "10089",
						["actorname_text_color"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							0.86789692938328, -- [4]
						},
						["quest_enabled"] = true,
						["level_text_alpha"] = 1,
						["big_actorname_text_size"] = 10,
						["health_incombat"] = {
							115, -- [1]
							15, -- [2]
						},
						["health"] = {
							115, -- [1]
							15, -- [2]
						},
						["big_actorname_text_font"] = "10089",
						["mana"] = {
							100, -- [1]
							4, -- [2]
						},
						["power_percent_text_font"] = "Accidental Presidency",
						["percent_text_size"] = 11,
						["level_text_enabled"] = true,
					},
					["friendlyplayer"] = {
						["big_actorname_text_size"] = 10,
						["spellpercent_text_font"] = "Big Noodle Titling",
						["level_text_size"] = 9,
						["actorname_use_class_color"] = true,
						["cast"] = {
							115, -- [1]
						},
						["fixed_class_color"] = {
							nil, -- [1]
							nil, -- [2]
							0.78039215686275, -- [3]
							1, -- [4]
						},
						["spellpercent_text_anchor"] = {
							["x"] = 2,
							["side"] = 5,
						},
						["spellname_text_outline"] = "OUTLINE",
						["big_actorname_text_shadow_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["level_text_font"] = "10089",
						["percent_text_color"] = {
							0.93725490196078, -- [1]
							0.97647058823529, -- [2]
							1, -- [3]
						},
						["actorname_text_font"] = "Expressway",
						["big_actorname_text_shadow_color_offset"] = {
							1, -- [1]
							-1, -- [2]
						},
						["mana_incombat"] = {
							nil, -- [1]
							4, -- [2]
						},
						["all_names"] = true,
						["big_actortitle_text_color"] = {
							1, -- [1]
							0.8, -- [2]
							0, -- [3]
						},
						["big_actortitle_text_outline"] = "OUTLINE",
						["actorname_text_spacing"] = 12,
						["only_damaged"] = false,
						["quest_color_enemy"] = {
							1, -- [1]
							0.369, -- [2]
							0, -- [3]
						},
						["big_actortitle_text_font"] = "10089",
						["percent_text_ooc"] = true,
						["big_actorname_text_color"] = {
							0.5, -- [1]
							1, -- [2]
							0.5, -- [3]
						},
						["big_actortitle_text_shadow_color_offset"] = {
							1, -- [1]
							-1, -- [2]
						},
						["actorname_text_size"] = 13,
						["cast_incombat"] = {
							115, -- [1]
							8, -- [2]
						},
						["big_actorname_text_font"] = "10089",
						["spellname_text_anchor"] = {
							["side"] = 3,
						},
						["big_actortitle_text_shadow_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["big_actortitle_text_size"] = 10,
						["spellname_text_font"] = "Big Noodle Titling",
						["big_actorname_text_outline"] = "OUTLINE",
						["quest_color_neutral"] = {
							1, -- [1]
							0.65, -- [2]
							0, -- [3]
						},
						["mana"] = {
							nil, -- [1]
							4, -- [2]
						},
						["power_percent_text_font"] = "Accidental Presidency",
						["use_playerclass_color"] = true,
						["spellpercent_text_size"] = 13,
						["level_text_alpha"] = 1,
						["percent_text_size"] = 13,
						["actorname_text_color"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							0.86789692938328, -- [4]
						},
						["percent_text_font"] = "Big Noodle Titling",
						["buff_frame_y_offset"] = 0,
						["quest_enabled"] = true,
						["actorname_text_anchor"] = {
							["y"] = 1,
							["side"] = 1,
						},
						["health_incombat"] = {
							115, -- [1]
							15, -- [2]
						},
						["health"] = {
							115, -- [1]
							13, -- [2]
						},
						["spellpercent_text_enabled"] = true,
						["percent_text_enabled"] = true,
						["spellname_text_size"] = 13,
						["percent_show_health"] = true,
					},
					["friendlynpc"] = {
						["actorname_use_friends_color"] = true,
						["spellpercent_text_font"] = "Big Noodle Titling",
						["show_guild_name"] = false,
						["level_text_size"] = 11,
						["actorname_use_class_color"] = false,
						["cast"] = {
							115, -- [1]
							8, -- [2]
						},
						["fixed_class_color"] = {
							0, -- [1]
							1, -- [2]
							0, -- [3]
						},
						["spellpercent_text_anchor"] = {
							["x"] = 2,
							["side"] = 5,
						},
						["spellname_text_outline"] = "OUTLINE",
						["click_through"] = true,
						["level_text_font"] = "Big Noodle Titling",
						["percent_text_color"] = {
							0.93725490196078, -- [1]
							0.97647058823529, -- [2]
							1, -- [3]
						},
						["actorname_text_font"] = "Big Noodle Titling",
						["actorname_use_guild_color"] = true,
						["actorname_text_outline"] = "OUTLINE",
						["actorname_text_spacing"] = 12,
						["only_damaged"] = false,
						["quest_color_enemy"] = {
							1, -- [1]
							0.369, -- [2]
							0, -- [3]
						},
						["only_thename"] = true,
						["big_actortitle_text_font"] = "Big Noodle Titling",
						["spellpercent_text_size"] = 11,
						["cast_incombat"] = {
							115, -- [1]
							8, -- [2]
						},
						["big_actorname_text_font"] = "Big Noodle Titling",
						["spellname_text_anchor"] = {
							["side"] = 3,
						},
						["big_actortitle_text_size"] = 10,
						["actorname_friend_color"] = {
							0.71, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["spellname_text_font"] = "Big Noodle Titling",
						["quest_color_neutral"] = {
							1, -- [1]
							0.65, -- [2]
							0, -- [3]
						},
						["actorname_text_size"] = 13,
						["percent_text_enabled"] = true,
						["actorname_text_color"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							0.86789692938328, -- [4]
						},
						["big_actorname_text_size"] = 10,
						["actorname_text_anchor"] = {
							["y"] = 1,
							["side"] = 1,
						},
						["percent_text_size"] = 11,
						["percent_text_ooc"] = true,
						["percent_text_font"] = "Big Noodle Titling",
						["actorname_guild_color"] = {
							0.498039, -- [1]
							1, -- [2]
							0.2, -- [3]
							1, -- [4]
						},
						["power_percent_text_font"] = "Accidental Presidency",
						["health_incombat"] = {
							115, -- [1]
							15, -- [2]
						},
						["health"] = {
							115, -- [1]
							15, -- [2]
						},
						["percent_show_health"] = true,
						["level_text_alpha"] = 1,
						["spellpercent_text_enabled"] = true,
						["spellname_text_size"] = 12,
						["level_text_enabled"] = true,
					},
					["enemyplayer"] = {
						["spellpercent_text_font"] = "Expressway",
						["level_text_size"] = 11,
						["cast"] = {
							110, -- [1]
							4, -- [2]
						},
						["big_actortitle_text_size"] = 10,
						["spellpercent_text_anchor"] = {
							["x"] = -9,
							["side"] = 4,
						},
						["spellname_text_outline"] = "OUTLINE",
						["level_text_font"] = "Big Noodle Titling",
						["percent_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["actorname_text_font"] = "Expressway",
						["all_names"] = true,
						["actorname_text_outline"] = "OUTLINE",
						["actorname_text_spacing"] = 7,
						["quest_color_enemy"] = {
							1, -- [1]
							0.369, -- [2]
							0, -- [3]
						},
						["big_actortitle_text_font"] = "Big Noodle Titling",
						["spellpercent_text_size"] = 7,
						["level_text_anchor"] = {
							["y"] = -0.099998474121094,
							["x"] = -1.8100051879883,
						},
						["cast_incombat"] = {
							110, -- [1]
							4, -- [2]
						},
						["actorname_text_shadow_color"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							0, -- [4]
						},
						["spellname_text_anchor"] = {
							["x"] = -19,
							["side"] = 3,
						},
						["percent_text_anchor"] = {
							["x"] = -1,
							["side"] = 11,
						},
						["spellname_text_font"] = "Expressway",
						["quest_color_neutral"] = {
							1, -- [1]
							0.65, -- [2]
							0, -- [3]
						},
						["actorname_text_size"] = 8,
						["power_percent_text_font"] = "Accidental Presidency",
						["percent_text_shadow_color"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							0, -- [4]
						},
						["big_actorname_text_size"] = 10,
						["level_text_alpha"] = 1,
						["percent_text_size"] = 7,
						["percent_text_font"] = "Expressway",
						["actorname_text_color"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							0.87000000476837, -- [4]
						},
						["percent_show_percent"] = false,
						["health_incombat"] = {
							110, -- [1]
							14, -- [2]
						},
						["health"] = {
							110, -- [1]
							14, -- [2]
						},
						["big_actorname_text_font"] = "Big Noodle Titling",
						["actorname_text_anchor"] = {
							["x"] = 1,
							["side"] = 10,
						},
						["quest_enabled"] = true,
						["spellname_text_size"] = 7,
						["level_text_enabled"] = false,
					},
					["enemynpc"] = {
						["spellpercent_text_font"] = "Expressway",
						["level_text_size"] = 11,
						["cast"] = {
							110, -- [1]
							4, -- [2]
						},
						["spellpercent_text_anchor"] = {
							["x"] = -9,
							["side"] = 4,
						},
						["level_text_font"] = "Big Noodle Titling",
						["percent_text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["actorname_text_font"] = "Expressway",
						["actorname_text_outline"] = "OUTLINE",
						["actorname_text_spacing"] = 7,
						["big_actortitle_text_font"] = "Big Noodle Titling",
						["level_text_anchor"] = {
							["y"] = -0.099998474121094,
							["x"] = -1.8100051879883,
						},
						["cast_incombat"] = {
							110, -- [1]
							4, -- [2]
						},
						["actorname_text_shadow_color"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							0, -- [4]
						},
						["spellname_text_anchor"] = {
							["x"] = -19,
							["side"] = 3,
						},
						["percent_text_anchor"] = {
							["x"] = -1,
							["side"] = 11,
						},
						["spellname_text_font"] = "Expressway",
						["actorname_text_size"] = 8,
						["power_percent_text_font"] = "Accidental Presidency",
						["spellpercent_text_size"] = 7,
						["percent_text_shadow_color"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							0, -- [4]
						},
						["actorname_text_color"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							0.87000000476837, -- [4]
						},
						["actorname_text_anchor"] = {
							["x"] = 1,
							["side"] = 10,
						},
						["percent_text_size"] = 7,
						["percent_text_font"] = "Expressway",
						["percent_show_percent"] = false,
						["health_incombat"] = {
							110, -- [1]
							14, -- [2]
						},
						["health"] = {
							110, -- [1]
							14, -- [2]
						},
						["big_actorname_text_font"] = "Big Noodle Titling",
						["level_text_alpha"] = 1,
						["spellname_text_size"] = 7,
						["level_text_enabled"] = false,
					},
				},
				["aura_y_offset"] = 0.099990844726563,
				["focus_texture"] = "Kait1",
				["cast_statusbar_bgcolor"] = {
					0.062745098039216, -- [1]
					0.062745098039216, -- [2]
					0.062745098039216, -- [3]
					0.76000000536442, -- [4]
				},
				["cast_statusbar_use_fade_effects"] = false,
				["indicator_spec"] = false,
				["border_thickness"] = 0.49999997019768,
				["indicator_scale"] = 0.99999994039536,
				["focus_color"] = {
					0.9921568627451, -- [1]
					1, -- [2]
					0.85882352941176, -- [3]
					0.43592411279678, -- [4]
				},
				["npc_colors"] = {
					["162331"] = {
						true, -- [1]
						false, -- [2]
						"fuchsia", -- [3]
					},
					["150297"] = {
						true, -- [1]
						false, -- [2]
						"fuchsia", -- [3]
					},
					["122984"] = {
						true, -- [1]
						false, -- [2]
						"PRIEST", -- [3]
					},
					["146409"] = {
						false, -- [1]
						false, -- [2]
						"darkgreen", -- [3]
					},
					["150146"] = {
						true, -- [1]
						false, -- [2]
						"fuchsia", -- [3]
					},
					["129601"] = {
						true, -- [1]
						false, -- [2]
						"fuchsia", -- [3]
					},
					["122971"] = {
						true, -- [1]
						false, -- [2]
						"blueviolet", -- [3]
					},
					["146753"] = {
						false, -- [1]
						false, -- [2]
						"blue", -- [3]
					},
					["137591"] = {
						true, -- [1]
						false, -- [2]
						"blue", -- [3]
					},
					["148120"] = {
						false, -- [1]
						false, -- [2]
						"blue", -- [3]
					},
					["120651"] = {
						true, -- [1]
						false, -- [2]
						"blue", -- [3]
					},
					["150160"] = {
						true, -- [1]
						false, -- [2]
						"PRIEST", -- [3]
					},
				},
				["hook_data"] = {
					{
						["Enabled"] = false,
						["Revision"] = 55,
						["HooksTemp"] = {
						},
						["Author"] = "Kastfall-Azralon",
						["Desc"] = "Easy way to change the color of an unit. Open the constructor script and follow the examples.",
						["Hooks"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --attempt to get the color from the unit color list\n    local color = envTable.NpcColors [unitFrame.namePlateUnitNameLower] or envTable.NpcColors [unitFrame.namePlateUnitName] or envTable.NpcColors [unitFrame.namePlateNpcId]\n    \n    --if the color exists, set the health bar color\n    if (color) then\n        Plater.SetNameplateColor (unitFrame, color)\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.NpcColors = {\n        \n        --examples, using the unit name in lower case, regular unit name and the unitID:\n        \n        [\"Thunderlord Windreader\"] = \"red\", --using regular mob name and color it as red\n        [\"thunderlord crag-leaper\"] = {1, 1, 0}, --using lower case and coloring it yellow\n        [75790] = \"#00FF00\", --using the ID of the unit and using green as color\n        \n        --insert the new mobs here:\n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n        \n    } --close custom color bracket\n    \nend\n\n\n\n\n",
						},
						["Name"] = "Color Automation [Plater]",
						["PlaterCore"] = 1,
						["LastHookEdited"] = "Constructor",
						["Time"] = 1555037041,
						["Icon"] = "Interface\\AddOns\\Plater\\images\\color_bar",
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
					}, -- [1]
					{
						["Enabled"] = false,
						["Revision"] = 46,
						["HooksTemp"] = {
						},
						["Author"] = "Izimode-Azralon",
						["Desc"] = "Change the nameplate color when a nameplate does not have the auras set in the constructor script.",
						["Hooks"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --do nothing if the player isn't in combat\n    if (not Plater.IsInCombat()) then\n        return \n    end\n    \n    --do nothing if the unit isn't in combat\n    if (not unitFrame.InCombat) then\n        return\n    end\n    \n    --check the auras\n    local hasAura = false\n    \n    for auraName, _ in pairs (envTable.TrackingAuras) do\n        if (Plater.NameplateHasAura (unitFrame, auraName)) then\n            hasAura = true\n            break\n        end\n    end\n    \n    if (not hasAura) then\n        Plater.SetNameplateColor (unitFrame, envTable.NameplateColor)\n    end    \n    \nend\n\n\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --Important: lines starting with double dashes are comments and are not part of the script\n    \n    --if the unit does not have any of the following auras, it will be painted with the color listed below\n    --list of spells to track, can be the spell name (case-sensitive) or the spellID\n    envTable.TrackingAuras = {\n        --[\"Nightblade\"] = true, --this is an example using the spell name\n        --[195452] = true, --this is an example using the spellID\n        \n    }\n    \n    --which color the nameplate wil be changed\n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    --you may also use /plater colors\n    envTable.NameplateColor = \"pink\"\n    \nend\n\n\n",
						},
						["Name"] = "Don't Have Aura [Plater]",
						["PlaterCore"] = 1,
						["LastHookEdited"] = "Constructor",
						["Time"] = 1550151941,
						["Icon"] = "Interface\\ICONS\\Spell_Shadow_ShadowWordPain",
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
					}, -- [2]
					{
						["Enabled"] = false,
						["Revision"] = 76,
						["Options"] = {
						},
						["LastHookEdited"] = "",
						["Author"] = "Izimode-Azralon",
						["HooksTemp"] = {
						},
						["Desc"] = "Hide neutral units, show when selected, see the constructor script for options.",
						["Hooks"] = {
							["Leave Combat"] = "function (self, unitId, unitFrame, envTable)\n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end\n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        envTable.HideNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n\n\n",
							["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat and InCombatLockdown()) then\n            return\n        end\n        \n        --check the unit reaction\n        if (unitFrame.namePlateIsTarget) then\n            envTable.ShowNameplate (unitFrame)\n            \n        else\n            envTable.HideNameplate (unitFrame)\n            \n        end    \n    end\n    \nend\n\n\n\n\n\n\n",
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        envTable.ShowNameplate (unitFrame)\n    end\n    \nend\n\n\n\n\n",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --when plater finishes an update on the nameplate\n    --check within the envTable if the healthBar of this nameplate should be hidden\n    if (envTable.IsHidden) then\n        if (unitFrame.healthBar:IsShown()) then\n            envTable.HideNameplate (unitFrame)\n        end\n    end\n    \nend\n\n\n\n\n",
							["Enter Combat"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateUnitReaction == envTable.REACTION_NEUTRAL) then\n        \n        --plater already handle this\n        if (unitFrame.PlayerCannotAttack) then\n            return\n        end    \n        \n        --check if is only open world\n        if (envTable.OnlyInOpenWorld and Plater.ZoneInstanceType ~= \"none\") then\n            return \n        end\n        \n        --check for only in combat\n        if (envTable.ShowInCombat) then\n            envTable.ShowNameplate (unitFrame)\n        end\n    end\nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.OnlyInOpenWorld = true;\n    envTable.ShowInCombat = true;\n    \n    --consts\n    envTable.REACTION_NEUTRAL = 4;\n    \n    --functions to hide and show the healthBar\n    function envTable.HideNameplate (unitFrame)\n        Plater.HideHealthBar (unitFrame)\n        Plater.DisableHighlight (unitFrame)\n        envTable.IsHidden = true\n    end\n    \n    function envTable.ShowNameplate (unitFrame)\n        Plater.ShowHealthBar (unitFrame)\n        Plater.EnableHighlight (unitFrame)\n        envTable.IsHidden = false\n    end\n    \nend\n\n\n\n\n",
						},
						["Prio"] = 99,
						["Time"] = 1598190547,
						["PlaterCore"] = 1,
						["OptionsValues"] = {
						},
						["Name"] = "Hide Neutral Units [Plater]",
						["Icon"] = 1990989,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
					}, -- [3]
					{
						["Enabled"] = false,
						["Revision"] = 90,
						["Options"] = {
						},
						["LastHookEdited"] = "Constructor",
						["Author"] = "Ahwa-Azralon",
						["HooksTemp"] = {
						},
						["Desc"] = "Add extra effects to execute range. See the constructor script for options.",
						["Hooks"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (envTable.UseCustomExecutePercent) then\n        \n        --manual detection\n        local healthBar = unitFrame.healthBar\n        if (healthBar.CurrentHealth / healthBar.CurrentHealthMax <= envTable.ExecutePercent) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end        \n        \n    else\n        \n        --auto detection\n        if (unitFrame.InExecuteRange) then\n            envTable.UnitInExecuteRange (unitFrame)\n        end\n        \n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --execute detection, if true the script will handle the execute percent\n    --while false Plater will automatically trigger the execute range\n    --you only want to set this to true in case of Plater not detecting the execute range correctly\n    envTable.UseCustomExecutePercent = false\n    --execute percent, if not detecting automatic, this is the percent to active the execute range\n    --use from zero to one, 0.20 is equal to 20% of the unit life\n    envTable.ExecutePercent = 0.20\n    \n    --allow this script to change the nameplate color when the unit is in execute range\n    envTable.CanChangeColor = true\n    --change the health bar color to this color when the unit is in execute range\n    --color can be set as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}\n    envTable.ExecuteColor = \"green\"\n    \n    --border color\n    envTable.CanChangeBorderColor = false\n    envTable.BorderColor = \"red\"\n    \n    --hide the default health divisor and the health execute indicator\n    envTable.HideHealthDivisor = false\n    --if not hidden, adjust the health divisor settings and the health execute indicator\n    envTable.HealthDivisorAlpha = 0.5\n    envTable.HealthDivisorColor = \"white\"\n    envTable.HealthExecuteIndicatorAlpha = 0.15\n    envTable.HealthExecuteIndicatorColor = \"darkred\"\n    \n    \n    --private (internal functions)\n    do\n        function envTable.UnitInExecuteRange (unitFrame)\n            --check if can change the execute color\n            if (envTable.CanChangeColor) then\n                Plater.SetNameplateColor (unitFrame, envTable.ExecuteColor)\n            end\n            \n            if (envTable.CanChangeBorderColor) then\n                Plater.SetBorderColor (unitFrame, envTable.BorderColor)\n            end\n            \n            if (envTable.HideHealthDivisor) then\n                unitFrame.healthBar.healthCutOff:Hide() \n                unitFrame.healthBar.executeRange:Hide()\n                \n            else\n                envTable.UpdateHealthDivisor (unitFrame)\n                \n            end\n        end\n        \n        function envTable.UpdateHealthDivisor (unitFrame)\n            local healthBar = unitFrame.healthBar\n            \n            healthBar.healthCutOff:Show()\n            healthBar.healthCutOff:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthDivisorColor))\n            healthBar.healthCutOff:SetAlpha (envTable.HealthDivisorAlpha)\n            \n            healthBar.executeRange:Show()\n            healthBar.executeRange:SetVertexColor (DetailsFramework:ParseColors (envTable.HealthExecuteIndicatorColor))\n            healthBar.executeRange:SetAlpha (envTable.HealthExecuteIndicatorAlpha)\n            \n            if (envTable.UseCustomExecutePercent) then\n                healthBar.healthCutOff:ClearAllPoints()\n                healthBar.executeRange:ClearAllPoints()\n                \n                healthBar.healthCutOff:SetSize (healthBar:GetHeight(), healthBar:GetHeight())\n                healthBar.healthCutOff:SetPoint (\"center\", healthBar, \"left\", healthBar:GetWidth() * envTable.ExecutePercent, 0)\n                \n                healthBar.executeRange:SetTexCoord (0, envTable.ExecutePercent, 0, 1)\n                healthBar.executeRange:SetHeight (healthBar:GetHeight())\n                healthBar.executeRange:SetPoint (\"left\", healthBar, \"left\", 0, 0)\n                healthBar.executeRange:SetPoint (\"right\", healthBar.healthCutOff, \"center\")\n            end\n            \n        end\n    end\n    \nend",
						},
						["Prio"] = 99,
						["Time"] = 1598190546,
						["PlaterCore"] = 1,
						["OptionsValues"] = {
						},
						["Name"] = "Execute Range [Plater]",
						["Icon"] = 135358,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
					}, -- [4]
					{
						["Enabled"] = false,
						["Revision"] = 231,
						["Options"] = {
						},
						["LastHookEdited"] = "",
						["Author"] = "Kastfall-Azralon",
						["HooksTemp"] = {
						},
						["Desc"] = "Change the nameplate color if the unit is attacking a specific unit like Monk's Ox Statue or Druid's Treants. You may edit which units it track in the constructor script.",
						["Hooks"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    --get the GUID of the target of the unit\n    local targetGUID = UnitGUID (unitId .. \"target\")\n    \n    if (targetGUID) then\n        \n        --get the npcID of the target\n        local npcID = Plater.GetNpcIDFromGUID (targetGUID)\n        --check if the npcID of this unit is in the npc list \n        if (envTable.ListOfNpcs [npcID]) then\n            Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [npcID])\n            \n        else\n            --check if the name of ths unit is in the list\n            local unitName = UnitName (unitId .. \"target\")\n            if (envTable.ListOfNpcs [unitName]) then\n                Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])\n                \n            else\n                --check if the name of the unit in lower case is in the npc list\n                unitName = string.lower (unitName)\n                if (envTable.ListOfNpcs [unitName]) then\n                    Plater.SetNameplateColor (unitFrame, envTable.ListOfNpcs [unitName])                \n                    \n                end\n            end\n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --list of npcs and their colors, can be inserted:\n    --name of the unit\n    --name of the unit in lower case\n    --npcID of the unit\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}    \n    \n    envTable.ListOfNpcs = {\n        [61146] = \"olive\", --monk statue npcID\n        [103822] = \"olive\", --druid treant npcID\n        \n    }\n    \n    \nend\n\n\n\n\n",
						},
						["Prio"] = 99,
						["Time"] = 1598190333,
						["PlaterCore"] = 1,
						["OptionsValues"] = {
						},
						["Name"] = "Attacking Specific Unit [Plater]",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_attacking_unit",
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
					}, -- [5]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
						},
						["Hooks"] = {
							["Nameplate Added"] = "\n\n-- exported function Plater.UpdatePlateSize() from Plater.lua\n--this is for advanced users which wants to reorder the nameplate frame at their desire\n\n\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    --check if there's a type of unit on this nameplate\n    local plateFrame = unitFrame:GetParent()\n    if (not plateFrame.actorType) then\n        return\n    end\n    \n    --get all the frames and cache some variables\n    local ACTORTYPE_ENEMY_PLAYER = \"enemyplayer\"\n    local profile = Plater.db.profile\n    local DB_PLATE_CONFIG = profile.plate_config\n    local isInCombat = Plater.IsInCombat()\n    local actorType = plateFrame.actorType\n    \n    local unitFrame = plateFrame.unitFrame\n    local healthBar = unitFrame.healthBar\n    local castBar = unitFrame.castBar\n    local powerBar = unitFrame.powerBar\n    local buffFrame1 = unitFrame.BuffFrame\n    local buffFrame2 = unitFrame.BuffFrame2\n    \n    --use in combat bars when in pvp\n    if (plateFrame.actorType == ACTORTYPE_ENEMY_PLAYER) then\n        if ((Plater.ZoneInstanceType == \"pvp\" or Plater.ZoneInstanceType == \"arena\") and DB_PLATE_CONFIG.player.pvp_always_incombat) then\n            isInCombat = true\n        end\n    end\n    \n    --get the config for this actor type\n    local plateConfigs = DB_PLATE_CONFIG [actorType]\n    --get the config key based if the player is in combat\n    local castBarConfigKey, healthBarConfigKey, manaConfigKey = Plater.GetHashKey (isInCombat)\n    \n    --get the width and height from what the user set in the options panel\n    local healthBarWidth, healthBarHeight = unitFrame.customHealthBarWidth or plateConfigs [healthBarConfigKey][1], unitFrame.customHealthBarHeight or plateConfigs [healthBarConfigKey][2]\n    local castBarWidth, castBarHeight = unitFrame.customCastBarWidth or plateConfigs [castBarConfigKey][1], unitFrame.customCastBarHeight or plateConfigs [castBarConfigKey][2]\n    local powerBarWidth, powerBarHeight = unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][1], unitFrame.customPowerBarHeight or plateConfigs [manaConfigKey][2]\n    \n    --calculate the offset for the cast bar, this is done due to the cast bar be anchored to topleft and topright\n    local castBarOffSetX = (healthBarWidth - castBarWidth) / 2\n    local castBarOffSetY = plateConfigs.castbar_offset\n    \n    --calculate offsets for the power bar\n    local powerBarOffSetX = (healthBarWidth - powerBarWidth) / 2\n    local powerBarOffSetY = 0\n    \n    --calculate the size deviation for pets\n    local unitType = Plater.GetUnitType (plateFrame)\n    if (unitType == \"pet\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.pet_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.pet_width_scale\n        \n    elseif (unitType == \"minus\") then\n        healthBarHeight = healthBarHeight * Plater.db.profile.minor_height_scale\n        healthBarWidth = healthBarWidth * Plater.db.profile.minor_width_scale\n    end\n    \n    --unit frame - is set to be the same size as the plateFrame\n    unitFrame:ClearAllPoints()\n    unitFrame:SetAllPoints()\n    \n    --calculates the health bar anchor points\n    --it will always be placed in the center of the nameplate area (where it accepts mouse clicks) \n    local xOffSet = (plateFrame:GetWidth() - healthBarWidth) / 2\n    local yOffSet = (plateFrame:GetHeight() - healthBarHeight) / 2\n    \n    --set the health bar point\n    healthBar:ClearAllPoints()\n    PixelUtil.SetPoint (healthBar, \"topleft\", unitFrame, \"topleft\", xOffSet + profile.global_offset_x, -yOffSet + profile.global_offset_y)\n    PixelUtil.SetPoint (healthBar, \"bottomright\", unitFrame, \"bottomright\", -xOffSet + profile.global_offset_x, yOffSet + profile.global_offset_y)\n    \n    --set the cast bar point and size\n    castBar:ClearAllPoints()\n    PixelUtil.SetPoint (castBar, \"topleft\", healthBar, \"bottomleft\", castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetPoint (castBar, \"topright\", healthBar, \"bottomright\", -castBarOffSetX, castBarOffSetY)\n    PixelUtil.SetHeight (castBar, castBarHeight)\n    PixelUtil.SetSize (castBar.Icon, castBarHeight, castBarHeight)\n    PixelUtil.SetSize (castBar.BorderShield, castBarHeight * 1.4, castBarHeight * 1.4)\n    \n    --set the power bar point and size\n    powerBar:ClearAllPoints()\n    PixelUtil.SetPoint (powerBar, \"topleft\", healthBar, \"bottomleft\", powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetPoint (powerBar, \"topright\", healthBar, \"bottomright\", -powerBarOffSetX, powerBarOffSetY)\n    PixelUtil.SetHeight (powerBar, powerBarHeight)\n    \n    --power bar are hidden by default, show it if there's a custom size for it\n    if (unitFrame.customPowerBarWidth and unitFrame.customPowerBarHeight) then\n        powerBar:SetUnit (unitFrame.unit)\n    end\n    \n    --aura frames\n    local bf1Anchor = Plater.db.profile.aura_frame1_anchor\n    Plater.SetAnchor (buffFrame1, {side = bf1Anchor.side, x = bf1Anchor.x, y = bf1Anchor.y + plateConfigs.buff_frame_y_offset}, unitFrame.healthBar, (Plater.db.profile.aura_grow_direction or 2) == 2)\n    \n    local bf2Anchor = Plater.db.profile.aura_frame2_anchor\n    Plater.SetAnchor (buffFrame2, {side = bf2Anchor.side, x = bf2Anchor.x, y = bf2Anchor.y + plateConfigs.buff_frame_y_offset}, unitFrame.healthBar, (Plater.db.profile.aura2_grow_direction or 2) == 2)\n    \nend\n\n\n",
						},
						["Time"] = 1598190548,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
						["url"] = "",
						["Icon"] = 574574,
						["Enabled"] = false,
						["Revision"] = 94,
						["semver"] = "",
						["Author"] = "Kastfall-Azralon",
						["Desc"] = "Function Plater.UpdatePlateSize from Plater.lua exported to scritps.",
						["Prio"] = 99,
						["version"] = -1,
						["PlaterCore"] = 1,
						["Options"] = {
						},
						["LastHookEdited"] = "",
						["Name"] = "Reorder Nameplate [Plater]",
					}, -- [6]
					{
						["Enabled"] = true,
						["Revision"] = 194,
						["HooksTemp"] = {
						},
						["Author"] = "Izimode-Azralon",
						["Desc"] = "Show combo points above the nameplate for Druid Feral and Rogues.",
						["Hooks"] = {
							["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --run constructor!\n    --constructor is executed only once when any script of the hook runs.\n    \nend\n\n\n",
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if need update the amount of combo points shown\n    if (envTable.LastPlayerTalentUpdate > envTable.LastUpdate) then\n        envTable.UpdateComboPointAmount()\n    end    \n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        envTable.UpdateComboPoints()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end    \n    \nend\n\n\n",
							["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    \n    --check if this nameplate is the current target\n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.ComboPointFrame:Show()\n        \n    else\n        envTable.ComboPointFrame:Hide()\n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Player Power Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.namePlateIsTarget and not unitFrame.IsSelf) then\n        envTable.UpdateComboPoints()\n    end\n    \n    \nend\n\n\n\n\n\n\n",
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n",
							["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.ComboPointFrame:Hide()\n    \nend\n\n\n\n\n",
							["Player Talent Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    --update the amount of comboo points shown when the player changes talents or specialization\n    envTable.UpdateComboPointAmount()\n    \n    --save the time of the last talent change\n    envTable.LastPlayerTalentUpdate = GetTime()\n    \n    \nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    local anchors = {\n        {\"bottom\", unitFrame.healthBar, \"top\", 0, 24},\n    }\n    \n    local sizes = {\n        width = 12,\n        height = 12,\n        scale = 1,\n    }\n    \n    local textures = {\n        backgroundTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        backgroundTexCoords = {78/128, 98/128, 21/64, 41/64},\n        \n        comboPointTexture = [[Interface\\PLAYERFRAME\\ClassOverlayComboPoints]],\n        comboPointTexCoords = {100/128, 120/128, 21/64, 41/64},\n    }\n    \n    local frameLevel = 1000\n    local frameStrata = \"high\"    \n    \n    --private\n    do\n        --store combo points frames on this table\n        envTable.ComboPoints = {}\n        --save when the player changed talents or spec\n        envTable.LastPlayerTalentUpdate = GetTime()\n        --save when this nameplate got a combo point amount and alignment update        \n        \n        --build combo points frame anchor (combo point are anchored to this)\n        if (not unitFrame.PlaterComboPointFrame) then\n            local hostFrame = CreateFrame (\"frame\", nil, unitFrame)\n            hostFrame.ComboPointFramesPool = {}\n            unitFrame.PlaterComboPointFrame = hostFrame\n            envTable.ComboPointFrame = hostFrame\n            \n            --DetailsFramework:ApplyStandardBackdrop (envTable.ComboPointFrame) --debug anchor size\n            \n            --animations\n            local onPlayShowAnimation = function (animation)\n                --stop the hide animation if it's playing\n                if (animation:GetParent():GetParent().HideAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().HideAnimation:Stop()\n                end\n                \n                animation:GetParent():Show()\n            end\n            \n            local onPlayHideAnimation = function (animation)\n                --stop the show animation if it's playing\n                if (animation:GetParent():GetParent().ShowAnimation:IsPlaying()) then\n                    animation:GetParent():GetParent().ShowAnimation:Stop()\n                end\n            end        \n            local onStopHideAnimation = function (animation)\n                animation:GetParent():Hide()       \n            end\n            \n            local createAnimations = function (comboPoint)\n                --on show\n                comboPoint.ShowAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayShowAnimation, nil)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 1, 0.1, 0, 0, 1, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"alpha\", 1, 0.1, .5, 1)\n                Plater:CreateAnimation (comboPoint.ShowAnimation, \"scale\", 2, 0.1, 1.2, 1.2, 1, 1)\n                \n                --on hide\n                comboPoint.HideAnimation = Plater:CreateAnimationHub (comboPoint.comboPointTexture, onPlayHideAnimation, onStopHideAnimation)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"scale\", 1, 0.1, 1, 1, 0, 0)\n                Plater:CreateAnimation (comboPoint.HideAnimation, \"alpha\", 1, 0.1, 1, 0)\n            end\n            \n            --build combo point frame        \n            for i =1, 10 do \n                local f = CreateFrame (\"frame\", nil, envTable.ComboPointFrame)\n                f:SetSize (sizes.width, sizes.height)\n                tinsert (envTable.ComboPoints, f)\n                tinsert (unitFrame.PlaterComboPointFrame.ComboPointFramesPool, f)\n                \n                local backgroundTexture = f:CreateTexture (nil, \"background\")\n                backgroundTexture:SetTexture (textures.backgroundTexture)\n                backgroundTexture:SetTexCoord (unpack (textures.backgroundTexCoords))\n                backgroundTexture:SetSize (sizes.width, sizes.height)\n                backgroundTexture:SetPoint (\"center\")\n                \n                local comboPointTexture = f:CreateTexture (nil, \"artwork\")\n                comboPointTexture:SetTexture (textures.comboPointTexture)\n                comboPointTexture:SetTexCoord (unpack (textures.comboPointTexCoords))\n                \n                comboPointTexture:SetSize (sizes.width, sizes.height)\n                comboPointTexture:SetPoint (\"center\")\n                comboPointTexture:Hide()            \n                \n                f.IsActive = false\n                \n                f.backgroundTexture = backgroundTexture\n                f.comboPointTexture = comboPointTexture\n                \n                createAnimations (f)\n            end\n            \n        else\n            envTable.ComboPointFrame = unitFrame.PlaterComboPointFrame\n            envTable.ComboPointFrame:SetScale (sizes.scale)\n            envTable.ComboPoints = unitFrame.PlaterComboPointFrame.ComboPointFramesPool\n            \n        end            \n        \n        envTable.ComboPointFrame:SetFrameLevel (frameLevel)\n        envTable.ComboPointFrame:SetFrameStrata (frameStrata)\n        \n        function envTable.UpdateComboPoints()\n            local comboPoints = UnitPower (\"player\", Enum.PowerType.ComboPoints)\n            \n            for i = 1, envTable.TotalComboPoints do\n                local thisComboPoint = envTable.ComboPoints [i]\n                \n                if (i <= comboPoints ) then\n                    --combo point enabled\n                    if (not thisComboPoint.IsActive) then\n                        thisComboPoint.ShowAnimation:Play()\n                        thisComboPoint.IsActive = true\n                        \n                    end\n                    \n                else\n                    --combo point disabled\n                    if (thisComboPoint.IsActive) then\n                        thisComboPoint.HideAnimation:Play()\n                        thisComboPoint.IsActive = false\n                        \n                    end\n                end\n            end\n            \n            \n        end\n        \n        function envTable.UpdateComboPointAmount()\n            local namePlateWidth = Plater.db.profile.plate_config.enemynpc.health_incombat[1]\n            local comboPoints = UnitPowerMax (\"player\", Enum.PowerType.ComboPoints)\n            local reservedSpace = namePlateWidth / comboPoints\n            \n            --store the total amount of combo points\n            envTable.TotalComboPoints = comboPoints\n            \n            --update anchor frame\n            envTable.ComboPointFrame:SetWidth (namePlateWidth)\n            envTable.ComboPointFrame:SetHeight (20)\n            envTable.ComboPointFrame:ClearAllPoints()\n            for i = 1, #anchors do\n                local anchor = anchors[i]\n                envTable.ComboPointFrame:SetPoint (unpack (anchor))\n            end        \n            \n            --\n            for i = 1, #envTable.ComboPoints do\n                envTable.ComboPoints[i]:Hide()\n                envTable.ComboPoints[i]:ClearAllPoints()\n            end\n            \n            for i = 1, comboPoints do\n                local comboPoint = envTable.ComboPoints[i]\n                comboPoint:SetPoint (\"left\", envTable.ComboPointFrame, \"left\", reservedSpace * (i-1), 0)\n                comboPoint:Show()\n            end\n            \n            envTable.LastUpdate = GetTime()\n            \n            envTable.UpdateComboPoints()\n        end\n        \n        --initialize\n        envTable.UpdateComboPointAmount()\n        envTable.ComboPointFrame:Hide()\n    end\n    \n    \nend",
						},
						["Name"] = "Combo Points [Plater]",
						["PlaterCore"] = 1,
						["LastHookEdited"] = "Constructor",
						["Time"] = 1555037147,
						["Icon"] = 135426,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
								["Enabled"] = true,
								["DRUID"] = true,
								["ROGUE"] = true,
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
								["103"] = true,
								["Enabled"] = true,
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
					}, -- [7]
					{
						["Enabled"] = false,
						["Revision"] = 97,
						["Options"] = {
						},
						["LastHookEdited"] = "Constructor",
						["Author"] = "Izimode-Azralon",
						["HooksTemp"] = {
						},
						["Desc"] = "Changes the target color to the color set in the constructor script.",
						["Hooks"] = {
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend",
							["Target Changed"] = "function (self, unitId, unitFrame, envTable)\n    envTable.UpdateColor (unitFrame)\nend\n\n\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --usage: color name e.g \"red\" \"yellow\"; color table e.g {1, 0, 0} {1, 1, 0}; hex string e.g. \"#FF0000\" \"FFFF00\"\n    \n    envTable.TargetColor = \"purple\"\n    --envTable.TargetColor = \"#FF00FF\"\n    --envTable.TargetColor = {252/255, 0/255, 254/255}\n    \n    function envTable.UpdateColor (unitFrame)\n        --do not change the color of the personal bar\n        if (not unitFrame.IsSelf) then\n            \n            --if this nameplate the current target of the player?\n            if (unitFrame.namePlateIsTarget) then\n                Plater.SetNameplateColor (unitFrame, envTable.TargetColor)  --rgb\n            else\n                --refresh the nameplate color\n                Plater.RefreshNameplateColor (unitFrame)\n            end\n        end\n    end\n    \nend\n\n\n\n\n",
						},
						["Prio"] = 99,
						["Time"] = 1598190397,
						["PlaterCore"] = 1,
						["OptionsValues"] = {
						},
						["Name"] = "Current Target Color [Plater]",
						["Icon"] = 878211,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
					}, -- [8]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
						},
						["Hooks"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auraContainers = {unitFrame.BuffFrame.PlaterBuffList}\n    \n    if (Plater.db.profile.buffs_on_aura2) then\n        auraContainers [2] = unitFrame.BuffFrame2.PlaterBuffList\n    end\n    \n    for containerID = 1, #auraContainers do\n        \n        local auraContainer = auraContainers [containerID]\n        local aurasShown = {}\n        local aurasDuplicated = {}\n        \n        --build the list of auras shown in the buff frame and check for each aura priority\n        --also check if the consolidate (stack) auras with the same name is enabled\n        for index, auraIcon in ipairs (auraContainer) do\n            if (auraIcon:IsShown()) then\n                if (envTable.consolidadeRepeatedAuras) then\n                    --is this aura already shown?\n                    local iconShownIndex = aurasDuplicated [auraIcon.SpellName]\n                    if (iconShownIndex) then\n                        --get the table with information about the shown icon\n                        local auraShownTable = aurasShown [iconShownIndex]\n                        --get the icon already in the table\n                        local icon = auraShownTable[1]\n                        --increase the amount of stacks\n                        auraShownTable[3] = auraShownTable[3] + 1\n                        \n                        --check if the remaining time of the icon already added in the table is lower than the current\n                        if (auraIcon.RemainingTime > icon.RemainingTime) then\n                            --replace the icon for the icon with bigger duration\n                            auraShownTable[1] = auraIcon\n                            icon:Hide()\n                        else\n                            auraIcon:Hide()\n                        end\n                    else    \n                        local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                        tinsert (aurasShown, {auraIcon, priority, 1}) --icon frame, priority, stack amount\n                        aurasDuplicated [auraIcon.SpellName] = #aurasShown\n                    end\n                else\n                    --not stacking similar auras\n                    local priority = envTable.priority[auraIcon.SpellName] or envTable.priority[auraIcon.spellId] or 1\n                    tinsert (aurasShown, {auraIcon, priority})\n                    \n                end           \n            end\n        end\n        \n        --sort auras by priority\n        table.sort (aurasShown, DetailsFramework.SortOrder2)\n        \n        local growDirection\n        if (containerID == 1) then --debuff container\n            growDirection = Plater.db.profile.aura_grow_direction\n            --force to grow to right if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 3\n            end\n            -- \"Left\", \"Center\", \"Right\" - 1  2  3\n            \n        elseif (containerID == 2) then --buff container\n            growDirection = Plater.db.profile.aura2_grow_direction\n            --force to grow to left if it is anchored to center\n            if (growDirection == 2) then\n                growDirection = 1\n            end\n            \n        end\n        \n        local padding = envTable.padding\n        local framersPerRow = envTable.maxAurasPerRow + 1\n        local horizontalLength = (-padding or 0)\n        \n        --first icon is where the row starts\n        local firstIcon = aurasShown[1] and aurasShown[1][1]\n        \n        if (firstIcon) then\n            local anchorPoint = firstIcon:GetParent() --anchor point is the BuffFrame\n            anchorPoint:SetSize (1, 1)\n            \n            --> left to right\n            if (growDirection == 3) then\n                --> iterate among all aura icons\n                for i = 1, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == 1) then\n                        auraIcon:SetPoint (\"bottomleft\", anchorPoint, \"bottomleft\", 0, 0)\n                    elseif (i % framersPerRow == 0) then\n                        auraIcon:SetPoint (\"bottomleft\", firstIcon, \"topleft\", 0, envTable.rowPadding or 0)\n                        framersPerRow = framersPerRow + framersPerRow\n                    else\n                        auraIcon:SetPoint (\"topleft\", aurasShown [i-1][1], \"topright\", padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                    \n                    horizontalLength = horizontalLength + auraIcon:GetWidth() + padding\n                end\n                \n                --right to left\n            elseif (growDirection == 1) then\n                --> iterate among all aura icons\n                for i = 1, #aurasShown do\n                    local auraIcon = aurasShown [i][1]\n                    auraIcon:ClearAllPoints()\n                    \n                    if (i == 1) then\n                        auraIcon:SetPoint (\"bottomright\", anchorPoint, \"bottomright\", 0, 0)\n                    elseif (i % framersPerRow == 0) then\n                        auraIcon:SetPoint (\"bottomright\", firstIcon, \"topright\", 0, envTable.rowPadding or 0)\n                        framersPerRow = framersPerRow + framersPerRow\n                    else\n                        auraIcon:SetPoint (\"topright\", aurasShown [i-1][1], \"topleft\", -padding, 0)\n                    end\n                    \n                    local stacks = aurasShown[i][3]\n                    if (stacks and stacks > 1) then\n                        auraIcon.StackText:SetText (stacks)\n                        auraIcon.StackText:Show()\n                    end\n                    \n                    horizontalLength = horizontalLength + auraIcon:GetWidth() + padding\n                end                    \n            end\n            \n            --set the size of the buff frame\n            anchorPoint:SetWidth (horizontalLength)\n            anchorPoint:SetHeight (firstIcon:GetHeight())\n            \n        end\n    end\nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --ATTENTION: after enabling this script, you may have to adjust the anchor point at the Buff Settings tab\n    \n    --space between each aura icon\n    envTable.padding = 2\n    \n    --space between each row of icons\n    envTable.rowPadding = 12\n    \n    --amount of icons in the row, it'll breakline and start a new row after reach the threshold\n    envTable.maxAurasPerRow = 5\n    \n    --stack auras of the same name that arent stacked by default from the game\n    envTable.consolidadeRepeatedAuras = true    \n    \n    --which auras goes first, assign a value (any number), bigger value goes first\n    envTable.priority = {\n        [\"Vampiric Touch\"] = 50,\n        [\"Shadow Word: Pain\"] = 22,\n        [\"Mind Flay\"] = 5,\n    }\n    \nend \n\n\n\n\n",
						},
						["Time"] = 1598190157,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\icon_aura_reorder",
						["Enabled"] = false,
						["Revision"] = 296,
						["semver"] = "",
						["Author"] = "Ditador-Azralon",
						["Desc"] = "Reorder buffs and debuffs following the settings set in the constructor.",
						["Prio"] = 99,
						["version"] = -1,
						["PlaterCore"] = 1,
						["Options"] = {
						},
						["LastHookEdited"] = "",
						["Name"] = "Aura Reorder [Plater]",
					}, -- [9]
					{
						["Enabled"] = false,
						["Revision"] = 26,
						["Options"] = {
						},
						["LastHookEdited"] = "",
						["Author"] = "Izimode-Azralon",
						["HooksTemp"] = {
						},
						["Desc"] = "Edit the Constructor script setting the font you want in the FONT = \"\", then /reload.",
						["Hooks"] = {
							["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --added this event just to run the constructor script\n    \nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --insert here the font you want to change then /reeload\n    --after the reload, check if the font has changed and disable this script\n    \n    local FONT = \"Accidental Presidency\"\n    \n    local profile = Plater.db.profile\n    local actorTables = profile.plate_config\n    \n    for plateType, plateTable in pairs (actorTables) do\n        \n        plateTable.actorname_text_font = FONT\n        plateTable.spellname_text_font = FONT\n        plateTable.spellpercent_text_font = FONT\n        plateTable.level_text_font = FONT\n        plateTable.percent_text_font = FONT\n        plateTable.big_actortitle_text_font = FONT\n        plateTable.big_actorname_text_font = FONT\n        plateTable.power_percent_text_font = FONT\n        \n    end\n    \n    profile.castbar_target_font = FONT\n    profile.aura_timer_text_font = FONT    \n    profile.aura_stack_font = FONT    \n    \nend\n\n\n",
						},
						["Prio"] = 99,
						["Time"] = 1598190553,
						["PlaterCore"] = 1,
						["OptionsValues"] = {
						},
						["Name"] = "Change All Fonts",
						["Icon"] = 134331,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
					}, -- [10]
					{
						["Enabled"] = true,
						["Revision"] = 58,
						["Options"] = {
						},
						["LastHookEdited"] = "",
						["Author"] = "Ditador-Azralon",
						["HooksTemp"] = {
						},
						["Desc"] = "Change the color of the aura timer by it's time left",
						["Hooks"] = {
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    \n    local auras = unitFrame.BuffFrame.PlaterBuffList\n    \n    for _, auraIcon in ipairs (auras) do\n        if (auraIcon:IsVisible()) then\n            if (auraIcon.RemainingTime < envTable.Timers.critical) then\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.critical)\n                auraIcon.TimerText:SetAlpha (envTable.Alpha.critical)\n                \n            elseif (auraIcon.RemainingTime < envTable.Timers.warning) then\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.warning)\n                auraIcon.TimerText:SetAlpha (envTable.Alpha.warning)\n                \n            else\n                Plater:SetFontColor (auraIcon.TimerText, envTable.Colors.okay)\n                auraIcon.TimerText:SetAlpha (envTable.Alpha.okay)\n            end \n        end\n        \n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --colors for each time bracket\n    envTable.Colors = {\n        critical = \"red\",\n        warning = \"yellow\",\n        okay = \"white\",\n    }\n    \n    envTable.Alpha = {\n        critical = 1,\n        warning = 0.8,\n        okay = 0.7,\n    }\n    \n    --time amount to enter in warning or critical state\n    envTable.Timers = {\n        critical = 4.9,\n        warning = 8,\n    }\n    \nend\n\n\n",
						},
						["Prio"] = 99,
						["Time"] = 1598190612,
						["PlaterCore"] = 1,
						["OptionsValues"] = {
						},
						["Name"] = "Paint Aura Timers",
						["Icon"] = "Interface\\Timer\\Challenges-Logo",
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
					}, -- [11]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
						},
						["Hooks"] = {
							["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    self.ThrottleUpdate = -1\n    \nend\n\n\n",
							["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    --show cast icon\n    envTable.ShowIcon = true\n    --anchor icon on what side\n    envTable.IconAnchor = \"left\" --accept 'left' 'right'\n    --fine tune the size of the icon\n    envTable.IconSizeOffset = -2\n    \n    \n    --shield for non interruptible casts\n    envTable.ShowShield = false\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    --private:\n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", 1, 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", -2, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 2, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 2, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n            \n        else\n            shield:Hide()\n            \n        end\n        \n    end\nend",
						},
						["Time"] = 1598190555,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
						["url"] = "",
						["Icon"] = "Interface\\Buttons\\UI-Quickslot2",
						["Enabled"] = false,
						["Revision"] = 222,
						["semver"] = "",
						["Author"] = "Ditador-Azralon",
						["Desc"] = "Move the icon of the spell cast to the left or right side of the nameplate.",
						["Prio"] = 99,
						["version"] = -1,
						["PlaterCore"] = 1,
						["Options"] = {
						},
						["LastHookEdited"] = "",
						["Name"] = "Cast Icon Anchor",
					}, -- [12]
					{
						["Enabled"] = false,
						["Revision"] = 26,
						["Options"] = {
						},
						["LastHookEdited"] = "",
						["Author"] = "Izimode-Azralon",
						["HooksTemp"] = {
						},
						["Desc"] = "Change the aura icon animation when they are shown above the nameplate",
						["Hooks"] = {
							["Nameplate Created"] = "function (self, unitId, unitFrame, envTable)\n    \n    --require a /reload after changing this code\n    \n    --this is a standard function replacement\n    --what the code is doing is overwriting an original function from Plater to create customizations\n    --this is allowed and safe to do\n    \n    function Plater.CreateShowAuraIconAnimation (iconFrame)\n        \n        --create the animation hub\n        local iconShowInAnimation = Plater:CreateAnimationHub (iconFrame)\n        \n        --create each individual animation\n        Plater:CreateAnimation (iconShowInAnimation, \"translation\", 1, 0, 0, -10)\n        Plater:CreateAnimation (iconShowInAnimation, \"translation\", 2, .05, 0, 13)\n        Plater:CreateAnimation (iconShowInAnimation, \"translation\", 3, .05, 0, -3)\n        \n        Plater:CreateAnimation (iconShowInAnimation, \"alpha\", 2, .05, .5, 1)\n        \n        Plater:CreateAnimation (iconShowInAnimation, \"scale\", 2, .05, .8, .8, 1.2, 1.2)\n        Plater:CreateAnimation (iconShowInAnimation, \"scale\", 3, .05, 1.2, 1.2, .9, .9)\n        \n        --store the animation within the icon frame object\n        iconFrame.ShowAnimation = iconShowInAnimation\n    end\n    \nend\n\n\n\n\n",
						},
						["Prio"] = 99,
						["Time"] = 1598190157,
						["PlaterCore"] = 1,
						["OptionsValues"] = {
						},
						["Name"] = "Aura Icon Animation",
						["Icon"] = 237026,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
					}, -- [13]
					{
						["Enabled"] = false,
						["Revision"] = 33,
						["Options"] = {
						},
						["LastHookEdited"] = "",
						["Author"] = "Izimode-Azralon",
						["HooksTemp"] = {
						},
						["Desc"] = "Just hide the cast icon. There's a bypass table in the constructor script, you may add some spells there to ignore the effect of this script and show its icon.",
						["Hooks"] = {
							["Cast Stop"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.HideIcon (unitFrame)\n    \nend\n\n\n",
							["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.HideIcon (unitFrame)\n    \nend\n\n\n",
							["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.HideIcon (unitFrame)\n    \nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --add the spell name or spellID in this table to still show its icon in the cast bar\n    envTable.ByPass = {\n        \n        Invincible = true, --example of spell name to ignore (mounting in the invincible mount shows the icon)\n        \n        \n    }\n    \n    \n    function envTable.HideIcon (unitFrame)\n        \n        local castBar = unitFrame.castBar\n        \n        if (not envTable.ByPass [castBar.SpellName ] and not envTable.ByPass [castBar.SpellID]) then\n            \n            unitFrame.castBar.Icon:Hide()\n            unitFrame.castBar.BorderShield:Hide()\n            \n        end\n        \n    end\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						},
						["Prio"] = 99,
						["Time"] = 1598190547,
						["PlaterCore"] = 1,
						["OptionsValues"] = {
						},
						["Name"] = "Hide Cast Icon",
						["Icon"] = "Interface\\GLUES\\LOGIN\\Glues-CheckBox-Check",
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
					}, -- [14]
					{
						["Enabled"] = true,
						["Revision"] = 67,
						["Options"] = {
						},
						["LastHookEdited"] = "",
						["Author"] = "Izimode-Azralon",
						["HooksTemp"] = {
						},
						["Desc"] = "Change the color for the heal absorb, heal prediction and shield amount indicators.",
						["Hooks"] = {
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    \n    --heal absorb\n    unitFrame.healthBar.healAbsorbIndicator:SetVertexColor (DetailsFramework:ParseColors (envTable.HealAbsorbColor))\n    \n    --shield absorb\n    unitFrame.healthBar.shieldAbsorbIndicator:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldsColor))\n    \n    --incoming heal\n    unitFrame.healthBar.incomingHealIndicator:SetVertexColor (DetailsFramework:ParseColors (envTable.IncomingHealColor))\n    \nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --color can be added as:\n    --color names: \"red\", \"yellow\"\n    --color hex: \"#FF0000\", \"#FFFF00\"\n    --color table: {1, 0, 0}, {1, 1, 0}           \n    \n    --make sure to enable the desired indicators at /plater options > Advanced tab > Show Heal/Shield Prediction\n    \n    --color when the heal absorb indicator\n    envTable.HealAbsorbColor = \"maroon\"\n    \n    --color of incoming heal indicator\n    envTable.IncomingHealColor = \"darkgreen\"\n    \n    --color of shield indicator\n    envTable.ShieldsColor = \"#C59000\"    \n    \nend\n\n\n",
						},
						["Prio"] = 99,
						["Time"] = 1598190318,
						["PlaterCore"] = 1,
						["OptionsValues"] = {
						},
						["Name"] = "Change Prediction Color",
						["Icon"] = 1035048,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
					}, -- [15]
					{
						["Enabled"] = true,
						["Revision"] = 165,
						["Options"] = {
						},
						["LastHookEdited"] = "",
						["Author"] = "Rhkqt-Tarren Mill",
						["HooksTemp"] = {
						},
						["Desc"] = "Sets Health Text to Adaptive Membrane Absorb Value",
						["Hooks"] = {
							["Health Update"] = "function (self, unitId, unitFrame, envTable)\n    local text = envTable.healthFunc()\n    if text then\n        unitFrame.healthBar.lifePercent:SetText(text)\n    end\nend\n\n\n\n\n",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    local text = envTable.healthFunc()\n    if text then\n        unitFrame.healthBar.lifePercent:SetText(text)\n    end\nend\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    --[[\n    ###################\n    ##                          ##\n    ##       SETTINGS       ##\n    ##                          ## \n    ###################\n]]\n    \n    -- END OF SETTINGS\n    local absorbValueOnly = {\n        [\"Methodjohn\"] =true,\n        [\"Synthesis Growth\"] =true,\n        [\"Horrific Hemorrhage\"] =true,\n    }\n    \n    local shortenNumber = function(number, significant)\n        if type(number) ~= \"number\" then\n            number = tonumber(number)\n        end\n        if not number then\n            return\n        end\n        \n        if type(significant) ~= \"number\" then\n            significant = tonumber(significant)\n        end\n        significant = significant or 3\n        \n        local affixes = {\n            \"k\",\n            \"m\",\n            \"b\",\n            \"t\",\n        }\n        affixes[0] = \"\"\n        \n        local log, floor, max, abs = math.log, math.floor, math.max, math.abs\n        \n        local powerTen = floor(log(abs(number)) / log(10)) --get the log base 10\n        powerTen = powerTen < 0 and 0 or powerTen --catch negative powers for numbers with an absolute value below 1\n        local affix = floor(powerTen / 3) --every third power of ten (so thousands) results in a new affix\n        local divNum = number / 1000^affix --get the \"new\" number by division with the floored amounts\n        local before = powerTen%3 + 1 --determine how many digits before the .\n        local after = max(0, significant - before) --and how many digits after\n        \n        return string.format(string.format(\"%%.%df%s\", after, affixes[affix]), divNum)\n    end\n    \n    envTable.healthFunc = function()\n        if absorbValueOnly[unitFrame.namePlateUnitName] then\n            local absorbs = UnitGetTotalAbsorbs(unitId)\n            if absorbs>0 then return shortenNumber(UnitGetTotalAbsorbs(unitId)) end            \n        end\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
						},
						["Prio"] = 99,
						["Time"] = 1598190318,
						["PlaterCore"] = 1,
						["OptionsValues"] = {
						},
						["Name"] = "Adaptive Membrane Absorb Value",
						["Icon"] = 135987,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
					}, -- [16]
					{
						["OptionsValues"] = {
						},
						["LastHookEdited"] = "",
						["Hooks"] = {
							["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    self.ThrottleUpdate = -1\n    \nend\n\n\n",
							["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    unitFrame.castBar.BorderShield:SetDrawLayer(\"artwork\")\n    envTable.UpdateIconPosition (unitFrame)\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable, modTable)\n    \n    --private:\n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local noInterruptTexture = castBar.BorderShield\n        \n        if (modTable.config.showIcon) then\n            icon:ClearAllPoints()\n            \n            if (modTable.config.iconOnLeftSide) then\n                if (modTable.config.useFullSize) then\n                    icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                    \n                else\n                    \n                    icon:SetPoint (\"topright\", unitFrame.castBar, \"topleft\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                end\n                \n            else\n                if (modTable.config.useFullSize) then\n                    icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                    \n                else\n                    \n                    icon:SetPoint (\"topleft\", unitFrame.castBar, \"topright\", modTable.config.iconPadding, modTable.config.iconSizeOffset)\n                    icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", modTable.config.iconPadding, -modTable.config.iconSizeOffset)\n                end\n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n        else\n            icon:Hide()\n        end\n        \n        if (modTable.config.showTexture and not castBar.canInterrupt) then\n            noInterruptTexture:Show()\n            \n            local texturePath = modTable.config.iconTexturePath\n            texturePath = texturePath:gsub(\"//\", \"/\")\n            texturePath = texturePath:gsub(\"\\\\\", \"/\")\n            \n            noInterruptTexture:SetTexture (texturePath)\n            noInterruptTexture:SetTexCoord (0, 1, 0, 1)\n            \n            if (modTable.config.desaturatedTexture) then\n                noInterruptTexture:SetDesaturated (modTable.config.desaturatedTexture)\n            else\n                noInterruptTexture:SetVertexColor (DetailsFramework:ParseColors (modTable.config.textureColor))\n            end\n            \n            noInterruptTexture:SetSize (modTable.config.textureWidth, castBar:GetHeight() + modTable.config.textureHeightMod)\n            noInterruptTexture:ClearAllPoints()\n            noInterruptTexture:SetPoint (\"center\", castBar, \"left\", modTable.config.texturePosition, 0)\n            noInterruptTexture:SetAlpha (modTable.config.textureAlpha)\n        else\n            noInterruptTexture:Hide()\n        end\n    end\nend",
						},
						["Time"] = 1597097268,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
						["url"] = "",
						["Icon"] = "Interface\\AddOns\\Plater\\images\\castbar_icon",
						["Enabled"] = false,
						["Revision"] = 348,
						["semver"] = "",
						["Author"] = "Ditador-Azralon",
						["Desc"] = "Move the icon of the spell cast to the left or right side of the nameplate.",
						["version"] = -1,
						["PlaterCore"] = 1,
						["Options"] = {
							{
								["Type"] = 5,
								["Key"] = "option4",
								["Value"] = "Icon Settings:",
								["Name"] = "Icon Settings",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [1]
							{
								["Type"] = 4,
								["Key"] = "showIcon",
								["Value"] = true,
								["Name"] = "Show Icon",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "Show the castbar icon when enabled",
							}, -- [2]
							{
								["Type"] = 4,
								["Key"] = "iconOnLeftSide",
								["Value"] = true,
								["Name"] = "Icon on Left Side",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "If enabled it anchor the icon on the left side, right otherwise",
							}, -- [3]
							{
								["Type"] = 4,
								["Key"] = "useFullSize",
								["Value"] = false,
								["Name"] = "Use Big Icon",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "If enabled the icon has the size of the cast bar plus the healthbar",
							}, -- [4]
							{
								["Type"] = 2,
								["Max"] = 5,
								["Desc"] = "Fine tune the icon size",
								["Min"] = 0,
								["Key"] = "iconSizeOffset",
								["Value"] = 0,
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Icon Size Offset",
							}, -- [5]
							{
								["Type"] = 2,
								["Max"] = 5,
								["Desc"] = "Space between the icon and the cast bar",
								["Min"] = -5,
								["Key"] = "iconPadding",
								["Value"] = 0,
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Icon Padding",
							}, -- [6]
							{
								["Type"] = 6,
								["Key"] = "option6",
								["Value"] = 0,
								["Name"] = "Blank Space",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_blank",
								["Desc"] = "",
							}, -- [7]
							{
								["Type"] = 5,
								["Key"] = "option5",
								["Value"] = "Can't Interrupt Texture:",
								["Name"] = "Interrupt Texture",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_label",
								["Desc"] = "",
							}, -- [8]
							{
								["Type"] = 4,
								["Key"] = "showTexture",
								["Value"] = true,
								["Name"] = "Show Texture",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "If enabled show a texture to tell the cast can't be interrupted",
							}, -- [9]
							{
								["Type"] = 3,
								["Key"] = "iconTexturePath",
								["Value"] = "Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON",
								["Name"] = "Texture Path",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_text",
								["Desc"] = "Insert the path for the texture",
							}, -- [10]
							{
								["Type"] = 4,
								["Key"] = "desaturatedTexture",
								["Value"] = true,
								["Name"] = "Texture Desaturated",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_bool",
								["Desc"] = "If enbaled, texture is shown in black & white",
							}, -- [11]
							{
								["Type"] = 1,
								["Key"] = "textureColor",
								["Value"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
									0.30567157268524, -- [4]
								},
								["Name"] = "Texture Color",
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_color",
								["Desc"] = "Select the color of the texture",
							}, -- [12]
							{
								["Type"] = 2,
								["Max"] = 32,
								["Desc"] = "Adjust the texture width",
								["Min"] = 1,
								["Key"] = "textureWidth",
								["Value"] = 10,
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Texture Width",
							}, -- [13]
							{
								["Type"] = 2,
								["Max"] = 16,
								["Desc"] = "The texture is set to be the same size as the cast bar, fine tune the height as wanted",
								["Min"] = -16,
								["Key"] = "textureHeightMod",
								["Value"] = 0,
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Texture Height Mod",
							}, -- [14]
							{
								["Type"] = 2,
								["Max"] = 32,
								["Desc"] = "Adjust the texture position",
								["Min"] = -32,
								["Key"] = "texturePosition",
								["Value"] = 0,
								["Fraction"] = false,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Texture Position",
							}, -- [15]
							{
								["Type"] = 2,
								["Max"] = 1,
								["Desc"] = "Adjust the texture transparency",
								["Min"] = 0,
								["Key"] = "textureAlpha",
								["Value"] = 1,
								["Fraction"] = true,
								["Icon"] = "Interface\\AddOns\\Plater\\images\\option_number",
								["Name"] = "Texture Alpha",
							}, -- [16]
						},
						["HooksTemp"] = {
						},
						["Name"] = "Cast Bar Icon Settings [P]",
					}, -- [17]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
						},
						["Hooks"] = {
							["Nameplate Updated"] = "\n\nfunction (self, unitId, unitFrame, envTable)\n    \n    local text = unitFrame.healthBar.unitName:GetText()\n    \n    local  FirstName  = { [144747] = true, -- pakus-aspect\n        [144767]  = true, -- gonks-aspect\n        [144963]  = true, -- kimbuls-aspect\n        [144941] = true,  -- akundas-aspect\n        [148894] = true, -- lost-soul\n        [148716] = true, -- risen-soul\n        [148893] = true, -- tormented-soul\n        [135989] = true, -- shieldbearer-of-zul\n        [127879] = true, -- shieldbearer-of-zul\n        [131527] = true, -- lord-waycrest\n        [131545] = true, -- lady-waycrest\n        [131863] = true, -- raal\n        [144324] = true, -- gorak-tul\n        [127484] = true, -- jes-howlis\n        [130655] = true, -- bobby-howlis\n        [155432] = true, -- enchanted-emissary\n        [155433] = true, -- void-touched-emissary\n        [135764] = true, --  explosive-totem\n        [135761] = true, -- thundering-totem\n        [135765] = true, -- torrent-totem\n        [135759] = true, --earthwall-totem\n        [134993] = true, -- mchimba\n        [137614] = true, -- demolishing 1\n        [140447] = true, -- demolishing 2\n        [137625] = true, --demolishing 3\n        [137626] = true, --demolishing 4\n        [139799] = true, -- ironhull apprentice\n        [139800] = true, -- galecaller apprentice\n        [135472] = true, -- zanzal the wise\n        [135475] = true, -- kula the butcher\n        [135470] = true, -- aka'ali the conqueror\n        [153755] = true, -- naeno megacrash\n        [150712] = true, -- trixie tazer\n        [131817] = true, -- Cragmaw the Infested\n        [134069] = true, --volzith the whisperer\n        [151657] = true, -- bomb tonk\n        [151658] = true, -- strider tonk\n        [151659] = true, -- rocket tonk\n        [144249] = true, -- omega buster\n        [136297] = true, -- forgotten denizen\n        [136295] = true, -- sunken denizen\n        [137405] = true} -- gripping\n    \n    \n    if (text) then\n        local  a ,b, c ,d ,e ,f=  strsplit(\" \",text,5)   \n        if not FirstName [unitFrame.namePlateNpcId] then \n            unitFrame.healthBar.unitName:SetText (f or e or d or c or b or a)  \n        else\n            unitFrame.healthBar.unitName:SetText (a) \n        end\n    end    \n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n",
						},
						["Time"] = 1598190429,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
						["url"] = "",
						["Icon"] = 134331,
						["Enabled"] = true,
						["Revision"] = 182,
						["semver"] = "",
						["Author"] = "Izimode-Azralon",
						["Desc"] = "Show Last Name only.",
						["Prio"] = 99,
						["version"] = -1,
						["PlaterCore"] = 1,
						["Options"] = {
						},
						["LastHookEdited"] = "",
						["Name"] = "Last Name Only",
					}, -- [18]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
						},
						["Hooks"] = {
							["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateBorder (unitFrame)\n    \nend\n\n\n",
							["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    if (unitFrame.castBar.CastBarBorder) then\n        unitFrame.castBar.CastBarBorder:Hide()\n    end    \nend",
							["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateBorder (unitFrame)\n    \nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    \n    --hide the icon of the spell, may require /reload after changing\n    envTable.HideIcon = false\n    \n    --border settings\n    envTable.BorderThickness = 0.5\n    envTable.BorderColor = \"black\"\n    \n    --private\n    --create the border\n    if (not unitFrame.castBar.CastBarBorder) then\n        unitFrame.castBar.CastBarBorder = CreateFrame (\"frame\", nil, unitFrame.castBar, \"NamePlateFullBorderTemplate\")\n        unitFrame.castBar.CastBarBorder:SetIgnoreParentScale(false)\n        \n    end    \n    \n    --update the border\n    function envTable.UpdateBorder (unitFrame)\n        local castBar = unitFrame.castBar\n        \n        local r, g, b, a = DetailsFramework:ParseColors (envTable.BorderColor)\n        castBar.CastBarBorder:SetVertexColor (r, g, b, a)\n        \n        local size = envTable.BorderThickness\n        castBar.CastBarBorder:SetBorderSizes (size, size, size, size)\n        castBar.CastBarBorder:UpdateSizes()        \n        \n        if (envTable.HideIcon) then\n            castBar.Icon:Hide()\n        end\n        \n        castBar.CastBarBorder:Show()\n    end\n    \nend\n\n\n\n\n",
						},
						["Time"] = 1598190158,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
						["url"] = "",
						["Icon"] = 133004,
						["Enabled"] = false,
						["Revision"] = 131,
						["semver"] = "",
						["Author"] = "Izimode-Azralon",
						["Desc"] = "Adds a pixels perfect border around the cast bar.",
						["Prio"] = 99,
						["version"] = -1,
						["PlaterCore"] = 1,
						["Options"] = {
						},
						["LastHookEdited"] = "",
						["Name"] = "Cast Bar Border",
					}, -- [19]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
						},
						["Hooks"] = {
							["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BuildFrames (unitFrame)\n    \nend\n\n\n",
							["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.castBar.IconOverlayFrame) then\n        unitFrame.castBar.IconOverlayFrame:Hide()\n    end\n    \nend\n\n\n\n\n",
							["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.BuildFrames (unitFrame)\n    \nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings\n    envTable.AnchorSide = \"left\"\n    envTable.BorderThickness = .5\n    envTable.BorderColor = \"black\"\n    \n    --private\n    function envTable.BuildFrames (unitFrame)\n        local castBar = unitFrame.castBar\n        \n        local r, g, b, a = DetailsFramework:ParseColors (envTable.BorderColor)\n        castBar.IconBorder:SetVertexColor (r, g, b, a)\n        \n        local size = envTable.BorderThickness\n        castBar.IconBorder:SetBorderSizes (size, size, size, size)\n        castBar.IconBorder:UpdateSizes()\n        \n        local icon = castBar.Icon\n        if (envTable.AnchorSide == \"left\") then\n            icon:ClearAllPoints()\n            icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", -2, 0)\n            icon:SetPoint (\"bottomright\", castBar, \"bottomleft\")\n            icon:SetWidth (icon:GetHeight())\n            \n            \n        elseif (envTable.AnchorSide == \"right\") then\n            icon:ClearAllPoints()\n            icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\")\n            icon:SetPoint (\"bottomleft\", castBar, \"bottomright\")\n            icon:SetWidth (icon:GetHeight())\n            \n        end\n        \n        icon:Show()\n        castBar.IconOverlayFrame:Show()\n    end\n    \n    if (not unitFrame.castBar.IconOverlayFrame) then\n        --icon support frame\n        unitFrame.castBar.IconOverlayFrame = CreateFrame (\"frame\", nil, unitFrame.castBar)\n        unitFrame.castBar.IconOverlayFrame:SetPoint (\"topleft\", unitFrame.castBar.Icon, \"topleft\")\n        unitFrame.castBar.IconOverlayFrame:SetPoint (\"bottomright\", unitFrame.castBar.Icon, \"bottomright\")\n        \n        unitFrame.castBar.IconBorder = CreateFrame (\"frame\", nil,  unitFrame.castBar.IconOverlayFrame, \"NamePlateFullBorderTemplate\")\n        unitFrame.castBar.IconBorder:SetIgnoreParentScale(false)\n    end    \n    \nend\n\n\n\n\n",
						},
						["Time"] = 1598190571,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
						["url"] = "",
						["Icon"] = 133004,
						["Enabled"] = false,
						["Revision"] = 138,
						["semver"] = "",
						["Author"] = "Izimode-Azralon",
						["Desc"] = "Adds a pixels perfect border around the cast bar spell icon.",
						["Prio"] = 99,
						["version"] = -1,
						["PlaterCore"] = 1,
						["Options"] = {
						},
						["LastHookEdited"] = "",
						["Name"] = "Cast Icon Border",
					}, -- [20]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
						},
						["Hooks"] = {
							["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateCastBar (unitFrame)\n    self.ThrottleUpdate = -1\n    \nend\n\n\n",
							["Destructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    if (unitFrame.castBar.CastBarBorder) then\n        unitFrame.castBar.CastBarBorder:Hide()\n    end    \n    \n    if (unitFrame.castBar.IconOverlayFrame) then\n        unitFrame.castBar.IconOverlayFrame:Hide()\n    end\n    \nend\n\n\n\n\n",
							["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateCastBar (unitFrame)\n    \nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --border settings\n    envTable.BorderThickness = 0.5\n    envTable.BorderColor = \"black\"\n    \n    --Icon anchor settings\n    --show cast icon\n    envTable.ShowIcon = true\n    --icon size\n    envTable.BigIcon = true\n    envTable.InsideBar = true -- only work with small icon\n    --anchor icon on what side\n    envTable.IconAnchor = \"left\" --or \"right\"\n    --fine tune the size of the icon\n    envTable.IconSizeOffset = 0\n    \n    --shield for non interruptible casts\n    envTable.ShowShield = false\n    envTable.ShieldTexture = [[Interface\\TargetingFrame\\Nameplates]]\n    envTable.ShieldSize = {10, 12}\n    \n    --private\n    --update the border\n    function envTable.UpdateCastBar (unitFrame)\n        local healthBar = unitFrame.healthBar\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        local r, g, b, a = DetailsFramework:ParseColors (envTable.BorderColor)\n        local offset = {x = 0, y = 0, side = 9}\n        \n        if unitFrame.ActorType then\n            offset = Plater.db.profile.plate_config[unitFrame.ActorType].spellname_text_anchor\n        end\n        \n        castBar.CastBarBorder:SetVertexColor (r, g, b, a)\n        \n        local size = envTable.BorderThickness\n        castBar.CastBarBorder:SetBorderSizes (size, size, size, size)\n        castBar.CastBarBorder:UpdateSizes()  \n        castBar.CastBarBorder:Show()\n        \n        if (envTable.ShowIcon) then\n            local frame = castBar\n            local xoff = 0\n            \n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                \n                if (envTable.BigIcon) then\n                    frame = healthBar\n                else\n                    if (envTable.InsideBar) then\n                        castBar:SetPoint (\"topleft\",  healthBar, \"bottomleft\", castBar:GetHeight(), 0)\n                        castBar:SetPoint (\"topright\", healthBar, \"bottomright\", 0, 0)    \n                    else\n                        xoff = -0.5\n                    end\n                end\n                \n                icon:SetPoint (\"topright\",  frame, \"topleft\", xoff, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", castBar, \"bottomleft\", xoff, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                \n                if (envTable.BigIcon) then\n                    frame = healthBar\n                else\n                    if (envTable.InsideBar) then\n                        castBar:SetPoint (\"topleft\",  healthBar, \"bottomleft\",0, 0)\n                        castBar:SetPoint (\"topright\", healthBar, \"bottomright\", -castBar:GetHeight(), 0) \n                    else\n                        xoff = 0.5\n                    end\n                end\n                \n                icon:SetPoint (\"topleft\",  frame, \"topright\", xoff, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", castBar, \"bottomright\", xoff, 0)\n            end\n            \n            icon:SetWidth (icon:GetHeight())     \n            castBar.IconBorder:UpdateSizes()\n            castBar.IconBorder:SetBorderSizes (size, size, size, size)\n            castBar.IconBorder:SetVertexColor (r, g, b, a)\n            icon:Show()\n            castBar.IconOverlayFrame:Show()\n        else\n            icon:Hide()\n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt and not castBar.IsInterrupted) then\n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetTexCoord (0.935, 0.98, 0.245, 0.359)\n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"RIGHT\", castBar.Text, \"LEFT\", -1, -0.5)\n            shield:Show()\n            \n            Plater.SetAnchor (castBar.Text, {x = offset.x+3, y = offset.y, side = offset.side})\n            \n        else\n            Plater.SetAnchor (castBar.Text, offset)\n            \n            shield:Hide()\n        end\n    end\n    \n    --create thee border\n    if (not unitFrame.castBar.CastBarBorder) then\n        unitFrame.castBar.CastBarBorder = CreateFrame (\"frame\", nil, unitFrame.castBar, \"NamePlateFullBorderTemplate\")   \n    end\n    \n    if (not unitFrame.castBar.IconOverlayFrame) and (envTable.ShowIcon) then\n        --icon support frame\n        unitFrame.castBar.IconOverlayFrame = CreateFrame (\"frame\", nil, unitFrame.castBar)\n        unitFrame.castBar.IconOverlayFrame:SetPoint (\"topleft\", unitFrame.castBar.Icon, \"topleft\")\n        unitFrame.castBar.IconOverlayFrame:SetPoint (\"bottomright\", unitFrame.castBar.Icon, \"bottomright\")\n        \n        unitFrame.castBar.IconBorder = CreateFrame (\"frame\", nil,  unitFrame.castBar.IconOverlayFrame, \"NamePlateFullBorderTemplate\")\n    end    \nend",
						},
						["Time"] = 1598190610,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
						["url"] = "https://wago.io/DbHvO1awZ/2",
						["Icon"] = 1723997,
						["Enabled"] = true,
						["Revision"] = 1009,
						["semver"] = "1.0.1",
						["Author"] = "Izimode-Azralon",
						["Desc"] = "Adds a pixels perfect border around the cast bar spell icon.",
						["Prio"] = 99,
						["version"] = 2,
						["PlaterCore"] = 1,
						["Options"] = {
						},
						["LastHookEdited"] = "",
						["Name"] = "Cast Bar & Icon form",
					}, -- [21]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
						},
						["Hooks"] = {
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable)\n    local plateFrame = unitFrame.PlateFrame\n    plateFrame.namePlateUnitName = string.sub(plateFrame.namePlateUnitName, 0, 17)\n    Plater.UpdateUnitName (plateFrame) \nend",
						},
						["Time"] = 1598190548,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
								["Enabled"] = true,
								["scenario"] = true,
								["pvp"] = true,
								["raid"] = true,
								["arena"] = true,
								["none"] = true,
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
						["url"] = "",
						["Icon"] = 134331,
						["Enabled"] = false,
						["Revision"] = 215,
						["semver"] = "",
						["Author"] = "Driani-Antonidas",
						["Desc"] = "",
						["Prio"] = 99,
						["version"] = -1,
						["PlaterCore"] = 1,
						["Options"] = {
						},
						["LastHookEdited"] = "",
						["Name"] = "Character Limit on Name",
					}, -- [22]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
						},
						["Hooks"] = {
							["Health Update"] = "function (self, unitId, unitFrame, envTable)\n    --insert code here\n    \n    envTable.UpdateHealth (unitFrame)    \n    \nend\n\n\n",
							["Nameplate Updated"] = "function (self, unitId, unitFrame, envTable)\n    --insert code here\n    \n    envTable.UpdateHealth (unitFrame)\n    \nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    --settings:\n    envTable.ShowMaxHealth = false\n    envTable.ShowPercent = true\n    envTable.Separator = \" - \"\n    \n    --privite:\n    function envTable.UpdateHealth (unitFrame)\n        --get the health and health max current values\n        local currentHealth = unitFrame.healthBar.CurrentHealth or 0\n        local currentHealthMax = unitFrame.healthBar.CurrentHealthMax or 0\n        \n        --build the string text with current health\n        local healthString = Plater.FormatNumber (currentHealth) .. \"\"\n        \n        --if is showing max health, add it in the health string text\n        if (envTable.ShowMaxHealth) then\n            healthString = healthString .. envTable.Separator .. Plater.FormatNumber (currentHealthMax)\n        end\n        \n        --if is showing the percent text, add it into the string text\n        if (envTable.ShowPercent) then\n            local percent = currentHealth / currentHealthMax * 100\n            local fraction = \"%.1f\"\n            \n            if (percent == 100) then\n                fraction = \"%.0f\"\n            elseif (percent < 10) then\n                fraction = \"%.2f\"\n            end\n            \n            if (envTable.ShowMaxHealth) then\n                healthString = healthString .. \" (\" .. format (fraction, percent) .. \"%)\"\n            else\n                healthString = healthString .. envTable.Separator .. format (fraction, percent) .. \"%\"\n            end\n        end\n        \n        --set the string text\n        unitFrame.healthBar.lifePercent:SetText (healthString)\n    end\n    \nend",
						},
						["Time"] = 1598190164,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
						["url"] = "",
						["Icon"] = 237031,
						["Enabled"] = true,
						["Revision"] = 101,
						["semver"] = "",
						["Author"] = "Izimode-Azralon",
						["Desc"] = "Show the total health and percent in the health amount text. See the constructor code to change options.",
						["Prio"] = 99,
						["version"] = -1,
						["PlaterCore"] = 1,
						["Options"] = {
						},
						["LastHookEdited"] = "",
						["Name"] = "Health / Max Health (%)",
					}, -- [23]
					{
						["OptionsValues"] = {
						},
						["HooksTemp"] = {
						},
						["Hooks"] = {
							["Nameplate Added"] = "function (self, unitId, unitFrame, envTable, modTable)\n    if unitFrame.IsTarget then\n        Plater.SetBorderColor (self, 255, 255, 255, 1.0)\n        unitFrame.healthBar.border:Show()\n    else\n        --unitFrame.healthBar.border:Hide()\n        Plater.SetBorderColor (self, 0, 0, 0, 1.0)\n    end\n    \nend",
							["Target Changed"] = "function (self, unitId, unitFrame, envTable, modTable)\n    if unitFrame.IsTarget then\n        Plater.SetBorderColor (self, 255, 255, 255, 1.0)\n        unitFrame.healthBar.border:Show()\n    else\n        --unitFrame.healthBar.border:Hide()\n        Plater.SetBorderColor (self, 0, 0, 0, 1.0)\n    end\nend\n\n\n\n\n\n\n\n\n\n\n\n",
							["Nameplate Removed"] = "function (self, unitId, unitFrame, envTable, modTable)\n    \n    envTable.UpdateBorder (unitFrame, false)\n    \n    Plater.SetBorderColor (self, 0, 0, 0, 1.0)\n    \nend\n\n\n\n\n",
							["Cast Start"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    envTable.UpdateBorder (unitFrame, true)\n    \nend\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",
							["Cast Update"] = "function (self, unitId, unitFrame, envTable)\n    \n    envTable.UpdateIconPosition (unitFrame)\n    self.ThrottleUpdate = -1\nend\n\n\n",
							["Constructor"] = "function (self, unitId, unitFrame, envTable)\n    \n    \n    --settings:\n    --show cast icon\n    envTable.ShowIcon = true\n    --anchor icon on what side\n    envTable.IconAnchor = \"left\" --accep 'left' 'right'\n    --fine tune the size of the icon\n    envTable.IconSizeOffset = 0\n    \n    --shield for non interruptible casts\n    envTable.ShowShield = false\n    envTable.ShieldTexture = [[Interface\\GROUPFRAME\\UI-GROUP-MAINTANKICON]]\n    envTable.ShieldDesaturated = true\n    envTable.ShieldColor = {1, 1, 1 ,1}\n    envTable.ShieldSize = {10, 12}\n    \n    --private:\n    function envTable.UpdateIconPosition (unitFrame)\n        local castBar = unitFrame.castBar\n        local icon = castBar.Icon\n        local shield = castBar.BorderShield\n        \n        if (envTable.ShowIcon) then\n            icon:ClearAllPoints()\n            \n            if (envTable.IconAnchor == \"left\") then\n                icon:SetPoint (\"topright\", unitFrame.healthBar, \"topleft\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomright\", unitFrame.castBar, \"bottomleft\", 0, 0)    \n                \n            elseif (envTable.IconAnchor == \"right\") then\n                icon:SetPoint (\"topleft\", unitFrame.healthBar, \"topright\", 0, envTable.IconSizeOffset)\n                icon:SetPoint (\"bottomleft\", unitFrame.castBar, \"bottomright\", 0, 0)\n                \n            end\n            \n            icon:SetWidth (icon:GetHeight())\n            icon:Show()\n            \n        else\n            icon:Hide()\n            \n        end\n        \n        if (envTable.ShowShield and not castBar.canInterrupt) then\n            shield:Show()\n            shield:SetAlpha (1)\n            shield:SetTexCoord (0, 1, 0, 1)\n            shield:SetVertexColor (1, 1, 1, 1)\n            \n            shield:SetTexture (envTable.ShieldTexture)\n            shield:SetDesaturated (envTable.ShieldDesaturated)\n            \n            if (not envTable.ShieldDesaturated) then\n                shield:SetVertexColor (DetailsFramework:ParseColors (envTable.ShieldColor))\n            end\n            \n            shield:SetSize (unpack (envTable.ShieldSize))\n            \n            shield:ClearAllPoints()\n            shield:SetPoint (\"center\", castBar, \"left\", 0, 0)\n            \n        else\n            shield:Hide()\n            \n        end\n        \n    end\n    \n    function envTable.UpdateBorder (unitFrame, casting)\n        local healthBar = unitFrame.healthBar\n        local castBar = unitFrame.castBar\n        --casting = not casting == false or  ((castBar.casting or castBar.channeling) and not (castBar.interrupted or castBar.failed))\n        \n        if casting then    \n            if envTable.IconAnchor == \"left\" then\n                healthBar.border:SetPoint(\"TOPLEFT\", castBar.Icon, \"TOPLEFT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMRIGHT\", castBar, \"BOTTOMRIGHT\", 0, 0)\n            elseif envTable.IconAnchor == \"right\" then\n                healthBar.border:SetPoint(\"TOPRIGHT\", castBar.Icon, \"TOPRIGHT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMLEFT\", castBar, \"BOTTOMLEFT\", 0, 0) \n            end\n        else\n            if envTable.IconAnchor == \"left\" then\n                healthBar.border:SetPoint(\"TOPLEFT\", healthBar, \"TOPLEFT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMRIGHT\", healthBar, \"BOTTOMRIGHT\", 0, 0)\n            else\n                healthBar.border:SetPoint(\"TOPRIGHT\", healthBar, \"TOPRIGHT\", 0, 0)\n                healthBar.border:SetPoint(\"BOTTOMLEFT\", healthBar, \"BOTTOMLEFT\", 0, 0) \n            end\n        end\n        healthBar.border:SetFrameStrata(\"HIGH\")\n        \n    end\n    \n    if not unitFrame.castBar.borderChangeHooked then\n        hooksecurefunc(unitFrame.castBar, \"Hide\", function() envTable.UpdateBorder(unitFrame, false) end)\n        unitFrame.castBar.borderChangeHooked = true\n    end\n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \nend",
						},
						["Time"] = 1598190319,
						["LoadConditions"] = {
							["talent"] = {
							},
							["group"] = {
							},
							["class"] = {
							},
							["map_ids"] = {
							},
							["role"] = {
							},
							["pvptalent"] = {
							},
							["spec"] = {
							},
							["race"] = {
							},
							["encounter_ids"] = {
							},
							["affix"] = {
							},
						},
						["url"] = "https://wago.io/YYsKsU4KL/3",
						["Icon"] = "Interface\\Buttons\\UI-Quickslot2",
						["Enabled"] = true,
						["Revision"] = 672,
						["semver"] = "1.0.2",
						["Author"] = "Viashi-Antonidas",
						["Desc"] = "Move the icon of the spell cast to the left or right side of the nameplate and extend the border around icon + cast bar.",
						["Prio"] = 99,
						["version"] = 3,
						["PlaterCore"] = 1,
						["Options"] = {
						},
						["LastHookEdited"] = "",
						["Name"] = "Target Cast Icon Anchor + Border -Apfel",
					}, -- [24]
				},
				["aura_width"] = 19,
				["health_statusbar_bgcolor"] = {
					0, -- [1]
					0, -- [2]
					0, -- [3]
					0.75452543795109, -- [4]
				},
				["range_check_enabled"] = false,
				["target_highlight_color"] = {
					0.93725490196078, -- [1]
					1, -- [2]
					0.9843137254902, -- [3]
				},
				["resources"] = {
					["y_offset_target"] = 20,
					["y_offset_target_withauras"] = 32,
				},
				["click_space"] = {
					123, -- [1]
					25, -- [2]
				},
				["extra_icon_auras"] = {
					277242, -- [1]
				},
				["aura2_grow_direction"] = 3,
				["pet_height_scale"] = 0.99999994039536,
				["aura_x_offset"] = 0.5,
				["first_run3"] = true,
				["healthbar_framelevel"] = 0,
				["health_statusbar_bgtexture"] = "ElvUI Norm",
				["indicator_raidmark_anchor"] = {
					["y"] = -4,
					["x"] = -17.819999694824,
					["side"] = 1,
				},
				["tank"] = {
					["colors"] = {
						["anothertank"] = {
							0.73333333333333, -- [1]
							0.19607843137255, -- [2]
							nil, -- [3]
							1, -- [4]
						},
						["aggro"] = {
							0.18823529411765, -- [1]
							0.76470588235294, -- [2]
							0.054901960784314, -- [3]
							1, -- [4]
						},
						["nocombat"] = {
							0.46666666666667, -- [1]
							0.003921568627451, -- [2]
							nil, -- [3]
							1, -- [4]
						},
						["noaggro"] = {
							0.78039215686275, -- [1]
							0.27843137254902, -- [2]
							0.28627450980392, -- [3]
							1, -- [4]
						},
						["pulling"] = {
							nil, -- [1]
							0.81960784313725, -- [2]
							0.26666666666667, -- [3]
							1, -- [4]
						},
					},
				},
				["aura_tracker"] = {
					["buff_banned"] = {
						["298473"] = true,
						["61573"] = true,
						["206150"] = true,
						["299450"] = true,
						["269278"] = true,
						["61574"] = true,
					},
					["debuff_banned"] = {
						["299353"] = true,
						["288293"] = true,
						["299350"] = true,
						["281242"] = true,
						["288333"] = true,
					},
					["debuff_tracked"] = {
						["285290"] = true,
						["312595"] = true,
					},
					["buff_tracked"] = {
						["226512"] = true,
						["209859"] = true,
						["265160"] = true,
						["262092"] = true,
						["273432"] = true,
					},
				},
				["castbar_target_show"] = true,
				["cast_statusbar_color"] = {
					nil, -- [1]
					0.88627450980392, -- [2]
					0.25490196078431, -- [3]
					1, -- [4]
				},
				["update_throttle"] = 0.050000000745058,
				["pet_width_scale"] = 0.99999994039536,
				["cast_statusbar_texture"] = "ElvUI Norm",
				["extra_icon_use_blizzard_border_color"] = false,
				["aura_stack_anchor"] = {
					["x"] = -0.5,
				},
				["aura_height2"] = 14,
				["indicator_extra_raidmark"] = false,
				["aura_show_debuffs_personal"] = false,
				["indicator_raidmark_scale"] = 0.5,
				["cast_statusbar_spark_alpha"] = 1,
				["aura_timer"] = false,
				["health_selection_overlay"] = "Empty",
				["target_highlight_alpha"] = 0,
				["news_frame"] = {
					["PlaterNewsFrame"] = {
						["scale"] = 1,
					},
				},
				["auto_toggle_stacking_enabled"] = true,
				["indicator_elite"] = false,
				["bossmod_aura_width"] = 16.039859771729,
				["target_shady_alpha"] = 0.44999998807907,
				["aura_width_personal"] = 23,
				["tap_denied_color"] = {
					0.37254901960784, -- [1]
					0.37254901960784, -- [2]
					0.37254901960784, -- [3]
					1, -- [4]
				},
				["bossmod_icons_anchor"] = {
					["side"] = 6,
				},
				["color_override_colors"] = {
					[3] = {
						0.78039215686275, -- [1]
						0.27843137254902, -- [2]
						0.29019607843137, -- [3]
					},
					[4] = {
						0.85098039215686, -- [1]
						0.76470588235294, -- [2]
						0.36078431372549, -- [3]
					},
					[5] = {
						0.28627450980392, -- [1]
						0.67843137254902, -- [2]
						0.30196078431373, -- [3]
					},
				},
				["border_color"] = {
					nil, -- [1]
					nil, -- [2]
					nil, -- [3]
					1, -- [4]
				},
				["target_highlight_height"] = 2,
				["version"] = 2,
				["aura_height_personal"] = 19,
				["cast_statusbar_fadeout_time"] = 0.0099999997764826,
				["patch_version"] = 12,
				["aura_timer_text_size"] = 11,
				["extra_icon_show_timer"] = false,
				["number_region_first_run"] = true,
				["castbar_target_anchor"] = {
					["x"] = 2,
				},
				["script_auto_imported"] = {
					["Cast - Small Alert"] = 4,
					["Aura - Invalidate Unit"] = 1,
					["Aura - Buff Alert"] = 4,
					["Color Change"] = 1,
					["Explosion Affix M+"] = 3,
					["Cast - Very Important"] = 2,
					["Aura Border Color"] = 1,
					["Unit - Important"] = 5,
					["Aura - Debuff Alert"] = 3,
					["Cast - Frontal Cone"] = 2,
					["Fixate"] = 3,
					["Aura - Blink Time Left"] = 1,
					["Unit Power"] = 1,
					["Cast - Big Alert"] = 5,
					["Fixate On You"] = 2,
				},
				["castbar_target_font"] = "Expressway",
				["cast_statusbar_spark_texture"] = "Interface\\AddOns\\Plater\\images\\spark8",
				["aura_cooldown_edge_texture"] = "Interface\\AddOns\\Plater\\images\\cooldown_edge_1",
				["aura_stack_color"] = {
					nil, -- [1]
					0.94509803921569, -- [2]
					0.93725490196078, -- [3]
				},
				["dps"] = {
					["colors"] = {
						["aggro"] = {
							0.78039215686275, -- [1]
							0.27843137254902, -- [2]
							0.28627450980392, -- [3]
							1, -- [4]
						},
						["notontank"] = {
							0.28627450980392, -- [1]
							0.67843137254902, -- [2]
							0.30196078431373, -- [3]
							1, -- [4]
						},
						["noaggro"] = {
							0.15294117647059, -- [1]
							0.62352941176471, -- [2]
							0.043137254901961, -- [3]
							1, -- [4]
						},
						["pulling"] = {
							nil, -- [1]
							0.81960784313725, -- [2]
							0.26666666666667, -- [3]
							1, -- [4]
						},
					},
				},
				["cast_statusbar_color_interrupted"] = {
					0, -- [1]
					1, -- [2]
					0.89411764705882, -- [3]
				},
				["aura_timer_text_font"] = "Accidental Presidency",
				["auto_toggle_stacking"] = {
					["cities"] = true,
				},
				["cast_statusbar_spark_width"] = 5,
				["aura_cooldown_reverse"] = false,
			},
		},
	}

end
