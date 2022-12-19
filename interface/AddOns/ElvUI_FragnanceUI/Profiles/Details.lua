local FUI, E, L, V, P, G = unpack(select(2, ...))

local twipe = table.wipe

-- Details profile setup
function FUI:GetDetailsProfile(res)

	local key = "Fragnance Details"

	if _detalhes_global then twipe(_detalhes_global) end

	if res == '1440p' then

		_detalhes_global = {
			["npcid_pool"] = {
			},
			["death_recap"] = {
				["enabled"] = true,
				["show_segments"] = false,
				["show_life_percent"] = false,
				["relevance_time"] = 7,
			},
			["spell_pool"] = {
				[269279] = 11,
				[186401] = 11,
				[292361] = 11,
				[783] = 11,
				[282559] = 11,
				[72968] = 11,
				[24858] = 11,
				[56488] = 1,
				[2479] = 11,
				[328136] = 11,
			},
			["encounter_spell_pool"] = {
			},
			["immersion_pets_on_solo_play"] = false,
			["npcid_ignored"] = {
			},
			["report_where"] = "GUILD",
			["auto_open_news_window"] = false,
			["got_first_run"] = true,
			["report_pos"] = {
				-254.0009155273438, -- [1]
				104.001708984375, -- [2]
			},
			["latest_report_table"] = {
			},
			["exp90temp"] = {
				["delete_damage_TCOB"] = true,
			},
			["always_use_profile"] = true,
			["immersion_special_units"] = true,
			["boss_mods_timers"] = {
				["encounter_timers_bw"] = {
				},
				["encounter_timers_dbm"] = {
				},
			},
			["spell_school_cache"] = {
			},
			["deathlog_healingdone_min"] = 10000,
			["__profiles"] = {
				[key] = {
					["show_arena_role_icon"] = false,
					["capture_real"] = {
						["heal"] = true,
						["spellcast"] = true,
						["miscdata"] = true,
						["aura"] = true,
						["energy"] = true,
						["damage"] = true,
					},
					["row_fade_in"] = {
						"in", -- [1]
						0.2, -- [2]
					},
					["streamer_config"] = {
						["faster_updates"] = false,
						["quick_detection"] = false,
						["reset_spec_cache"] = false,
						["no_alerts"] = false,
						["disable_mythic_dungeon"] = false,
						["use_animation_accel"] = true,
					},
					["all_players_are_group"] = false,
					["use_row_animations"] = true,
					["report_heal_links"] = false,
					["remove_realm_from_name"] = true,
					["minimum_overall_combat_time"] = 10,
					["event_tracker"] = {
						["enabled"] = false,
						["font_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["line_height"] = 16,
						["line_color"] = {
							0.1, -- [1]
							0.1, -- [2]
							0.1, -- [3]
							0.3, -- [4]
						},
						["font_shadow"] = "NONE",
						["font_size"] = 10,
						["font_face"] = "Friz Quadrata TT",
						["frame"] = {
							["show_title"] = true,
							["strata"] = "LOW",
							["backdrop_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								0.2, -- [4]
							},
							["locked"] = false,
							["height"] = 300,
							["width"] = 250,
						},
						["line_texture"] = "Details Serenity",
						["options_frame"] = {
						},
					},
					["report_to_who"] = "Scrype",
					["class_specs_coords"] = {
						[62] = {
							0.251953125, -- [1]
							0.375, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[63] = {
							0.375, -- [1]
							0.5, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[250] = {
							0, -- [1]
							0.125, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[251] = {
							0.125, -- [1]
							0.25, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[252] = {
							0.25, -- [1]
							0.375, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[253] = {
							0.875, -- [1]
							1, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[254] = {
							0, -- [1]
							0.125, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[255] = {
							0.125, -- [1]
							0.25, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[66] = {
							0.125, -- [1]
							0.25, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[257] = {
							0.5, -- [1]
							0.625, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[258] = {
							0.6328125, -- [1]
							0.75, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[259] = {
							0.75, -- [1]
							0.875, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[260] = {
							0.875, -- [1]
							1, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[577] = {
							0.25, -- [1]
							0.375, -- [2]
							0.5, -- [3]
							0.625, -- [4]
						},
						[262] = {
							0.125, -- [1]
							0.25, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[581] = {
							0.375, -- [1]
							0.5, -- [2]
							0.5, -- [3]
							0.625, -- [4]
						},
						[264] = {
							0.375, -- [1]
							0.5, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[265] = {
							0.5, -- [1]
							0.625, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[266] = {
							0.625, -- [1]
							0.75, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[267] = {
							0.75, -- [1]
							0.875, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[268] = {
							0.625, -- [1]
							0.75, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[269] = {
							0.875, -- [1]
							1, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[270] = {
							0.75, -- [1]
							0.875, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[70] = {
							0.251953125, -- [1]
							0.375, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[102] = {
							0.375, -- [1]
							0.5, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[71] = {
							0.875, -- [1]
							1, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[103] = {
							0.5, -- [1]
							0.625, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[72] = {
							0, -- [1]
							0.125, -- [2]
							0.5, -- [3]
							0.625, -- [4]
						},
						[104] = {
							0.625, -- [1]
							0.75, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[73] = {
							0.125, -- [1]
							0.25, -- [2]
							0.5, -- [3]
							0.625, -- [4]
						},
						[64] = {
							0.5, -- [1]
							0.625, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[105] = {
							0.75, -- [1]
							0.875, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[65] = {
							0, -- [1]
							0.125, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[256] = {
							0.375, -- [1]
							0.5, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[261] = {
							0, -- [1]
							0.125, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[263] = {
							0.25, -- [1]
							0.375, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
					},
					["profile_save_pos"] = true,
					["tooltip"] = {
						["header_statusbar"] = {
							0.3, -- [1]
							0.3, -- [2]
							0.3, -- [3]
							0.8, -- [4]
							false, -- [5]
							false, -- [6]
							"WorldState Score", -- [7]
						},
						["fontcolor_right"] = {
							1, -- [1]
							0.7, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["line_height"] = 17,
						["tooltip_max_targets"] = 2,
						["icon_size"] = {
							["W"] = 17,
							["H"] = 17,
						},
						["tooltip_max_pets"] = 2,
						["anchor_relative"] = "top",
						["abbreviation"] = 2,
						["anchored_to"] = 1,
						["show_amount"] = false,
						["header_text_color"] = {
							1, -- [1]
							0.9176, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["fontsize"] = 13,
						["background"] = {
							0.196078431372549, -- [1]
							0.196078431372549, -- [2]
							0.196078431372549, -- [3]
							0.8, -- [4]
						},
						["submenu_wallpaper"] = true,
						["fontsize_title"] = 10,
						["icon_border_texcoord"] = {
							["B"] = 0.921875,
							["L"] = 0.078125,
							["T"] = 0.078125,
							["R"] = 0.921875,
						},
						["commands"] = {
						},
						["tooltip_max_abilities"] = 6,
						["fontface"] = "Friz Quadrata TT",
						["border_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							0, -- [4]
						},
						["border_texture"] = "Blizzard Tooltip",
						["anchor_offset"] = {
							0, -- [1]
							0, -- [2]
						},
						["fontshadow"] = true,
						["menus_bg_texture"] = "Interface\\SPELLBOOK\\Spellbook-Page-1",
						["border_size"] = 16,
						["maximize_method"] = 1,
						["anchor_screen_pos"] = {
							507.7, -- [1]
							-350.5, -- [2]
						},
						["anchor_point"] = "bottom",
						["menus_bg_coords"] = {
							0.309777336120606, -- [1]
							0.924000015258789, -- [2]
							0.213000011444092, -- [3]
							0.279000015258789, -- [4]
						},
						["fontcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["menus_bg_color"] = {
							0.8, -- [1]
							0.8, -- [2]
							0.8, -- [3]
							0.2, -- [4]
						},
					},
					["ps_abbreviation"] = 3,
					["world_combat_is_trash"] = false,
					["update_speed"] = 0.05000000074505806,
					["bookmark_text_size"] = 11,
					["animation_speed_mintravel"] = 0.45,
					["track_item_level"] = true,
					["windows_fade_in"] = {
						"in", -- [1]
						0.2, -- [2]
					},
					["instances_menu_click_to_open"] = false,
					["overall_clear_newchallenge"] = true,
					["current_dps_meter"] = {
						["enabled"] = false,
						["font_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["arena_enabled"] = true,
						["font_shadow"] = "NONE",
						["font_size"] = 18,
						["mythic_dungeon_enabled"] = true,
						["sample_size"] = 5,
						["font_face"] = "Friz Quadrata TT",
						["frame"] = {
							["show_title"] = false,
							["strata"] = "LOW",
							["backdrop_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								0.2, -- [4]
							},
							["locked"] = false,
							["height"] = 65,
							["width"] = 220,
						},
						["update_interval"] = 0.1,
						["options_frame"] = {
						},
					},
					["data_cleanup_logout"] = false,
					["instances_disable_bar_highlight"] = false,
					["trash_concatenate"] = false,
					["color_by_arena_team"] = true,
					["animation_speed"] = 33,
					["disable_stretch_from_toolbar"] = false,
					["disable_lock_ungroup_buttons"] = false,
					["memory_ram"] = 64,
					["disable_window_groups"] = false,
					["instances_suppress_trash"] = 0,
					["options_window"] = {
						["scale"] = 1,
					},
					["animation_speed_maxtravel"] = 3,
					["instances"] = {
						{
							["__pos"] = {
								["normal"] = {
									["y"] = -600.1647177200897,
									["x"] = 898.9998424914966,
									["w"] = 246.6020812988281,
									["h"] = 232.6898345947266,
								},
								["solo"] = {
									["y"] = 2,
									["x"] = 1,
									["w"] = 300,
									["h"] = 200,
								},
							},
							["hide_in_combat_type"] = 1,
							["clickthrough_window"] = false,
							["menu_anchor"] = {
								12, -- [1]
								0, -- [2]
								["side"] = 2,
							},
							["bg_r"] = 0.06274509803921569,
							["hide_out_of_combat"] = false,
							["color_buttons"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
							["micro_displays_locked"] = true,
							["fontstrings_width"] = 35,
							["tooltip"] = {
								["n_abilities"] = 3,
								["n_enemies"] = 3,
							},
							["switch_all_roles_in_combat"] = false,
							["clickthrough_toolbaricons"] = false,
							["row_info"] = {
								["textR_outline"] = false,
								["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
								["textL_outline"] = false,
								["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
								["textR_show_data"] = {
									true, -- [1]
									true, -- [2]
									true, -- [3]
								},
								["textL_enable_custom_text"] = true,
								["fixed_text_color"] = {
									0.956862745098039, -- [1]
									0.980392156862745, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["space"] = {
									["right"] = 0,
									["left"] = 0,
									["between"] = -1,
								},
								["texture_background_class_color"] = false,
								["textL_outline_small_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["font_face_file"] = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\Expressway.ttf",
								["textL_custom_text"] = "{data3}{data2}",
								["models"] = {
									["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
									["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
									["upper_alpha"] = 0.501719892024994,
									["lower_enabled"] = false,
									["lower_alpha"] = 0.1,
									["upper_enabled"] = false,
								},
								["textL_translit_text"] = false,
								["texture_custom_file"] = "Interface\\",
								["texture_file"] = "Interface\\Addons\\ElvUI_FragnanceUI\\Media\\Statusbar\\Atrocity.tga",
								["height"] = 30,
								["font_size"] = 13,
								["icon_file"] = "Interface\\AddOns\\Details\\images\\classes",
								["icon_grayscale"] = false,
								["backdrop"] = {
									["enabled"] = true,
									["size"] = 1,
									["color"] = {
										0, -- [1]
										0, -- [2]
										0, -- [3]
										0, -- [4]
									},
									["texture"] = "ElvUI GlowBorder",
								},
								["textR_bracket"] = "[",
								["textR_enable_custom_text"] = true,
								["fixed_texture_background_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									0.188838005065918, -- [4]
								},
								["fixed_texture_color"] = {
									0.06274509803921569, -- [1]
									0.06274509803921569, -- [2]
									0.06274509803921569, -- [3]
									0.6831168532371521, -- [4]
								},
								["textL_show_number"] = false,
								["percent_type"] = 1,
								["textL_outline_small"] = true,
								["textR_custom_text"] = "{data1} ({data2}, {data3})",
								["texture"] = "Atrocity",
								["texture_custom"] = "",
								["texture_background_file"] = "Interface\\Addons\\ElvUI_FragnanceUI\\Media\\Statusbar\\Atrocity.tga",
								["textL_class_colors"] = false,
								["alpha"] = 0.6831168532371521,
								["textR_class_colors"] = false,
								["texture_background"] = "Atrocity",
								["textR_outline_small_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["no_icon"] = false,
								["icon_offset"] = {
									0, -- [1]
									0, -- [2]
								},
								["textR_outline_small"] = true,
								["font_face"] = "Expressway",
								["texture_class_colors"] = false,
								["start_after_icon"] = true,
								["fast_ps_update"] = false,
								["textR_separator"] = "NONE",
								["use_spec_icons"] = true,
							},
							["ignore_mass_showhide"] = false,
							["plugins_grow_direction"] = 1,
							["menu_icons"] = {
								true, -- [1]
								true, -- [2]
								true, -- [3]
								true, -- [4]
								true, -- [5]
								false, -- [6]
								["space"] = 1,
								["shadow"] = false,
							},
							["desaturated_menu"] = false,
							["micro_displays_side"] = 1,
							["window_scale"] = 1.029999971389771,
							["hide_icon"] = true,
							["toolbar_side"] = 1,
							["bg_g"] = 0.06274509803921569,
							["menu_icons_alpha"] = 0.5,
							["bg_b"] = 0.06274509803921569,
							["switch_healer_in_combat"] = false,
							["color"] = {
								0.06274509803921569, -- [1]
								0.06274509803921569, -- [2]
								0.06274509803921569, -- [3]
								0.8500000089406967, -- [4]
							},
							["hide_on_context"] = {
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [1]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [2]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [3]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [4]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [5]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [6]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [7]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [8]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [9]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [10]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [11]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [12]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [13]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [14]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [15]
							},
							["skin"] = "Serenity",
							["following"] = {
								["enabled"] = true,
								["bar_color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
								["text_color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
							},
							["switch_healer"] = false,
							["fontstrings_text2_anchor"] = 70,
							["__snapV"] = false,
							["__snapH"] = true,
							["StatusBarSaved"] = {
								["center"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
								["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
								["options"] = {
									["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
										["segmentType"] = 2,
										["textFace"] = "Expressway",
										["textYMod"] = 1,
										["timeType"] = 1,
										["textAlign"] = 3,
										["textSize"] = 13,
										["textColor"] = {
											1, -- [1]
											1, -- [2]
											1, -- [3]
											1, -- [4]
										},
									},
									["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
										["segmentType"] = 2,
										["textFace"] = "Expressway",
										["textYMod"] = 1,
										["timeType"] = 1,
										["textAlign"] = 1,
										["textSize"] = 13,
										["textColor"] = {
											1, -- [1]
											1, -- [2]
											1, -- [3]
											1, -- [4]
										},
									},
									["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
										["segmentType"] = 2,
										["textFace"] = "Expressway",
										["textYMod"] = 1,
										["timeType"] = 1,
										["textAlign"] = 2,
										["textSize"] = 13,
										["textColor"] = {
											1, -- [1]
											1, -- [2]
											1, -- [3]
											1, -- [4]
										},
									},
								},
								["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
							},
							["grab_on_top"] = false,
							["__was_opened"] = true,
							["instance_button_anchor"] = {
								-27, -- [1]
								1, -- [2]
							},
							["version"] = 3,
							["fontstrings_text4_anchor"] = 0,
							["__locked"] = true,
							["menu_alpha"] = {
								["enabled"] = false,
								["onenter"] = 1,
								["iconstoo"] = true,
								["ignorebars"] = false,
								["onleave"] = 1,
							},
							["switch_damager"] = false,
							["row_show_animation"] = {
								["anim"] = "Fade",
								["options"] = {
								},
							},
							["bars_inverted"] = false,
							["strata"] = "LOW",
							["clickthrough_incombatonly"] = true,
							["__snap"] = {
								[3] = 2,
							},
							["stretch_button_side"] = 2,
							["hide_in_combat_alpha"] = 0,
							["bars_sort_direction"] = 1,
							["show_statusbar"] = false,
							["libwindow"] = {
								["y"] = 2.188391706262538e-05,
								["x"] = -254.000054287957,
								["point"] = "BOTTOMRIGHT",
								["scale"] = 1.029999971389771,
							},
							["statusbar_info"] = {
								["alpha"] = 0.8500000089406967,
								["overlay"] = {
									0.06274509803921569, -- [1]
									0.06274509803921569, -- [2]
									0.06274509803921569, -- [3]
								},
							},
							["backdrop_texture"] = "Details Ground",
							["bars_grow_direction"] = 1,
							["bg_alpha"] = 0,
							["switch_tank_in_combat"] = false,
							["switch_tank"] = false,
							["switch_damager_in_combat"] = false,
							["icon_desaturated"] = false,
							["menu_anchor_down"] = {
								15, -- [1]
								-3, -- [2]
							},
							["auto_current"] = true,
							["clickthrough_rows"] = false,
							["attribute_text"] = {
								["show_timer"] = true,
								["shadow"] = false,
								["side"] = 2,
								["text_color"] = {
									0.976470588235294, -- [1]
									1, -- [2]
									0.988235294117647, -- [3]
									1, -- [4]
								},
								["custom_text"] = "{name}",
								["text_face"] = "Expressway",
								["anchor"] = {
									-20, -- [1]
									1, -- [2]
								},
								["enabled"] = false,
								["enable_custom_text"] = false,
								["text_size"] = 12,
							},
							["auto_hide_menu"] = {
								["left"] = true,
								["right"] = false,
							},
							["hide_in_combat"] = false,
							["posicao"] = {
								["normal"] = {
									["y"] = -600.1647177200897,
									["x"] = 898.9998424914966,
									["w"] = 246.6020812988281,
									["h"] = 232.6898345947266,
								},
								["solo"] = {
									["y"] = 2,
									["x"] = 1,
									["w"] = 300,
									["h"] = 200,
								},
							},
							["switch_all_roles_after_wipe"] = false,
							["skin_custom"] = "",
							["wallpaper"] = {
								["enabled"] = false,
								["width"] = 266.000061035156,
								["texcoord"] = {
									0.0480000019073486, -- [1]
									0.298000011444092, -- [2]
									0.630999984741211, -- [3]
									0.755999984741211, -- [4]
								},
								["overlay"] = {
									0.999997794628143, -- [1]
									0.999997794628143, -- [2]
									0.999997794628143, -- [3]
									0.266666084527969, -- [4]
								},
								["anchor"] = "all",
								["height"] = 225.999984741211,
								["alpha"] = 0.266666680574417,
								["texture"] = "Interface\\AddOns\\Details\\images\\skins\\elvui",
							},
							["total_bar"] = {
								["enabled"] = false,
								["only_in_group"] = true,
								["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
								["color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
							},
							["show_sidebars"] = false,
							["fontstrings_text3_anchor"] = 35,
							["use_multi_fontstrings"] = false,
							["menu_icons_size"] = 0.9099999666213989,
						}, -- [1]
						{
							["__pos"] = {
								["normal"] = {
									["y"] = -600.1647177200897,
									["x"] = 1152.999690378188,
									["w"] = 246.6020812988281,
									["h"] = 232.6898345947266,
								},
								["solo"] = {
									["y"] = 2,
									["x"] = 1,
									["w"] = 300,
									["h"] = 200,
								},
							},
							["hide_in_combat_type"] = 1,
							["clickthrough_window"] = false,
							["menu_anchor"] = {
								11.66122436523438, -- [1]
								0, -- [2]
								["side"] = 2,
							},
							["bg_r"] = 0.06274509803921569,
							["hide_out_of_combat"] = false,
							["color_buttons"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
							["micro_displays_locked"] = true,
							["fontstrings_width"] = 35,
							["tooltip"] = {
								["n_abilities"] = 3,
								["n_enemies"] = 3,
							},
							["switch_all_roles_in_combat"] = false,
							["clickthrough_toolbaricons"] = false,
							["row_info"] = {
								["textR_outline"] = false,
								["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
								["textL_outline"] = false,
								["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
								["textR_show_data"] = {
									true, -- [1]
									true, -- [2]
									true, -- [3]
								},
								["textL_enable_custom_text"] = true,
								["fixed_text_color"] = {
									0.956862745098039, -- [1]
									0.980392156862745, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["space"] = {
									["right"] = 0,
									["left"] = 0,
									["between"] = -1,
								},
								["texture_background_class_color"] = false,
								["textL_outline_small_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["font_face_file"] = "Interface\\AddOns\\ElvUI\\Media\\Fonts\\Expressway.ttf",
								["textL_custom_text"] = "{data3}{data2}",
								["models"] = {
									["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
									["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
									["upper_alpha"] = 0.501719892024994,
									["lower_enabled"] = false,
									["lower_alpha"] = 0.1,
									["upper_enabled"] = false,
								},
								["textL_translit_text"] = false,
								["texture_custom_file"] = "Interface\\",
								["texture_file"] = "Interface\\Addons\\ElvUI_FragnanceUI\\Media\\Statusbar\\Atrocity.tga",
								["height"] = 30,
								["font_size"] = 13,
								["icon_file"] = "Interface\\AddOns\\Details\\images\\classes",
								["icon_grayscale"] = false,
								["backdrop"] = {
									["enabled"] = true,
									["size"] = 1,
									["color"] = {
										0, -- [1]
										0, -- [2]
										0, -- [3]
										0, -- [4]
									},
									["texture"] = "ElvUI GlowBorder",
								},
								["textR_bracket"] = "[",
								["textR_enable_custom_text"] = true,
								["fixed_texture_background_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									0.188838005065918, -- [4]
								},
								["fixed_texture_color"] = {
									0.06274509803921569, -- [1]
									0.06274509803921569, -- [2]
									0.06274509803921569, -- [3]
									0.6831168532371521, -- [4]
								},
								["textL_show_number"] = false,
								["percent_type"] = 1,
								["textL_outline_small"] = true,
								["textR_custom_text"] = "{data1} ({data2}, {data3})",
								["texture"] = "Atrocity",
								["texture_custom"] = "",
								["texture_background_file"] = "Interface\\Addons\\ElvUI_FragnanceUI\\Media\\Statusbar\\Atrocity.tga",
								["textL_class_colors"] = false,
								["alpha"] = 0.6831168532371521,
								["textR_class_colors"] = false,
								["texture_background"] = "Atrocity",
								["textR_outline_small_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["no_icon"] = false,
								["icon_offset"] = {
									0, -- [1]
									0, -- [2]
								},
								["textR_outline_small"] = true,
								["font_face"] = "Expressway",
								["texture_class_colors"] = false,
								["start_after_icon"] = true,
								["fast_ps_update"] = false,
								["textR_separator"] = "NONE",
								["use_spec_icons"] = true,
							},
							["ignore_mass_showhide"] = false,
							["plugins_grow_direction"] = 1,
							["menu_icons"] = {
								true, -- [1]
								true, -- [2]
								true, -- [3]
								true, -- [4]
								true, -- [5]
								false, -- [6]
								["space"] = 1,
								["shadow"] = false,
							},
							["desaturated_menu"] = false,
							["micro_displays_side"] = 1,
							["window_scale"] = 1.029999971389771,
							["hide_icon"] = true,
							["toolbar_side"] = 1,
							["bg_g"] = 0.06274509803921569,
							["menu_icons_alpha"] = 0.5,
							["bg_b"] = 0.06274509803921569,
							["switch_healer_in_combat"] = false,
							["color"] = {
								0.06274509803921569, -- [1]
								0.06274509803921569, -- [2]
								0.06274509803921569, -- [3]
								0.8500000089406967, -- [4]
							},
							["hide_on_context"] = {
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [1]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [2]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [3]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [4]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [5]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [6]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [7]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [8]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [9]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [10]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [11]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [12]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [13]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [14]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [15]
							},
							["skin"] = "Serenity",
							["following"] = {
								["enabled"] = true,
								["bar_color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
								["text_color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
							},
							["switch_healer"] = false,
							["fontstrings_text2_anchor"] = 70,
							["__snapV"] = false,
							["__snapH"] = true,
							["StatusBarSaved"] = {
								["center"] = "DETAILS_STATUSBAR_PLUGIN_PATTRIBUTE",
								["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
								["options"] = {
									["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
										["isHidden"] = true,
										["textYMod"] = 0,
										["textXMod"] = 0,
										["textFace"] = "Expressway",
										["textAlign"] = 3,
										["textStyle"] = 2,
										["textSize"] = 12.47707176208496,
										["textColor"] = {
											1, -- [1]
											1, -- [2]
											1, -- [3]
										},
									},
									["DETAILS_STATUSBAR_PLUGIN_PATTRIBUTE"] = {
										["isHidden"] = false,
										["textStyle"] = 2,
										["textYMod"] = -1,
										["textXMod"] = 6,
										["textFace"] = "Expressway",
										["timeType"] = 1,
										["textAlign"] = 2,
										["textSize"] = 12.47707176208496,
										["textColor"] = {
											1, -- [1]
											1, -- [2]
											1, -- [3]
										},
									},
									["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
										["isHidden"] = true,
										["timeType"] = 1,
										["textYMod"] = 0,
										["segmentType"] = 2,
										["textFace"] = "Expressway",
										["textStyle"] = 2,
										["textXMod"] = 6,
										["textAlign"] = 1,
										["textSize"] = 12.47707176208496,
										["textColor"] = {
											1, -- [1]
											1, -- [2]
											1, -- [3]
										},
									},
								},
								["left"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
							},
							["grab_on_top"] = false,
							["__was_opened"] = true,
							["instance_button_anchor"] = {
								-27, -- [1]
								1, -- [2]
							},
							["version"] = 3,
							["fontstrings_text4_anchor"] = 0,
							["__locked"] = true,
							["menu_alpha"] = {
								["enabled"] = false,
								["onenter"] = 1,
								["iconstoo"] = true,
								["ignorebars"] = false,
								["onleave"] = 1,
							},
							["switch_damager"] = false,
							["row_show_animation"] = {
								["anim"] = "Fade",
								["options"] = {
								},
							},
							["bars_inverted"] = false,
							["strata"] = "LOW",
							["clickthrough_incombatonly"] = true,
							["__snap"] = {
								1, -- [1]
							},
							["stretch_button_side"] = 2,
							["hide_in_combat_alpha"] = 0,
							["bars_sort_direction"] = 1,
							["show_statusbar"] = false,
							["libwindow"] = {
								["y"] = 2.188391706262538e-05,
								["x"] = 5.096138920634985e-05,
								["point"] = "BOTTOMRIGHT",
								["scale"] = 1.029999971389771,
							},
							["statusbar_info"] = {
								["alpha"] = 0.8500000089406967,
								["overlay"] = {
									0.06274509803921569, -- [1]
									0.06274509803921569, -- [2]
									0.06274509803921569, -- [3]
								},
							},
							["backdrop_texture"] = "Details Ground",
							["bars_grow_direction"] = 1,
							["bg_alpha"] = 0,
							["switch_tank_in_combat"] = false,
							["switch_tank"] = false,
							["switch_damager_in_combat"] = false,
							["icon_desaturated"] = false,
							["menu_anchor_down"] = {
								15, -- [1]
								-3, -- [2]
							},
							["auto_current"] = true,
							["clickthrough_rows"] = false,
							["attribute_text"] = {
								["show_timer"] = true,
								["shadow"] = false,
								["side"] = 2,
								["text_color"] = {
									0.976470588235294, -- [1]
									1, -- [2]
									0.988235294117647, -- [3]
									1, -- [4]
								},
								["custom_text"] = "{name}",
								["text_face"] = "Expressway",
								["anchor"] = {
									-20, -- [1]
									1, -- [2]
								},
								["enabled"] = false,
								["enable_custom_text"] = false,
								["text_size"] = 12,
							},
							["auto_hide_menu"] = {
								["left"] = true,
								["right"] = false,
							},
							["hide_in_combat"] = false,
							["posicao"] = {
								["normal"] = {
									["y"] = -600.1647177200897,
									["x"] = 1152.999690378188,
									["w"] = 246.6020812988281,
									["h"] = 232.6898345947266,
								},
								["solo"] = {
									["y"] = 2,
									["x"] = 1,
									["w"] = 300,
									["h"] = 200,
								},
							},
							["switch_all_roles_after_wipe"] = false,
							["skin_custom"] = "",
							["wallpaper"] = {
								["enabled"] = false,
								["width"] = 266.000061035156,
								["texcoord"] = {
									0.0480000019073486, -- [1]
									0.298000011444092, -- [2]
									0.630999984741211, -- [3]
									0.755999984741211, -- [4]
								},
								["overlay"] = {
									0.999997794628143, -- [1]
									0.999997794628143, -- [2]
									0.999997794628143, -- [3]
									0.266666084527969, -- [4]
								},
								["anchor"] = "all",
								["height"] = 225.999984741211,
								["alpha"] = 0.266666680574417,
								["texture"] = "Interface\\AddOns\\Details\\images\\skins\\elvui",
							},
							["total_bar"] = {
								["enabled"] = false,
								["only_in_group"] = true,
								["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
								["color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
							},
							["show_sidebars"] = false,
							["fontstrings_text3_anchor"] = 35,
							["use_multi_fontstrings"] = false,
							["menu_icons_size"] = 0.9099999666213989,
						}, -- [2]
					},
					["hotcorner_topleft"] = {
						["hide"] = false,
					},
					["font_faces"] = {
						["menus"] = "Expressway",
					},
					["deadlog_limit"] = 16,
					["instances_segments_locked"] = false,
					["instances_no_libwindow"] = false,
					["segments_amount"] = 18,
					["report_lines"] = 3,
					["data_broker_text"] = "",
					["clear_ungrouped"] = true,
					["skin"] = "WoW Interface",
					["override_spellids"] = true,
					["font_sizes"] = {
						["menus"] = 11,
					},
					["total_abbreviation"] = 2,
					["report_schema"] = 1,
					["animation_speed_triggertravel"] = 5,
					["minimum_combat_time"] = 5,
					["use_battleground_server_parser"] = false,
					["cloud_capture"] = true,
					["damage_taken_everything"] = false,
					["scroll_speed"] = 2,
					["new_window_size"] = {
						["height"] = 130,
						["width"] = 320,
					},
					["chat_tab_embed"] = {
						["enabled"] = false,
						["y_offset"] = 0,
						["x_offset"] = 0,
						["single_window"] = false,
						["w2_pos"] = {
							["point"] = "BOTTOMRIGHT",
							["scale"] = 1.029999971389771,
							["y_legacy"] = -615.1645870265571,
							["w"] = 208.7378997802734,
							["y"] = 0.0001531874475417631,
							["h"] = 203.5636138916016,
							["x_legacy"] = 1170.181527880878,
							["x"] = -2.318203368748073,
							["pos_table"] = true,
						},
						["tab_name"] = "",
						["w1_pos"] = {
							["point"] = "BOTTOMRIGHT",
							["scale"] = 1.029999971389771,
							["y_legacy"] = -615.1647441920765,
							["w"] = 208.7382354736328,
							["y"] = 0,
							["h"] = 203.5636138916016,
							["x_legacy"] = 956.1854596924068,
							["x"] = -216.3142765261582,
							["pos_table"] = true,
						},
					},
					["deadlog_events"] = 32,
					["use_scroll"] = false,
					["close_shields"] = false,
					["class_coords"] = {
						["HUNTER"] = {
							0, -- [1]
							0.25, -- [2]
							0.25, -- [3]
							0.5, -- [4]
						},
						["WARRIOR"] = {
							0, -- [1]
							0.25, -- [2]
							0, -- [3]
							0.25, -- [4]
						},
						["SHAMAN"] = {
							0.25, -- [1]
							0.49609375, -- [2]
							0.25, -- [3]
							0.5, -- [4]
						},
						["MAGE"] = {
							0.25, -- [1]
							0.49609375, -- [2]
							0, -- [3]
							0.25, -- [4]
						},
						["PET"] = {
							0.25, -- [1]
							0.49609375, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["DRUID"] = {
							0.7421875, -- [1]
							0.98828125, -- [2]
							0, -- [3]
							0.25, -- [4]
						},
						["MONK"] = {
							0.5, -- [1]
							0.73828125, -- [2]
							0.5, -- [3]
							0.75, -- [4]
						},
						["DEATHKNIGHT"] = {
							0.25, -- [1]
							0.5, -- [2]
							0.5, -- [3]
							0.75, -- [4]
						},
						["MONSTER"] = {
							0, -- [1]
							0.25, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["UNKNOW"] = {
							0.5, -- [1]
							0.75, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["PRIEST"] = {
							0.49609375, -- [1]
							0.7421875, -- [2]
							0.25, -- [3]
							0.5, -- [4]
						},
						["ROGUE"] = {
							0.49609375, -- [1]
							0.7421875, -- [2]
							0, -- [3]
							0.25, -- [4]
						},
						["Alliance"] = {
							0.49609375, -- [1]
							0.7421875, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["WARLOCK"] = {
							0.7421875, -- [1]
							0.98828125, -- [2]
							0.25, -- [3]
							0.5, -- [4]
						},
						["DEMONHUNTER"] = {
							0.73828126, -- [1]
							1, -- [2]
							0.5, -- [3]
							0.75, -- [4]
						},
						["Horde"] = {
							0.7421875, -- [1]
							0.98828125, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["PALADIN"] = {
							0, -- [1]
							0.25, -- [2]
							0.5, -- [3]
							0.75, -- [4]
						},
						["UNGROUPPLAYER"] = {
							0.5, -- [1]
							0.75, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["ENEMY"] = {
							0, -- [1]
							0.25, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
					},
					["overall_clear_logout"] = false,
					["disable_alldisplays_window"] = false,
					["trash_auto_remove"] = true,
					["window_clamp"] = {
						-8, -- [1]
						0, -- [2]
						21, -- [3]
						-14, -- [4]
					},
					["windows_fade_out"] = {
						"out", -- [1]
						0.2, -- [2]
					},
					["numerical_system_symbols"] = "auto",
					["clear_graphic"] = true,
					["class_colors"] = {
						["HUNTER"] = {
							0.67, -- [1]
							0.83, -- [2]
							0.45, -- [3]
						},
						["WARRIOR"] = {
							0.78, -- [1]
							0.61, -- [2]
							0.43, -- [3]
						},
						["PALADIN"] = {
							0.96, -- [1]
							0.55, -- [2]
							0.73, -- [3]
						},
						["MAGE"] = {
							0.41, -- [1]
							0.8, -- [2]
							0.94, -- [3]
						},
						["ARENA_YELLOW"] = {
							0.9, -- [1]
							0.9, -- [2]
							0, -- [3]
						},
						["UNGROUPPLAYER"] = {
							0.4, -- [1]
							0.4, -- [2]
							0.4, -- [3]
						},
						["DRUID"] = {
							1, -- [1]
							0.49, -- [2]
							0.04, -- [3]
						},
						["MONK"] = {
							0, -- [1]
							1, -- [2]
							0.59, -- [3]
						},
						["DEATHKNIGHT"] = {
							0.77, -- [1]
							0.12, -- [2]
							0.23, -- [3]
						},
						["WARLOCK"] = {
							0.58, -- [1]
							0.51, -- [2]
							0.79, -- [3]
						},
						["UNKNOW"] = {
							0.2, -- [1]
							0.2, -- [2]
							0.2, -- [3]
						},
						["PRIEST"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["ROGUE"] = {
							1, -- [1]
							0.96, -- [2]
							0.41, -- [3]
						},
						["ARENA_GREEN"] = {
							0.1, -- [1]
							0.85, -- [2]
							0.1, -- [3]
						},
						["ENEMY"] = {
							0.94117, -- [1]
							0, -- [2]
							0.0196, -- [3]
							1, -- [4]
						},
						["DEMONHUNTER"] = {
							0.64, -- [1]
							0.19, -- [2]
							0.79, -- [3]
						},
						["version"] = 1,
						["NEUTRAL"] = {
							1, -- [1]
							1, -- [2]
							0, -- [3]
						},
						["SHAMAN"] = {
							0, -- [1]
							0.44, -- [2]
							0.87, -- [3]
						},
						["PET"] = {
							0.3, -- [1]
							0.4, -- [2]
							0.5, -- [3]
						},
					},
					["segments_auto_erase"] = 1,
					["options_group_edit"] = true,
					["broadcaster_enabled"] = false,
					["minimap"] = {
						["onclick_what_todo"] = 1,
						["radius"] = 160,
						["text_type"] = 1,
						["minimapPos"] = 85.2364513807249,
						["text_format"] = 3,
						["hide"] = true,
					},
					["instances_amount"] = 5,
					["max_window_size"] = {
						["height"] = 450,
						["width"] = 480,
					},
					["deny_score_messages"] = false,
					["only_pvp_frags"] = false,
					["disable_stretch_button"] = false,
					["default_bg_color"] = 0.0941,
					["standard_skin"] = {
						["show_statusbar"] = false,
						["switch_healer_in_combat"] = false,
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["menu_anchor"] = {
							17, -- [1]
							2, -- [2]
							["side"] = 2,
						},
						["bg_r"] = 0.517647058823529,
						["skin"] = "ElvUI Style II",
						["following"] = {
							["bar_color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
							},
							["enabled"] = false,
							["text_color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
							},
						},
						["color_buttons"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["switch_healer"] = false,
						["micro_displays_locked"] = true,
						["bg_b"] = 0.517647058823529,
						["bg_alpha"] = 1,
						["version"] = 3,
						["tooltip"] = {
							["n_abilities"] = 3,
							["n_enemies"] = 3,
						},
						["backdrop_texture"] = "Details Ground",
						["total_bar"] = {
							["enabled"] = false,
							["only_in_group"] = true,
							["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
							["color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
							},
						},
						["switch_all_roles_in_combat"] = false,
						["switch_tank_in_combat"] = false,
						["name"] = "",
						["attribute_text"] = {
							["enabled"] = true,
							["shadow"] = true,
							["side"] = 1,
							["text_color"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								0.7, -- [4]
							},
							["custom_text"] = "{name}",
							["text_face"] = "ElvUI Font",
							["anchor"] = {
								-19, -- [1]
								5, -- [2]
							},
							["show_timer"] = {
								true, -- [1]
								true, -- [2]
								true, -- [3]
							},
							["enable_custom_text"] = false,
							["text_size"] = 11,
						},
						["switch_tank"] = false,
						["menu_alpha"] = {
							["enabled"] = false,
							["onleave"] = 1,
							["ignorebars"] = false,
							["iconstoo"] = true,
							["onenter"] = 1,
						},
						["statusbar_info"] = {
							["alpha"] = 1,
							["overlay"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
							},
						},
						["menu_icons_size"] = 0.850000023841858,
						["libwindow"] = {
							["y"] = 23.000072479248,
							["x"] = -5.9998779296875,
							["point"] = "BOTTOMRIGHT",
						},
						["strata"] = "LOW",
						["micro_displays_side"] = 2,
						["row_show_animation"] = {
							["anim"] = "Fade",
							["options"] = {
							},
						},
						["ignore_mass_showhide"] = false,
						["hide_in_combat_alpha"] = 0,
						["plugins_grow_direction"] = 1,
						["menu_icons"] = {
							true, -- [1]
							true, -- [2]
							true, -- [3]
							true, -- [4]
							true, -- [5]
							false, -- [6]
							["space"] = -2,
							["shadow"] = false,
						},
						["switch_damager"] = false,
						["auto_hide_menu"] = {
							["left"] = false,
							["right"] = false,
						},
						["bars_grow_direction"] = 1,
						["menu_anchor_down"] = {
							16, -- [1]
							-2, -- [2]
						},
						["instance_button_anchor"] = {
							-27, -- [1]
							1, -- [2]
						},
						["skin_custom"] = "",
						["switch_damager_in_combat"] = false,
						["grab_on_top"] = false,
						["row_info"] = {
							["textR_outline"] = false,
							["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
							["textL_outline"] = false,
							["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
							["textL_outline_small"] = true,
							["textL_enable_custom_text"] = false,
							["fixed_text_color"] = {
								0.905882352941177, -- [1]
								0.905882352941177, -- [2]
								0.905882352941177, -- [3]
								1, -- [4]
							},
							["space"] = {
								["right_noborder"] = -3,
								["between"] = 1,
								["right"] = -3,
								["left"] = 1,
								["left_noborder"] = 1,
							},
							["texture_background_class_color"] = false,
							["textL_outline_small_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["font_face_file"] = "Fonts\\FRIZQT__.TTF",
							["textL_custom_text"] = "{data1}. {data3}{data2}",
							["models"] = {
								["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
								["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
								["upper_alpha"] = 0.5,
								["lower_enabled"] = false,
								["lower_alpha"] = 0.1,
								["upper_enabled"] = false,
							},
							["height"] = 14,
							["texture_file"] = "Interface\\AddOns\\Details\\images\\bar_skyline",
							["icon_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
							["texture_custom_file"] = "Interface\\",
							["font_size"] = 10,
							["textR_bracket"] = "(",
							["texture_custom"] = "",
							["backdrop"] = {
								["enabled"] = false,
								["texture"] = "Details BarBorder 1",
								["color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["size"] = 5,
							},
							["fixed_texture_color"] = {
								0.862745098039216, -- [1]
								0.862745098039216, -- [2]
								0.862745098039216, -- [3]
								1, -- [4]
							},
							["textL_show_number"] = true,
							["texture"] = "Skyline",
							["textR_enable_custom_text"] = false,
							["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
							["fixed_texture_background_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								0.295484036207199, -- [4]
							},
							["textR_outline_small"] = true,
							["percent_type"] = 1,
							["texture_background_file"] = "Interface\\Addons\\SharedMedia\\statusbar\\BantoBar",
							["texture_background"] = "BantoBar",
							["alpha"] = 1,
							["textL_class_colors"] = false,
							["textR_outline_small_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["no_icon"] = false,
							["textR_class_colors"] = false,
							["start_after_icon"] = false,
							["font_face"] = "ElvUI Font",
							["texture_class_colors"] = true,
							["textR_show_data"] = {
								true, -- [1]
								true, -- [2]
								true, -- [3]
							},
							["fast_ps_update"] = false,
							["textR_separator"] = ",",
							["use_spec_icons"] = true,
						},
						["hide_icon"] = true,
						["auto_current"] = true,
						["toolbar_side"] = 1,
						["bg_g"] = 0.517647058823529,
						["window_scale"] = 1,
						["hide_in_combat"] = false,
						["desaturated_menu"] = false,
						["switch_all_roles_after_wipe"] = false,
						["hide_in_combat_type"] = 1,
						["wallpaper"] = {
							["overlay"] = {
								0.999997794628143, -- [1]
								0.999997794628143, -- [2]
								0.999997794628143, -- [3]
								0.799998223781586, -- [4]
							},
							["width"] = 265.999979475717,
							["texcoord"] = {
								0.0480000019073486, -- [1]
								0.298000011444092, -- [2]
								0.630999984741211, -- [3]
								0.755999984741211, -- [4]
							},
							["enabled"] = true,
							["anchor"] = "all",
							["height"] = 226.000007591173,
							["alpha"] = 0.800000071525574,
							["texture"] = "Interface\\AddOns\\Details\\images\\skins\\elvui",
						},
						["stretch_button_side"] = 1,
						["show_sidebars"] = true,
						["hide_out_of_combat"] = false,
						["bars_sort_direction"] = 1,
						["bars_inverted"] = false,
					},
					["segments_amount_to_save"] = 18,
					["segments_panic_mode"] = false,
					["overall_flag"] = 16,
					["overall_clear_newboss"] = true,
					["row_fade_out"] = {
						"out", -- [1]
						0.2, -- [2]
					},
					["player_details_window"] = {
						["scale"] = 1,
						["bar_texture"] = "Skyline",
						["skin"] = "ElvUI",
					},
					["numerical_system"] = 1,
					["pvp_as_group"] = true,
					["force_activity_time_pvp"] = true,
					["class_icons_small"] = "Interface\\AddOns\\Details\\images\\classes_small",
					["memory_threshold"] = 3,
					["disable_reset_button"] = false,
					["animate_scroll"] = false,
					["death_tooltip_width"] = 350,
					["time_type"] = 2,
					["default_bg_alpha"] = 0.5,
					["time_type_original"] = 2,
				},
			},
			["damage_scroll_auto_open"] = false,
			["tutorial"] = {
				["unlock_button"] = 4,
				["main_help_button"] = 8672,
				["SWITCH_PANEL_FIRST_OPENED"] = true,
				["ATTRIBUTE_SELECT_TUTORIAL1"] = true,
				["MEMORY_USAGE_ALERT1"] = true,
				["ENCOUNTER_BREAKDOWN_CHART"] = true,
				["feedback_window1"] = true,
				["STREAMER_FEATURES_POPUP1"] = true,
				["MIN_COMBAT_TIME"] = true,
				["WINDOW_LOCK_UNLOCK1"] = true,
				["DISABLE_ONDEATH_PANEL"] = true,
				["STREAMER_PLUGIN_FIRSTRUN"] = true,
				["ENCOUNTER_BREAKDOWN_PHASES"] = true,
				["WINDOW_GROUP_MAKING1"] = true,
				["FULL_DELETE_WINDOW"] = true,
				["ENCOUNTER_BREAKDOWN_SPELLAURAS"] = true,
				["FORGE_TUTORIAL"] = true,
				["DETAILS_INFO_TUTORIAL1"] = true,
				["alert_frames"] = {
					false, -- [1]
					false, -- [2]
					false, -- [3]
					false, -- [4]
					false, -- [5]
					false, -- [6]
				},
				["OPTIONS_PANEL_OPENED"] = true,
				["DETAILS_INFO_TUTORIAL2"] = 10,
				["OVERALLDATA_WARNING1"] = 26,
				["ctrl_click_close_tutorial"] = true,
				["version_announce"] = 0,
				["HISTORYPANEL_TUTORIAL"] = true,
				["bookmark_tutorial"] = true,
				["logons"] = 8672,
				["ENCOUNTER_DETAILS_BALLON_TUTORIAL1"] = true,
			},
			["run_code"] = {
				["on_groupchange"] = "\n-- this code runs when the player enter or leave a group",
				["on_zonechanged"] = "\n-- when the player changes zone, this code will run",
				["on_init"] = "\n-- code to run when Details! initializes, put here code which only will run once\n-- this also will run then the profile is changed\n\n--size of the death log tooltip in the Deaths display (default 350)\nDetails.death_tooltip_width = 350;\n\n--when in arena or battleground, details! silently switch to activity time (goes back to the old setting on leaving, default true)\nDetails.force_activity_time_pvp = true;\n\n--speed of the bar animations (default 33)\nDetails.animation_speed = 33;\n\n--threshold to trigger slow or fast speed (default 0.45)\nDetails.animation_speed_mintravel = 0.45;\n\n--call to update animations\nDetails:RefreshAnimationFunctions();\n\n--max window size, does require a /reload to work (default 480 x 450)\nDetails.max_window_size.width = 480;\nDetails.max_window_size.height = 450;\n\n--use the arena team color as the class color (default true)\nDetails.color_by_arena_team = true;\n\n--use the role icon in the player bar when inside an arena (default false)\nDetails.show_arena_role_icon = false;\n\n--how much time the update warning is shown (default 10)\nDetails.update_warning_timeout = 10;\n\nlocal delScript = function()   \n    print(\"cleaning\")\n    for i=0,4 do\n        for j = 1,32 do\n            local itemLink = select(7,GetContainerItemInfo(i, j))\n            if itemLink then\n                local itemSubType = select(7,GetItemInfo(itemLink))\n                local itemName = GetItemInfo(itemLink)\n                if itemSubType == \"Companion Pets\" then\n                    PickupContainerItem(i, j)\n                    DeleteCursorItem()\n                end\n                if itemName == \"Sack of Plunder\" or itemName == \"Wayfinder's Satchel\" or itemName == \"Seafarer's Coin Pouch\" then\n                    UseContainerItem(i,j)\n                end         \n            end\n        end\n    end\nend\nsetglobal( \"CleanIslandItems\", delScript )\n\nWeakAuras.me = GetUnitName(\"player\",true);\nWeakAuras.myGUID = UnitGUID(\"player\");\n\n--hooksecurefunc(\"CompactUnitFrame_UpdateName\", function(frame)\n       -- if (UnitExists(frame.unit)) then\n       --     frame.name:SetScale(1.5,1.5);\n      --  end\n--end);",
				["on_specchanged"] = "\n-- run when the player changes its spec",
				["on_leavecombat"] = "\n-- this code runs when the player leave combat",
				["on_entercombat"] = "\n-- this code runs when the player enters in combat",
			},
			["last_changelog_size"] = 1861,
			["realm_sync"] = true,
			["mythic_plus"] = {
				["make_overall_boss_only"] = false,
				["mythicrun_chart_frame"] = {
				},
				["merge_boss_trash"] = false,
				["delay_to_show_graphic"] = 5,
				["always_in_combat"] = false,
				["make_overall_when_done"] = true,
				["delete_trash_after_merge"] = true,
				["show_damage_graphic"] = true,
				["mythicrun_chart_frame_ready"] = {
				},
				["boss_dedicated_segment"] = true,
				["mythicrun_chart_frame_minimized"] = {
				},
				["last_mythicrun_chart"] = {
				},
			},
			["damage_scroll_position"] = {
			},
			["exit_errors"] = {
				"v7.3.5.5572 Interface\\AddOns\\Details\\core\\meta.lua:642: attempt to perform arithmetic on field '?' (a nil value)", -- [1]
			},
			["plugin_window_pos"] = {
				["y"] = -42.666748046875,
				["x"] = 214.83349609375,
				["point"] = "TOPLEFT",
				["scale"] = 1,
			},
			["show_totalhitdamage_on_overkill"] = false,
			["createauraframe"] = {
				["y"] = -1.52587890625e-05,
				["x"] = -0.000152587890625,
				["point"] = "CENTER",
				["scale"] = 1,
			},
			["global_plugin_database"] = {
				["DETAILS_PLUGIN_ENCOUNTER_DETAILS"] = {
					["encounter_timers_bw"] = {
					},
					["encounter_timers_dbm"] = {
					},
				},
			},
			["update_warning_timeout"] = 10,
			["savedCustomSpells"] = {
				{
					1, -- [1]
					"Melee", -- [2]
					"Interface\\ICONS\\INV_Sword_04", -- [3]
				}, -- [1]
				{
					2, -- [1]
					"Auto Shot", -- [2]
					"Interface\\ICONS\\INV_Weapon_Bow_07", -- [3]
				}, -- [2]
				{
					4, -- [1]
					"Environment (Drowning)", -- [2]
					"Interface\\ICONS\\Ability_Suffocate", -- [3]
				}, -- [3]
				{
					8, -- [1]
					"Environment (Slime)", -- [2]
					"Interface\\ICONS\\Ability_Creature_Poison_02", -- [3]
				}, -- [4]
				{
					88082, -- [1]
					"Fireball (Mirror Image)", -- [2]
					135812, -- [3]
				}, -- [5]
				{
					94472, -- [1]
					"Atonement (critical)", -- [2]
					135887, -- [3]
				}, -- [6]
				{
					59638, -- [1]
					"Frostbolt (Mirror Image)", -- [2]
					135846, -- [3]
				}, -- [7]
				{
					5, -- [1]
					"Environment (Fatigue)", -- [2]
					"Interface\\ICONS\\Spell_Arcane_MindMastery", -- [3]
				}, -- [8]
				{
					158336, -- [1]
					"Pulverize (wave #1)", -- [2]
					135242, -- [3]
				}, -- [9]
				{
					3, -- [1]
					"Environment (Falling)", -- [2]
					"Interface\\ICONS\\Spell_Magic_FeatherFall", -- [3]
				}, -- [10]
				{
					6, -- [1]
					"Environment (Fire)", -- [2]
					"Interface\\ICONS\\INV_SummerFest_FireSpirit", -- [3]
				}, -- [11]
				{
					224078, -- [1]
					"Devilsaur Shock Leash (trinket)", -- [2]
					136048, -- [3]
				}, -- [12]
				{
					214350, -- [1]
					"Nightmare Essence (trinket)", -- [2]
					1357816, -- [3]
				}, -- [13]
				{
					44461, -- [1]
					"Living Bomb (explosion)", -- [2]
					236220, -- [3]
				}, -- [14]
				{
					213786, -- [1]
					"Nightfall (trinket)", -- [2]
					236168, -- [3]
				}, -- [15]
				{
					120761, -- [1]
					"Glaive Toss (Glaive #2)", -- [2]
					132330, -- [3]
				}, -- [16]
				{
					121414, -- [1]
					"Glaive Toss (Glaive #1)", -- [2]
					132330, -- [3]
				}, -- [17]
				{
					33778, -- [1]
					"Lifebloom (bloom)", -- [2]
					136041, -- [3]
				}, -- [18]
				{
					7, -- [1]
					"Environment (Lava)", -- [2]
					"Interface\\ICONS\\Ability_Rhyolith_Volcano", -- [3]
				}, -- [19]
				{
					158420, -- [1]
					"Pulverize (wave #3)", -- [2]
					135242, -- [3]
				}, -- [20]
				{
					158417, -- [1]
					"Pulverize (wave #2)", -- [2]
					135242, -- [3]
				}, -- [21]
				{
					161612, -- [1]
					"Overflowing Energy (caught)", -- [2]
					841219, -- [3]
				}, -- [22]
				{
					98021, -- [1]
					"Health Exchange", -- [2]
					237586, -- [3]
				}, -- [23]
				{
					161576, -- [1]
					"Overflowing Energy (explosion)", -- [2]
					841219, -- [3]
				}, -- [24]
				{
					237680, -- [1]
					"Howling Blast (AoE)", -- [2]
					135833, -- [3]
				}, -- [25]
				{
					215969, -- [1]
					"Epidemic (AoE)", -- [2]
					136066, -- [3]
				}, -- [26]
				{
					49184, -- [1]
					"Howling Blast (Main Target)", -- [2]
					135833, -- [3]
				}, -- [27]
				{
					70890, -- [1]
					"Scourge Strike (Shadow)", -- [2]
					237530, -- [3]
				}, -- [28]
				{
					212739, -- [1]
					"Epidemic (Main Target)", -- [2]
					136066, -- [3]
				}, -- [29]
				{
					55090, -- [1]
					"Scourge Strike (Physical)", -- [2]
					237530, -- [3]
				}, -- [30]
				{
					278227, -- [1]
					"Barkspines (Trinket)", -- [2]
					134439, -- [3]
				}, -- [31]
				{
					268998, -- [1]
					"Kindled Soul (Trinket)", -- [2]
					651093, -- [3]
				}, -- [32]
				{
					278812, -- [1]
					"Lion's Grace (Trinket)", -- [2]
					464140, -- [3]
				}, -- [33]
				{
					270827, -- [1]
					"Webweaver's Soul Gem (Trinket)", -- [2]
					237431, -- [3]
				}, -- [34]
				{
					279664, -- [1]
					"Bloody Bile (Trinket)", -- [2]
					136007, -- [3]
				}, -- [35]
				{
					278359, -- [1]
					"Blood Hatred (Trinket)", -- [2]
					132175, -- [3]
				}, -- [36]
				{
					278155, -- [1]
					"Lingering Power of Xalzaix (Trinket)", -- [2]
					254105, -- [3]
				}, -- [37]
				{
					271115, -- [1]
					"Ignition Mage's Fuse (Trinket)", -- [2]
					1119937, -- [3]
				}, -- [38]
				{
					277179, -- [1]
					"Rapid Adaptation (Trinket)", -- [2]
					135884, -- [3]
				}, -- [39]
				{
					278057, -- [1]
					"Volatile Blood Explosion (Trinket)", -- [2]
					538040, -- [3]
				}, -- [40]
				{
					277185, -- [1]
					"Dig Deep (Trinket)", -- [2]
					134229, -- [3]
				}, -- [41]
				{
					277187, -- [1]
					"Toughen Up (Trinket)", -- [2]
					135884, -- [3]
				}, -- [42]
				{
					277181, -- [1]
					"Taste of Victory (Trinket)", -- [2]
					135897, -- [3]
				}, -- [43]
				{
					278862, -- [1]
					"Chill of the Runes (Trinket)", -- [2]
					252270, -- [3]
				}, -- [44]
				{
					271462, -- [1]
					"Rotcrusted Voodoo Doll (Trinket)", -- [2]
					1716867, -- [3]
				}, -- [45]
				{
					270925, -- [1]
					"Waterspout (Trinket)", -- [2]
					1698701, -- [3]
				}, -- [46]
				{
					271071, -- [1]
					"Conch of Dark Whispers (Trinket)", -- [2]
					1498840, -- [3]
				}, -- [47]
				{
					271465, -- [1]
					"Rotcrusted Voodoo Doll (Trinket)", -- [2]
					1716867, -- [3]
				}, -- [48]
				{
					278383, -- [1]
					"Ruffling Tempest (Trinket)", -- [2]
					2103829, -- [3]
				}, -- [49]
				{
					271671, -- [1]
					"Cacaphonous Chord (Trinket)", -- [2]
					454048, -- [3]
				}, -- [50]
				{
					196917, -- [1]
					"Light of the Martyr (Damage)", -- [2]
					135938, -- [3]
				}, -- [51]
				{
					228649, -- [1]
					"Blackout Kick (Passive)", -- [2]
					574575, -- [3]
				}, -- [52]
			},
			["item_level_pool"] = {
			},
			["plater"] = {
				["realtime_dps_enabled"] = false,
				["realtime_dps_size"] = 12,
				["realtime_dps_player_shadow"] = true,
				["damage_taken_enabled"] = false,
				["realtime_dps_player_size"] = 12,
				["damage_taken_size"] = 12,
				["realtime_dps_color"] = {
					1, -- [1]
					1, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["realtime_dps_anchor"] = {
					["y"] = 0,
					["x"] = 0,
					["side"] = 7,
				},
				["damage_taken_shadow"] = true,
				["damage_taken_anchor"] = {
					["y"] = 0,
					["x"] = 0,
					["side"] = 7,
				},
				["damage_taken_color"] = {
					1, -- [1]
					1, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["realtime_dps_player_color"] = {
					1, -- [1]
					1, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["realtime_dps_player_anchor"] = {
					["y"] = 0,
					["x"] = 0,
					["side"] = 7,
				},
				["realtime_dps_player_enabled"] = false,
				["realtime_dps_shadow"] = true,
			},
			["raid_data"] = {
			},
			["spellid_ignored"] = {
			},
			["always_use_profile_name"] = key,
			["savedStyles"] = {
			},
			["always_use_profile_exception"] = {
			},
			["details_auras"] = {
			},
			["switchSaved"] = {
				["slots"] = 4,
				["table"] = {
					{
						["atributo"] = 1,
						["sub_atributo"] = 1,
					}, -- [1]
					{
						["atributo"] = 2,
						["sub_atributo"] = 1,
					}, -- [2]
					{
						["atributo"] = 1,
						["sub_atributo"] = 6,
					}, -- [3]
					{
						["atributo"] = 4,
						["sub_atributo"] = 5,
					}, -- [4]
				},
			},
			["savedTimeCaptures"] = {
			},
			["latest_news_saw"] = "v9.0.1.7933",
			["custom"] = {
				{
					["source"] = false,
					["author"] = "Details!",
					["desc"] = "Show who in your raid used a potion during the encounter.",
					["tooltip"] = "			--init:\n			local player, combat, instance = ...\n			\n			--get the debuff container for potion of focus\n			local debuff_uptime_container = player.debuff_uptime and player.debuff_uptime_spells and player.debuff_uptime_spells._ActorTable\n			if (debuff_uptime_container) then\n				local focus_potion = debuff_uptime_container [DETAILS_FOCUS_POTION_ID]\n				if (focus_potion) then\n				local name, _, icon = GetSpellInfo (DETAILS_FOCUS_POTION_ID)\n				GameCooltip:AddLine (name, 1) --> can use only 1 focus potion (can't be pre-potion)\n				_detalhes:AddTooltipBackgroundStatusbar()\n				GameCooltip:AddIcon (icon, 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				end\n			end\n			\n			--get the misc actor container\n			local buff_uptime_container = player.buff_uptime and player.buff_uptime_spells and player.buff_uptime_spells._ActorTable\n			if (buff_uptime_container) then\n				for spellId, _ in pairs (DetailsFramework.PotionIDs) do\n					local potionUsed = buff_uptime_container [spellId]\n			\n					if (potionUsed) then\n						local name, _, icon = GetSpellInfo (spellId)\n						GameCooltip:AddLine (name, potionUsed.activedamt)\n						_detalhes:AddTooltipBackgroundStatusbar()\n						GameCooltip:AddIcon (icon, 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n					end\n				end\n			end\n			",
					["icon"] = "Interface\\ICONS\\INV_Potion_03",
					["name"] = "Potion Used",
					["spellid"] = false,
					["target"] = false,
					["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n				\n				--get the misc actor container\n				local misc_container = combat:GetActorList ( DETAILS_ATTRIBUTE_MISC )\n				\n				--do the loop:\n				for _, player in ipairs ( misc_container ) do \n					\n					--only player in group\n					if (player:IsGroupPlayer()) then\n						\n						local found_potion = false\n						\n						--get the spell debuff uptime container\n						local debuff_uptime_container = player.debuff_uptime and player.debuff_uptime_spells and player.debuff_uptime_spells._ActorTable\n						if (debuff_uptime_container) then\n							--potion of focus (can't use as pre-potion, so, its amount is always 1\n							local focus_potion = debuff_uptime_container [DETAILS_FOCUS_POTION_ID]\n							\n							if (focus_potion) then\n								total = total + 1\n								found_potion = true\n								if (top < 1) then\n									top = 1\n								end\n								--add amount to the player \n								instance_container:AddValue (player, 1)\n							end\n						end\n						\n						--get the spell buff uptime container\n						local buff_uptime_container = player.buff_uptime and player.buff_uptime_spells and player.buff_uptime_spells._ActorTable\n						if (buff_uptime_container) then\n							for spellId, _ in pairs (DetailsFramework.PotionIDs) do\n								local potionUsed = buff_uptime_container [spellId]\n				\n								if (potionUsed) then\n									local used = potionUsed.activedamt\n									if (used and used > 0) then\n										total = total + used\n										found_potion = true\n										if (used > top) then\n											top = used\n										end\n				\n										--add amount to the player \n										instance_container:AddValue (player, used)\n									end\n								end\n							end\n						end\n						\n						if (found_potion) then\n							amount = amount + 1\n						end    \n					end\n				end\n				\n				--return:\n				return total, top, amount\n				",
					["attribute"] = false,
					["script_version"] = 6,
				}, -- [1]
				{
					["source"] = false,
					["total_script"] = false,
					["author"] = "Details! Team",
					["percent_script"] = false,
					["desc"] = "Show who in your raid group used the healthstone or a heal potion.",
					["icon"] = "Interface\\ICONS\\INV_Stone_04",
					["spellid"] = false,
					["name"] = "Health Potion & Stone",
					["script"] = "			--get the parameters passed\n			local combat, instance_container, instance = ...\n			--declade the values to return\n			local total, top, amount = 0, 0, 0\n			\n			--do the loop\n			local AllHealCharacters = combat:GetActorList (DETAILS_ATTRIBUTE_HEAL)\n			for index, character in ipairs (AllHealCharacters) do\n				local AllSpells = character:GetSpellList()\n				local found = false\n				for spellid, spell in pairs (AllSpells) do\n					if (DETAILS_HEALTH_POTION_LIST [spellid]) then\n						instance_container:AddValue (character, spell.total)\n						total = total + spell.total\n						if (top < spell.total) then\n							top = spell.total\n						end\n						found = true\n					end\n				end\n			\n				if (found) then\n					amount = amount + 1\n				end\n			end\n			--loop end\n			--return the values\n			return total, top, amount\n			",
					["target"] = false,
					["tooltip"] = "			--get the parameters passed\n			local actor, combat, instance = ...\n			\n			--get the cooltip object (we dont use the convencional GameTooltip here)\n			local GameCooltip = GameCooltip\n			local R, G, B, A = 0, 0, 0, 0.75\n			\n			local hs = actor:GetSpell (6262)\n			if (hs) then\n				GameCooltip:AddLine (select (1, GetSpellInfo(6262)),  _detalhes:ToK(hs.total))\n				GameCooltip:AddIcon (select (3, GetSpellInfo (6262)), 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				GameCooltip:AddStatusBar (100, 1, R, G, B, A)\n			end\n			\n			local pot = actor:GetSpell (DETAILS_HEALTH_POTION_ID)\n			if (pot) then\n				GameCooltip:AddLine (select (1, GetSpellInfo(DETAILS_HEALTH_POTION_ID)),  _detalhes:ToK(pot.total))\n				GameCooltip:AddIcon (select (3, GetSpellInfo (DETAILS_HEALTH_POTION_ID)), 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				GameCooltip:AddStatusBar (100, 1, R, G, B, A)\n			end\n			\n			local pot = actor:GetSpell (DETAILS_REJU_POTION_ID)\n			if (pot) then\n				GameCooltip:AddLine (select (1, GetSpellInfo(DETAILS_REJU_POTION_ID)),  _detalhes:ToK(pot.total))\n				GameCooltip:AddIcon (select (3, GetSpellInfo (DETAILS_REJU_POTION_ID)), 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				GameCooltip:AddStatusBar (100, 1, R, G, B, A)\n			end\n\n			--Cooltip code\n			",
					["attribute"] = false,
					["script_version"] = 15,
				}, -- [2]
				{
					["source"] = false,
					["author"] = "Details!",
					["tooltip"] = "				\n			",
					["percent_script"] = "				local value, top, total, combat, instance = ...\n				return string.format (\"%.1f\", value/top*100)\n			",
					["desc"] = "Tells how much time each character spent doing damage.",
					["icon"] = "Interface\\Buttons\\UI-MicroStream-Red",
					["spellid"] = false,
					["name"] = "Damage Activity Time",
					["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, amount = 0, 0\n\n				--get the misc actor container\n				local damage_container = combat:GetActorList ( DETAILS_ATTRIBUTE_DAMAGE )\n				\n				--do the loop:\n				for _, player in ipairs ( damage_container ) do \n					if (player.grupo) then\n						local activity = player:Tempo()\n						total = total + activity\n						amount = amount + 1\n						--add amount to the player \n						instance_container:AddValue (player, activity)\n					end\n				end\n				\n				--return:\n				return total, combat:GetCombatTime(), amount\n			",
					["target"] = false,
					["total_script"] = "				local value, top, total, combat, instance = ...\n				local minutos, segundos = math.floor (value/60), math.floor (value%60)\n				return minutos .. \"m \" .. segundos .. \"s\"\n			",
					["attribute"] = false,
					["script_version"] = 3,
				}, -- [3]
				{
					["source"] = false,
					["author"] = "Details!",
					["tooltip"] = "				\n			",
					["percent_script"] = "				local value, top, total, combat, instance = ...\n				return string.format (\"%.1f\", value/top*100)\n			",
					["desc"] = "Tells how much time each character spent doing healing.",
					["icon"] = "Interface\\Buttons\\UI-MicroStream-Green",
					["spellid"] = false,
					["name"] = "Healing Activity Time",
					["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n\n				--get the misc actor container\n				local damage_container = combat:GetActorList ( DETAILS_ATTRIBUTE_HEAL )\n				\n				--do the loop:\n				for _, player in ipairs ( damage_container ) do \n					if (player.grupo) then\n						local activity = player:Tempo()\n						total = total + activity\n						amount = amount + 1\n						--add amount to the player \n						instance_container:AddValue (player, activity)\n					end\n				end\n				\n				--return:\n				return total, combat:GetCombatTime(), amount\n			",
					["target"] = false,
					["total_script"] = "				local value, top, total, combat, instance = ...\n				local minutos, segundos = math.floor (value/60), math.floor (value%60)\n				return minutos .. \"m \" .. segundos .. \"s\"\n			",
					["attribute"] = false,
					["script_version"] = 2,
				}, -- [4]
				{
					["source"] = false,
					["author"] = "Details!",
					["desc"] = "Show the crowd control amount for each player.",
					["total_script"] = "				local value, top, total, combat, instance = ...\n				return floor (value)\n			",
					["icon"] = "Interface\\ICONS\\Spell_Frost_FreezingBreath",
					["spellid"] = false,
					["name"] = "Crowd Control Done",
					["tooltip"] = "				local actor, combat, instance = ...\n				local spells = {}\n				for spellid, spell in pairs (actor.cc_done_spells._ActorTable) do\n				    tinsert (spells, {spellid, spell.counter})\n				end\n\n				table.sort (spells, _detalhes.Sort2)\n\n				for index, spell in ipairs (spells) do\n				    local name, _, icon = GetSpellInfo (spell [1])\n				    GameCooltip:AddLine (name, spell [2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    GameCooltip:AddIcon (icon, 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				end\n\n				local targets = {}\n				for playername, amount in pairs (actor.cc_done_targets) do\n				    tinsert (targets, {playername, amount})\n				end\n\n				table.sort (targets, _detalhes.Sort2)\n\n				_detalhes:AddTooltipSpellHeaderText (\"Targets\", \"yellow\", #targets)\n				local class, _, _, _, _, r, g, b = _detalhes:GetClass (actor.nome)\n				_detalhes:AddTooltipHeaderStatusbar (1, 1, 1, 0.6)\n\n				for index, target in ipairs (targets) do\n				    GameCooltip:AddLine (target[1], target [2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    \n				    local class, _, _, _, _, r, g, b = _detalhes:GetClass (target [1])\n				    if (class and class ~= \"UNKNOW\") then\n					local texture, l, r, t, b = _detalhes:GetClassIcon (class)\n					GameCooltip:AddIcon (\"Interface\\\\AddOns\\\\Details\\\\images\\\\classes_small_alpha\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height, l, r, t, b)\n				    else\n					GameCooltip:AddIcon (\"Interface\\\\GossipFrame\\\\IncompleteQuestIcon\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    end\n				    --\n				end\n			",
					["target"] = false,
					["script"] = "				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n\n				local misc_actors = combat:GetActorList (DETAILS_ATTRIBUTE_MISC)\n\n				for index, character in ipairs (misc_actors) do\n					if (character.cc_done and character:IsPlayer()) then\n						local cc_done = floor (character.cc_done)\n						instance_container:AddValue (character, cc_done)\n						total = total + cc_done\n						if (cc_done > top) then\n							top = cc_done\n						end\n						amount = amount + 1\n					end\n				end\n\n				return total, top, amount\n			",
					["attribute"] = false,
					["script_version"] = 11,
				}, -- [5]
				{
					["source"] = false,
					["author"] = "Details!",
					["desc"] = "Show the amount of crowd control received for each player.",
					["total_script"] = "				local value, top, total, combat, instance = ...\n				return floor (value)\n			",
					["icon"] = "Interface\\ICONS\\Spell_Frost_ChainsOfIce",
					["spellid"] = false,
					["name"] = "Crowd Control Received",
					["tooltip"] = "				local actor, combat, instance = ...\n				local name = actor:name()\n				local spells, from = {}, {}\n				local misc_actors = combat:GetActorList (DETAILS_ATTRIBUTE_MISC)\n\n				for index, character in ipairs (misc_actors) do\n				    if (character.cc_done and character:IsPlayer()) then\n					local on_actor = character.cc_done_targets [name]\n					if (on_actor) then\n					    tinsert (from, {character:name(), on_actor})\n					    \n					    for spellid, spell in pairs (character.cc_done_spells._ActorTable) do\n						\n						local spell_on_actor = spell.targets [name]\n						if (spell_on_actor) then\n						    local has_spell\n						    for index, spell_table in ipairs (spells) do\n							if (spell_table [1] == spellid) then\n							    spell_table [2] = spell_table [2] + spell_on_actor\n							    has_spell = true\n							end\n						    end\n						    if (not has_spell) then\n							tinsert (spells, {spellid, spell_on_actor}) \n						    end\n						end\n						\n					    end            \n					end\n				    end\n				end\n\n				table.sort (from, _detalhes.Sort2)\n				table.sort (spells, _detalhes.Sort2)\n\n				for index, spell in ipairs (spells) do\n				    local name, _, icon = GetSpellInfo (spell [1])\n				    GameCooltip:AddLine (name, spell [2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    GameCooltip:AddIcon (icon, 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)    \n				end\n\n				_detalhes:AddTooltipSpellHeaderText (\"From\", \"yellow\", #from)\n				_detalhes:AddTooltipHeaderStatusbar (1, 1, 1, 0.6)\n\n				for index, t in ipairs (from) do\n				    GameCooltip:AddLine (t[1], t[2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    \n				    local class, _, _, _, _, r, g, b = _detalhes:GetClass (t [1])\n				    if (class and class ~= \"UNKNOW\") then\n					local texture, l, r, t, b = _detalhes:GetClassIcon (class)\n					GameCooltip:AddIcon (\"Interface\\\\AddOns\\\\Details\\\\images\\\\classes_small_alpha\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height, l, r, t, b)\n				    else\n					GameCooltip:AddIcon (\"Interface\\\\GossipFrame\\\\IncompleteQuestIcon\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    end     \n				    \n				end\n			",
					["target"] = false,
					["script"] = "				local combat, instance_container, instance = ...\n				local total, top, amt = 0, 0, 0\n\n				local misc_actors = combat:GetActorList (DETAILS_ATTRIBUTE_MISC)\n				DETAILS_CUSTOM_CC_RECEIVED_CACHE = DETAILS_CUSTOM_CC_RECEIVED_CACHE or {}\n				wipe (DETAILS_CUSTOM_CC_RECEIVED_CACHE)\n\n				for index, character in ipairs (misc_actors) do\n				    if (character.cc_done and character:IsPlayer()) then\n					\n					for player_name, amount in pairs (character.cc_done_targets) do\n					    local target = combat (1, player_name) or combat (2, player_name)\n					    if (target and target:IsPlayer()) then\n						instance_container:AddValue (target, amount)\n						total = total + amount\n						if (amount > top) then\n						    top = amount\n						end\n						if (not DETAILS_CUSTOM_CC_RECEIVED_CACHE [player_name]) then\n						    DETAILS_CUSTOM_CC_RECEIVED_CACHE [player_name] = true\n						    amt = amt + 1\n						end\n					    end\n					end\n					\n				    end\n				end\n\n				return total, top, amt\n			",
					["attribute"] = false,
					["script_version"] = 3,
				}, -- [6]
				{
					["source"] = false,
					["author"] = "Details!",
					["percent_script"] = "				local value, top, total, combat, instance = ...\n				local dps = _detalhes:ToK (floor (value) / combat:GetCombatTime())\n				local percent = string.format (\"%.1f\", value/total*100)\n				return dps .. \", \" .. percent\n			",
					["desc"] = "Show your spells in the window.",
					["tooltip"] = "			--config:\n			--Background RBG and Alpha:\n			local R, G, B, A = 0, 0, 0, 0.75\n			local R, G, B, A = 0.1960, 0.1960, 0.1960, 0.8697\n\n			--get the parameters passed\n			local spell, combat, instance = ...\n\n			--get the cooltip object (we dont use the convencional GameTooltip here)\n			local GC = GameCooltip\n			GC:SetOption (\"YSpacingMod\", 0)\n\n			local role = DetailsFramework.UnitGroupRolesAssigned (\"player\")\n\n			if (spell.n_dmg) then\n			    \n			    local spellschool, schooltext = spell.spellschool, \"\"\n			    if (spellschool) then\n				local t = _detalhes.spells_school [spellschool]\n				if (t and t.name) then\n				    schooltext = t.formated\n				end\n			    end\n			    \n			    local total_hits = spell.counter\n			    local combat_time = instance.showing:GetCombatTime()\n			    \n			    local debuff_uptime_total, cast_string = \"\", \"\"\n			    local misc_actor = instance.showing (4, _detalhes.playername)\n			    if (misc_actor) then\n				local debuff_uptime = misc_actor.debuff_uptime_spells and misc_actor.debuff_uptime_spells._ActorTable [spell.id] and misc_actor.debuff_uptime_spells._ActorTable [spell.id].uptime\n				if (debuff_uptime) then\n				    debuff_uptime_total = floor (debuff_uptime / instance.showing:GetCombatTime() * 100)\n				end\n				\n				local spell_cast = misc_actor.spell_cast and misc_actor.spell_cast [spell.id]\n				\n				if (not spell_cast and misc_actor.spell_cast) then\n				    local spellname = GetSpellInfo (spell.id)\n				    for casted_spellid, amount in pairs (misc_actor.spell_cast) do\n					local casted_spellname = GetSpellInfo (casted_spellid)\n					if (casted_spellname == spellname) then\n					    spell_cast = amount .. \" (|cFFFFFF00?|r)\"\n					end\n				    end\n				end\n				if (not spell_cast) then\n				    spell_cast = \"(|cFFFFFF00?|r)\"\n				end\n				cast_string = cast_string .. spell_cast\n			    end\n			    \n			    --Cooltip code\n			    GC:AddLine (\"Casts:\", cast_string or \"?\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    if (debuff_uptime_total ~= \"\") then\n				GC:AddLine (\"Uptime:\", (debuff_uptime_total or \"?\") .. \"%\")\n				GC:AddStatusBar (100, 1, R, G, B, A)\n			    end\n			    \n			    GC:AddLine (\"Hits:\", spell.counter)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local average = spell.total / total_hits\n			    GC:AddLine (\"Average:\", _detalhes:ToK (average))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"E-Dps:\", _detalhes:ToK (spell.total / combat_time))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"School:\", schooltext)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Normal Hits: \", spell.n_amt .. \" (\" ..floor ( spell.n_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local n_average = spell.n_dmg / spell.n_amt\n			    local T = (combat_time*spell.n_dmg)/spell.total\n			    local P = average/n_average*100\n			    T = P*T/100\n			    \n			    GC:AddLine (\"Average / E-Dps: \",  _detalhes:ToK (n_average) .. \" / \" .. format (\"%.1f\",spell.n_dmg / T ))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Critical Hits: \", spell.c_amt .. \" (\" ..floor ( spell.c_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    if (spell.c_amt > 0) then\n				local c_average = spell.c_dmg/spell.c_amt\n				local T = (combat_time*spell.c_dmg)/spell.total\n				local P = average/c_average*100\n				T = P*T/100\n				local crit_dps = spell.c_dmg / T\n				\n				GC:AddLine (\"Average / E-Dps: \",  _detalhes:ToK (c_average) .. \" / \" .. _detalhes:comma_value (crit_dps))\n			    else\n				GC:AddLine (\"Average / E-Dps: \",  \"0 / 0\")    \n			    end\n			    \n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Multistrike: \", spell.m_amt .. \" (\" ..floor ( spell.m_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"On Normal / On Critical:\", spell.m_amt - spell.m_crit .. \"  / \" .. spell.m_crit)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			elseif (spell.n_curado) then\n			    \n			    local spellschool, schooltext = spell.spellschool, \"\"\n			    if (spellschool) then\n				local t = _detalhes.spells_school [spellschool]\n				if (t and t.name) then\n				    schooltext = t.formated\n				end\n			    end\n			    \n			    local total_hits = spell.counter\n			    local combat_time = instance.showing:GetCombatTime()\n			    \n			    --Cooltip code\n			    GC:AddLine (\"Hits:\", spell.counter)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local average = spell.total / total_hits\n			    GC:AddLine (\"Average:\", _detalhes:ToK (average))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"E-Hps:\", _detalhes:ToK (spell.total / combat_time))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"School:\", schooltext)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Normal Hits: \", spell.n_amt .. \" (\" ..floor ( spell.n_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local n_average = spell.n_curado / spell.n_amt\n			    local T = (combat_time*spell.n_curado)/spell.total\n			    local P = average/n_average*100\n			    T = P*T/100\n			    \n			    GC:AddLine (\"Average / E-Dps: \",  _detalhes:ToK (n_average) .. \" / \" .. format (\"%.1f\",spell.n_curado / T ))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Critical Hits: \", spell.c_amt .. \" (\" ..floor ( spell.c_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    if (spell.c_amt > 0) then\n				local c_average = spell.c_curado/spell.c_amt\n				local T = (combat_time*spell.c_curado)/spell.total\n				local P = average/c_average*100\n				T = P*T/100\n				local crit_dps = spell.c_curado / T\n				\n				GC:AddLine (\"Average / E-Hps: \",  _detalhes:ToK (c_average) .. \" / \" .. _detalhes:comma_value (crit_dps))\n			    else\n				GC:AddLine (\"Average / E-Hps: \",  \"0 / 0\")    \n			    end\n			    \n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Multistrike: \", spell.m_amt .. \" (\" ..floor ( spell.m_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"On Normal / On Critical:\", spell.m_amt - spell.m_crit .. \"  / \" .. spell.m_crit)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			end\n			",
					["icon"] = "Interface\\CHATFRAME\\UI-ChatIcon-Battlenet",
					["name"] = "My Spells",
					["spellid"] = false,
					["target"] = false,
					["script"] = "				--get the parameters passed\n				local combat, instance_container, instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n\n				local player\n				local pet_attribute\n				\n				local role = DetailsFramework.UnitGroupRolesAssigned (\"player\")\n				local spec = DetailsFramework.GetSpecialization()\n				role = spec and DetailsFramework.GetSpecializationRole (spec) or role\n\n				if (role == \"DAMAGER\") then\n					player = combat (DETAILS_ATTRIBUTE_DAMAGE, _detalhes.playername)\n					pet_attribute = DETAILS_ATTRIBUTE_DAMAGE\n				elseif (role == \"HEALER\") then    \n					player = combat (DETAILS_ATTRIBUTE_HEAL, _detalhes.playername)\n					pet_attribute = DETAILS_ATTRIBUTE_HEAL\n				else\n					player = combat (DETAILS_ATTRIBUTE_DAMAGE, _detalhes.playername)\n					pet_attribute = DETAILS_ATTRIBUTE_DAMAGE\n				end\n\n				--do the loop\n\n				if (player) then\n					local spells = player:GetSpellList()\n					for spellid, spell in pairs (spells) do\n						instance_container:AddValue (spell, spell.total)\n						total = total + spell.total\n						if (top < spell.total) then\n							top = spell.total\n						end\n						amount = amount + 1\n					end\n				    \n					for _, PetName in ipairs (player.pets) do\n						local pet = combat (pet_attribute, PetName)\n						if (pet) then\n							for spellid, spell in pairs (pet:GetSpellList()) do\n								instance_container:AddValue (spell, spell.total, nil, \" (\" .. PetName:gsub ((\" <.*\"), \"\") .. \")\")\n								total = total + spell.total\n								if (top < spell.total) then\n									top = spell.total\n								end\n								amount = amount + 1\n							end\n						end\n					end\n				end\n\n				--return the values\n				return total, top, amount\n			",
					["attribute"] = false,
					["script_version"] = 7,
				}, -- [7]
				{
					["source"] = false,
					["author"] = "Details!",
					["desc"] = "Show the amount of damage applied on targets marked with skull.",
					["tooltip"] = "				--get the parameters passed\n				local actor, combat, instance = ...\n\n				--get the cooltip object (we dont use the convencional GameTooltip here)\n				local GameCooltip = GameCooltip\n\n				--Cooltip code\n				local format_func = Details:GetCurrentToKFunction()\n\n				--Cooltip code\n				local RaidTargets = actor.raid_targets\n\n				local DamageOnStar = RaidTargets [128]\n				if (DamageOnStar) then\n				    --RAID_TARGET_8 is the built-in localized word for 'Skull'.\n				    GameCooltip:AddLine (RAID_TARGET_8 .. \":\", format_func (_, DamageOnStar))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_8\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n			",
					["icon"] = "Interface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8",
					["name"] = "Damage On Skull Marked Targets",
					["spellid"] = false,
					["target"] = false,
					["script"] = "				--get the parameters passed\n				local Combat, CustomContainer, Instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n				\n				--raid target flags: \n				-- 128: skull \n				-- 64: cross\n				-- 32: square\n				-- 16: moon\n				-- 8: triangle\n				-- 4: diamond\n				-- 2: circle\n				-- 1: star\n				\n				--do the loop\n				for _, actor in ipairs (Combat:GetActorList (DETAILS_ATTRIBUTE_DAMAGE)) do\n				    if (actor:IsPlayer()) then\n					if (actor.raid_targets [128]) then\n					    CustomContainer:AddValue (actor, actor.raid_targets [128])\n					end        \n				    end\n				end\n\n				--if not managed inside the loop, get the values of total, top and amount\n				total, top = CustomContainer:GetTotalAndHighestValue()\n				amount = CustomContainer:GetNumActors()\n\n				--return the values\n				return total, top, amount\n			",
					["attribute"] = false,
					["script_version"] = 3,
				}, -- [8]
				{
					["source"] = false,
					["author"] = "Details!",
					["desc"] = "Show the amount of damage applied on targets marked with any other mark.",
					["tooltip"] = "				--get the parameters passed\n				local actor, combat, instance = ...\n\n				--get the cooltip object\n				local GameCooltip = GameCooltip\n\n				local format_func = Details:GetCurrentToKFunction()\n\n				--Cooltip code\n				local RaidTargets = actor.raid_targets\n\n				local DamageOnStar = RaidTargets [1]\n				if (DamageOnStar) then\n				    GameCooltip:AddLine (RAID_TARGET_1 .. \":\", format_func (_, DamageOnStar))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_1\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnCircle = RaidTargets [2]\n				if (DamageOnCircle) then\n				    GameCooltip:AddLine (RAID_TARGET_2 .. \":\", format_func (_, DamageOnCircle))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_2\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnDiamond = RaidTargets [4]\n				if (DamageOnDiamond) then\n				    GameCooltip:AddLine (RAID_TARGET_3 .. \":\", format_func (_, DamageOnDiamond))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_3\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnTriangle = RaidTargets [8]\n				if (DamageOnTriangle) then\n				    GameCooltip:AddLine (RAID_TARGET_4 .. \":\", format_func (_, DamageOnTriangle))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_4\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnMoon = RaidTargets [16]\n				if (DamageOnMoon) then\n				    GameCooltip:AddLine (RAID_TARGET_5 .. \":\", format_func (_, DamageOnMoon))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_5\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnSquare = RaidTargets [32]\n				if (DamageOnSquare) then\n				    GameCooltip:AddLine (RAID_TARGET_6 .. \":\", format_func (_, DamageOnSquare))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_6\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnCross = RaidTargets [64]\n				if (DamageOnCross) then\n				    GameCooltip:AddLine (RAID_TARGET_7 .. \":\", format_func (_, DamageOnCross))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_7\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n			",
					["icon"] = "Interface\\TARGETINGFRAME\\UI-RaidTargetingIcon_5",
					["name"] = "Damage On Other Marked Targets",
					["spellid"] = false,
					["target"] = false,
					["script"] = "				--get the parameters passed\n				local Combat, CustomContainer, Instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n\n				--do the loop\n				for _, actor in ipairs (Combat:GetActorList (DETAILS_ATTRIBUTE_DAMAGE)) do\n				    if (actor:IsPlayer()) then\n					local total = (actor.raid_targets [1] or 0) --star\n					total = total + (actor.raid_targets [2] or 0) --circle\n					total = total + (actor.raid_targets [4] or 0) --diamond\n					total = total + (actor.raid_targets [8] or 0) --tiangle\n					total = total + (actor.raid_targets [16] or 0) --moon\n					total = total + (actor.raid_targets [32] or 0) --square\n					total = total + (actor.raid_targets [64] or 0) --cross\n					\n					if (total > 0) then\n					    CustomContainer:AddValue (actor, total)\n					end\n				    end\n				end\n\n				--if not managed inside the loop, get the values of total, top and amount\n				total, top = CustomContainer:GetTotalAndHighestValue()\n				amount = CustomContainer:GetNumActors()\n\n				--return the values\n				return total, top, amount\n			",
					["attribute"] = false,
					["script_version"] = 3,
				}, -- [9]
				{
					["source"] = false,
					["author"] = "Details!",
					["desc"] = "Show overall damage done on the fly.",
					["total_script"] = "				local value, top, total, combat, instance = ...\n\n				--get the time of overall combat\n				local OverallCombatTime = Details:GetCombat (-1):GetCombatTime()\n\n				--get the time of current combat if the player is in combat\n				if (Details.in_combat) then\n				    local CurrentCombatTime = Details:GetCombat (0):GetCombatTime()\n				    OverallCombatTime = OverallCombatTime + CurrentCombatTime\n				end\n\n				--build the string\n				local ToK = Details:GetCurrentToKFunction()\n				local s = ToK (_, value / OverallCombatTime)\n				\n				if (instance.row_info.textR_show_data[3]) then\n				    s = ToK (_, value) .. \" (\" .. s .. \", \"\n				else\n				    s = ToK (_, value) .. \" (\" .. s\n				end\n\n				return s\n			",
					["icon"] = "Interface\\Buttons\\Spell-Reset",
					["spellid"] = false,
					["name"] = "Dynamic Overall Damage",
					["tooltip"] = "				--get the parameters passed\n				local actor, combat, instance = ...\n\n				--get the cooltip object (we dont use the convencional GameTooltip here)\n				local GameCooltip = GameCooltip2\n\n				--Cooltip code\n				--get the overall combat\n				local OverallCombat = Details:GetCombat (-1)\n				--get the current combat\n				local CurrentCombat = Details:GetCombat (0)\n\n				local AllSpells = {}\n\n				--overall\n				local player = OverallCombat [1]:GetActor (actor.nome)\n				local playerSpells = player:GetSpellList()\n				for spellID, spellTable in pairs (playerSpells) do\n				    AllSpells [spellID] = spellTable.total\n				end\n\n				--current\n				local player = CurrentCombat [1]:GetActor (actor.nome)\n				if (player) then\n					local playerSpells = player:GetSpellList()\n					for spellID, spellTable in pairs (playerSpells) do\n						AllSpells [spellID] = (AllSpells [spellID] or 0) + (spellTable.total or 0)\n					end\n				end\n\n				local sortedList = {}\n				for spellID, total in pairs (AllSpells) do\n				    tinsert (sortedList, {spellID, total})\n				end\n				table.sort (sortedList, Details.Sort2)\n\n				local format_func = Details:GetCurrentToKFunction()\n\n				--build the tooltip\n				for i, t in ipairs (sortedList) do\n				    local spellID, total = unpack (t)\n				    if (total > 1) then\n					local spellName, _, spellIcon = Details.GetSpellInfo (spellID)\n					\n					GameCooltip:AddLine (spellName, format_func (_, total))\n					Details:AddTooltipBackgroundStatusbar()\n					GameCooltip:AddIcon (spellIcon, 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    end\n				end\n			",
					["target"] = false,
					["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n\n				--get the overall combat\n				local OverallCombat = Details:GetCombat (-1)\n				--get the current combat\n				local CurrentCombat = Details:GetCombat (0)\n\n				if (not OverallCombat.GetActorList or not CurrentCombat.GetActorList) then\n				    return 0, 0, 0\n				end\n\n				--get the damage actor container for overall\n				local damage_container_overall = OverallCombat:GetActorList ( DETAILS_ATTRIBUTE_DAMAGE )\n				--get the damage actor container for current\n				local damage_container_current = CurrentCombat:GetActorList ( DETAILS_ATTRIBUTE_DAMAGE )\n\n				--do the loop:\n				for _, player in ipairs ( damage_container_overall ) do \n				    --only player in group\n				    if (player:IsGroupPlayer()) then\n					instance_container:AddValue (player, player.total)\n				    end\n				end\n\n				if (Details.in_combat) then\n				    for _, player in ipairs ( damage_container_current ) do \n					--only player in group\n					if (player:IsGroupPlayer()) then\n					    instance_container:AddValue (player, player.total)        \n					end\n				    end\n				end\n\n				total, top =  instance_container:GetTotalAndHighestValue()\n				amount =  instance_container:GetNumActors()\n\n				--return:\n				return total, top, amount\n			",
					["attribute"] = false,
					["script_version"] = 5,
				}, -- [10]
				{
					["source"] = false,
					["author"] = "Details!",
					["desc"] = "Damage done to shields",
					["tooltip"] = "				--get the parameters passed\n				local actor, Combat, instance = ...\n\n				--get the cooltip object (we dont use the convencional GameTooltip here)\n				local GameCooltip = GameCooltip\n\n				--Cooltip code\n				--get the actor total damage absorbed\n				local totalAbsorb = actor.totalabsorbed\n				local format_func = Details:GetCurrentToKFunction()\n\n				--get the damage absorbed by all the actor pets\n				for petIndex, petName in ipairs (actor.pets) do\n				    local pet = Combat :GetActor (1, petName)\n				    if (pet) then\n					totalAbsorb = totalAbsorb + pet.totalabsorbed\n				    end\n				end\n\n				GameCooltip:AddLine (actor:Name(), format_func (_, actor.totalabsorbed))\n				Details:AddTooltipBackgroundStatusbar()\n\n				for petIndex, petName in ipairs (actor.pets) do\n				    local pet = Combat :GetActor (1, petName)\n				    if (pet) then\n					totalAbsorb = totalAbsorb + pet.totalabsorbed\n					\n					GameCooltip:AddLine (petName, format_func (_, pet.totalabsorbed))\n					Details:AddTooltipBackgroundStatusbar()        \n					\n				    end\n				end\n			",
					["icon"] = "Interface\\ICONS\\Spell_Holy_PowerWordShield",
					["name"] = "Damage on Shields",
					["spellid"] = false,
					["target"] = false,
					["script"] = "				--get the parameters passed\n				local Combat, CustomContainer, Instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n\n				--do the loop\n				for index, actor in ipairs (Combat:GetActorList(1)) do\n				    if (actor:IsPlayer()) then\n					\n					--get the actor total damage absorbed\n					local totalAbsorb = actor.totalabsorbed\n					\n					--get the damage absorbed by all the actor pets\n					for petIndex, petName in ipairs (actor.pets) do\n					    local pet = Combat :GetActor (1, petName)\n					    if (pet) then\n						totalAbsorb = totalAbsorb + pet.totalabsorbed\n					    end\n					end\n					\n					--add the value to the actor on the custom container\n					CustomContainer:AddValue (actor, totalAbsorb)        \n					\n				    end\n				end\n				--loop end\n\n				--if not managed inside the loop, get the values of total, top and amount\n				total, top = CustomContainer:GetTotalAndHighestValue()\n				amount = CustomContainer:GetNumActors()\n\n				--return the values\n				return total, top, amount\n			",
					["attribute"] = false,
					["script_version"] = 1,
				}, -- [11]
			},
			["performance_profiles"] = {
				["Dungeon"] = {
					["enabled"] = false,
					["update_speed"] = 1,
					["aura"] = true,
					["miscdata"] = true,
					["heal"] = true,
					["use_row_animations"] = false,
					["energy"] = false,
					["damage"] = true,
				},
				["RaidFinder"] = {
					["enabled"] = false,
					["update_speed"] = 1,
					["aura"] = true,
					["miscdata"] = true,
					["heal"] = true,
					["use_row_animations"] = false,
					["energy"] = false,
					["damage"] = true,
				},
				["Battleground15"] = {
					["enabled"] = false,
					["update_speed"] = 1,
					["aura"] = true,
					["miscdata"] = true,
					["heal"] = true,
					["use_row_animations"] = false,
					["energy"] = false,
					["damage"] = true,
				},
				["Raid15"] = {
					["enabled"] = false,
					["update_speed"] = 1,
					["aura"] = true,
					["miscdata"] = true,
					["heal"] = true,
					["use_row_animations"] = false,
					["energy"] = false,
					["damage"] = true,
				},
				["Mythic"] = {
					["enabled"] = false,
					["update_speed"] = 1,
					["aura"] = true,
					["miscdata"] = true,
					["heal"] = true,
					["use_row_animations"] = false,
					["energy"] = false,
					["damage"] = true,
				},
				["Arena"] = {
					["enabled"] = false,
					["update_speed"] = 1,
					["aura"] = true,
					["miscdata"] = true,
					["heal"] = true,
					["use_row_animations"] = false,
					["energy"] = false,
					["damage"] = true,
				},
				["Raid30"] = {
					["enabled"] = false,
					["update_speed"] = 1,
					["aura"] = true,
					["miscdata"] = true,
					["heal"] = true,
					["use_row_animations"] = false,
					["energy"] = false,
					["damage"] = true,
				},
				["Battleground40"] = {
					["enabled"] = false,
					["update_speed"] = 1,
					["aura"] = true,
					["miscdata"] = true,
					["heal"] = true,
					["use_row_animations"] = false,
					["energy"] = false,
					["damage"] = true,
				},
			},
			["exit_log"] = {
				"1 - Closing Janela Info.", -- [1]
				"2 - Clearing user place from instances.", -- [2]
				"4 - Reversing switches.", -- [3]
				"6 - Saving Config.", -- [4]
				"7 - Saving Profiles.", -- [5]
				"8 - Saving nicktag cache.", -- [6]
			},
			["immersion_unit_special_icons"] = true,
			["lastUpdateWarning"] = 0,
			["dungeon_data"] = {
			},
		}

	elseif res == '1080p' then

		_detalhes_global = {
			["npcid_pool"] = {
			},
			["death_recap"] = {
				["show_segments"] = false,
				["enabled"] = true,
				["show_life_percent"] = false,
				["relevance_time"] = 7,
			},
			["spell_pool"] = {
			},
			["encounter_spell_pool"] = {
			},
			["immersion_pets_on_solo_play"] = false,
			["npcid_ignored"] = {
			},
			["report_where"] = "RAID",
			["auto_open_news_window"] = true,
			["got_first_run"] = true,
			["report_pos"] = {
				-254.0009155273438, -- [1]
				104.001708984375, -- [2]
			},
			["latest_report_table"] = {
			},
			["exp90temp"] = {
				["delete_damage_TCOB"] = true,
			},
			["always_use_profile"] = true,
			["immersion_special_units"] = true,
			["boss_mods_timers"] = {
				["encounter_timers_bw"] = {
				},
				["encounter_timers_dbm"] = {
				},
			},
			["spell_school_cache"] = {
			},
			["deathlog_healingdone_min"] = 10000,
			["__profiles"] = {
				[key] = {
					["show_arena_role_icon"] = false,
					["capture_real"] = {
						["heal"] = true,
						["spellcast"] = true,
						["miscdata"] = true,
						["aura"] = true,
						["energy"] = true,
						["damage"] = true,
					},
					["row_fade_in"] = {
						"in", -- [1]
						0.2, -- [2]
					},
					["streamer_config"] = {
						["faster_updates"] = false,
						["quick_detection"] = false,
						["reset_spec_cache"] = false,
						["no_alerts"] = false,
						["disable_mythic_dungeon"] = false,
						["use_animation_accel"] = true,
					},
					["all_players_are_group"] = false,
					["use_row_animations"] = true,
					["report_heal_links"] = false,
					["remove_realm_from_name"] = true,
					["minimum_overall_combat_time"] = 10,
					["event_tracker"] = {
						["enabled"] = false,
						["font_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["line_height"] = 16,
						["line_color"] = {
							0.1, -- [1]
							0.1, -- [2]
							0.1, -- [3]
							0.3, -- [4]
						},
						["font_shadow"] = "NONE",
						["font_size"] = 10,
						["font_face"] = "Friz Quadrata TT",
						["frame"] = {
							["show_title"] = true,
							["strata"] = "LOW",
							["backdrop_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								0.2, -- [4]
							},
							["locked"] = false,
							["height"] = 300,
							["width"] = 250,
						},
						["line_texture"] = "Details Serenity",
						["options_frame"] = {
						},
					},
					["report_to_who"] = "Scrype",
					["class_specs_coords"] = {
						[62] = {
							0.251953125, -- [1]
							0.375, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[63] = {
							0.375, -- [1]
							0.5, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[250] = {
							0, -- [1]
							0.125, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[251] = {
							0.125, -- [1]
							0.25, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[252] = {
							0.25, -- [1]
							0.375, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[253] = {
							0.875, -- [1]
							1, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[254] = {
							0, -- [1]
							0.125, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[255] = {
							0.125, -- [1]
							0.25, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[66] = {
							0.125, -- [1]
							0.25, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[257] = {
							0.5, -- [1]
							0.625, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[258] = {
							0.6328125, -- [1]
							0.75, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[259] = {
							0.75, -- [1]
							0.875, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[260] = {
							0.875, -- [1]
							1, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[577] = {
							0.25, -- [1]
							0.375, -- [2]
							0.5, -- [3]
							0.625, -- [4]
						},
						[262] = {
							0.125, -- [1]
							0.25, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[581] = {
							0.375, -- [1]
							0.5, -- [2]
							0.5, -- [3]
							0.625, -- [4]
						},
						[264] = {
							0.375, -- [1]
							0.5, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[265] = {
							0.5, -- [1]
							0.625, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[266] = {
							0.625, -- [1]
							0.75, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[267] = {
							0.75, -- [1]
							0.875, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[268] = {
							0.625, -- [1]
							0.75, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[269] = {
							0.875, -- [1]
							1, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[270] = {
							0.75, -- [1]
							0.875, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[70] = {
							0.251953125, -- [1]
							0.375, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[102] = {
							0.375, -- [1]
							0.5, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[71] = {
							0.875, -- [1]
							1, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[103] = {
							0.5, -- [1]
							0.625, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[72] = {
							0, -- [1]
							0.125, -- [2]
							0.5, -- [3]
							0.625, -- [4]
						},
						[104] = {
							0.625, -- [1]
							0.75, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[73] = {
							0.125, -- [1]
							0.25, -- [2]
							0.5, -- [3]
							0.625, -- [4]
						},
						[64] = {
							0.5, -- [1]
							0.625, -- [2]
							0.125, -- [3]
							0.25, -- [4]
						},
						[105] = {
							0.75, -- [1]
							0.875, -- [2]
							0, -- [3]
							0.125, -- [4]
						},
						[65] = {
							0, -- [1]
							0.125, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[256] = {
							0.375, -- [1]
							0.5, -- [2]
							0.25, -- [3]
							0.375, -- [4]
						},
						[261] = {
							0, -- [1]
							0.125, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
						[263] = {
							0.25, -- [1]
							0.375, -- [2]
							0.375, -- [3]
							0.5, -- [4]
						},
					},
					["profile_save_pos"] = true,
					["tooltip"] = {
						["header_statusbar"] = {
							0.3, -- [1]
							0.3, -- [2]
							0.3, -- [3]
							0.8, -- [4]
							false, -- [5]
							false, -- [6]
							"WorldState Score", -- [7]
						},
						["fontcolor_right"] = {
							1, -- [1]
							0.7, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["line_height"] = 17,
						["tooltip_max_targets"] = 2,
						["icon_size"] = {
							["W"] = 17,
							["H"] = 17,
						},
						["tooltip_max_pets"] = 2,
						["anchor_relative"] = "top",
						["abbreviation"] = 2,
						["anchored_to"] = 1,
						["show_amount"] = false,
						["header_text_color"] = {
							1, -- [1]
							0.9176, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["fontsize"] = 13,
						["background"] = {
							0.196078431372549, -- [1]
							0.196078431372549, -- [2]
							0.196078431372549, -- [3]
							0.8, -- [4]
						},
						["submenu_wallpaper"] = true,
						["fontsize_title"] = 10,
						["icon_border_texcoord"] = {
							["B"] = 0.921875,
							["L"] = 0.078125,
							["T"] = 0.078125,
							["R"] = 0.921875,
						},
						["commands"] = {
						},
						["tooltip_max_abilities"] = 6,
						["fontface"] = "Friz Quadrata TT",
						["border_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							0, -- [4]
						},
						["border_texture"] = "Blizzard Tooltip",
						["anchor_offset"] = {
							0, -- [1]
							0, -- [2]
						},
						["fontshadow"] = true,
						["menus_bg_texture"] = "Interface\\SPELLBOOK\\Spellbook-Page-1",
						["border_size"] = 16,
						["maximize_method"] = 1,
						["anchor_screen_pos"] = {
							507.7, -- [1]
							-350.5, -- [2]
						},
						["anchor_point"] = "bottom",
						["menus_bg_coords"] = {
							0.309777336120606, -- [1]
							0.924000015258789, -- [2]
							0.213000011444092, -- [3]
							0.279000015258789, -- [4]
						},
						["fontcolor"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["menus_bg_color"] = {
							0.8, -- [1]
							0.8, -- [2]
							0.8, -- [3]
							0.2, -- [4]
						},
					},
					["ps_abbreviation"] = 3,
					["world_combat_is_trash"] = false,
					["update_speed"] = 0.0500000007450581,
					["bookmark_text_size"] = 11,
					["animation_speed_mintravel"] = 0.45,
					["track_item_level"] = true,
					["windows_fade_in"] = {
						"in", -- [1]
						0.2, -- [2]
					},
					["instances_menu_click_to_open"] = false,
					["overall_clear_newchallenge"] = true,
					["current_dps_meter"] = {
						["enabled"] = false,
						["font_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["arena_enabled"] = true,
						["font_shadow"] = "NONE",
						["font_size"] = 18,
						["mythic_dungeon_enabled"] = true,
						["sample_size"] = 5,
						["font_face"] = "Friz Quadrata TT",
						["frame"] = {
							["show_title"] = false,
							["strata"] = "LOW",
							["backdrop_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								0.2, -- [4]
							},
							["locked"] = false,
							["height"] = 65,
							["width"] = 220,
						},
						["update_interval"] = 0.1,
						["options_frame"] = {
						},
					},
					["data_cleanup_logout"] = false,
					["instances_disable_bar_highlight"] = false,
					["trash_concatenate"] = false,
					["color_by_arena_team"] = true,
					["animation_speed"] = 33,
					["disable_stretch_from_toolbar"] = false,
					["disable_lock_ungroup_buttons"] = false,
					["memory_ram"] = 64,
					["disable_window_groups"] = false,
					["instances_suppress_trash"] = 0,
					["options_window"] = {
						["scale"] = 1,
					},
					["animation_speed_maxtravel"] = 3,
					["instances_segments_locked"] = false,
					["deadlog_limit"] = 16,
					["font_faces"] = {
						["menus"] = "Friz Quadrata TT",
					},
					["instances_no_libwindow"] = false,
					["instances"] = {
						{
							["__pos"] = {
								["normal"] = {
									["y"] = -449.3264108407981,
									["x"] = 671.7154578780743,
									["w"] = 246.60205078125,
									["h"] = 232.6898345947266,
								},
								["solo"] = {
									["y"] = 2,
									["x"] = 1,
									["w"] = 300,
									["h"] = 200,
								},
							},
							["hide_in_combat_type"] = 1,
							["clickthrough_window"] = false,
							["menu_anchor"] = {
								12, -- [1]
								0, -- [2]
								["side"] = 2,
							},
							["bg_r"] = 0.06274509803921569,
							["hide_out_of_combat"] = false,
							["color_buttons"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
							["micro_displays_locked"] = true,
							["fontstrings_width"] = 35,
							["tooltip"] = {
								["n_abilities"] = 3,
								["n_enemies"] = 3,
							},
							["switch_all_roles_in_combat"] = false,
							["clickthrough_toolbaricons"] = false,
							["row_info"] = {
								["textR_outline"] = false,
								["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
								["textL_outline"] = false,
								["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
								["textR_show_data"] = {
									true, -- [1]
									true, -- [2]
									true, -- [3]
								},
								["percent_type"] = 1,
								["fixed_text_color"] = {
									0.956862745098039, -- [1]
									0.980392156862745, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["space"] = {
									["right"] = 0,
									["left"] = 0,
									["between"] = -1,
								},
								["texture_background_class_color"] = false,
								["start_after_icon"] = true,
								["font_face_file"] = "Fonts\\FRIZQT__.TTF",
								["textL_custom_text"] = "{data3}{data2}",
								["models"] = {
									["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
									["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
									["upper_alpha"] = 0.501719892024994,
									["lower_enabled"] = false,
									["lower_alpha"] = 0.1,
									["upper_enabled"] = false,
								},
								["textL_translit_text"] = false,
								["height"] = 30,
								["texture_file"] = "Interface\\TargetingFrame\\UI-StatusBar",
								["texture_custom_file"] = "Interface\\",
								["font_size"] = 13,
								["icon_file"] = "Interface\\AddOns\\Details\\images\\classes",
								["icon_grayscale"] = false,
								["backdrop"] = {
									["enabled"] = true,
									["size"] = 1,
									["color"] = {
										0, -- [1]
										0, -- [2]
										0, -- [3]
										0, -- [4]
									},
									["texture"] = "ElvUI GlowBorder",
								},
								["use_spec_icons"] = true,
								["textR_enable_custom_text"] = true,
								["texture"] = "Atrocity",
								["fixed_texture_color"] = {
									0.06274509803921569, -- [1]
									0.06274509803921569, -- [2]
									0.06274509803921569, -- [3]
									0.6831168532371521, -- [4]
								},
								["textL_show_number"] = false,
								["textL_enable_custom_text"] = true,
								["textL_outline_small"] = true,
								["textR_custom_text"] = "{data1} ({data2}, {data3})",
								["fixed_texture_background_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									0.188838005065918, -- [4]
								},
								["texture_custom"] = "",
								["texture_background_file"] = "Interface\\TargetingFrame\\UI-StatusBar",
								["textL_class_colors"] = false,
								["alpha"] = 0.6831168532371521,
								["textR_class_colors"] = false,
								["texture_background"] = "Atrocity",
								["textR_outline_small_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["no_icon"] = false,
								["icon_offset"] = {
									0, -- [1]
									0, -- [2]
								},
								["textR_outline_small"] = true,
								["font_face"] = "Expressway",
								["texture_class_colors"] = false,
								["textL_outline_small_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["fast_ps_update"] = false,
								["textR_separator"] = "NONE",
								["textR_bracket"] = "[",
							},
							["ignore_mass_showhide"] = false,
							["plugins_grow_direction"] = 1,
							["menu_icons"] = {
								true, -- [1]
								true, -- [2]
								true, -- [3]
								true, -- [4]
								true, -- [5]
								false, -- [6]
								["space"] = 2,
								["shadow"] = false,
							},
							["desaturated_menu"] = false,
							["micro_displays_side"] = 1,
							["window_scale"] = 0.7793505787849426,
							["hide_icon"] = false,
							["toolbar_side"] = 1,
							["bg_g"] = 0.06274509803921569,
							["menu_icons_alpha"] = 0.5,
							["bg_b"] = 0.06274509803921569,
							["switch_healer_in_combat"] = false,
							["color"] = {
								0.06274509803921569, -- [1]
								0.06274509803921569, -- [2]
								0.06274509803921569, -- [3]
								0.8500000089406967, -- [4]
							},
							["hide_on_context"] = {
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [1]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [2]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [3]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [4]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [5]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [6]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [7]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [8]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [9]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [10]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [11]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [12]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [13]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [14]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [15]
							},
							["skin"] = "Serenity",
							["following"] = {
								["enabled"] = true,
								["bar_color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
								["text_color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
							},
							["switch_healer"] = false,
							["fontstrings_text2_anchor"] = 70,
							["__snapV"] = false,
							["__snapH"] = true,
							["StatusBarSaved"] = {
								["center"] = "DETAILS_STATUSBAR_PLUGIN_PATTRIBUTE",
								["right"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
								["options"] = {
									["DETAILS_STATUSBAR_PLUGIN_PATTRIBUTE"] = {
										["isHidden"] = true,
										["timeType"] = 1,
										["textYMod"] = -2,
										["textFace"] = "Expressway",
										["textStyle"] = 1,
										["textXMod"] = 6,
										["textAlign"] = 2,
										["textSize"] = 12,
										["textColor"] = {
											1, -- [1]
											1, -- [2]
											1, -- [3]
											1, -- [4]
										},
									},
									["DETAILS_STATUSBAR_PLUGIN_PSEGMENT"] = {
										["isHidden"] = false,
										["textStyle"] = 1,
										["textYMod"] = -2,
										["segmentType"] = 3,
										["textXMod"] = 2,
										["textFace"] = "Expressway",
										["textAlign"] = 1,
										["textSize"] = 12,
										["textColor"] = {
											1, -- [1]
											1, -- [2]
											1, -- [3]
											1, -- [4]
										},
									},
									["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
										["isHidden"] = false,
										["textStyle"] = 1,
										["textYMod"] = -2,
										["textXMod"] = -1,
										["textFace"] = "Expressway",
										["timeType"] = 1,
										["textAlign"] = 3,
										["textSize"] = 12,
										["textColor"] = {
											1, -- [1]
											1, -- [2]
											1, -- [3]
											1, -- [4]
										},
									},
								},
								["left"] = "DETAILS_STATUSBAR_PLUGIN_PSEGMENT",
							},
							["grab_on_top"] = false,
							["__was_opened"] = true,
							["instance_button_anchor"] = {
								-27, -- [1]
								1, -- [2]
							},
							["version"] = 3,
							["fontstrings_text4_anchor"] = 0,
							["__locked"] = true,
							["menu_alpha"] = {
								["enabled"] = false,
								["onenter"] = 1,
								["iconstoo"] = true,
								["ignorebars"] = false,
								["onleave"] = 1,
							},
							["switch_damager"] = false,
							["row_show_animation"] = {
								["anim"] = "Fade",
								["options"] = {
								},
							},
							["bars_inverted"] = false,
							["strata"] = "LOW",
							["clickthrough_incombatonly"] = true,
							["__snap"] = {
								[3] = 2,
							},
							["stretch_button_side"] = 1,
							["hide_in_combat_alpha"] = 0,
							["bars_sort_direction"] = 1,
							["show_statusbar"] = false,
							["libwindow"] = {
								["y"] = 4.92388077302881e-05,
								["x"] = -192.1898512040643,
								["point"] = "BOTTOMRIGHT",
								["scale"] = 0.7793505787849426,
							},
							["statusbar_info"] = {
								["alpha"] = 0.8500000089406967,
								["overlay"] = {
									0.06274509803921569, -- [1]
									0.06274509803921569, -- [2]
									0.06274509803921569, -- [3]
								},
							},
							["backdrop_texture"] = "Details Ground",
							["bars_grow_direction"] = 1,
							["bg_alpha"] = 0,
							["switch_tank_in_combat"] = false,
							["switch_tank"] = false,
							["switch_damager_in_combat"] = false,
							["icon_desaturated"] = false,
							["menu_anchor_down"] = {
								15, -- [1]
								-3, -- [2]
							},
							["auto_current"] = true,
							["clickthrough_rows"] = false,
							["attribute_text"] = {
								["enabled"] = false,
								["shadow"] = false,
								["side"] = 2,
								["text_size"] = 12,
								["custom_text"] = "{name}",
								["text_face"] = "Bazooka",
								["anchor"] = {
									-20, -- [1]
									1, -- [2]
								},
								["show_timer"] = true,
								["enable_custom_text"] = false,
								["text_color"] = {
									0.976470588235294, -- [1]
									1, -- [2]
									0.988235294117647, -- [3]
									1, -- [4]
								},
							},
							["auto_hide_menu"] = {
								["left"] = true,
								["right"] = false,
							},
							["hide_in_combat"] = false,
							["posicao"] = {
								["normal"] = {
									["y"] = -449.3264108407981,
									["x"] = 671.7154578780743,
									["w"] = 246.60205078125,
									["h"] = 232.6898345947266,
								},
								["solo"] = {
									["y"] = 2,
									["x"] = 1,
									["w"] = 300,
									["h"] = 200,
								},
							},
							["switch_all_roles_after_wipe"] = false,
							["skin_custom"] = "",
							["wallpaper"] = {
								["enabled"] = false,
								["width"] = 266.000061035156,
								["texcoord"] = {
									0.0480000019073486, -- [1]
									0.298000011444092, -- [2]
									0.630999984741211, -- [3]
									0.755999984741211, -- [4]
								},
								["overlay"] = {
									0.999997794628143, -- [1]
									0.999997794628143, -- [2]
									0.999997794628143, -- [3]
									0.266666084527969, -- [4]
								},
								["anchor"] = "all",
								["height"] = 225.999984741211,
								["alpha"] = 0.266666680574417,
								["texture"] = "Interface\\AddOns\\Details\\images\\skins\\elvui",
							},
							["total_bar"] = {
								["enabled"] = false,
								["only_in_group"] = true,
								["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
								["color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
							},
							["show_sidebars"] = false,
							["fontstrings_text3_anchor"] = 35,
							["use_multi_fontstrings"] = false,
							["menu_icons_size"] = 0.9099999666213989,
						}, -- [1]
						{
							["__pos"] = {
								["normal"] = {
									["y"] = -449.3264108407981,
									["x"] = 863.9049129575557,
									["w"] = 246.60205078125,
									["h"] = 232.6898345947266,
								},
								["solo"] = {
									["y"] = 2,
									["x"] = 1,
									["w"] = 300,
									["h"] = 200,
								},
							},
							["hide_in_combat_type"] = 1,
							["clickthrough_window"] = false,
							["menu_anchor"] = {
								11.66122436523438, -- [1]
								0, -- [2]
								["side"] = 2,
							},
							["bg_r"] = 0.06274509803921569,
							["hide_out_of_combat"] = false,
							["color_buttons"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
							["micro_displays_locked"] = true,
							["fontstrings_width"] = 35,
							["tooltip"] = {
								["n_abilities"] = 3,
								["n_enemies"] = 3,
							},
							["switch_all_roles_in_combat"] = false,
							["clickthrough_toolbaricons"] = false,
							["row_info"] = {
								["textR_outline"] = false,
								["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
								["textL_outline"] = false,
								["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
								["textR_show_data"] = {
									true, -- [1]
									true, -- [2]
									true, -- [3]
								},
								["percent_type"] = 1,
								["fixed_text_color"] = {
									0.956862745098039, -- [1]
									0.980392156862745, -- [2]
									1, -- [3]
									1, -- [4]
								},
								["space"] = {
									["right"] = 0,
									["left"] = 0,
									["between"] = -1,
								},
								["texture_background_class_color"] = false,
								["start_after_icon"] = true,
								["font_face_file"] = "Fonts\\FRIZQT__.TTF",
								["textL_custom_text"] = "{data3}{data2}",
								["models"] = {
									["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
									["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
									["upper_alpha"] = 0.501719892024994,
									["lower_enabled"] = false,
									["lower_alpha"] = 0.1,
									["upper_enabled"] = false,
								},
								["textL_translit_text"] = false,
								["height"] = 30,
								["texture_file"] = "Interface\\TargetingFrame\\UI-StatusBar",
								["texture_custom_file"] = "Interface\\",
								["font_size"] = 13,
								["icon_file"] = "Interface\\AddOns\\Details\\images\\classes",
								["icon_grayscale"] = false,
								["backdrop"] = {
									["enabled"] = true,
									["size"] = 1,
									["color"] = {
										0, -- [1]
										0, -- [2]
										0, -- [3]
										0, -- [4]
									},
									["texture"] = "ElvUI GlowBorder",
								},
								["use_spec_icons"] = true,
								["textR_enable_custom_text"] = true,
								["texture"] = "Atrocity",
								["fixed_texture_color"] = {
									0.06274509803921569, -- [1]
									0.06274509803921569, -- [2]
									0.06274509803921569, -- [3]
									0.6831168532371521, -- [4]
								},
								["textL_show_number"] = false,
								["textL_enable_custom_text"] = true,
								["textL_outline_small"] = true,
								["textR_custom_text"] = "{data1} ({data2}, {data3})",
								["fixed_texture_background_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									0.188838005065918, -- [4]
								},
								["texture_custom"] = "",
								["texture_background_file"] = "Interface\\TargetingFrame\\UI-StatusBar",
								["textL_class_colors"] = false,
								["alpha"] = 0.6831168532371521,
								["textR_class_colors"] = false,
								["texture_background"] = "Atrocity",
								["textR_outline_small_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["no_icon"] = false,
								["icon_offset"] = {
									0, -- [1]
									0, -- [2]
								},
								["textR_outline_small"] = true,
								["font_face"] = "Expressway",
								["texture_class_colors"] = false,
								["textL_outline_small_color"] = {
									0, -- [1]
									0, -- [2]
									0, -- [3]
									1, -- [4]
								},
								["fast_ps_update"] = false,
								["textR_separator"] = "NONE",
								["textR_bracket"] = "[",
							},
							["ignore_mass_showhide"] = false,
							["plugins_grow_direction"] = 1,
							["menu_icons"] = {
								true, -- [1]
								true, -- [2]
								true, -- [3]
								true, -- [4]
								true, -- [5]
								false, -- [6]
								["space"] = 1,
								["shadow"] = false,
							},
							["desaturated_menu"] = false,
							["micro_displays_side"] = 1,
							["window_scale"] = 0.7793505787849426,
							["hide_icon"] = false,
							["toolbar_side"] = 1,
							["bg_g"] = 0.06274509803921569,
							["menu_icons_alpha"] = 0.5,
							["bg_b"] = 0.06274509803921569,
							["switch_healer_in_combat"] = false,
							["color"] = {
								0.06274509803921569, -- [1]
								0.06274509803921569, -- [2]
								0.06274509803921569, -- [3]
								0.8500000089406967, -- [4]
							},
							["hide_on_context"] = {
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [1]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [2]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [3]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [4]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [5]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [6]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [7]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [8]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [9]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [10]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [11]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [12]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [13]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [14]
								{
									["enabled"] = false,
									["inverse"] = false,
									["value"] = 100,
								}, -- [15]
							},
							["skin"] = "Serenity",
							["following"] = {
								["enabled"] = true,
								["bar_color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
								["text_color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
							},
							["switch_healer"] = false,
							["fontstrings_text2_anchor"] = 70,
							["__snapV"] = false,
							["__snapH"] = true,
							["StatusBarSaved"] = {
								["center"] = "DETAILS_STATUSBAR_PLUGIN_PATTRIBUTE",
								["right"] = "DETAILS_STATUSBAR_PLUGIN_PDPS",
								["options"] = {
									["DETAILS_STATUSBAR_PLUGIN_PDPS"] = {
										["isHidden"] = true,
										["textYMod"] = 0,
										["textXMod"] = 0,
										["textFace"] = "Expressway",
										["textAlign"] = 3,
										["textStyle"] = 2,
										["textSize"] = 12.81804275512695,
										["textColor"] = {
											1, -- [1]
											1, -- [2]
											1, -- [3]
										},
									},
									["DETAILS_STATUSBAR_PLUGIN_PATTRIBUTE"] = {
										["isHidden"] = false,
										["textStyle"] = 2,
										["textYMod"] = -2.117647171020508,
										["textFace"] = "Expressway",
										["textXMod"] = 6,
										["timeType"] = 1,
										["textAlign"] = 2,
										["textSize"] = 12.81804275512695,
										["textColor"] = {
											1, -- [1]
											1, -- [2]
											1, -- [3]
										},
									},
									["DETAILS_STATUSBAR_PLUGIN_CLOCK"] = {
										["isHidden"] = true,
										["timeType"] = 1,
										["textYMod"] = 0,
										["segmentType"] = 2,
										["textFace"] = "Expressway",
										["textStyle"] = 2,
										["textXMod"] = 6,
										["textAlign"] = 1,
										["textSize"] = 12.81804275512695,
										["textColor"] = {
											1, -- [1]
											1, -- [2]
											1, -- [3]
										},
									},
								},
								["left"] = "DETAILS_STATUSBAR_PLUGIN_CLOCK",
							},
							["grab_on_top"] = false,
							["__was_opened"] = true,
							["instance_button_anchor"] = {
								-27, -- [1]
								1, -- [2]
							},
							["version"] = 3,
							["fontstrings_text4_anchor"] = 0,
							["__locked"] = true,
							["menu_alpha"] = {
								["enabled"] = false,
								["onenter"] = 1,
								["iconstoo"] = true,
								["ignorebars"] = false,
								["onleave"] = 1,
							},
							["switch_damager"] = false,
							["row_show_animation"] = {
								["anim"] = "Fade",
								["options"] = {
								},
							},
							["bars_inverted"] = false,
							["strata"] = "LOW",
							["clickthrough_incombatonly"] = true,
							["__snap"] = {
								1, -- [1]
							},
							["stretch_button_side"] = 1,
							["hide_in_combat_alpha"] = 0,
							["bars_sort_direction"] = 1,
							["show_statusbar"] = false,
							["libwindow"] = {
								["y"] = 4.92388077302881e-05,
								["x"] = -0.0004001981433248147,
								["point"] = "BOTTOMRIGHT",
								["scale"] = 0.7793505787849426,
							},
							["statusbar_info"] = {
								["alpha"] = 0.8500000089406967,
								["overlay"] = {
									0.06274509803921569, -- [1]
									0.06274509803921569, -- [2]
									0.06274509803921569, -- [3]
								},
							},
							["backdrop_texture"] = "Details Ground",
							["bars_grow_direction"] = 1,
							["bg_alpha"] = 0,
							["switch_tank_in_combat"] = false,
							["switch_tank"] = false,
							["switch_damager_in_combat"] = false,
							["icon_desaturated"] = false,
							["menu_anchor_down"] = {
								15, -- [1]
								-3, -- [2]
							},
							["auto_current"] = true,
							["clickthrough_rows"] = false,
							["attribute_text"] = {
								["enabled"] = false,
								["shadow"] = false,
								["side"] = 2,
								["text_size"] = 12,
								["custom_text"] = "{name}",
								["text_face"] = "BigNoodleTitling",
								["anchor"] = {
									-20, -- [1]
									1, -- [2]
								},
								["show_timer"] = true,
								["enable_custom_text"] = false,
								["text_color"] = {
									0.976470588235294, -- [1]
									1, -- [2]
									0.988235294117647, -- [3]
									1, -- [4]
								},
							},
							["auto_hide_menu"] = {
								["left"] = true,
								["right"] = false,
							},
							["hide_in_combat"] = false,
							["posicao"] = {
								["normal"] = {
									["y"] = -449.3264108407981,
									["x"] = 863.9049129575557,
									["w"] = 246.60205078125,
									["h"] = 232.6898345947266,
								},
								["solo"] = {
									["y"] = 2,
									["x"] = 1,
									["w"] = 300,
									["h"] = 200,
								},
							},
							["switch_all_roles_after_wipe"] = false,
							["skin_custom"] = "",
							["wallpaper"] = {
								["enabled"] = false,
								["width"] = 266.000061035156,
								["texcoord"] = {
									0.0480000019073486, -- [1]
									0.298000011444092, -- [2]
									0.630999984741211, -- [3]
									0.755999984741211, -- [4]
								},
								["overlay"] = {
									0.999997794628143, -- [1]
									0.999997794628143, -- [2]
									0.999997794628143, -- [3]
									0.266666084527969, -- [4]
								},
								["anchor"] = "all",
								["height"] = 225.999984741211,
								["alpha"] = 0.266666680574417,
								["texture"] = "Interface\\AddOns\\Details\\images\\skins\\elvui",
							},
							["total_bar"] = {
								["enabled"] = false,
								["only_in_group"] = true,
								["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
								["color"] = {
									1, -- [1]
									1, -- [2]
									1, -- [3]
								},
							},
							["show_sidebars"] = false,
							["fontstrings_text3_anchor"] = 35,
							["use_multi_fontstrings"] = false,
							["menu_icons_size"] = 0.9099999666213989,
						}, -- [2]
					},
					["data_broker_text"] = "",
					["segments_amount"] = 18,
					["report_lines"] = 3,
					["clear_ungrouped"] = true,
					["use_battleground_server_parser"] = false,
					["skin"] = "WoW Interface",
					["override_spellids"] = true,
					["use_scroll"] = false,
					["report_schema"] = 1,
					["overall_flag"] = 16,
					["numerical_system"] = 1,
					["minimum_combat_time"] = 5,
					["font_sizes"] = {
						["menus"] = 11,
					},
					["cloud_capture"] = true,
					["damage_taken_everything"] = false,
					["scroll_speed"] = 2,
					["new_window_size"] = {
						["height"] = 130,
						["width"] = 320,
					},
					["chat_tab_embed"] = {
						["enabled"] = false,
						["y_offset"] = 0,
						["x_offset"] = 0,
						["single_window"] = false,
						["w2_pos"] = {
							["point"] = "BOTTOMRIGHT",
							["x_legacy"] = 1170.181527880878,
							["pos_table"] = true,
							["w"] = 208.7378997802734,
							["y"] = 0.0001531874475417631,
							["h"] = 203.5636138916016,
							["scale"] = 1.029999971389771,
							["x"] = -2.318203368748073,
							["y_legacy"] = -615.1645870265571,
						},
						["tab_name"] = "",
						["w1_pos"] = {
							["point"] = "BOTTOMRIGHT",
							["x_legacy"] = 956.1854596924068,
							["pos_table"] = true,
							["w"] = 208.7382354736328,
							["y"] = 0,
							["h"] = 203.5636138916016,
							["scale"] = 1.029999971389771,
							["x"] = -216.3142765261582,
							["y_legacy"] = -615.1647441920765,
						},
					},
					["deadlog_events"] = 32,
					["window_clamp"] = {
						-8, -- [1]
						0, -- [2]
						21, -- [3]
						-14, -- [4]
					},
					["close_shields"] = false,
					["class_coords"] = {
						["HUNTER"] = {
							0, -- [1]
							0.25, -- [2]
							0.25, -- [3]
							0.5, -- [4]
						},
						["WARRIOR"] = {
							0, -- [1]
							0.25, -- [2]
							0, -- [3]
							0.25, -- [4]
						},
						["ROGUE"] = {
							0.49609375, -- [1]
							0.7421875, -- [2]
							0, -- [3]
							0.25, -- [4]
						},
						["MAGE"] = {
							0.25, -- [1]
							0.49609375, -- [2]
							0, -- [3]
							0.25, -- [4]
						},
						["PET"] = {
							0.25, -- [1]
							0.49609375, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["DRUID"] = {
							0.7421875, -- [1]
							0.98828125, -- [2]
							0, -- [3]
							0.25, -- [4]
						},
						["MONK"] = {
							0.5, -- [1]
							0.73828125, -- [2]
							0.5, -- [3]
							0.75, -- [4]
						},
						["DEATHKNIGHT"] = {
							0.25, -- [1]
							0.5, -- [2]
							0.5, -- [3]
							0.75, -- [4]
						},
						["MONSTER"] = {
							0, -- [1]
							0.25, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["UNKNOW"] = {
							0.5, -- [1]
							0.75, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["PRIEST"] = {
							0.49609375, -- [1]
							0.7421875, -- [2]
							0.25, -- [3]
							0.5, -- [4]
						},
						["SHAMAN"] = {
							0.25, -- [1]
							0.49609375, -- [2]
							0.25, -- [3]
							0.5, -- [4]
						},
						["Alliance"] = {
							0.49609375, -- [1]
							0.7421875, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["WARLOCK"] = {
							0.7421875, -- [1]
							0.98828125, -- [2]
							0.25, -- [3]
							0.5, -- [4]
						},
						["DEMONHUNTER"] = {
							0.73828126, -- [1]
							1, -- [2]
							0.5, -- [3]
							0.75, -- [4]
						},
						["Horde"] = {
							0.7421875, -- [1]
							0.98828125, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["PALADIN"] = {
							0, -- [1]
							0.25, -- [2]
							0.5, -- [3]
							0.75, -- [4]
						},
						["UNGROUPPLAYER"] = {
							0.5, -- [1]
							0.75, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
						["ENEMY"] = {
							0, -- [1]
							0.25, -- [2]
							0.75, -- [3]
							1, -- [4]
						},
					},
					["windows_fade_out"] = {
						"out", -- [1]
						0.2, -- [2]
					},
					["disable_alldisplays_window"] = false,
					["standard_skin"] = false,
					["hotcorner_topleft"] = {
						["hide"] = false,
					},
					["trash_auto_remove"] = true,
					["animation_speed_triggertravel"] = 5,
					["clear_graphic"] = true,
					["class_colors"] = {
						["HUNTER"] = {
							0.67, -- [1]
							0.83, -- [2]
							0.45, -- [3]
						},
						["WARRIOR"] = {
							0.78, -- [1]
							0.61, -- [2]
							0.43, -- [3]
						},
						["ROGUE"] = {
							1, -- [1]
							0.96, -- [2]
							0.41, -- [3]
						},
						["MAGE"] = {
							0.41, -- [1]
							0.8, -- [2]
							0.94, -- [3]
						},
						["ARENA_YELLOW"] = {
							0.9, -- [1]
							0.9, -- [2]
							0, -- [3]
						},
						["UNGROUPPLAYER"] = {
							0.4, -- [1]
							0.4, -- [2]
							0.4, -- [3]
						},
						["DRUID"] = {
							1, -- [1]
							0.49, -- [2]
							0.04, -- [3]
						},
						["MONK"] = {
							0, -- [1]
							1, -- [2]
							0.59, -- [3]
						},
						["DEATHKNIGHT"] = {
							0.77, -- [1]
							0.12, -- [2]
							0.23, -- [3]
						},
						["PET"] = {
							0.3, -- [1]
							0.4, -- [2]
							0.5, -- [3]
						},
						["UNKNOW"] = {
							0.2, -- [1]
							0.2, -- [2]
							0.2, -- [3]
						},
						["PRIEST"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["ENEMY"] = {
							0.94117, -- [1]
							0, -- [2]
							0.0196, -- [3]
							1, -- [4]
						},
						["SHAMAN"] = {
							0, -- [1]
							0.44, -- [2]
							0.87, -- [3]
						},
						["WARLOCK"] = {
							0.58, -- [1]
							0.51, -- [2]
							0.79, -- [3]
						},
						["DEMONHUNTER"] = {
							0.64, -- [1]
							0.19, -- [2]
							0.79, -- [3]
						},
						["version"] = 1,
						["NEUTRAL"] = {
							1, -- [1]
							1, -- [2]
							0, -- [3]
						},
						["PALADIN"] = {
							0.96, -- [1]
							0.55, -- [2]
							0.73, -- [3]
						},
						["ARENA_GREEN"] = {
							0.1, -- [1]
							0.85, -- [2]
							0.1, -- [3]
						},
					},
					["segments_auto_erase"] = 1,
					["options_group_edit"] = true,
					["broadcaster_enabled"] = false,
					["minimap"] = {
						["onclick_what_todo"] = 1,
						["radius"] = 160,
						["text_type"] = 1,
						["minimapPos"] = 85.2364513807249,
						["text_format"] = 3,
						["hide"] = true,
					},
					["instances_amount"] = 5,
					["max_window_size"] = {
						["height"] = 450,
						["width"] = 480,
					},
					["deny_score_messages"] = false,
					["only_pvp_frags"] = false,
					["disable_stretch_button"] = false,
					["default_bg_color"] = 0.0941,
					["segments_amount_to_save"] = 18,
					["total_abbreviation"] = 2,
					["segments_panic_mode"] = false,
					["numerical_system_symbols"] = "auto",
					["player_details_window"] = {
						["scale"] = 1,
						["bar_texture"] = "Skyline",
						["skin"] = "ElvUI",
					},
					["row_fade_out"] = {
						"out", -- [1]
						0.2, -- [2]
					},
					["memory_threshold"] = 3,
					["overall_clear_logout"] = false,
					["overall_clear_newboss"] = true,
					["force_activity_time_pvp"] = true,
					["class_icons_small"] = "Interface\\AddOns\\Details\\images\\classes_small",
					["pvp_as_group"] = true,
					["disable_reset_button"] = false,
					["animate_scroll"] = false,
					["death_tooltip_width"] = 350,
					["time_type"] = 2,
					["default_bg_alpha"] = 0.5,
					["time_type_original"] = 2,
				},
			},
			["damage_scroll_auto_open"] = true,
			["tutorial"] = {
				["unlock_button"] = 4,
				["main_help_button"] = 8358,
				["SWITCH_PANEL_FIRST_OPENED"] = true,
				["ATTRIBUTE_SELECT_TUTORIAL1"] = true,
				["MEMORY_USAGE_ALERT1"] = true,
				["logons"] = 8358,
				["MIN_COMBAT_TIME"] = true,
				["STREAMER_FEATURES_POPUP1"] = true,
				["ENCOUNTER_DETAILS_BALLON_TUTORIAL1"] = true,
				["WINDOW_LOCK_UNLOCK1"] = true,
				["DISABLE_ONDEATH_PANEL"] = true,
				["STREAMER_PLUGIN_FIRSTRUN"] = true,
				["ENCOUNTER_BREAKDOWN_PHASES"] = true,
				["bookmark_tutorial"] = true,
				["FULL_DELETE_WINDOW"] = true,
				["DETAILS_INFO_TUTORIAL1"] = true,
				["WINDOW_GROUP_MAKING1"] = true,
				["ENCOUNTER_BREAKDOWN_SPELLAURAS"] = true,
				["alert_frames"] = {
					false, -- [1]
					false, -- [2]
					false, -- [3]
					false, -- [4]
					false, -- [5]
					false, -- [6]
				},
				["version_announce"] = 0,
				["ctrl_click_close_tutorial"] = true,
				["OVERALLDATA_WARNING1"] = 26,
				["DETAILS_INFO_TUTORIAL2"] = 10,
				["OPTIONS_PANEL_OPENED"] = true,
				["HISTORYPANEL_TUTORIAL"] = true,
				["FORGE_TUTORIAL"] = true,
				["ENCOUNTER_BREAKDOWN_CHART"] = true,
				["feedback_window1"] = true,
			},
			["run_code"] = {
				["on_specchanged"] = "\n-- run when the player changes its spec",
				["on_zonechanged"] = "\n-- when the player changes zone, this code will run",
				["on_init"] = "\n-- code to run when Details! initializes, put here code which only will run once\n-- this also will run then the profile is changed\n\n--size of the death log tooltip in the Deaths display (default 350)\nDetails.death_tooltip_width = 350;\n\n--when in arena or battleground, details! silently switch to activity time (goes back to the old setting on leaving, default true)\nDetails.force_activity_time_pvp = true;\n\n--speed of the bar animations (default 33)\nDetails.animation_speed = 33;\n\n--threshold to trigger slow or fast speed (default 0.45)\nDetails.animation_speed_mintravel = 0.45;\n\n--call to update animations\nDetails:RefreshAnimationFunctions();\n\n--max window size, does require a /reload to work (default 480 x 450)\nDetails.max_window_size.width = 480;\nDetails.max_window_size.height = 450;\n\n--use the arena team color as the class color (default true)\nDetails.color_by_arena_team = true;\n\n--use the role icon in the player bar when inside an arena (default false)\nDetails.show_arena_role_icon = false;\n\n--how much time the update warning is shown (default 10)\nDetails.update_warning_timeout = 10;\n\nlocal delScript = function()   \n    print(\"cleaning\")\n    for i=0,4 do\n        for j = 1,32 do\n            local itemLink = select(7,GetContainerItemInfo(i, j))\n            if itemLink then\n                local itemSubType = select(7,GetItemInfo(itemLink))\n                local itemName = GetItemInfo(itemLink)\n                if itemSubType == \"Companion Pets\" then\n                    PickupContainerItem(i, j)\n                    DeleteCursorItem()\n                end\n                if itemName == \"Sack of Plunder\" or itemName == \"Wayfinder's Satchel\" or itemName == \"Seafarer's Coin Pouch\" then\n                    UseContainerItem(i,j)\n                end         \n            end\n        end\n    end\nend\nsetglobal( \"CleanIslandItems\", delScript )\n\nWeakAuras.me = GetUnitName(\"player\",true);\nWeakAuras.myGUID = UnitGUID(\"player\");\n\n--hooksecurefunc(\"CompactUnitFrame_UpdateName\", function(frame)\n       -- if (UnitExists(frame.unit)) then\n       --     frame.name:SetScale(1.5,1.5);\n      --  end\n--end);",
				["on_groupchange"] = "\n-- this code runs when the player enter or leave a group",
				["on_leavecombat"] = "\n-- this code runs when the player leave combat",
				["on_entercombat"] = "\n-- this code runs when the player enters in combat",
			},
			["last_changelog_size"] = 1861,
			["realm_sync"] = true,
			["mythic_plus"] = {
				["make_overall_boss_only"] = false,
				["mythicrun_chart_frame"] = {
					["y"] = -48.99951171875,
					["x"] = -43.999755859375,
					["point"] = "TOPRIGHT",
					["scale"] = 1,
				},
				["merge_boss_trash"] = true,
				["delay_to_show_graphic"] = 20,
				["always_in_combat"] = false,
				["make_overall_when_done"] = true,
				["delete_trash_after_merge"] = true,
				["show_damage_graphic"] = false,
				["mythicrun_chart_frame_ready"] = {
				},
				["boss_dedicated_segment"] = true,
				["mythicrun_chart_frame_minimized"] = {
					["y"] = 6.103515625e-05,
					["x"] = 0,
					["point"] = "CENTER",
					["scale"] = 1,
				},
				["last_mythicrun_chart"] = {
				},
			},
			["damage_scroll_position"] = {
			},
			["exit_errors"] = {
				"v7.3.5.5572 Interface\\AddOns\\Details\\core\\meta.lua:642: attempt to perform arithmetic on field '?' (a nil value)", -- [1]
			},
			["plugin_window_pos"] = {
				["y"] = -105.00537109375,
				["x"] = -220.9787292480469,
				["point"] = "TOP",
				["scale"] = 1,
			},
			["show_totalhitdamage_on_overkill"] = false,
			["createauraframe"] = {
				["y"] = -0.0001220703125,
				["x"] = 0.000244140625,
				["point"] = "CENTER",
				["scale"] = 1,
			},
			["global_plugin_database"] = {
				["DETAILS_PLUGIN_ENCOUNTER_DETAILS"] = {
					["encounter_timers_bw"] = {
					},
					["encounter_timers_dbm"] = {
					},
				},
			},
			["update_warning_timeout"] = 10,
			["savedCustomSpells"] = {
				{
					1, -- [1]
					"Melee", -- [2]
					"Interface\\ICONS\\INV_Sword_04", -- [3]
				}, -- [1]
				{
					2, -- [1]
					"Auto Shot", -- [2]
					"Interface\\ICONS\\INV_Weapon_Bow_07", -- [3]
				}, -- [2]
				{
					4, -- [1]
					"Environment (Drowning)", -- [2]
					"Interface\\ICONS\\Ability_Suffocate", -- [3]
				}, -- [3]
				{
					8, -- [1]
					"Environment (Slime)", -- [2]
					"Interface\\ICONS\\Ability_Creature_Poison_02", -- [3]
				}, -- [4]
				{
					88082, -- [1]
					"Fireball (Mirror Image)", -- [2]
					135812, -- [3]
				}, -- [5]
				{
					94472, -- [1]
					"Atonement (critical)", -- [2]
					135887, -- [3]
				}, -- [6]
				{
					59638, -- [1]
					"Frostbolt (Mirror Image)", -- [2]
					135846, -- [3]
				}, -- [7]
				{
					5, -- [1]
					"Environment (Fatigue)", -- [2]
					"Interface\\ICONS\\Spell_Arcane_MindMastery", -- [3]
				}, -- [8]
				{
					158336, -- [1]
					"Pulverize (wave #1)", -- [2]
					135242, -- [3]
				}, -- [9]
				{
					3, -- [1]
					"Environment (Falling)", -- [2]
					"Interface\\ICONS\\Spell_Magic_FeatherFall", -- [3]
				}, -- [10]
				{
					6, -- [1]
					"Environment (Fire)", -- [2]
					"Interface\\ICONS\\INV_SummerFest_FireSpirit", -- [3]
				}, -- [11]
				{
					224078, -- [1]
					"Devilsaur Shock Leash (trinket)", -- [2]
					136048, -- [3]
				}, -- [12]
				{
					214350, -- [1]
					"Nightmare Essence (trinket)", -- [2]
					1357816, -- [3]
				}, -- [13]
				{
					44461, -- [1]
					"Living Bomb (explosion)", -- [2]
					236220, -- [3]
				}, -- [14]
				{
					213786, -- [1]
					"Nightfall (trinket)", -- [2]
					236168, -- [3]
				}, -- [15]
				{
					120761, -- [1]
					"Glaive Toss (Glaive #2)", -- [2]
					132330, -- [3]
				}, -- [16]
				{
					121414, -- [1]
					"Glaive Toss (Glaive #1)", -- [2]
					132330, -- [3]
				}, -- [17]
				{
					33778, -- [1]
					"Lifebloom (bloom)", -- [2]
					136041, -- [3]
				}, -- [18]
				{
					7, -- [1]
					"Environment (Lava)", -- [2]
					"Interface\\ICONS\\Ability_Rhyolith_Volcano", -- [3]
				}, -- [19]
				{
					158420, -- [1]
					"Pulverize (wave #3)", -- [2]
					135242, -- [3]
				}, -- [20]
				{
					158417, -- [1]
					"Pulverize (wave #2)", -- [2]
					135242, -- [3]
				}, -- [21]
				{
					161612, -- [1]
					"Overflowing Energy (caught)", -- [2]
					841219, -- [3]
				}, -- [22]
				{
					98021, -- [1]
					"Health Exchange", -- [2]
					237586, -- [3]
				}, -- [23]
				{
					161576, -- [1]
					"Overflowing Energy (explosion)", -- [2]
					841219, -- [3]
				}, -- [24]
				{
					237680, -- [1]
					"Howling Blast (AoE)", -- [2]
					135833, -- [3]
				}, -- [25]
				{
					215969, -- [1]
					"Epidemic (AoE)", -- [2]
					136066, -- [3]
				}, -- [26]
				{
					49184, -- [1]
					"Howling Blast (Main Target)", -- [2]
					135833, -- [3]
				}, -- [27]
				{
					70890, -- [1]
					"Scourge Strike (Shadow)", -- [2]
					237530, -- [3]
				}, -- [28]
				{
					212739, -- [1]
					"Epidemic (Main Target)", -- [2]
					136066, -- [3]
				}, -- [29]
				{
					55090, -- [1]
					"Scourge Strike (Physical)", -- [2]
					237530, -- [3]
				}, -- [30]
				{
					278227, -- [1]
					"Barkspines (Trinket)", -- [2]
					134439, -- [3]
				}, -- [31]
				{
					268998, -- [1]
					"Kindled Soul (Trinket)", -- [2]
					651093, -- [3]
				}, -- [32]
				{
					278812, -- [1]
					"Lion's Grace (Trinket)", -- [2]
					464140, -- [3]
				}, -- [33]
				{
					270827, -- [1]
					"Webweaver's Soul Gem (Trinket)", -- [2]
					237431, -- [3]
				}, -- [34]
				{
					279664, -- [1]
					"Bloody Bile (Trinket)", -- [2]
					136007, -- [3]
				}, -- [35]
				{
					278359, -- [1]
					"Blood Hatred (Trinket)", -- [2]
					132175, -- [3]
				}, -- [36]
				{
					278155, -- [1]
					"Lingering Power of Xalzaix (Trinket)", -- [2]
					254105, -- [3]
				}, -- [37]
				{
					271115, -- [1]
					"Ignition Mage's Fuse (Trinket)", -- [2]
					1119937, -- [3]
				}, -- [38]
				{
					277179, -- [1]
					"Rapid Adaptation (Trinket)", -- [2]
					135884, -- [3]
				}, -- [39]
				{
					278057, -- [1]
					"Volatile Blood Explosion (Trinket)", -- [2]
					538040, -- [3]
				}, -- [40]
				{
					277185, -- [1]
					"Dig Deep (Trinket)", -- [2]
					134229, -- [3]
				}, -- [41]
				{
					277187, -- [1]
					"Toughen Up (Trinket)", -- [2]
					135884, -- [3]
				}, -- [42]
				{
					277181, -- [1]
					"Taste of Victory (Trinket)", -- [2]
					135897, -- [3]
				}, -- [43]
				{
					278862, -- [1]
					"Chill of the Runes (Trinket)", -- [2]
					252270, -- [3]
				}, -- [44]
				{
					271462, -- [1]
					"Rotcrusted Voodoo Doll (Trinket)", -- [2]
					1716867, -- [3]
				}, -- [45]
				{
					270925, -- [1]
					"Waterspout (Trinket)", -- [2]
					1698701, -- [3]
				}, -- [46]
				{
					271071, -- [1]
					"Conch of Dark Whispers (Trinket)", -- [2]
					1498840, -- [3]
				}, -- [47]
				{
					271465, -- [1]
					"Rotcrusted Voodoo Doll (Trinket)", -- [2]
					1716867, -- [3]
				}, -- [48]
				{
					278383, -- [1]
					"Ruffling Tempest (Trinket)", -- [2]
					2103829, -- [3]
				}, -- [49]
				{
					271671, -- [1]
					"Cacaphonous Chord (Trinket)", -- [2]
					454048, -- [3]
				}, -- [50]
				{
					196917, -- [1]
					"Light of the Martyr (Damage)", -- [2]
					135938, -- [3]
				}, -- [51]
				{
					228649, -- [1]
					"Blackout Kick (Passive)", -- [2]
					574575, -- [3]
				}, -- [52]
			},
			["item_level_pool"] = {
			},
			["plater"] = {
				["realtime_dps_enabled"] = false,
				["damage_taken_anchor"] = {
					["y"] = 0,
					["x"] = 0,
					["side"] = 7,
				},
				["realtime_dps_player_shadow"] = true,
				["realtime_dps_player_enabled"] = false,
				["realtime_dps_player_size"] = 12,
				["damage_taken_size"] = 12,
				["realtime_dps_color"] = {
					1, -- [1]
					1, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["realtime_dps_anchor"] = {
					["y"] = 0,
					["x"] = 0,
					["side"] = 7,
				},
				["realtime_dps_size"] = 12,
				["damage_taken_shadow"] = true,
				["realtime_dps_player_color"] = {
					1, -- [1]
					1, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["damage_taken_color"] = {
					1, -- [1]
					1, -- [2]
					0, -- [3]
					1, -- [4]
				},
				["realtime_dps_player_anchor"] = {
					["y"] = 0,
					["x"] = 0,
					["side"] = 7,
				},
				["damage_taken_enabled"] = false,
				["realtime_dps_shadow"] = true,
			},
			["raid_data"] = {
			},
			["spellid_ignored"] = {
			},
			["always_use_profile_name"] = key,
			["savedStyles"] = {
				{
					["show_statusbar"] = false,
					["backdrop_texture"] = "None",
					["color"] = {
						0.92156862745098, -- [1]
						0.886274509803922, -- [2]
						1, -- [3]
						0, -- [4]
					},
					["menu_anchor"] = {
						14, -- [1]
						2, -- [2]
						["side"] = 2,
					},
					["bg_r"] = 0.486274509803922,
					["hide_out_of_combat"] = false,
					["following"] = {
						["enabled"] = true,
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["switch_healer"] = false,
					["micro_displays_locked"] = true,
					["bars_inverted"] = false,
					["switch_healer_in_combat"] = false,
					["skin_custom"] = "",
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["name"] = "heh guden",
					["stretch_button_side"] = 1,
					["switch_all_roles_in_combat"] = false,
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["version"] = 3,
					["attribute_text"] = {
						["show_timer"] = {
							true, -- [1]
							true, -- [2]
							true, -- [3]
						},
						["shadow"] = false,
						["side"] = 1,
						["text_color"] = {
							0.949019607843137, -- [1]
							1, -- [2]
							0.968627450980392, -- [3]
							1, -- [4]
						},
						["custom_text"] = "{name}",
						["text_face"] = "BigNoodleTitling",
						["anchor"] = {
							-15, -- [1]
							2, -- [2]
						},
						["enabled"] = true,
						["enable_custom_text"] = false,
						["text_size"] = 13,
					},
					["bars_sort_direction"] = 1,
					["menu_alpha"] = {
						["enabled"] = false,
						["onenter"] = 1,
						["iconstoo"] = true,
						["ignorebars"] = false,
						["onleave"] = 1,
					},
					["menu_icons_size"] = 0.850000023841858,
					["libwindow"] = {
						["y"] = 18.0001831054688,
						["x"] = -200.997924804688,
						["point"] = "BOTTOMRIGHT",
					},
					["switch_damager"] = false,
					["strata"] = "LOW",
					["micro_displays_side"] = 2,
					["window_scale"] = 1,
					["switch_tank"] = false,
					["hide_in_combat_alpha"] = 0,
					["switch_all_roles_after_wipe"] = false,
					["menu_icons"] = {
						true, -- [1]
						true, -- [2]
						true, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = 1,
						["shadow"] = false,
					},
					["desaturated_menu"] = false,
					["statusbar_info"] = {
						["alpha"] = 0,
						["overlay"] = {
							0.92156862745098, -- [1]
							0.886274509803922, -- [2]
							1, -- [3]
						},
					},
					["bars_grow_direction"] = 1,
					["menu_anchor_down"] = {
						16, -- [1]
						-2, -- [2]
					},
					["plugins_grow_direction"] = 1,
					["switch_tank_in_combat"] = false,
					["switch_damager_in_combat"] = false,
					["grab_on_top"] = false,
					["ignore_mass_showhide"] = false,
					["hide_icon"] = true,
					["auto_current"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.486274509803922,
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["hide_in_combat"] = false,
					["hide_in_combat_type"] = 1,
					["auto_hide_menu"] = {
						["left"] = false,
						["right"] = false,
					},
					["skin"] = "ElvUI Style II",
					["wallpaper"] = {
						["enabled"] = true,
						["width"] = 265.999979475717,
						["texcoord"] = {
							0.0480000019073486, -- [1]
							0.298000011444092, -- [2]
							0.630999984741211, -- [3]
							0.755999984741211, -- [4]
						},
						["overlay"] = {
							0.999997794628143, -- [1]
							0.999997794628143, -- [2]
							0.999997794628143, -- [3]
							0.799998223781586, -- [4]
						},
						["anchor"] = "all",
						["height"] = 226.000007591173,
						["alpha"] = 0.800000071525574,
						["texture"] = "Interface\\AddOns\\Details\\images\\skins\\elvui",
					},
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = true,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["show_sidebars"] = true,
					["bg_alpha"] = 1,
					["row_info"] = {
						["textR_outline"] = true,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
						["textL_outline"] = true,
						["textR_outline_small"] = true,
						["textR_show_data"] = {
							true, -- [1]
							true, -- [2]
							true, -- [3]
						},
						["textL_enable_custom_text"] = false,
						["fixed_text_color"] = {
							0.905882352941177, -- [1]
							0.905882352941177, -- [2]
							0.905882352941177, -- [3]
							1, -- [4]
						},
						["space"] = {
							["right_noborder"] = -3,
							["left"] = 1,
							["left_noborder"] = 1,
							["between"] = 0,
							["right"] = -3,
						},
						["texture_background_class_color"] = true,
						["start_after_icon"] = false,
						["font_face_file"] = "Interface\\Addons\\SharedMedia_MyMedia\\font\\BigNoodleTitling.ttf",
						["textL_custom_text"] = "{data1}. {data3}{data2}",
						["font_size"] = 15,
						["texture_custom_file"] = "Interface\\",
						["texture_file"] = "Interface\\AddOns\\ElvUI\\media\\textures\\normTex2.tga",
						["icon_file"] = "",
						["height"] = 30,
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.5,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
						["textR_bracket"] = "{",
						["texture_custom"] = "",
						["backdrop"] = {
							["enabled"] = false,
							["texture"] = "Details BarBorder 1",
							["color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["size"] = 4,
						},
						["fixed_texture_color"] = {
							0.576470588235294, -- [1]
							0.576470588235294, -- [2]
							0.576470588235294, -- [3]
							1, -- [4]
						},
						["textL_show_number"] = true,
						["percent_type"] = 1,
						["textR_enable_custom_text"] = false,
						["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
						["texture"] = "ElvUI Norm",
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["fixed_texture_background_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							0.295484036207199, -- [4]
						},
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["texture_background"] = "Empty",
						["alpha"] = 1,
						["textR_class_colors"] = false,
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["no_icon"] = true,
						["textL_class_colors"] = false,
						["textL_outline_small"] = true,
						["font_face"] = "BigNoodleTitling",
						["texture_class_colors"] = true,
						["texture_background_file"] = "Interface\\Addons\\SharedMedia\\statusbar\\Empty",
						["fast_ps_update"] = false,
						["textR_separator"] = ",",
						["use_spec_icons"] = false,
					},
					["bg_b"] = 0.486274509803922,
				}, -- [1]
				{
					["show_statusbar"] = false,
					["menu_icons_size"] = 0.799999952316284,
					["color"] = {
						0.211764705882353, -- [1]
						0.282352941176471, -- [2]
						0.568627450980392, -- [3]
						0, -- [4]
					},
					["menu_anchor"] = {
						17, -- [1]
						-1, -- [2]
						["side"] = 2,
					},
					["bg_r"] = 0,
					["hide_out_of_combat"] = false,
					["following"] = {
						["enabled"] = true,
						["bar_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
						["text_color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["color_buttons"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["toolbar_icon_file"] = "Interface\\AddOns\\Details\\images\\toolbar_icons",
					["micro_displays_locked"] = true,
					["bg_b"] = 0.454901960784314,
					["skin_custom"] = "",
					["switch_healer"] = false,
					["bars_sort_direction"] = 1,
					["tooltip"] = {
						["n_abilities"] = 3,
						["n_enemies"] = 3,
					},
					["stretch_button_side"] = 1,
					["row_info"] = {
						["textR_outline"] = false,
						["spec_file"] = "Interface\\AddOns\\Details\\images\\spec_icons_normal",
						["textL_outline"] = false,
						["textR_outline_small"] = true,
						["textL_outline_small"] = true,
						["percent_type"] = 1,
						["fixed_text_color"] = {
							0.956862745098039, -- [1]
							0.980392156862745, -- [2]
							1, -- [3]
							1, -- [4]
						},
						["space"] = {
							["right"] = 0,
							["left"] = 0,
							["between"] = 0,
						},
						["texture_background_class_color"] = false,
						["start_after_icon"] = true,
						["font_face_file"] = "Interface\\AddOns\\ElvUI\\media\\fonts\\BigNoodleTitling.ttf",
						["textL_custom_text"] = "{data3}{data2}",
						["font_size"] = 15,
						["height"] = 30,
						["texture_file"] = "Interface\\AddOns\\ElvUI\\media\\textures\\normTex2.tga",
						["texture_custom_file"] = "Interface\\",
						["icon_file"] = "Interface\\AddOns\\Details\\images\\classes_small",
						["icon_grayscale"] = false,
						["models"] = {
							["upper_model"] = "Spells\\AcidBreath_SuperGreen.M2",
							["lower_model"] = "World\\EXPANSION02\\DOODADS\\Coldarra\\COLDARRALOCUS.m2",
							["upper_alpha"] = 0.501719892024994,
							["lower_enabled"] = false,
							["lower_alpha"] = 0.1,
							["upper_enabled"] = false,
						},
						["use_spec_icons"] = true,
						["textR_enable_custom_text"] = true,
						["backdrop"] = {
							["enabled"] = true,
							["size"] = 1,
							["color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								1, -- [4]
							},
							["texture"] = "ElvUI GlowBorder",
						},
						["fixed_texture_color"] = {
							0.101960784313725, -- [1]
							0.101960784313725, -- [2]
							0.101960784313725, -- [3]
							0.851069182157517, -- [4]
						},
						["textL_show_number"] = false,
						["textR_show_data"] = {
							true, -- [1]
							true, -- [2]
							false, -- [3]
						},
						["texture_custom"] = "",
						["textR_custom_text"] = "{data1} ({data2}, {data3}%)",
						["texture"] = "ElvUI Norm",
						["texture_highlight"] = "Interface\\FriendsFrame\\UI-FriendsList-Highlight",
						["textL_enable_custom_text"] = true,
						["texture_background_file"] = "Interface\\AddOns\\ElvUI\\media\\textures\\normTex2.tga",
						["texture_background"] = "ElvUI Norm",
						["alpha"] = 0.851069182157517,
						["textR_class_colors"] = false,
						["textR_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["no_icon"] = false,
						["textL_class_colors"] = false,
						["textL_outline_small_color"] = {
							0, -- [1]
							0, -- [2]
							0, -- [3]
							1, -- [4]
						},
						["font_face"] = "Big Noodle Titling",
						["texture_class_colors"] = false,
						["fixed_texture_background_color"] = {
							0.411764705882353, -- [1]
							0.411764705882353, -- [2]
							0.411764705882353, -- [3]
							0.219142735004425, -- [4]
						},
						["fast_ps_update"] = false,
						["textR_separator"] = "NONE",
						["textR_bracket"] = "[",
					},
					["switch_all_roles_in_combat"] = false,
					["switch_tank_in_combat"] = false,
					["version"] = 3,
					["attribute_text"] = {
						["enabled"] = false,
						["shadow"] = false,
						["side"] = 1,
						["text_size"] = 12,
						["custom_text"] = "{name}",
						["text_face"] = "Big Noodle Titling",
						["anchor"] = {
							-17, -- [1]
							1, -- [2]
						},
						["show_timer"] = {
							true, -- [1]
							true, -- [2]
							true, -- [3]
						},
						["enable_custom_text"] = false,
						["text_color"] = {
							0.976470588235294, -- [1]
							1, -- [2]
							0.988235294117647, -- [3]
							1, -- [4]
						},
					},
					["backdrop_texture"] = "Details Ground",
					["menu_alpha"] = {
						["enabled"] = false,
						["onenter"] = 1,
						["iconstoo"] = true,
						["ignorebars"] = false,
						["onleave"] = 1,
					},
					["hide_in_combat_type"] = 1,
					["auto_hide_menu"] = {
						["left"] = true,
						["right"] = false,
					},
					["desaturated_menu"] = false,
					["strata"] = "LOW",
					["statusbar_info"] = {
						["alpha"] = 0,
						["overlay"] = {
							0.211764705882353, -- [1]
							0.282352941176471, -- [2]
							0.568627450980392, -- [3]
						},
					},
					["bars_grow_direction"] = 1,
					["switch_tank"] = false,
					["hide_in_combat_alpha"] = 0,
					["switch_all_roles_after_wipe"] = false,
					["menu_icons"] = {
						true, -- [1]
						true, -- [2]
						true, -- [3]
						true, -- [4]
						true, -- [5]
						false, -- [6]
						["space"] = 1,
						["shadow"] = false,
					},
					["switch_damager"] = false,
					["micro_displays_side"] = 2,
					["row_show_animation"] = {
						["anim"] = "Fade",
						["options"] = {
						},
					},
					["window_scale"] = 1,
					["libwindow"] = {
						["y"] = 0,
						["x"] = -205.999877929688,
						["point"] = "BOTTOMRIGHT",
						["scale"] = 1,
					},
					["switch_healer_in_combat"] = false,
					["menu_anchor_down"] = {
						15, -- [1]
						-3, -- [2]
					},
					["switch_damager_in_combat"] = false,
					["hide_icon"] = true,
					["grab_on_top"] = false,
					["auto_current"] = true,
					["toolbar_side"] = 1,
					["bg_g"] = 0.0509803921568627,
					["show_sidebars"] = false,
					["hide_in_combat"] = false,
					["plugins_grow_direction"] = 1,
					["ignore_mass_showhide"] = false,
					["skin"] = "Serenity",
					["wallpaper"] = {
						["enabled"] = false,
						["width"] = 266.000061035156,
						["texcoord"] = {
							0.0480000019073486, -- [1]
							0.298000011444092, -- [2]
							0.630999984741211, -- [3]
							0.755999984741211, -- [4]
						},
						["overlay"] = {
							0.999997794628143, -- [1]
							0.999997794628143, -- [2]
							0.999997794628143, -- [3]
							0.266666084527969, -- [4]
						},
						["anchor"] = "all",
						["height"] = 225.999984741211,
						["alpha"] = 0.266666680574417,
						["texture"] = "Interface\\AddOns\\Details\\images\\skins\\elvui",
					},
					["total_bar"] = {
						["enabled"] = false,
						["only_in_group"] = true,
						["icon"] = "Interface\\ICONS\\INV_Sigil_Thorim",
						["color"] = {
							1, -- [1]
							1, -- [2]
							1, -- [3]
						},
					},
					["name"] = "Frag BFA",
					["instance_button_anchor"] = {
						-27, -- [1]
						1, -- [2]
					},
					["bg_alpha"] = 0,
					["bars_inverted"] = false,
				}, -- [2]
			},
			["always_use_profile_exception"] = {
				["Sliddy"] = true,
			},
			["details_auras"] = {
			},
			["switchSaved"] = {
				["slots"] = 24,
				["table"] = {
					{
						["atributo"] = 1,
						["sub_atributo"] = 1,
					}, -- [1]
					{
						["atributo"] = 2,
						["sub_atributo"] = 1,
					}, -- [2]
					{
						["atributo"] = 1,
						["sub_atributo"] = 6,
					}, -- [3]
					{
						["atributo"] = 4,
						["sub_atributo"] = 5,
					}, -- [4]
					{
						["atributo"] = 4,
						["sub_atributo"] = 7,
					}, -- [5]
					{
						["atributo"] = 4,
						["sub_atributo"] = 3,
					}, -- [6]
					{
						["atributo"] = 4,
						["sub_atributo"] = 8,
					}, -- [7]
					{
						["atributo"] = 4,
						["sub_atributo"] = 1,
					}, -- [8]
					{
						["atributo"] = 1,
						["sub_atributo"] = 3,
					}, -- [9]
					{
						["atributo"] = 1,
						["sub_atributo"] = 8,
					}, -- [10]
					{
						["atributo"] = 4,
						["sub_atributo"] = 4,
					}, -- [11]
					{
						["atributo"] = 1,
						["sub_atributo"] = 4,
					}, -- [12]
					{
						["atributo"] = 4,
						["sub_atributo"] = 8,
					}, -- [13]
					{
						["atributo"] = 2,
						["sub_atributo"] = 3,
					}, -- [14]
					{
						["atributo"] = 2,
						["sub_atributo"] = 5,
					}, -- [15]
					{
						["atributo"] = 1,
						["sub_atributo"] = 4,
					}, -- [16]
					{
						["atributo"] = 1,
						["sub_atributo"] = 6,
					}, -- [17]
					{
						["atributo"] = 1,
						["sub_atributo"] = 5,
					}, -- [18]
					{
						["atributo"] = "plugin",
						["sub_atributo"] = "DETAILS_PLUGIN_TINY_THREAT",
					}, -- [19]
					{
						["atributo"] = 5,
						["sub_atributo"] = 3,
					}, -- [20]
					{
						["atributo"] = 4,
						["sub_atributo"] = 4,
					}, -- [21]
					{
						["atributo"] = 5,
						["sub_atributo"] = 8,
					}, -- [22]
					{
						["atributo"] = 5,
						["sub_atributo"] = 9,
					}, -- [23]
					{
						["atributo"] = 5,
						["sub_atributo"] = 5,
					}, -- [24]
					{
						["atributo"] = 1,
						["sub_atributo"] = 7,
					}, -- [25]
					{
						["atributo"] = 3,
						["sub_atributo"] = 5,
					}, -- [26]
					{
						["atributo"] = 3,
						["sub_atributo"] = 5,
					}, -- [27]
					{
						["atributo"] = 5,
						["sub_atributo"] = 1,
					}, -- [28]
					{
						["atributo"] = 5,
						["sub_atributo"] = 2,
					}, -- [29]
					{
					}, -- [30]
					{
					}, -- [31]
					{
					}, -- [32]
					{
					}, -- [33]
					{
					}, -- [34]
					{
					}, -- [35]
					{
					}, -- [36]
					{
					}, -- [37]
					{
					}, -- [38]
					{
					}, -- [39]
					{
					}, -- [40]
				},
			},
			["savedTimeCaptures"] = {
			},
			["latest_news_saw"] = "v9.0.1.7933",
			["custom"] = {
				{
					["source"] = false,
					["author"] = "Details!",
					["total_script"] = "				local value, top, total, combat, instance = ...\n				return floor (value)\n			",
					["desc"] = "Show the crowd control amount for each player.",
					["attribute"] = false,
					["script"] = "				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n\n				local misc_actors = combat:GetActorList (DETAILS_ATTRIBUTE_MISC)\n\n				for index, character in ipairs (misc_actors) do\n					if (character.cc_done and character:IsPlayer()) then\n						local cc_done = floor (character.cc_done)\n						instance_container:AddValue (character, cc_done)\n						total = total + cc_done\n						if (cc_done > top) then\n							top = cc_done\n						end\n						amount = amount + 1\n					end\n				end\n\n				return total, top, amount\n			",
					["name"] = "Crowd Control Done",
					["tooltip"] = "				local actor, combat, instance = ...\n				local spells = {}\n				for spellid, spell in pairs (actor.cc_done_spells._ActorTable) do\n				    tinsert (spells, {spellid, spell.counter})\n				end\n\n				table.sort (spells, _detalhes.Sort2)\n\n				for index, spell in ipairs (spells) do\n				    local name, _, icon = GetSpellInfo (spell [1])\n				    GameCooltip:AddLine (name, spell [2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    GameCooltip:AddIcon (icon, 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				end\n\n				local targets = {}\n				for playername, amount in pairs (actor.cc_done_targets) do\n				    tinsert (targets, {playername, amount})\n				end\n\n				table.sort (targets, _detalhes.Sort2)\n\n				_detalhes:AddTooltipSpellHeaderText (\"Targets\", \"yellow\", #targets)\n				local class, _, _, _, _, r, g, b = _detalhes:GetClass (actor.nome)\n				_detalhes:AddTooltipHeaderStatusbar (1, 1, 1, 0.6)\n\n				for index, target in ipairs (targets) do\n				    GameCooltip:AddLine (target[1], target [2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    \n				    local class, _, _, _, _, r, g, b = _detalhes:GetClass (target [1])\n				    if (class and class ~= \"UNKNOW\") then\n					local texture, l, r, t, b = _detalhes:GetClassIcon (class)\n					GameCooltip:AddIcon (\"Interface\\\\AddOns\\\\Details\\\\images\\\\classes_small_alpha\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height, l, r, t, b)\n				    else\n					GameCooltip:AddIcon (\"Interface\\\\GossipFrame\\\\IncompleteQuestIcon\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    end\n				    --\n				end\n			",
					["target"] = false,
					["spellid"] = false,
					["icon"] = "Interface\\ICONS\\Spell_Frost_FreezingBreath",
					["script_version"] = 11,
				}, -- [1]
				{
					["source"] = false,
					["author"] = "Details!",
					["desc"] = "Show the amount of crowd control received for each player.",
					["total_script"] = "				local value, top, total, combat, instance = ...\n				return floor (value)\n			",
					["icon"] = "Interface\\ICONS\\Spell_Frost_ChainsOfIce",
					["spellid"] = false,
					["name"] = "Crowd Control Received",
					["tooltip"] = "				local actor, combat, instance = ...\n				local name = actor:name()\n				local spells, from = {}, {}\n				local misc_actors = combat:GetActorList (DETAILS_ATTRIBUTE_MISC)\n\n				for index, character in ipairs (misc_actors) do\n				    if (character.cc_done and character:IsPlayer()) then\n					local on_actor = character.cc_done_targets [name]\n					if (on_actor) then\n					    tinsert (from, {character:name(), on_actor})\n					    \n					    for spellid, spell in pairs (character.cc_done_spells._ActorTable) do\n						\n						local spell_on_actor = spell.targets [name]\n						if (spell_on_actor) then\n						    local has_spell\n						    for index, spell_table in ipairs (spells) do\n							if (spell_table [1] == spellid) then\n							    spell_table [2] = spell_table [2] + spell_on_actor\n							    has_spell = true\n							end\n						    end\n						    if (not has_spell) then\n							tinsert (spells, {spellid, spell_on_actor}) \n						    end\n						end\n						\n					    end            \n					end\n				    end\n				end\n\n				table.sort (from, _detalhes.Sort2)\n				table.sort (spells, _detalhes.Sort2)\n\n				for index, spell in ipairs (spells) do\n				    local name, _, icon = GetSpellInfo (spell [1])\n				    GameCooltip:AddLine (name, spell [2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    GameCooltip:AddIcon (icon, 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)    \n				end\n\n				_detalhes:AddTooltipSpellHeaderText (\"From\", \"yellow\", #from)\n				_detalhes:AddTooltipHeaderStatusbar (1, 1, 1, 0.6)\n\n				for index, t in ipairs (from) do\n				    GameCooltip:AddLine (t[1], t[2])\n				    _detalhes:AddTooltipBackgroundStatusbar()\n				    \n				    local class, _, _, _, _, r, g, b = _detalhes:GetClass (t [1])\n				    if (class and class ~= \"UNKNOW\") then\n					local texture, l, r, t, b = _detalhes:GetClassIcon (class)\n					GameCooltip:AddIcon (\"Interface\\\\AddOns\\\\Details\\\\images\\\\classes_small_alpha\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height, l, r, t, b)\n				    else\n					GameCooltip:AddIcon (\"Interface\\\\GossipFrame\\\\IncompleteQuestIcon\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    end     \n				    \n				end\n			",
					["target"] = false,
					["script"] = "				local combat, instance_container, instance = ...\n				local total, top, amt = 0, 0, 0\n\n				local misc_actors = combat:GetActorList (DETAILS_ATTRIBUTE_MISC)\n				DETAILS_CUSTOM_CC_RECEIVED_CACHE = DETAILS_CUSTOM_CC_RECEIVED_CACHE or {}\n				wipe (DETAILS_CUSTOM_CC_RECEIVED_CACHE)\n\n				for index, character in ipairs (misc_actors) do\n				    if (character.cc_done and character:IsPlayer()) then\n					\n					for player_name, amount in pairs (character.cc_done_targets) do\n					    local target = combat (1, player_name) or combat (2, player_name)\n					    if (target and target:IsPlayer()) then\n						instance_container:AddValue (target, amount)\n						total = total + amount\n						if (amount > top) then\n						    top = amount\n						end\n						if (not DETAILS_CUSTOM_CC_RECEIVED_CACHE [player_name]) then\n						    DETAILS_CUSTOM_CC_RECEIVED_CACHE [player_name] = true\n						    amt = amt + 1\n						end\n					    end\n					end\n					\n				    end\n				end\n\n				return total, top, amt\n			",
					["attribute"] = false,
					["script_version"] = 3,
				}, -- [2]
				{
					["source"] = false,
					["author"] = "Details!",
					["percent_script"] = "				local value, top, total, combat, instance = ...\n				local dps = _detalhes:ToK (floor (value) / combat:GetCombatTime())\n				local percent = string.format (\"%.1f\", value/total*100)\n				return dps .. \", \" .. percent\n			",
					["desc"] = "Show your spells in the window.",
					["tooltip"] = "			--config:\n			--Background RBG and Alpha:\n			local R, G, B, A = 0, 0, 0, 0.75\n			local R, G, B, A = 0.1960, 0.1960, 0.1960, 0.8697\n\n			--get the parameters passed\n			local spell, combat, instance = ...\n\n			--get the cooltip object (we dont use the convencional GameTooltip here)\n			local GC = GameCooltip\n			GC:SetOption (\"YSpacingMod\", 0)\n\n			local role = DetailsFramework.UnitGroupRolesAssigned (\"player\")\n\n			if (spell.n_dmg) then\n			    \n			    local spellschool, schooltext = spell.spellschool, \"\"\n			    if (spellschool) then\n				local t = _detalhes.spells_school [spellschool]\n				if (t and t.name) then\n				    schooltext = t.formated\n				end\n			    end\n			    \n			    local total_hits = spell.counter\n			    local combat_time = instance.showing:GetCombatTime()\n			    \n			    local debuff_uptime_total, cast_string = \"\", \"\"\n			    local misc_actor = instance.showing (4, _detalhes.playername)\n			    if (misc_actor) then\n				local debuff_uptime = misc_actor.debuff_uptime_spells and misc_actor.debuff_uptime_spells._ActorTable [spell.id] and misc_actor.debuff_uptime_spells._ActorTable [spell.id].uptime\n				if (debuff_uptime) then\n				    debuff_uptime_total = floor (debuff_uptime / instance.showing:GetCombatTime() * 100)\n				end\n				\n				local spell_cast = misc_actor.spell_cast and misc_actor.spell_cast [spell.id]\n				\n				if (not spell_cast and misc_actor.spell_cast) then\n				    local spellname = GetSpellInfo (spell.id)\n				    for casted_spellid, amount in pairs (misc_actor.spell_cast) do\n					local casted_spellname = GetSpellInfo (casted_spellid)\n					if (casted_spellname == spellname) then\n					    spell_cast = amount .. \" (|cFFFFFF00?|r)\"\n					end\n				    end\n				end\n				if (not spell_cast) then\n				    spell_cast = \"(|cFFFFFF00?|r)\"\n				end\n				cast_string = cast_string .. spell_cast\n			    end\n			    \n			    --Cooltip code\n			    GC:AddLine (\"Casts:\", cast_string or \"?\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    if (debuff_uptime_total ~= \"\") then\n				GC:AddLine (\"Uptime:\", (debuff_uptime_total or \"?\") .. \"%\")\n				GC:AddStatusBar (100, 1, R, G, B, A)\n			    end\n			    \n			    GC:AddLine (\"Hits:\", spell.counter)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local average = spell.total / total_hits\n			    GC:AddLine (\"Average:\", _detalhes:ToK (average))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"E-Dps:\", _detalhes:ToK (spell.total / combat_time))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"School:\", schooltext)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Normal Hits: \", spell.n_amt .. \" (\" ..floor ( spell.n_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local n_average = spell.n_dmg / spell.n_amt\n			    local T = (combat_time*spell.n_dmg)/spell.total\n			    local P = average/n_average*100\n			    T = P*T/100\n			    \n			    GC:AddLine (\"Average / E-Dps: \",  _detalhes:ToK (n_average) .. \" / \" .. format (\"%.1f\",spell.n_dmg / T ))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Critical Hits: \", spell.c_amt .. \" (\" ..floor ( spell.c_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    if (spell.c_amt > 0) then\n				local c_average = spell.c_dmg/spell.c_amt\n				local T = (combat_time*spell.c_dmg)/spell.total\n				local P = average/c_average*100\n				T = P*T/100\n				local crit_dps = spell.c_dmg / T\n				\n				GC:AddLine (\"Average / E-Dps: \",  _detalhes:ToK (c_average) .. \" / \" .. _detalhes:comma_value (crit_dps))\n			    else\n				GC:AddLine (\"Average / E-Dps: \",  \"0 / 0\")    \n			    end\n			    \n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Multistrike: \", spell.m_amt .. \" (\" ..floor ( spell.m_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"On Normal / On Critical:\", spell.m_amt - spell.m_crit .. \"  / \" .. spell.m_crit)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			elseif (spell.n_curado) then\n			    \n			    local spellschool, schooltext = spell.spellschool, \"\"\n			    if (spellschool) then\n				local t = _detalhes.spells_school [spellschool]\n				if (t and t.name) then\n				    schooltext = t.formated\n				end\n			    end\n			    \n			    local total_hits = spell.counter\n			    local combat_time = instance.showing:GetCombatTime()\n			    \n			    --Cooltip code\n			    GC:AddLine (\"Hits:\", spell.counter)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local average = spell.total / total_hits\n			    GC:AddLine (\"Average:\", _detalhes:ToK (average))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"E-Hps:\", _detalhes:ToK (spell.total / combat_time))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"School:\", schooltext)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Normal Hits: \", spell.n_amt .. \" (\" ..floor ( spell.n_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    local n_average = spell.n_curado / spell.n_amt\n			    local T = (combat_time*spell.n_curado)/spell.total\n			    local P = average/n_average*100\n			    T = P*T/100\n			    \n			    GC:AddLine (\"Average / E-Dps: \",  _detalhes:ToK (n_average) .. \" / \" .. format (\"%.1f\",spell.n_curado / T ))\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Critical Hits: \", spell.c_amt .. \" (\" ..floor ( spell.c_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    if (spell.c_amt > 0) then\n				local c_average = spell.c_curado/spell.c_amt\n				local T = (combat_time*spell.c_curado)/spell.total\n				local P = average/c_average*100\n				T = P*T/100\n				local crit_dps = spell.c_curado / T\n				\n				GC:AddLine (\"Average / E-Hps: \",  _detalhes:ToK (c_average) .. \" / \" .. _detalhes:comma_value (crit_dps))\n			    else\n				GC:AddLine (\"Average / E-Hps: \",  \"0 / 0\")    \n			    end\n			    \n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    --GC:AddLine (\" \")\n			    \n			    GC:AddLine (\"Multistrike: \", spell.m_amt .. \" (\" ..floor ( spell.m_amt/total_hits*100) .. \"%)\")\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			    \n			    GC:AddLine (\"On Normal / On Critical:\", spell.m_amt - spell.m_crit .. \"  / \" .. spell.m_crit)\n			    GC:AddStatusBar (100, 1, R, G, B, A)\n			end\n			",
					["icon"] = "Interface\\CHATFRAME\\UI-ChatIcon-Battlenet",
					["name"] = "My Spells",
					["spellid"] = false,
					["target"] = false,
					["script"] = "				--get the parameters passed\n				local combat, instance_container, instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n\n				local player\n				local pet_attribute\n				\n				local role = DetailsFramework.UnitGroupRolesAssigned (\"player\")\n				local spec = DetailsFramework.GetSpecialization()\n				role = spec and DetailsFramework.GetSpecializationRole (spec) or role\n\n				if (role == \"DAMAGER\") then\n					player = combat (DETAILS_ATTRIBUTE_DAMAGE, _detalhes.playername)\n					pet_attribute = DETAILS_ATTRIBUTE_DAMAGE\n				elseif (role == \"HEALER\") then    \n					player = combat (DETAILS_ATTRIBUTE_HEAL, _detalhes.playername)\n					pet_attribute = DETAILS_ATTRIBUTE_HEAL\n				else\n					player = combat (DETAILS_ATTRIBUTE_DAMAGE, _detalhes.playername)\n					pet_attribute = DETAILS_ATTRIBUTE_DAMAGE\n				end\n\n				--do the loop\n\n				if (player) then\n					local spells = player:GetSpellList()\n					for spellid, spell in pairs (spells) do\n						instance_container:AddValue (spell, spell.total)\n						total = total + spell.total\n						if (top < spell.total) then\n							top = spell.total\n						end\n						amount = amount + 1\n					end\n				    \n					for _, PetName in ipairs (player.pets) do\n						local pet = combat (pet_attribute, PetName)\n						if (pet) then\n							for spellid, spell in pairs (pet:GetSpellList()) do\n								instance_container:AddValue (spell, spell.total, nil, \" (\" .. PetName:gsub ((\" <.*\"), \"\") .. \")\")\n								total = total + spell.total\n								if (top < spell.total) then\n									top = spell.total\n								end\n								amount = amount + 1\n							end\n						end\n					end\n				end\n\n				--return the values\n				return total, top, amount\n			",
					["attribute"] = false,
					["script_version"] = 7,
				}, -- [3]
				{
					["source"] = false,
					["author"] = "Details!",
					["desc"] = "Show the amount of damage applied on targets marked with skull.",
					["tooltip"] = "				--get the parameters passed\n				local actor, combat, instance = ...\n\n				--get the cooltip object (we dont use the convencional GameTooltip here)\n				local GameCooltip = GameCooltip\n\n				--Cooltip code\n				local format_func = Details:GetCurrentToKFunction()\n\n				--Cooltip code\n				local RaidTargets = actor.raid_targets\n\n				local DamageOnStar = RaidTargets [128]\n				if (DamageOnStar) then\n				    --RAID_TARGET_8 is the built-in localized word for 'Skull'.\n				    GameCooltip:AddLine (RAID_TARGET_8 .. \":\", format_func (_, DamageOnStar))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_8\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n			",
					["attribute"] = false,
					["name"] = "Damage On Skull Marked Targets",
					["script"] = "				--get the parameters passed\n				local Combat, CustomContainer, Instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n				\n				--raid target flags: \n				-- 128: skull \n				-- 64: cross\n				-- 32: square\n				-- 16: moon\n				-- 8: triangle\n				-- 4: diamond\n				-- 2: circle\n				-- 1: star\n				\n				--do the loop\n				for _, actor in ipairs (Combat:GetActorList (DETAILS_ATTRIBUTE_DAMAGE)) do\n				    if (actor:IsPlayer()) then\n					if (actor.raid_targets [128]) then\n					    CustomContainer:AddValue (actor, actor.raid_targets [128])\n					end        \n				    end\n				end\n\n				--if not managed inside the loop, get the values of total, top and amount\n				total, top = CustomContainer:GetTotalAndHighestValue()\n				amount = CustomContainer:GetNumActors()\n\n				--return the values\n				return total, top, amount\n			",
					["target"] = false,
					["spellid"] = false,
					["icon"] = "Interface\\TARGETINGFRAME\\UI-RaidTargetingIcon_8",
					["script_version"] = 3,
				}, -- [4]
				{
					["source"] = false,
					["author"] = "Details!",
					["desc"] = "Show the amount of damage applied on targets marked with any other mark.",
					["tooltip"] = "				--get the parameters passed\n				local actor, combat, instance = ...\n\n				--get the cooltip object\n				local GameCooltip = GameCooltip\n\n				local format_func = Details:GetCurrentToKFunction()\n\n				--Cooltip code\n				local RaidTargets = actor.raid_targets\n\n				local DamageOnStar = RaidTargets [1]\n				if (DamageOnStar) then\n				    GameCooltip:AddLine (RAID_TARGET_1 .. \":\", format_func (_, DamageOnStar))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_1\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnCircle = RaidTargets [2]\n				if (DamageOnCircle) then\n				    GameCooltip:AddLine (RAID_TARGET_2 .. \":\", format_func (_, DamageOnCircle))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_2\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnDiamond = RaidTargets [4]\n				if (DamageOnDiamond) then\n				    GameCooltip:AddLine (RAID_TARGET_3 .. \":\", format_func (_, DamageOnDiamond))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_3\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnTriangle = RaidTargets [8]\n				if (DamageOnTriangle) then\n				    GameCooltip:AddLine (RAID_TARGET_4 .. \":\", format_func (_, DamageOnTriangle))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_4\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnMoon = RaidTargets [16]\n				if (DamageOnMoon) then\n				    GameCooltip:AddLine (RAID_TARGET_5 .. \":\", format_func (_, DamageOnMoon))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_5\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnSquare = RaidTargets [32]\n				if (DamageOnSquare) then\n				    GameCooltip:AddLine (RAID_TARGET_6 .. \":\", format_func (_, DamageOnSquare))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_6\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n\n				local DamageOnCross = RaidTargets [64]\n				if (DamageOnCross) then\n				    GameCooltip:AddLine (RAID_TARGET_7 .. \":\", format_func (_, DamageOnCross))\n				    GameCooltip:AddIcon (\"Interface\\\\TARGETINGFRAME\\\\UI-RaidTargetingIcon_7\", 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    Details:AddTooltipBackgroundStatusbar()\n				end\n			",
					["attribute"] = false,
					["name"] = "Damage On Other Marked Targets",
					["script"] = "				--get the parameters passed\n				local Combat, CustomContainer, Instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n\n				--do the loop\n				for _, actor in ipairs (Combat:GetActorList (DETAILS_ATTRIBUTE_DAMAGE)) do\n				    if (actor:IsPlayer()) then\n					local total = (actor.raid_targets [1] or 0) --star\n					total = total + (actor.raid_targets [2] or 0) --circle\n					total = total + (actor.raid_targets [4] or 0) --diamond\n					total = total + (actor.raid_targets [8] or 0) --tiangle\n					total = total + (actor.raid_targets [16] or 0) --moon\n					total = total + (actor.raid_targets [32] or 0) --square\n					total = total + (actor.raid_targets [64] or 0) --cross\n					\n					if (total > 0) then\n					    CustomContainer:AddValue (actor, total)\n					end\n				    end\n				end\n\n				--if not managed inside the loop, get the values of total, top and amount\n				total, top = CustomContainer:GetTotalAndHighestValue()\n				amount = CustomContainer:GetNumActors()\n\n				--return the values\n				return total, top, amount\n			",
					["target"] = false,
					["spellid"] = false,
					["icon"] = "Interface\\TARGETINGFRAME\\UI-RaidTargetingIcon_5",
					["script_version"] = 3,
				}, -- [5]
				{
					["source"] = false,
					["author"] = "Details!",
					["desc"] = "Damage done to shields",
					["tooltip"] = "				--get the parameters passed\n				local actor, Combat, instance = ...\n\n				--get the cooltip object (we dont use the convencional GameTooltip here)\n				local GameCooltip = GameCooltip\n\n				--Cooltip code\n				--get the actor total damage absorbed\n				local totalAbsorb = actor.totalabsorbed\n				local format_func = Details:GetCurrentToKFunction()\n\n				--get the damage absorbed by all the actor pets\n				for petIndex, petName in ipairs (actor.pets) do\n				    local pet = Combat :GetActor (1, petName)\n				    if (pet) then\n					totalAbsorb = totalAbsorb + pet.totalabsorbed\n				    end\n				end\n\n				GameCooltip:AddLine (actor:Name(), format_func (_, actor.totalabsorbed))\n				Details:AddTooltipBackgroundStatusbar()\n\n				for petIndex, petName in ipairs (actor.pets) do\n				    local pet = Combat :GetActor (1, petName)\n				    if (pet) then\n					totalAbsorb = totalAbsorb + pet.totalabsorbed\n					\n					GameCooltip:AddLine (petName, format_func (_, pet.totalabsorbed))\n					Details:AddTooltipBackgroundStatusbar()        \n					\n				    end\n				end\n			",
					["icon"] = "Interface\\ICONS\\Spell_Holy_PowerWordShield",
					["name"] = "Damage on Shields",
					["spellid"] = false,
					["target"] = false,
					["script"] = "				--get the parameters passed\n				local Combat, CustomContainer, Instance = ...\n				--declade the values to return\n				local total, top, amount = 0, 0, 0\n\n				--do the loop\n				for index, actor in ipairs (Combat:GetActorList(1)) do\n				    if (actor:IsPlayer()) then\n					\n					--get the actor total damage absorbed\n					local totalAbsorb = actor.totalabsorbed\n					\n					--get the damage absorbed by all the actor pets\n					for petIndex, petName in ipairs (actor.pets) do\n					    local pet = Combat :GetActor (1, petName)\n					    if (pet) then\n						totalAbsorb = totalAbsorb + pet.totalabsorbed\n					    end\n					end\n					\n					--add the value to the actor on the custom container\n					CustomContainer:AddValue (actor, totalAbsorb)        \n					\n				    end\n				end\n				--loop end\n\n				--if not managed inside the loop, get the values of total, top and amount\n				total, top = CustomContainer:GetTotalAndHighestValue()\n				amount = CustomContainer:GetNumActors()\n\n				--return the values\n				return total, top, amount\n			",
					["attribute"] = false,
					["script_version"] = 1,
				}, -- [6]
				{
					["source"] = false,
					["total_script"] = false,
					["author"] = "Details! Team",
					["percent_script"] = false,
					["desc"] = "Show who in your raid group used the healthstone or a heal potion.",
					["icon"] = "Interface\\ICONS\\INV_Stone_04",
					["spellid"] = false,
					["name"] = "Health Potion & Stone",
					["script"] = "			--get the parameters passed\n			local combat, instance_container, instance = ...\n			--declade the values to return\n			local total, top, amount = 0, 0, 0\n			\n			--do the loop\n			local AllHealCharacters = combat:GetActorList (DETAILS_ATTRIBUTE_HEAL)\n			for index, character in ipairs (AllHealCharacters) do\n				local AllSpells = character:GetSpellList()\n				local found = false\n				for spellid, spell in pairs (AllSpells) do\n					if (DETAILS_HEALTH_POTION_LIST [spellid]) then\n						instance_container:AddValue (character, spell.total)\n						total = total + spell.total\n						if (top < spell.total) then\n							top = spell.total\n						end\n						found = true\n					end\n				end\n			\n				if (found) then\n					amount = amount + 1\n				end\n			end\n			--loop end\n			--return the values\n			return total, top, amount\n			",
					["target"] = false,
					["tooltip"] = "			--get the parameters passed\n			local actor, combat, instance = ...\n			\n			--get the cooltip object (we dont use the convencional GameTooltip here)\n			local GameCooltip = GameCooltip\n			local R, G, B, A = 0, 0, 0, 0.75\n			\n			local hs = actor:GetSpell (6262)\n			if (hs) then\n				GameCooltip:AddLine (select (1, GetSpellInfo(6262)),  _detalhes:ToK(hs.total))\n				GameCooltip:AddIcon (select (3, GetSpellInfo (6262)), 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				GameCooltip:AddStatusBar (100, 1, R, G, B, A)\n			end\n			\n			local pot = actor:GetSpell (DETAILS_HEALTH_POTION_ID)\n			if (pot) then\n				GameCooltip:AddLine (select (1, GetSpellInfo(DETAILS_HEALTH_POTION_ID)),  _detalhes:ToK(pot.total))\n				GameCooltip:AddIcon (select (3, GetSpellInfo (DETAILS_HEALTH_POTION_ID)), 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				GameCooltip:AddStatusBar (100, 1, R, G, B, A)\n			end\n			\n			local pot = actor:GetSpell (DETAILS_REJU_POTION_ID)\n			if (pot) then\n				GameCooltip:AddLine (select (1, GetSpellInfo(DETAILS_REJU_POTION_ID)),  _detalhes:ToK(pot.total))\n				GameCooltip:AddIcon (select (3, GetSpellInfo (DETAILS_REJU_POTION_ID)), 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				GameCooltip:AddStatusBar (100, 1, R, G, B, A)\n			end\n\n			--Cooltip code\n			",
					["attribute"] = false,
					["script_version"] = 15,
				}, -- [7]
				{
					["source"] = false,
					["author"] = "Details!",
					["tooltip"] = "				\n			",
					["percent_script"] = "				local value, top, total, combat, instance = ...\n				return string.format (\"%.1f\", value/top*100)\n			",
					["desc"] = "Tells how much time each character spent doing damage.",
					["icon"] = "Interface\\Buttons\\UI-MicroStream-Red",
					["spellid"] = false,
					["name"] = "Damage Activity Time",
					["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, amount = 0, 0\n\n				--get the misc actor container\n				local damage_container = combat:GetActorList ( DETAILS_ATTRIBUTE_DAMAGE )\n				\n				--do the loop:\n				for _, player in ipairs ( damage_container ) do \n					if (player.grupo) then\n						local activity = player:Tempo()\n						total = total + activity\n						amount = amount + 1\n						--add amount to the player \n						instance_container:AddValue (player, activity)\n					end\n				end\n				\n				--return:\n				return total, combat:GetCombatTime(), amount\n			",
					["target"] = false,
					["total_script"] = "				local value, top, total, combat, instance = ...\n				local minutos, segundos = math.floor (value/60), math.floor (value%60)\n				return minutos .. \"m \" .. segundos .. \"s\"\n			",
					["attribute"] = false,
					["script_version"] = 3,
				}, -- [8]
				{
					["source"] = false,
					["author"] = "Details!",
					["tooltip"] = "				\n			",
					["percent_script"] = "				local value, top, total, combat, instance = ...\n				return string.format (\"%.1f\", value/top*100)\n			",
					["desc"] = "Tells how much time each character spent doing healing.",
					["icon"] = "Interface\\Buttons\\UI-MicroStream-Green",
					["spellid"] = false,
					["name"] = "Healing Activity Time",
					["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n\n				--get the misc actor container\n				local damage_container = combat:GetActorList ( DETAILS_ATTRIBUTE_HEAL )\n				\n				--do the loop:\n				for _, player in ipairs ( damage_container ) do \n					if (player.grupo) then\n						local activity = player:Tempo()\n						total = total + activity\n						amount = amount + 1\n						--add amount to the player \n						instance_container:AddValue (player, activity)\n					end\n				end\n				\n				--return:\n				return total, combat:GetCombatTime(), amount\n			",
					["target"] = false,
					["total_script"] = "				local value, top, total, combat, instance = ...\n				local minutos, segundos = math.floor (value/60), math.floor (value%60)\n				return minutos .. \"m \" .. segundos .. \"s\"\n			",
					["attribute"] = false,
					["script_version"] = 2,
				}, -- [9]
				{
					["source"] = false,
					["author"] = "Details!",
					["desc"] = "Show overall damage done on the fly.",
					["total_script"] = "				local value, top, total, combat, instance = ...\n\n				--get the time of overall combat\n				local OverallCombatTime = Details:GetCombat (-1):GetCombatTime()\n\n				--get the time of current combat if the player is in combat\n				if (Details.in_combat) then\n				    local CurrentCombatTime = Details:GetCombat (0):GetCombatTime()\n				    OverallCombatTime = OverallCombatTime + CurrentCombatTime\n				end\n\n				--build the string\n				local ToK = Details:GetCurrentToKFunction()\n				local s = ToK (_, value / OverallCombatTime)\n				\n				if (instance.row_info.textR_show_data[3]) then\n				    s = ToK (_, value) .. \" (\" .. s .. \", \"\n				else\n				    s = ToK (_, value) .. \" (\" .. s\n				end\n\n				return s\n			",
					["icon"] = "Interface\\Buttons\\Spell-Reset",
					["spellid"] = false,
					["name"] = "Dynamic Overall Damage",
					["tooltip"] = "				--get the parameters passed\n				local actor, combat, instance = ...\n\n				--get the cooltip object (we dont use the convencional GameTooltip here)\n				local GameCooltip = GameCooltip2\n\n				--Cooltip code\n				--get the overall combat\n				local OverallCombat = Details:GetCombat (-1)\n				--get the current combat\n				local CurrentCombat = Details:GetCombat (0)\n\n				local AllSpells = {}\n\n				--overall\n				local player = OverallCombat [1]:GetActor (actor.nome)\n				local playerSpells = player:GetSpellList()\n				for spellID, spellTable in pairs (playerSpells) do\n				    AllSpells [spellID] = spellTable.total\n				end\n\n				--current\n				local player = CurrentCombat [1]:GetActor (actor.nome)\n				if (player) then\n					local playerSpells = player:GetSpellList()\n					for spellID, spellTable in pairs (playerSpells) do\n						AllSpells [spellID] = (AllSpells [spellID] or 0) + (spellTable.total or 0)\n					end\n				end\n\n				local sortedList = {}\n				for spellID, total in pairs (AllSpells) do\n				    tinsert (sortedList, {spellID, total})\n				end\n				table.sort (sortedList, Details.Sort2)\n\n				local format_func = Details:GetCurrentToKFunction()\n\n				--build the tooltip\n				for i, t in ipairs (sortedList) do\n				    local spellID, total = unpack (t)\n				    if (total > 1) then\n					local spellName, _, spellIcon = Details.GetSpellInfo (spellID)\n					\n					GameCooltip:AddLine (spellName, format_func (_, total))\n					Details:AddTooltipBackgroundStatusbar()\n					GameCooltip:AddIcon (spellIcon, 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				    end\n				end\n			",
					["target"] = false,
					["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n\n				--get the overall combat\n				local OverallCombat = Details:GetCombat (-1)\n				--get the current combat\n				local CurrentCombat = Details:GetCombat (0)\n\n				if (not OverallCombat.GetActorList or not CurrentCombat.GetActorList) then\n				    return 0, 0, 0\n				end\n\n				--get the damage actor container for overall\n				local damage_container_overall = OverallCombat:GetActorList ( DETAILS_ATTRIBUTE_DAMAGE )\n				--get the damage actor container for current\n				local damage_container_current = CurrentCombat:GetActorList ( DETAILS_ATTRIBUTE_DAMAGE )\n\n				--do the loop:\n				for _, player in ipairs ( damage_container_overall ) do \n				    --only player in group\n				    if (player:IsGroupPlayer()) then\n					instance_container:AddValue (player, player.total)\n				    end\n				end\n\n				if (Details.in_combat) then\n				    for _, player in ipairs ( damage_container_current ) do \n					--only player in group\n					if (player:IsGroupPlayer()) then\n					    instance_container:AddValue (player, player.total)        \n					end\n				    end\n				end\n\n				total, top =  instance_container:GetTotalAndHighestValue()\n				amount =  instance_container:GetNumActors()\n\n				--return:\n				return total, top, amount\n			",
					["attribute"] = false,
					["script_version"] = 5,
				}, -- [10]
				{
					["source"] = false,
					["author"] = "Details!",
					["desc"] = "Show who in your raid used a potion during the encounter.",
					["tooltip"] = "			--init:\n			local player, combat, instance = ...\n			\n			--get the debuff container for potion of focus\n			local debuff_uptime_container = player.debuff_uptime and player.debuff_uptime_spells and player.debuff_uptime_spells._ActorTable\n			if (debuff_uptime_container) then\n				local focus_potion = debuff_uptime_container [DETAILS_FOCUS_POTION_ID]\n				if (focus_potion) then\n				local name, _, icon = GetSpellInfo (DETAILS_FOCUS_POTION_ID)\n				GameCooltip:AddLine (name, 1) --> can use only 1 focus potion (can't be pre-potion)\n				_detalhes:AddTooltipBackgroundStatusbar()\n				GameCooltip:AddIcon (icon, 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n				end\n			end\n			\n			--get the misc actor container\n			local buff_uptime_container = player.buff_uptime and player.buff_uptime_spells and player.buff_uptime_spells._ActorTable\n			if (buff_uptime_container) then\n				for spellId, _ in pairs (DetailsFramework.PotionIDs) do\n					local potionUsed = buff_uptime_container [spellId]\n			\n					if (potionUsed) then\n						local name, _, icon = GetSpellInfo (spellId)\n						GameCooltip:AddLine (name, potionUsed.activedamt)\n						_detalhes:AddTooltipBackgroundStatusbar()\n						GameCooltip:AddIcon (icon, 1, 1, _detalhes.tooltip.line_height, _detalhes.tooltip.line_height)\n					end\n				end\n			end\n			",
					["attribute"] = false,
					["name"] = "Potion Used",
					["script"] = "				--init:\n				local combat, instance_container, instance = ...\n				local total, top, amount = 0, 0, 0\n				\n				--get the misc actor container\n				local misc_container = combat:GetActorList ( DETAILS_ATTRIBUTE_MISC )\n				\n				--do the loop:\n				for _, player in ipairs ( misc_container ) do \n					\n					--only player in group\n					if (player:IsGroupPlayer()) then\n						\n						local found_potion = false\n						\n						--get the spell debuff uptime container\n						local debuff_uptime_container = player.debuff_uptime and player.debuff_uptime_spells and player.debuff_uptime_spells._ActorTable\n						if (debuff_uptime_container) then\n							--potion of focus (can't use as pre-potion, so, its amount is always 1\n							local focus_potion = debuff_uptime_container [DETAILS_FOCUS_POTION_ID]\n							\n							if (focus_potion) then\n								total = total + 1\n								found_potion = true\n								if (top < 1) then\n									top = 1\n								end\n								--add amount to the player \n								instance_container:AddValue (player, 1)\n							end\n						end\n						\n						--get the spell buff uptime container\n						local buff_uptime_container = player.buff_uptime and player.buff_uptime_spells and player.buff_uptime_spells._ActorTable\n						if (buff_uptime_container) then\n							for spellId, _ in pairs (DetailsFramework.PotionIDs) do\n								local potionUsed = buff_uptime_container [spellId]\n				\n								if (potionUsed) then\n									local used = potionUsed.activedamt\n									if (used and used > 0) then\n										total = total + used\n										found_potion = true\n										if (used > top) then\n											top = used\n										end\n				\n										--add amount to the player \n										instance_container:AddValue (player, used)\n									end\n								end\n							end\n						end\n						\n						if (found_potion) then\n							amount = amount + 1\n						end    \n					end\n				end\n				\n				--return:\n				return total, top, amount\n				",
					["target"] = false,
					["spellid"] = false,
					["icon"] = "Interface\\ICONS\\INV_Potion_03",
					["script_version"] = 6,
				}, -- [11]
			},
			["performance_profiles"] = {
				["Dungeon"] = {
					["enabled"] = false,
					["update_speed"] = 1,
					["miscdata"] = true,
					["aura"] = true,
					["heal"] = true,
					["use_row_animations"] = false,
					["energy"] = false,
					["damage"] = true,
				},
				["RaidFinder"] = {
					["enabled"] = false,
					["update_speed"] = 1,
					["miscdata"] = true,
					["aura"] = true,
					["heal"] = true,
					["use_row_animations"] = false,
					["energy"] = false,
					["damage"] = true,
				},
				["Battleground15"] = {
					["enabled"] = false,
					["update_speed"] = 1,
					["miscdata"] = true,
					["aura"] = true,
					["heal"] = true,
					["use_row_animations"] = false,
					["energy"] = false,
					["damage"] = true,
				},
				["Battleground40"] = {
					["enabled"] = false,
					["update_speed"] = 1,
					["miscdata"] = true,
					["aura"] = true,
					["heal"] = true,
					["use_row_animations"] = false,
					["energy"] = false,
					["damage"] = true,
				},
				["Mythic"] = {
					["enabled"] = false,
					["update_speed"] = 1,
					["miscdata"] = true,
					["aura"] = true,
					["heal"] = true,
					["use_row_animations"] = false,
					["energy"] = false,
					["damage"] = true,
				},
				["Arena"] = {
					["enabled"] = false,
					["update_speed"] = 1,
					["miscdata"] = true,
					["aura"] = true,
					["heal"] = true,
					["use_row_animations"] = false,
					["energy"] = false,
					["damage"] = true,
				},
				["Raid30"] = {
					["enabled"] = false,
					["update_speed"] = 1,
					["miscdata"] = true,
					["aura"] = true,
					["heal"] = true,
					["use_row_animations"] = false,
					["energy"] = false,
					["damage"] = true,
				},
				["Raid15"] = {
					["enabled"] = false,
					["update_speed"] = 1,
					["miscdata"] = true,
					["aura"] = true,
					["heal"] = true,
					["use_row_animations"] = false,
					["energy"] = false,
					["damage"] = true,
				},
			},
			["exit_log"] = {
				"1 - Closing Janela Info.", -- [1]
				"2 - Clearing user place from instances.", -- [2]
				"4 - Reversing switches.", -- [3]
				"6 - Saving Config.", -- [4]
				"7 - Saving Profiles.", -- [5]
				"8 - Saving nicktag cache.", -- [6]
			},
			["immersion_unit_special_icons"] = true,
			["lastUpdateWarning"] = 1597769225,
			["dungeon_data"] = {
			},
		}

	end

	_detalhes:ApplyProfile(key)
end
