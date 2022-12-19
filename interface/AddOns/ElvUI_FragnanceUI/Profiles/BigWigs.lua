local FUI, E, L, V, P, G = unpack(select(2, ...))

-- BigWigs profile setup
function FUI:GetBigWigsProfile(res)

	local key = "Fragnance BW"

	LoadAddOn("BigWigs_Options")
	LoadAddOn("BigWigs")

	if BigWigs3DB['profiles'] == nil then BigWigs3DB['profiles'] = {} end

	if BigWigs3DB['profiles'][key] == nil then

		if res == '1440p' then

			BigWigs3DB = {
				["global"] = {
					["watchedMovies"] = {
					},
				},
				["namespaces"] = {
					["BigWigs_Bosses_King Rastakhan"] = {
						["profiles"] = {
							["Default"] = {
								[284933] = 967415,
								[285346] = 1032951,
							},
						},
					},
					["BigWigs_Bosses_Atal'Dazar Trash"] = {
						["profiles"] = {
							["Default"] = {
								[252687] = 0,
							},
						},
					},
					["BigWigs_Bosses_Adderis and Aspix"] = {
						["profiles"] = {
							["Default"] = {
								[263246] = 1032439,
							},
						},
					},
					["LibDualSpec-1.0"] = {
						["char"] = {
						},
					},
					["BigWigs_Bosses_Vol'kaal"] = {
						["profiles"] = {
							["Default"] = {
								[250241] = 0,
							},
						},
					},
					["BigWigs_Bosses_N'Zoth, the Corruptor"] = {
						["profiles"] = {
							["Default"] = {
								[312866] = 3130103,
								[318449] = 3064567,
							},
							[key] = {
								[316711] = 3064567,
								[310184] = 3064567,
								[315772] = 3064567,
							},
						},
					},
					["BigWigs_Plugins_Statistics"] = {
					},
					["BigWigs_Bosses_King's Rest Trash"] = {
						["profiles"] = {
							["Default"] = {
								[271564] = 0,
								[269931] = 0,
								[270865] = 0,
							},
						},
					},
					["BigWigs_Plugins_Wipe"] = {
					},
					["BigWigs_Bosses_Loa Council"] = {
						["profiles"] = {
							["Default"] = {
								[285945] = 0,
							},
						},
					},
					["BigWigs_Bosses_Za'qul, Herald of Ny'alotha"] = {
						["profiles"] = {
							["Default"] = {
								[295444] = 1032951,
								[304733] = 0,
								[292996] = 0,
							},
						},
					},
					["BigWigs_Plugins_Transcriptor"] = {
						["global"] = {
							["ignoredEvents"] = {
							},
						},
					},
					["BigWigs_Plugins_Messages"] = {
						["profiles"] = {
							["Default"] = {
								["outline"] = "OUTLINE",
								["fontSize"] = 20.000000273549,
								["BWEmphasizeCountdownMessageAnchor_x"] = 664.889022264073,
								["emphasizedMessages"] = {
									["sink20OutputSink"] = "None",
								},
								["BWMessageAnchor_x"] = 611.9115140995382,
								["fontName"] = "Expressway",
								["BWEmphasizeCountdownMessageAnchor_y"] = 469.3332133548392,
								["font"] = "Expressway",
								["BWEmphasizeMessageAnchor_y"] = 458.0443263669113,
								["BWMessageAnchor_y"] = 549.8670756670326,
								["sink20OutputSink"] = "None",
								["BWEmphasizeMessageAnchor_x"] = 610.4890007147951,
							},
							[key] = {
								["outline"] = "OUTLINE",
								["fontSize"] = 14,
								["BWEmphasizeCountdownMessageAnchor_x"] = 665.4223654336456,
								["BWMessageAnchor_x"] = 385.2449419670884,
								["fontName"] = "Expressway",
								["BWEmphasizeCountdownMessageAnchor_y"] = 483.1998949925037,
								["font"] = "Expressway",
								["BWEmphasizeMessageAnchor_y"] = 455.3783440623301,
								["BWMessageAnchor_y"] = 66.13373147648645,
								["BWEmphasizeMessageAnchor_x"] = 626.4891602781208,
								["sink20OutputSink"] = "BigWigsEmphasized",
							},
						},
					},
					["BigWigs_Bosses_The Golden Serpent"] = {
						["profiles"] = {
							["Default"] = {
								[265910] = 0,
							},
						},
					},
					["BigWigs_Plugins_Victory"] = {
					},
					["BigWigs_Bosses_Aqu'sirr"] = {
						["profiles"] = {
							["Default"] = {
								[264560] = 0,
							},
						},
					},
					["BigWigs_Bosses_Il'gynoth, Corruption Reborn"] = {
						["profiles"] = {
							["Default"] = {
								[313759] = 3130103,
								[311401] = 3129591,
								[309961] = 0,
							},
						},
					},
					["BigWigs_Plugins_Pull"] = {
					},
					["BigWigs_Plugins_AutoReply"] = {
					},
					["BigWigs_Bosses_Shrine of the Storm Trash"] = {
						["profiles"] = {
							["Default"] = {
								[276265] = 0,
								[267977] = 0,
								[268050] = 0,
								[274631] = 0,
							},
						},
					},
					["BigWigs_Plugins_Respawn"] = {
					},
					["BigWigs_Plugins_Sounds"] = {
						["profiles"] = {
							["Default"] = {
								["Long"] = {
									["BigWigs_Bosses_N'Zoth, the Corruptor"] = {
										[318976] = "Arrow Swoosh",
										[316463] = "Moan",
									},
								},
								["Alert"] = {
									["BigWigs_Bosses_Infested Crawg"] = {
										[260292] = "BigWigs: Alert",
									},
								},
								["sound"] = false,
								["media"] = {
									["Alarm"] = "None",
									["Alert"] = "None",
								},
							},
							[key] = {
								["Long"] = {
									["BigWigs_Bosses_N'Zoth, the Corruptor"] = {
										[318976] = "Arrow Swoosh",
										[316463] = "Moan",
									},
								},
								["sound"] = false,
								["Alert"] = {
									["BigWigs_Bosses_Infested Crawg"] = {
										[260292] = "BigWigs: Alert",
									},
								},
								["media"] = {
									["Alarm"] = "None",
									["Alert"] = "None",
								},
							},
						},
					},
					["BigWigs_Bosses_The Hivemind"] = {
						["profiles"] = {
							["Default"] = {
								["custom_on_-20726"] = false,
							},
						},
					},
					["BigWigs_Bosses_Tik'ali"] = {
						["profiles"] = {
							["Default"] = {
								[257582] = 2015479,
							},
						},
					},
					["BigWigs_Plugins_Alt Power"] = {
						["profiles"] = {
							["Default"] = {
								["posx"] = 127.999069939697,
								["posy"] = 236.088373772291,
								["disabled"] = true,
								["font"] = "Expressway",
							},
							[key] = {
								["posx"] = 362.6657415707414,
								["posy"] = 73.95475646120758,
								["disabled"] = true,
								["font"] = "Expressway",
							},
						},
					},
					["BigWigs_Bosses_Avatar of Sethraliss"] = {
						["profiles"] = {
							["Default"] = {
								[273677] = 0,
							},
						},
					},
					["BigWigs_Bosses_High Tinker Mekkatorque"] = {
						["profiles"] = {
							["omg pls"] = {
								["custom_off_sparkbot_marker"] = true,
								["custom_off_286646"] = true,
							},
							["Default"] = {
								[286646] = 1032439,
								["custom_off_sparkbot_marker"] = true,
								["custom_off_286646"] = true,
							},
						},
					},
					["BigWigs_Bosses_Priestess Alun'za"] = {
						["profiles"] = {
							["Default"] = {
								[258709] = 0,
								[255579] = 0,
								[255582] = 0,
							},
						},
					},
					["BigWigs_Bosses_Freehold Trash"] = {
						["profiles"] = {
							["Default"] = {
								[257437] = 0,
								[272402] = 0,
								[257908] = 0,
								[274555] = 0,
								[257775] = 0,
							},
						},
					},
					["BigWigs_Bosses_The MOTHERLODE!! Trash"] = {
						["profiles"] = {
							["Default"] = {
								[263628] = 0,
								[262412] = 0,
							},
						},
					},
					["BigWigs_Bosses_Sergeant Bainbridge"] = {
						["profiles"] = {
							["Default"] = {
								[257585] = 0,
							},
						},
					},
					["BigWigs_Plugins_Colors"] = {
						["profiles"] = {
							["Default"] = {
								["barBackground"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											0, -- [1]
											0, -- [2]
											0, -- [3]
											0, -- [4]
										},
									},
								},
								["blue"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											0.305882352941177, -- [1]
											0.36078431372549, -- [2]
											0.647058823529412, -- [3]
											1, -- [4]
										},
									},
								},
								["barEmphasized"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											nil, -- [1]
											0.1647058823529412, -- [2]
											0.1647058823529412, -- [3]
										},
									},
								},
								["barColor"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											0.4862745098039216, -- [1]
											0.4980392156862745, -- [2]
											0.6941176470588235, -- [3]
										},
									},
								},
								["red"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											nil, -- [1]
											0, -- [2]
											0.0941176470588235, -- [3]
											1, -- [4]
										},
									},
								},
							},
							[key] = {
								["barBackground"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											0.06274509803921569, -- [1]
											0.06274509803921569, -- [2]
											0.06274509803921569, -- [3]
											0, -- [4]
										},
									},
								},
								["red"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											0.7803921568627451, -- [1]
											0.07450980392156863, -- [2]
											0.1568627450980392, -- [3]
											1, -- [4]
										},
									},
								},
								["barEmphasized"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											0.4, -- [1]
											[3] = 0.03137254901960784,
										},
									},
								},
								["blue"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											0.305882352941177, -- [1]
											0.36078431372549, -- [2]
											0.647058823529412, -- [3]
											1, -- [4]
										},
									},
								},
								["barColor"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											0.6941176470588235, -- [1]
											0.6941176470588235, -- [2]
											0.6941176470588235, -- [3]
										},
									},
								},
								["flash"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											nil, -- [1]
											nil, -- [2]
											nil, -- [3]
											1, -- [4]
										},
									},
								},
							},
						},
					},
					["BigWigs_Plugins_Bars"] = {
						["profiles"] = {
							["Default"] = {
								["outline"] = "OUTLINE",
								["fontSize"] = 15,
								["visibleBarLimit"] = 6,
								["alignTime"] = "CENTER",
								["BigWigsAnchor_width"] = 483.9995422363281,
								["BigWigsAnchor_y"] = 147.1995682239303,
								["emphasizeGrowup"] = false,
								["BigWigsAnchor_x"] = 1106.799797307438,
								["fill"] = false,
								["interceptMouse"] = false,
								["BigWigsEmphasizeAnchor_height"] = 22.99999618530273,
								["monochrome"] = false,
								["fontName"] = "Big Noodle Titling",
								["BigWigsAnchor_height"] = 19.99997329711914,
								["texture"] = "Atrocity",
								["barStyle"] = "ElvUI",
								["fontSizeEmph"] = 15,
								["BigWigsEmphasizeAnchor_width"] = 312.0000305175781,
								["BigWigsEmphasizeAnchor_x"] = 606,
								["BigWigsEmphasizeAnchor_y"] = 200.2649030227531,
								["emphasizeTime"] = 6,
							},
							[key] = {
								["BigWigsEmphasizeAnchor_y"] = 216,
								["fontSize"] = 12,
								["visibleBarLimit"] = 4,
								["BigWigsAnchor_width"] = 485.0000610351563,
								["BigWigsAnchor_y"] = 147,
								["nameplateOffsetY"] = 15,
								["BigWigsAnchor_x"] = 1107.20044837,
								["fill"] = false,
								["interceptMouse"] = false,
								["BigWigsEmphasizeAnchor_height"] = 21.9999885559082,
								["emphasizeTime"] = 20,
								["outline"] = "OUTLINE",
								["monochrome"] = false,
								["fontName"] = "Expressway",
								["BigWigsAnchor_height"] = 19.99999618530273,
								["BigWigsEmphasizeAnchor_x"] = 605,
								["BigWigsEmphasizeAnchor_width"] = 313.0001220703125,
								["visibleBarLimitEmph"] = 4,
								["nameplateWidth"] = 162,
								["barStyle"] = "ElvUI",
								["texture"] = "Atrocity",
								["emphasizeGrowup"] = false,
								["nameplateHeight"] = 8,
							},
						},
					},
					["BigWigs_Plugins_InfoBox"] = {
						["profiles"] = {
							["Default"] = {
								["posx"] = 310.0447828385877,
								["posy"] = 71.110999584198,
							},
							[key] = {
								["posx"] = 371.9114451779424,
								["posy"] = 88.17769014569967,
							},
						},
					},
					["BigWigs_Plugins_Super Emphasize"] = {
						["profiles"] = {
							["Default"] = {
								["outline"] = "OUTLINE",
								["font"] = "Expressway",
								["fontColor"] = {
									["b"] = 1,
									["g"] = 0.984313725490196,
									["r"] = 0.992156862745098,
								},
								["Countdown"] = {
									["BigWigs_Bosses_Uu'nat, Harbinger of the Void"] = {
										[285685] = "Deutsch: Heroes of the Storm",
									},
									["BigWigs_Bosses_N'Zoth, the Corruptor"] = {
										[318976] = "Deutsch: Heroes of the Storm",
									},
								},
								["fontName"] = "Expressway",
								["voice"] = "Deutsch: Heroes of the Storm",
							},
							[key] = {
								["outline"] = "OUTLINE",
								["fontSize"] = 26,
								["fontColor"] = {
									["b"] = 1,
									["g"] = 0.984313725490196,
									["r"] = 0.992156862745098,
								},
								["voice"] = "Deutsch: Heroes of the Storm",
								["Countdown"] = {
									["BigWigs_Bosses_Uu'nat, Harbinger of the Void"] = {
										[285685] = "Deutsch: Heroes of the Storm",
									},
									["BigWigs_Bosses_N'Zoth, the Corruptor"] = {
										[318976] = "Deutsch: Heroes of the Storm",
									},
								},
								["font"] = "Expressway",
								["upper"] = false,
								["countdownTime"] = 10,
								["fontName"] = "Expressway",
							},
						},
					},
					["BigWigs_Plugins_Raid Icons"] = {
					},
					["BigWigs_Plugins_BossBlock"] = {
					},
					["BigWigs_Plugins_Proximity"] = {
						["profiles"] = {
							["Default"] = {
								["posx"] = 380.4443274914411,
								["posy"] = 109.1547289093696,
								["disabled"] = true,
								["height"] = 118.8096694946289,
								["font"] = "Interface\\Addons\\Tukui\\medias\\fonts\\normal_font.ttf",
								["width"] = 237.5715179443359,
							},
							[key] = {
								["posx"] = 350.0443216416497,
								["font"] = "Interface\\Addons\\Tukui\\medias\\fonts\\normal_font.ttf",
								["disabled"] = true,
								["height"] = 118.8096694946289,
								["posy"] = 70.2215856935909,
								["width"] = 237.5714721679688,
							},
						},
					},
				},
				["wipe80"] = true,
				["discord"] = 15,
				["profileKeys"] = {
					[E.mynameRealm] = key,
				},
				["profiles"] = {
					["Default"] = {
					},
					[key] = {
						["flash"] = false,
					},
				},
			}

		elseif res == '1080p' then

			BigWigs3DB = {
				["discord"] = 15,
				["namespaces"] = {
					["BigWigs_Bosses_King Rastakhan"] = {
						["profiles"] = {
							["Default"] = {
								[284933] = 967415,
								[285346] = 1032951,
							},
						},
					},
					["BigWigs_Bosses_Atal'Dazar Trash"] = {
						["profiles"] = {
							["Default"] = {
								[252687] = 0,
							},
						},
					},
					["BigWigs_Plugins_Alt Power"] = {
						["profiles"] = {
							["Default"] = {
								["posx"] = 127.999069939697,
								["posy"] = 236.088373772291,
								["disabled"] = true,
								["font"] = "Expressway",
							},
							[key] = {
								["posx"] = 362.6657415707414,
								["disabled"] = true,
								["posy"] = 73.95475646120758,
								["font"] = "Expressway",
							},
						},
					},
					["BigWigs_Plugins_BossBlock"] = {
					},
					["BigWigs_Bosses_Uu'nat, Harbinger of the Void"] = {
						["profiles"] = {
							["Default"] = {
								[285416] = 0,
								[284851] = 1032439,
								[285185] = 0,
								[285685] = 1032439,
								[285307] = 0,
							},
						},
					},
					["BigWigs_Bosses_N'Zoth, the Corruptor"] = {
						["profiles"] = {
							["Default"] = {
								[312866] = 3130103,
								[318449] = 3064567,
							},
							[key] = {
								[316711] = 3064567,
								[310184] = 3064567,
								[315772] = 3064567,
							},
						},
					},
					["BigWigs_Plugins_AutoReply"] = {
					},
					["BigWigs_Bosses_King's Rest Trash"] = {
						["profiles"] = {
							["Default"] = {
								[271564] = 0,
								[269931] = 0,
								[270865] = 0,
							},
						},
					},
					["BigWigs_Bosses_The Restless Cabal"] = {
						["profiles"] = {
							["Default"] = {
								[282386] = 0,
								["custom_off_-19060"] = true,
								["berserk"] = 0,
								[282407] = 0,
							},
						},
					},
					["BigWigs_Plugins_Wipe"] = {
					},
					["BigWigs_Bosses_Loa Council"] = {
						["profiles"] = {
							["Default"] = {
								[285945] = 0,
							},
						},
					},
					["BigWigs_Bosses_Rezan"] = {
						["profiles"] = {
							["Default"] = {
								[255434] = 3064055,
							},
						},
					},
					["BigWigs_Bosses_Za'qul, Herald of Ny'alotha"] = {
						["profiles"] = {
							["Default"] = {
								[295444] = 1032951,
								[304733] = 0,
								[292996] = 0,
							},
						},
					},
					["BigWigs_Bosses_Orgozoa"] = {
						["profiles"] = {
							["Default"] = {
								[305057] = 967415,
								[305048] = 2015991,
							},
						},
					},
					["BigWigs_Bosses_Vectis"] = {
						["profiles"] = {
							["Rogue BFA BW"] = {
								[265127] = 835831,
							},
						},
					},
					["BigWigs_Bosses_Freehold Trash"] = {
						["profiles"] = {
							["Default"] = {
								[257437] = 0,
								[272402] = 0,
								[257908] = 0,
								[274555] = 0,
								[257775] = 0,
							},
						},
					},
					["BigWigs_Bosses_The Golden Serpent"] = {
						["profiles"] = {
							["Default"] = {
								[265910] = 0,
							},
						},
					},
					["BigWigs_Plugins_Victory"] = {
					},
					["BigWigs_Bosses_Adderis and Aspix"] = {
						["profiles"] = {
							["Default"] = {
								[263246] = 1032439,
							},
						},
					},
					["BigWigs_Bosses_Il'gynoth, Corruption Reborn"] = {
						["profiles"] = {
							["Default"] = {
								[313759] = 3130103,
								[309961] = 0,
								[311401] = 3129591,
							},
						},
					},
					["BigWigs_Bosses_Ra-den the Despoiled"] = {
						["profiles"] = {
							["Default"] = {
								[306881] = 3130103,
								[316065] = 3130103,
							},
						},
					},
					["BigWigs_Plugins_Raid Icons"] = {
					},
					["BigWigs_Bosses_Shrine of the Storm Trash"] = {
						["profiles"] = {
							["Default"] = {
								[276265] = 0,
								[267977] = 0,
								[268050] = 0,
								[274631] = 0,
							},
						},
					},
					["BigWigs_Bosses_Mythrax the Unraveler"] = {
						["profiles"] = {
							["Rogue BFA BW"] = {
								[272404] = 966839,
								[276922] = 967415,
							},
						},
					},
					["BigWigs_Bosses_Tik'ali"] = {
						["profiles"] = {
							["Default"] = {
								[257582] = 2015479,
							},
						},
					},
					["BigWigs_Plugins_Sounds"] = {
						["profiles"] = {
							["Default"] = {
								["Long"] = {
									["BigWigs_Bosses_N'Zoth, the Corruptor"] = {
										[318976] = "Arrow Swoosh",
										[316463] = "Moan",
									},
								},
								["sound"] = false,
								["Alert"] = {
									["BigWigs_Bosses_Infested Crawg"] = {
										[260292] = "BigWigs: Alert",
									},
								},
								["media"] = {
									["Alarm"] = "None",
									["Alert"] = "None",
								},
							},
						},
					},
					["BigWigs_Bosses_The Hivemind"] = {
						["profiles"] = {
							["Default"] = {
								["custom_on_-20726"] = false,
							},
						},
					},
					["BigWigs_Bosses_High Tinker Mekkatorque"] = {
						["profiles"] = {
							["omg pls"] = {
								["custom_off_sparkbot_marker"] = true,
								["custom_off_286646"] = true,
							},
							["Default"] = {
								[286646] = 1032439,
								["custom_off_sparkbot_marker"] = true,
								["custom_off_286646"] = true,
							},
						},
					},
					["BigWigs_Bosses_Aqu'sirr"] = {
						["profiles"] = {
							["Default"] = {
								[264560] = 0,
							},
						},
					},
					["BigWigs_Plugins_Respawn"] = {
					},
					["BigWigs_Plugins_Transcriptor"] = {
						["global"] = {
							["ignoredEvents"] = {
							},
						},
					},
					["BigWigs_Bosses_Vol'kaal"] = {
						["profiles"] = {
							["Default"] = {
								[250241] = 0,
							},
						},
					},
					["BigWigs_Plugins_Messages"] = {
						["profiles"] = {
							["Default"] = {
								["outline"] = "OUTLINE",
								["fontSize"] = 20.000000273549,
								["BWEmphasizeCountdownMessageAnchor_x"] = 664.889022264073,
								["emphasizedMessages"] = {
									["sink20OutputSink"] = "None",
								},
								["BWMessageAnchor_x"] = 611.9115140995382,
								["fontName"] = "Expressway",
								["BWEmphasizeCountdownMessageAnchor_y"] = 469.3332133548392,
								["font"] = "Expressway",
								["BWEmphasizeMessageAnchor_y"] = 458.0443263669113,
								["BWMessageAnchor_y"] = 549.8670756670326,
								["BWEmphasizeMessageAnchor_x"] = 610.4890007147951,
								["sink20OutputSink"] = "None",
							},
							[key] = {
								["outline"] = "OUTLINE",
								["BWEmphasizeMessageAnchor_x"] = 625.9557618128019,
								["BWEmphasizeCountdownMessageAnchor_x"] = 664.889022264073,
								["BWEmphasizeMessageAnchor_y"] = 507.1115498854269,
								["BWMessageAnchor_y"] = 66.13373147648645,
								["sink20OutputSink"] = "None",
								["BWMessageAnchor_x"] = 385.2449419670884,
								["fontName"] = "Expressway",
								["BWEmphasizeCountdownMessageAnchor_y"] = 469.3332133548392,
								["font"] = "Expressway",
								["fontSize"] = 20.000000273549,
							},
							["GanazaUI'"] = {
								["fontSize"] = 20.000000273549,
								["font"] = "Friz Quadrata TT",
							},
							["ganaza ui"] = {
								["font"] = "Friz Quadrata TT",
								["fontSize"] = 20.000000273549,
							},
						},
					},
					["BigWigs_Bosses_The MOTHERLODE!! Trash"] = {
						["profiles"] = {
							["Default"] = {
								[263628] = 0,
								[262412] = 0,
							},
						},
					},
					["BigWigs_Bosses_Sergeant Bainbridge"] = {
						["profiles"] = {
							["Default"] = {
								[257585] = 0,
							},
						},
					},
					["BigWigs_Plugins_Colors"] = {
						["profiles"] = {
							["Default"] = {
								["blue"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											0.305882352941177, -- [1]
											0.36078431372549, -- [2]
											0.647058823529412, -- [3]
											1, -- [4]
										},
									},
								},
								["barBackground"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											0, -- [1]
											0, -- [2]
											0, -- [3]
											0, -- [4]
										},
									},
								},
								["barEmphasized"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											nil, -- [1]
											0.1647058823529412, -- [2]
											0.1647058823529412, -- [3]
										},
									},
								},
								["barColor"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											0.4862745098039216, -- [1]
											0.4980392156862745, -- [2]
											0.6941176470588235, -- [3]
										},
									},
								},
								["red"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											nil, -- [1]
											0, -- [2]
											0.0941176470588235, -- [3]
											1, -- [4]
										},
									},
								},
							},
							[key] = {
								["barBackground"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											0.06274509803921569, -- [1]
											0.06274509803921569, -- [2]
											0.06274509803921569, -- [3]
											0, -- [4]
										},
									},
								},
								["red"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											0.7803921568627451, -- [1]
											0.07450980392156863, -- [2]
											0.1568627450980392, -- [3]
											1, -- [4]
										},
									},
								},
								["barEmphasized"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											0.4, -- [1]
											[3] = 0.03137254901960784,
										},
									},
								},
								["blue"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											0.305882352941177, -- [1]
											0.36078431372549, -- [2]
											0.647058823529412, -- [3]
											1, -- [4]
										},
									},
								},
								["barColor"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											0.6941176470588235, -- [1]
											0.6941176470588235, -- [2]
											0.6941176470588235, -- [3]
										},
									},
								},
								["flash"] = {
									["BigWigs_Plugins_Colors"] = {
										["default"] = {
											nil, -- [1]
											nil, -- [2]
											nil, -- [3]
											1, -- [4]
										},
									},
								},
							},
						},
					},
					["BigWigs_Bosses_Lady Jaina Proudmoore"] = {
						["profiles"] = {
							["Default"] = {
								[285254] = 2015479,
							},
						},
					},
					["BigWigs_Plugins_InfoBox"] = {
						["profiles"] = {
							["Default"] = {
								["posx"] = 310.0447828385877,
								["posy"] = 71.110999584198,
							},
							[key] = {
								["posx"] = 371.9114451779424,
								["posy"] = 88.17769014569967,
							},
						},
					},
					["BigWigs_Plugins_Bars"] = {
						["profiles"] = {
							["Default"] = {
								["outline"] = "OUTLINE",
								["fontSize"] = 15,
								["visibleBarLimit"] = 6,
								["alignTime"] = "CENTER",
								["BigWigsAnchor_width"] = 483.9995422363281,
								["BigWigsAnchor_y"] = 147.1995682239303,
								["emphasizeGrowup"] = false,
								["BigWigsAnchor_x"] = 1106.799797307438,
								["fill"] = false,
								["interceptMouse"] = false,
								["BigWigsEmphasizeAnchor_height"] = 23.00000953674316,
								["monochrome"] = false,
								["fontName"] = "Big Noodle Titling",
								["BigWigsAnchor_height"] = 19.99996948242188,
								["emphasizeTime"] = 6,
								["BigWigsEmphasizeAnchor_y"] = 200.2649030227531,
								["BigWigsEmphasizeAnchor_x"] = 606,
								["BigWigsEmphasizeAnchor_width"] = 169.0000152587891,
								["fontSizeEmph"] = 15,
								["barStyle"] = "ElvUI",
							},
							[key] = {
								["outline"] = "OUTLINE",
								["BigWigsAnchor_width"] = 364.9999694824219,
								["fill"] = false,
								["BigWigsEmphasizeAnchor_height"] = 16.9999942779541,
								["monochrome"] = false,
								["fontName"] = "Expressway",
								["BigWigsAnchor_height"] = 16.9999942779541,
								["visibleBarLimitEmph"] = 4,
								["fontSize"] = 11,
								["visibleBarLimit"] = 5,
								["BigWigsAnchor_y"] = 149.1999927620918,
								["emphasizeGrowup"] = false,
								["emphasizeTime"] = 10,
								["barStyle"] = "ElvUI",
								["interceptMouse"] = false,
								["BigWigsEmphasizeAnchor_width"] = 237.9999237060547,
								["BigWigsEmphasizeAnchor_x"] = 604.7112125593776,
								["BigWigsEmphasizeAnchor_y"] = 216,
								["BigWigsAnchor_x"] = 1109.333273389602,
								["fontSizeEmph"] = 11,
							},
							["GanazaUI'"] = {
								["BigWigsAnchor_width"] = 199.999915199823,
								["BigWigsEmphasizeAnchor_width"] = 299.999995349668,
								["font"] = "Friz Quadrata TT",
							},
							["ganaza ui"] = {
								["BigWigsAnchor_width"] = 199.999915199823,
								["BigWigsEmphasizeAnchor_width"] = 299.999995349668,
								["font"] = "Friz Quadrata TT",
							},
						},
					},
					["LibDualSpec-1.0"] = {
						["char"] = {
							["Doitpssy - Tarren Mill"] = {
								"Default", -- [1]
								"Default", -- [2]
								"Default", -- [3]
								"xd mw", -- [4]
								["enabled"] = true,
							},
						},
					},
					["BigWigs_Plugins_Super Emphasize"] = {
						["profiles"] = {
							["Default"] = {
								["outline"] = "OUTLINE",
								["font"] = "Expressway",
								["fontColor"] = {
									["r"] = 0.992156862745098,
									["g"] = 0.984313725490196,
									["b"] = 1,
								},
								["fontName"] = "Expressway",
								["voice"] = "Deutsch: Heroes of the Storm",
								["Countdown"] = {
									["BigWigs_Bosses_Uu'nat, Harbinger of the Void"] = {
										[285685] = "Deutsch: Heroes of the Storm",
									},
									["BigWigs_Bosses_N'Zoth, the Corruptor"] = {
										[318976] = "Deutsch: Heroes of the Storm",
									},
								},
							},
							[key] = {
								["outline"] = "OUTLINE",
								["fontColor"] = {
									["r"] = 0.992156862745098,
									["g"] = 0.984313725490196,
									["b"] = 1,
								},
								["fontName"] = "Expressway",
								["Countdown"] = {
									["BigWigs_Bosses_Uu'nat, Harbinger of the Void"] = {
										[285685] = "Deutsch: Heroes of the Storm",
									},
									["BigWigs_Bosses_N'Zoth, the Corruptor"] = {
										[318976] = "Deutsch: Heroes of the Storm",
									},
								},
								["font"] = "Expressway",
								["voice"] = "English: David",
							},
						},
					},
					["BigWigs_Bosses_Priestess Alun'za"] = {
						["profiles"] = {
							["Default"] = {
								[258709] = 0,
								[255579] = 0,
								[255582] = 0,
							},
						},
					},
					["BigWigs_Bosses_Queen Azshara"] = {
						["profiles"] = {
							["Default"] = {
								[297371] = 0,
								[297937] = 0,
								[303657] = 0,
								[297372] = 0,
								["custom_off_303657"] = true,
								[300519] = 967415,
								[301078] = 2015479,
								[300428] = 0,
								[297934] = 0,
								[298531] = 0,
								[298756] = 0,
								[298121] = 0,
								[-20480] = 1032951,
								[300743] = 0,
								[298021] = 0,
								[304475] = 0,
								[297907] = 0,
								[298014] = 0,
								[299094] = 0,
							},
						},
					},
					["BigWigs_Plugins_Statistics"] = {
					},
					["BigWigs_Bosses_Avatar of Sethraliss"] = {
						["profiles"] = {
							["Default"] = {
								[273677] = 0,
							},
						},
					},
					["BigWigs_Plugins_Proximity"] = {
						["profiles"] = {
							["Default"] = {
								["posx"] = 380.4443274914411,
								["posy"] = 109.1547289093696,
								["disabled"] = true,
								["height"] = 118.8096694946289,
								["font"] = "Interface\\Addons\\Tukui\\medias\\fonts\\normal_font.ttf",
								["width"] = 237.5715179443359,
							},
							[key] = {
								["disabled"] = true,
								["posx"] = 350.0443216416497,
								["width"] = 237.5714874267578,
								["posy"] = 70.2215856935909,
								["height"] = 118.8096694946289,
								["font"] = "Interface\\Addons\\Tukui\\medias\\fonts\\normal_font.ttf",
							},
							["GanazaUI'"] = {
								["fontSize"] = 20.000000273549,
								["font"] = "Friz Quadrata TT",
							},
							["ganaza ui"] = {
								["font"] = "Friz Quadrata TT",
								["fontSize"] = 20.000000273549,
							},
						},
					},
					["BigWigs_Bosses_G'huun"] = {
						["profiles"] = {
							["Rogue BFA BW"] = {
								["stages"] = 0,
								[270373] = 1032375,
							},
							["Default"] = {
								[270373] = 1032439,
							},
						},
					},
					["BigWigs_Plugins_Pull"] = {
					},
					["BigWigs_Bosses_Jadefire Masters Horde"] = {
						["profiles"] = {
							["Default"] = {
								[284656] = 1032951,
								[282030] = 1032951,
							},
						},
					},
				},
				["wipe80"] = true,
				["profileKeys"] = {
					[E.mynameRealm] = key,
				},
				["profiles"] = {
					["Default"] = {
					},
					[key] = {
						["flash"] = false,
					},
				},
			}

		end
	end

	BigWigs.db:SetProfile(key)
end
