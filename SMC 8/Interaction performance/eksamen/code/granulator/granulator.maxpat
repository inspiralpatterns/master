{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 2,
			"revision" : 4,
			"architecture" : "x86",
			"modernui" : 1
		}
,
		"rect" : [ 554.0, 260.0, 875.0, 271.0 ],
		"bgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
		"bglocked" : 1,
		"openinpresentation" : 1,
		"default_fontsize" : 14.0,
		"default_fontface" : 0,
		"default_fontname" : "Avenir Book",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 0,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-69",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 163.0, 192.0, 56.0, 28.0 ],
					"style" : "",
					"text" : "r on-off"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-95",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "fct-window.maxpat",
					"numinlets" : 0,
					"numoutlets" : 0,
					"offset" : [ 0.0, 0.0 ],
					"patching_rect" : [ 460.0, 255.0, 233.5, 148.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 648.163208, 173.160004, 247.5, 148.0 ],
					"varname" : "fct-window",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-60",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 98.666672, 22.666668, 89.0, 28.0 ],
					"style" : "",
					"text" : "r grain-delay"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-76",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 65.0, 145.0, 44.0, 28.0 ],
					"style" : "",
					"text" : "r rdur"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-66",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 44.0, 52.0, 80.0, 28.0 ],
					"style" : "",
					"text" : "r scattering"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 464.5, 205.0, 64.0, 28.0 ],
					"style" : "",
					"text" : "r density"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 506.0, 101.0, 100.0, 28.0 ],
					"style" : "",
					"text" : "r crossfade"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-26",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 378.0, 74.000015, 100.0, 28.0 ],
					"style" : "",
					"text" : "r speed"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 119.0, 766.0, 142.5, 28.0 ],
					"style" : "",
					"text" : "dac~ 1 2"
				}

			}
, 			{
				"box" : 				{
					"clip_size" : 1,
					"display_range" : [ -45.0, 6.0 ],
					"id" : "obj-102",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"orientation" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 840.0, 840.0, 100.0, 5.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 445.880768, 154.0, 386.0, 5.0 ]
				}

			}
, 			{
				"box" : 				{
					"clip_size" : 1,
					"display_range" : [ -45.0, 6.0 ],
					"id" : "obj-99",
					"maxclass" : "live.meter~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"orientation" : 1,
					"outlettype" : [ "list" ],
					"patching_rect" : [ 840.0, 810.0, 100.0, 5.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 445.880768, 147.5, 386.0, 5.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-130",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1405.5, 79.5, 106.0, 26.0 ],
					"style" : "",
					"text" : "prepend replace"
				}

			}
, 			{
				"box" : 				{
					"allowdrag" : 0,
					"autopopulate" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_color" : [ 1.0, 1.0, 1.0, 0.0 ],
					"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "color",
					"fontsize" : 13.0,
					"id" : "obj-131",
					"items" : [ "a-le-attese-silenziose.aif", ",", "b-dipinti-intervalli.aif", ",", "c-dipinti-II.aif", ",", "Cymbaltone.wav", ",", "d-high.aif", ",", "e-saw-chain.aif", ",", "f-cymb-bow-10.aif", ",", "g-cigarette.aif", ",", "Gitarknirk.wav", ",", "h-carne-o-metallo.aif", ",", "i-drone.aif", ",", "j-drumscape.aif", ",", "k-russian.aif", ",", "l-scratch.aif", ",", "Skrik Langsomt.wav" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1365.0, 49.5, 100.0, 26.0 ],
					"prefix" : "patterns:/Users/Boggiz/Dropbox/Mattia/La differenza tra un punto e un abisso (2014)/concert-samples/",
					"presentation" : 1,
					"presentation_rect" : [ 3.5, 130.0, 201.0, 26.0 ],
					"style" : "",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-118",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1237.0, 15.0, 96.0, 26.0 ],
					"style" : "",
					"text" : "prepend prefix"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-122",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1277.5, 79.5, 106.0, 26.0 ],
					"style" : "",
					"text" : "prepend replace"
				}

			}
, 			{
				"box" : 				{
					"allowdrag" : 0,
					"autopopulate" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_color" : [ 1.0, 1.0, 1.0, 0.0 ],
					"bgfillcolor_color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "color",
					"fontsize" : 13.0,
					"id" : "obj-123",
					"items" : [ "a-le-attese-silenziose.aif", ",", "b-dipinti-intervalli.aif", ",", "c-dipinti-II.aif", ",", "Cymbaltone.wav", ",", "d-high.aif", ",", "e-saw-chain.aif", ",", "f-cymb-bow-10.aif", ",", "g-cigarette.aif", ",", "Gitarknirk.wav", ",", "h-carne-o-metallo.aif", ",", "i-drone.aif", ",", "j-drumscape.aif", ",", "k-russian.aif", ",", "l-scratch.aif", ",", "Skrik Langsomt.wav" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1237.0, 49.5, 100.0, 26.0 ],
					"prefix" : "patterns:/Users/Boggiz/Dropbox/Mattia/La differenza tra un punto e un abisso (2014)/concert-samples/",
					"presentation" : 1,
					"presentation_rect" : [ 5.5, 50.0, 199.0, 26.0 ],
					"style" : "",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-128",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1117.0, 60.0, 59.0, 42.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 286.997009, 219.660004, 59.0, 42.0 ],
					"style" : "",
					"text" : "sample folder",
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-129",
					"maxclass" : "dropfile",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1104.5, 49.5, 84.0, 45.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 274.497009, 218.160004, 84.0, 45.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Zapfino",
					"fontsize" : 20.0,
					"id" : "obj-67",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 375.0, 405.0, 243.0, 74.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 350.214111, -4.0, 155.0, 74.0 ],
					"style" : "",
					"text" : "Granulator",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-47",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 543.5, 164.500031, 51.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 785.413208, 115.5, 51.0, 24.0 ],
					"style" : "",
					"text" : "Pitch 2",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-45",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 543.5, 133.000031, 53.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 572.674683, 116.5, 53.0, 24.0 ],
					"style" : "",
					"text" : "Pitch 1",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.909804, 0.909804, 0.909804, 0.0 ],
					"activeslidercolor" : [ 0.741176, 0.356863, 0.047059, 1.0 ],
					"appearance" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"id" : "obj-62",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 387.75, 164.500031, 152.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 655.0, 119.5, 127.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "pitch-2",
							"parameter_shortname" : "live.numbox[2]",
							"parameter_type" : 0,
							"parameter_mmax" : 200.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 100.0 ],
							"parameter_unitstyle" : 5
						}

					}
,
					"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"varname" : "pitch-2"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.909804, 0.909804, 0.909804, 0.0 ],
					"activeslidercolor" : [ 0.741176, 0.356863, 0.047059, 1.0 ],
					"appearance" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"id" : "obj-41",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 387.75, 133.000031, 152.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 443.761505, 118.5, 127.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "pitch-1",
							"parameter_shortname" : "live.numbox[2]",
							"parameter_type" : 0,
							"parameter_mmax" : 200.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 100.0 ],
							"parameter_unitstyle" : 5
						}

					}
,
					"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"varname" : "pitch-1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"format" : 6,
					"id" : "obj-38",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1435.0, 600.0, 65.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"format" : 6,
					"id" : "obj-36",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1353.214355, 600.0, 57.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1435.0, 517.0, 86.0, 24.0 ],
					"style" : "",
					"text" : "pvar pitch-2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1353.214355, 495.0, 84.0, 24.0 ],
					"style" : "",
					"text" : "pvar pitch-1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "float" ],
					"patching_rect" : [ 119.5, 345.0, 70.0, 24.0 ],
					"style" : "",
					"text" : "t b f"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 119.5, 316.0, 47.0, 24.0 ],
					"style" : "",
					"text" : "/ 100."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-246",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 6,
					"outlettype" : [ "", "", "", "", "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 2,
							"revision" : 4,
							"architecture" : "x86",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 14.0,
						"default_fontface" : 0,
						"default_fontname" : "Georgia",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-99",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 115.599976, 208.5, 90.0, 20.0 ],
									"style" : "",
									"text" : "normalize $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-145",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 112.199951, 100.0, 46.0, 20.0 ],
									"style" : "",
									"text" : "set $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-146",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 100.0, 46.0, 20.0 ],
									"style" : "",
									"text" : "set $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"hidden" : 1,
									"id" : "obj-131",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 206.957153, 143.0, 40.0, 20.0 ],
									"style" : "",
									"text" : "set 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"hidden" : 1,
									"id" : "obj-134",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 165.957153, 143.0, 40.0, 20.0 ],
									"style" : "",
									"text" : "set 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"hidden" : 1,
									"id" : "obj-135",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 115.599976, 143.0, 40.0, 20.0 ],
									"style" : "",
									"text" : "set 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"hidden" : 1,
									"id" : "obj-136",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 206.957153, 120.0, 32.5, 22.0 ],
									"style" : "",
									"text" : "+ 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"hidden" : 1,
									"id" : "obj-138",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 159.957153, 120.0, 32.5, 22.0 ],
									"style" : "",
									"text" : "+ 2"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-104",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 115.599976, 187.0, 81.0, 20.0 ],
									"style" : "",
									"text" : "setmode $1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-234",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 50.0, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-235",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 112.199951, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-236",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 110.599976, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-237",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 115.599976, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-238",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 157.957153, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-239",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 201.957153, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-240",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 288.5, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-241",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 112.199951, 288.5, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-242",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 115.599976, 288.5, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-243",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 110.599976, 288.5, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-244",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 165.957153, 288.5, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-245",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 206.957153, 288.5, 25.0, 25.0 ],
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-243", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-104", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-245", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-131", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-244", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-134", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-242", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-135", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-104", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 216.457153, 171.5, 125.099976, 171.5 ],
									"source" : [ "obj-136", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-104", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"midpoints" : [ 169.457153, 171.5, 125.099976, 171.5 ],
									"source" : [ "obj-138", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-241", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-145", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-240", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-146", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-146", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-234", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-145", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-235", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-104", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-236", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-135", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-236", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-99", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-237", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-134", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-238", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-138", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-238", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-131", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-239", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-136", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-239", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-243", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-99", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 1159.042847, 428.0, 175.957153, 24.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"fontname" : "Georgia",
						"fontsize" : 14.0,
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p buffer-controls"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-233",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 2,
							"revision" : 4,
							"architecture" : "x86",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 14.0,
						"default_fontface" : 0,
						"default_fontname" : "Georgia",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-77",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"patching_rect" : [ 127.75, 174.0, 48.0, 22.0 ],
									"style" : "",
									"text" : "ej.line"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-78",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"patching_rect" : [ 50.0, 174.0, 48.0, 22.0 ],
									"style" : "",
									"text" : "ej.line"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 2,
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-2",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 127.75, 100.0, 55.0, 22.0 ],
									"style" : "",
									"text" : "Sel end"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 2,
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-32",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 100.0, 63.0, 22.0 ],
									"style" : "",
									"text" : "Sel start"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-38",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 127.75, 129.0, 67.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-41",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 50.0, 129.0, 63.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-229",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-230",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 127.75, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-231",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 256.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-232",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 127.75, 256.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-41", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-229", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-38", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-230", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-77", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-38", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-78", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-41", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-232", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-77", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-231", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-78", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 1190.0, 255.0, 96.75, 24.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"fontname" : "Georgia",
						"fontsize" : 14.0,
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p sel-dur"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-227",
					"maxclass" : "newobj",
					"numinlets" : 6,
					"numoutlets" : 6,
					"outlettype" : [ "", "", "", "", "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 2,
							"revision" : 4,
							"architecture" : "x86",
							"modernui" : 1
						}
,
						"rect" : [ 25.0, 69.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 14.0,
						"default_fontface" : 0,
						"default_fontname" : "Georgia",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-88",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 285.0, 195.0, 90.0, 20.0 ],
									"style" : "",
									"text" : "normalize $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-144",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 186.0, 135.0, 46.0, 20.0 ],
									"style" : "",
									"text" : "set $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-141",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 100.0, 46.0, 20.0 ],
									"style" : "",
									"text" : "set $1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"hidden" : 1,
									"id" : "obj-130",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 383.857178, 143.0, 40.0, 20.0 ],
									"style" : "",
									"text" : "set 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"hidden" : 1,
									"id" : "obj-129",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 340.357178, 143.0, 40.0, 20.0 ],
									"style" : "",
									"text" : "set 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"hidden" : 1,
									"id" : "obj-128",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 232.0, 135.0, 40.0, 20.0 ],
									"style" : "",
									"text" : "set 0"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"hidden" : 1,
									"id" : "obj-114",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 383.857178, 120.0, 32.5, 22.0 ],
									"style" : "",
									"text" : "+ 1"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"hidden" : 1,
									"id" : "obj-97",
									"maxclass" : "newobj",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 336.857178, 120.0, 32.5, 22.0 ],
									"style" : "",
									"text" : "+ 2"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-95",
									"maxclass" : "message",
									"numinlets" : 2,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 105.0, 135.0, 81.0, 20.0 ],
									"style" : "",
									"text" : "setmode $1"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-215",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 50.0, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-216",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 71.0, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-217",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 105.0, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-218",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "float" ],
									"patching_rect" : [ 285.0, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-219",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 333.607178, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-220",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 378.857178, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-221",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 289.5, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-222",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 287.599976, 289.5, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-223",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 290.0, 289.5, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-224",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 285.0, 289.5, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-225",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 340.357178, 289.5, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-226",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 383.857178, 289.5, 25.0, 25.0 ],
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-95", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 393.357178, 179.5, 114.5, 179.5 ],
									"source" : [ "obj-114", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-223", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-128", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-225", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-129", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-226", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-130", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-221", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-141", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-222", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-144", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-141", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-215", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-144", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-216", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-128", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-217", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-95", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-217", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-88", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-218", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-129", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-219", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-97", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-219", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-114", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-220", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-130", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-220", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-224", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-88", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-224", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-95", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-95", 0 ],
									"disabled" : 0,
									"hidden" : 1,
									"midpoints" : [ 346.357178, 179.5, 114.5, 179.5 ],
									"source" : [ "obj-97", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 819.142822, 428.0, 178.214355, 24.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"fontname" : "Georgia",
						"fontsize" : 14.0,
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p buffer-controls"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-214",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 7,
							"minor" : 2,
							"revision" : 4,
							"architecture" : "x86",
							"modernui" : 1
						}
,
						"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"openinpresentation" : 0,
						"default_fontsize" : 14.0,
						"default_fontface" : 0,
						"default_fontname" : "Georgia",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-76",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"patching_rect" : [ 127.75, 174.0, 48.0, 22.0 ],
									"style" : "",
									"text" : "ej.line"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-74",
									"maxclass" : "newobj",
									"numinlets" : 3,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"patching_rect" : [ 50.0, 174.0, 48.0, 22.0 ],
									"style" : "",
									"text" : "ej.line"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 2,
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-133",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 127.75, 100.0, 55.0, 22.0 ],
									"style" : "",
									"text" : "Sel end"
								}

							}
, 							{
								"box" : 								{
									"fontface" : 2,
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-132",
									"maxclass" : "comment",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 100.0, 63.0, 22.0 ],
									"style" : "",
									"text" : "Sel start"
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-27",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 127.75, 129.0, 67.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Georgia",
									"fontsize" : 14.0,
									"id" : "obj-28",
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "bang" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 50.0, 129.0, 63.0, 22.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-210",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-211",
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 127.75, 40.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-212",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 256.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-213",
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 127.75, 256.0, 25.0, 25.0 ],
									"style" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-28", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-210", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-27", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-211", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-76", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-27", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-74", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-28", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-212", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-74", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-213", 0 ],
									"disabled" : 0,
									"hidden" : 0,
									"source" : [ "obj-76", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 848.321411, 255.0, 95.410706, 24.0 ],
					"saved_object_attributes" : 					{
						"description" : "",
						"digest" : "",
						"fontname" : "Georgia",
						"fontsize" : 14.0,
						"globalpatchername" : "",
						"style" : "",
						"tags" : ""
					}
,
					"style" : "",
					"text" : "p sel-dur"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1023.5, 495.0, 99.0, 24.0 ],
					"style" : "",
					"text" : "pvar min-amp"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-167",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 787.75, 133.000031, 86.0, 24.0 ],
					"style" : "",
					"text" : "natural-freq"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-142",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 119.5, 251.5, 95.0, 24.0 ],
					"style" : "",
					"text" : "loadmess 100"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-126",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 119.5, 405.0, 70.0, 24.0 ],
					"style" : "",
					"text" : "* 1."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-121",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 281.5, 66.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 784.913208, 56.5, 48.0, 24.0 ],
					"style" : "",
					"text" : "Speed",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.909804, 0.909804, 0.909804, 0.0 ],
					"activeslidercolor" : [ 0.741176, 0.356863, 0.047059, 1.0 ],
					"appearance" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"focusbordercolor" : [ 0.098039, 0.098039, 0.098039, 1.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"id" : "obj-119",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 119.5, 288.5, 79.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 655.0, 60.0, 127.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "phasor-speed",
							"parameter_shortname" : "live.numbox",
							"parameter_type" : 0,
							"parameter_mmax" : 200.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 100 ],
							"parameter_unitstyle" : 5,
							"parameter_speedlim" : 10.0
						}

					}
,
					"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"varname" : "phasor-speed"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-120",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 788.964294, 194.5, 95.0, 24.0 ],
					"style" : "",
					"text" : "loadmess 100"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-110",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 513.166748, 69.5, 43.0, 24.0 ],
					"style" : "",
					"text" : "s pan"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-106",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 513.166748, 39.5, 39.0, 24.0 ],
					"style" : "",
					"text" : "* 10."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-105",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 641.666748, 15.5, 88.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 784.674683, 76.099976, 71.0, 24.0 ],
					"style" : "",
					"text" : "Pan speed",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.909804, 0.909804, 0.909804, 0.0 ],
					"activeslidercolor" : [ 0.741176, 0.356863, 0.047059, 1.0 ],
					"activetricolor2" : [ 0.750438, 0.376851, 0.001552, 1.0 ],
					"appearance" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"focusbordercolor" : [ 0.098039, 0.098039, 0.098039, 1.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"id" : "obj-101",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 513.166748, 16.5, 115.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 654.761475, 79.599976, 127.238525, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "pan-speed",
							"parameter_shortname" : "live.numbox",
							"parameter_type" : 0,
							"parameter_mmax" : 1.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.3 ],
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"varname" : "pan-speed"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"format" : 6,
					"id" : "obj-23",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 262.5, 705.0, 59.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-90",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 262.5, 660.0, 109.0, 24.0 ],
					"style" : "",
					"text" : "pvar main-scale"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-91",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 242.5, 735.0, 39.0, 24.0 ],
					"style" : "",
					"text" : "*~ 1."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-159",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 14.5, 88.000031, 78.0, 24.0 ],
					"style" : "",
					"text" : "loadmess 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"format" : 6,
					"id" : "obj-154",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 139.0, 705.0, 59.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-152",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 139.0, 660.0, 109.0, 24.0 ],
					"style" : "",
					"text" : "pvar main-scale"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-151",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 255.833282, 164.499969, 62.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 784.913208, 96.099976, 38.0, 24.0 ],
					"style" : "",
					"text" : "Gain",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.909804, 0.909804, 0.909804, 0.0 ],
					"activeslidercolor" : [ 0.741176, 0.356863, 0.047059, 1.0 ],
					"activetricolor2" : [ 0.750438, 0.376851, 0.001552, 1.0 ],
					"appearance" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"focusbordercolor" : [ 0.098039, 0.098039, 0.098039, 1.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"id" : "obj-150",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 195.833282, 166.499969, 50.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 655.0, 99.599976, 127.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "main-scale",
							"parameter_shortname" : "live.numbox",
							"parameter_type" : 0,
							"parameter_mmax" : 1.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1 ],
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"varname" : "main-scale"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-149",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 119.0, 735.0, 39.0, 24.0 ],
					"style" : "",
					"text" : "*~ 1."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-87",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 609.0, 44.0, 69.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 394.761505, 92.0, 20.0, 24.0 ],
					"style" : "",
					"text" : "A",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-86",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 964.571411, 44.0, 64.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 394.761505, 172.0, 20.0, 24.0 ],
					"style" : "",
					"text" : "B",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-83",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 255.833282, 131.000031, 70.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 573.674683, 95.0, 70.0, 24.0 ],
					"style" : "",
					"text" : "A/B xfade",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.909804, 0.909804, 0.909804, 0.0 ],
					"activeslidercolor" : [ 0.741176, 0.356863, 0.047059, 1.0 ],
					"activetricolor2" : [ 0.750438, 0.376851, 0.001552, 1.0 ],
					"appearance" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"focusbordercolor" : [ 0.098039, 0.098039, 0.098039, 1.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"id" : "obj-81",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 195.833282, 133.000031, 50.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 443.761505, 98.5, 128.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "morphing",
							"parameter_shortname" : "live.numbox",
							"parameter_type" : 0,
							"parameter_mmax" : 1.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ],
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"varname" : "morphing"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"format" : 6,
					"id" : "obj-80",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1271.0, 600.0, 50.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-18",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1271.0, 563.0, 103.0, 24.0 ],
					"style" : "",
					"text" : "pvar morphing"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-85",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 400.0, 262.0, 56.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 573.674683, 75.0, 56.0, 24.0 ],
					"style" : "",
					"text" : "Density",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-84",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 270.833282, 285.0, 128.0, 24.0 ],
					"style" : "",
					"text" : "expr ln(1/$f1)*200"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"format" : 6,
					"id" : "obj-82",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 270.833282, 316.0, 110.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.909804, 0.909804, 0.909804, 0.0 ],
					"activeslidercolor" : [ 0.741176, 0.356863, 0.047059, 1.0 ],
					"activetricolor2" : [ 0.750438, 0.376851, 0.001552, 1.0 ],
					"appearance" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"focusbordercolor" : [ 0.098039, 0.098039, 0.098039, 1.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"id" : "obj-79",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 270.833282, 263.0, 115.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 443.761505, 78.5, 128.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "density",
							"parameter_shortname" : "live.numbox",
							"parameter_type" : 0,
							"parameter_mmin" : 0.01,
							"parameter_mmax" : 0.99,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.5 ],
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"varname" : "density"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-72",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 942.142883, 495.0, 55.0, 24.0 ],
					"style" : "",
					"text" : "pipe 10"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-73",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 859.928589, 495.0, 55.0, 24.0 ],
					"style" : "",
					"text" : "pipe 10"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-68",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 9,
					"outlettype" : [ "float", "list", "float", "float", "float", "float", "float", "", "int" ],
					"patching_rect" : [ 1047.571411, 133.000031, 144.0, 24.0 ],
					"style" : "",
					"text" : "info~ gran1-sample-2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-70",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 909.571411, 73.5, 157.0, 24.0 ],
					"style" : "",
					"text" : "buffer~ gran1-sample-2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-52",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 142.25, 533.0, 56.0, 24.0 ],
					"style" : "",
					"text" : "note $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-30",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 777.714294, 495.0, 55.0, 24.0 ],
					"style" : "",
					"text" : "pipe 10"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-12",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 695.5, 495.0, 55.0, 24.0 ],
					"style" : "",
					"text" : "pipe 10"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"activebgoncolor" : [ 0.741176, 0.356863, 0.047059, 1.0 ],
					"bgcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"bgoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"bordercolor" : [ 0.298039, 0.298039, 0.298039, 1.0 ],
					"id" : "obj-53",
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 241.833298, 225.0, 30.0, 27.000015 ],
					"presentation" : 1,
					"presentation_rect" : [ 445.880768, 203.160004, 16.5, 16.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "granulation",
							"parameter_shortname" : "live.toggle",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "off", "on" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.0 ]
						}

					}
,
					"varname" : "granulation"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-43",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 15.0, 383.0, 50.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-37",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 15.0, 428.0, 59.0, 24.0 ],
					"style" : "",
					"text" : "open $1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 5,
					"numoutlets" : 4,
					"outlettype" : [ "int", "", "", "int" ],
					"patching_rect" : [ 241.833298, 426.0, 88.0, 24.0 ],
					"style" : "",
					"text" : "counter 1 80"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 241.833298, 353.5, 48.0, 24.0 ],
					"style" : "",
					"text" : "metro"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-64",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1189.0, 530.697021, 50.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1189.0, 495.0, 103.0, 24.0 ],
					"style" : "",
					"text" : "pvar rand-amp"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.909804, 0.909804, 0.909804, 0.0 ],
					"activetricolor2" : [ 0.918646, 0.461321, 0.0019, 1.0 ],
					"bordercolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"focusbordercolor" : [ 0.2, 0.2, 0.2, 1.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"fontsize" : 11.0,
					"id" : "obj-58",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 330.0, 16.0, 56.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 4.0, 242.660004, 53.0, 19.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "max-amp",
							"parameter_shortname" : "live.numbox[1]",
							"parameter_type" : 0,
							"parameter_mmax" : 1.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.7 ],
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"tricolor2" : [ 0.572549, 0.615686, 0.658824, 0.0 ],
					"varname" : "max-amp"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.909804, 0.909804, 0.909804, 0.0 ],
					"activetricolor2" : [ 0.918646, 0.461321, 0.0019, 1.0 ],
					"bordercolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"focusbordercolor" : [ 0.2, 0.2, 0.2, 1.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"fontsize" : 11.0,
					"id" : "obj-56",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 195.833282, 17.5, 57.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 3.5, 217.660004, 53.0, 19.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "min-amp",
							"parameter_shortname" : "live.numbox[1]",
							"parameter_type" : 0,
							"parameter_mmax" : 1.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.3 ],
							"parameter_unitstyle" : 1
						}

					}
,
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"tricolor2" : [ 0.572549, 0.615686, 0.658824, 0.0 ],
					"varname" : "min-amp"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.909804, 0.909804, 0.909804, 0.0 ],
					"activetricolor2" : [ 0.918646, 0.461321, 0.0019, 1.0 ],
					"bordercolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"focusbordercolor" : [ 0.2, 0.2, 0.2, 1.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"fontsize" : 11.0,
					"id" : "obj-55",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 330.0, 104.500015, 54.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 133.01413, 242.160004, 54.0, 19.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "max-len",
							"parameter_shortname" : "live.numbox[1]",
							"parameter_type" : 0,
							"parameter_mmax" : 2000.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1500.0 ],
							"parameter_unitstyle" : 0
						}

					}
,
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"tricolor2" : [ 0.572549, 0.615686, 0.658824, 0.0 ],
					"varname" : "max-len"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.909804, 0.909804, 0.909804, 0.0 ],
					"activetricolor2" : [ 0.918646, 0.461321, 0.0019, 1.0 ],
					"bordercolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"focusbordercolor" : [ 0.2, 0.2, 0.2, 1.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"fontsize" : 11.0,
					"id" : "obj-51",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 195.833282, 106.000015, 64.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 133.01413, 217.660004, 56.0, 19.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "min-len",
							"parameter_shortname" : "live.numbox[1]",
							"parameter_type" : 0,
							"parameter_mmax" : 2000.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 500 ],
							"parameter_unitstyle" : 0
						}

					}
,
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"tricolor2" : [ 0.572549, 0.615686, 0.658824, 0.0 ],
					"varname" : "min-len"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"format" : 6,
					"id" : "obj-49",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1106.076904, 600.0, 50.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-50",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1106.076904, 564.302979, 101.0, 24.0 ],
					"style" : "",
					"text" : "pvar max-amp"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"format" : 6,
					"id" : "obj-48",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1023.5, 538.697021, 50.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"activebgoncolor" : [ 0.741176, 0.356863, 0.047059, 1.0 ],
					"bgcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"bgoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-40",
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 241.833298, 191.499969, 30.0, 28.636364 ],
					"presentation" : 1,
					"presentation_rect" : [ 523.380737, 232.160004, 15.5, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "scattering",
							"parameter_shortname" : "live.toggle",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "off", "on" ]
						}

					}
,
					"varname" : "scattering"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"activebgoncolor" : [ 0.741176, 0.356863, 0.047059, 1.0 ],
					"bgcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"bgoncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-39",
					"maxclass" : "live.toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 14.5, 191.0, 30.0, 27.000015 ],
					"presentation" : 1,
					"presentation_rect" : [ 447.380737, 232.160004, 15.5, 15.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "rand-dur",
							"parameter_shortname" : "live.toggle",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "off", "on" ]
						}

					}
,
					"varname" : "rand-dur"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-33",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 255.833282, 44.000015, 60.0, 24.0 ],
					"style" : "",
					"text" : "Jittering",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.909804, 0.909804, 0.909804, 0.0 ],
					"activeslidercolor" : [ 0.944595, 0.474352, 0.001954, 1.0 ],
					"activetricolor2" : [ 0.750438, 0.376851, 0.001552, 1.0 ],
					"appearance" : 2,
					"bordercolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"focusbordercolor" : [ 0.098039, 0.098039, 0.098039, 1.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"id" : "obj-31",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 195.833282, 46.000015, 49.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "phi-jit",
							"parameter_shortname" : "live.numbox",
							"parameter_type" : 0,
							"parameter_mmax" : 1.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 0.09 ],
							"parameter_unitstyle" : 1
						}

					}
,
					"varname" : "phi-jit"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"activeslidercolor" : [ 0.741176, 0.356863, 0.047059, 1.0 ],
					"activetricolor2" : [ 0.750438, 0.376851, 0.001552, 1.0 ],
					"appearance" : 2,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"focusbordercolor" : [ 0.098039, 0.098039, 0.098039, 1.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"id" : "obj-21",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 195.833282, 76.000015, 48.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 443.761505, 58.5, 127.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "grain-delay",
							"parameter_shortname" : "live.numbox",
							"parameter_type" : 0,
							"parameter_mmax" : 2000.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 500 ],
							"parameter_unitstyle" : 2
						}

					}
,
					"textcolor" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"varname" : "grain-delay"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 11.0,
					"id" : "obj-57",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 394.166718, 14.5, 55.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 66.0, 242.660004, 55.0, 22.0 ],
					"style" : "",
					"text" : "MAX vol",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 11.0,
					"id" : "obj-14",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 259.333282, 16.0, 57.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 65.5, 217.660004, 50.0, 22.0 ],
					"style" : "",
					"text" : "MIN vol",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 14.0,
					"id" : "obj-42",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 272.333313, 227.5, 86.0, 26.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 463.380768, 198.660004, 86.0, 26.0 ],
					"style" : "",
					"text" : "Granulation",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-100",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 9,
					"outlettype" : [ "float", "list", "float", "float", "float", "float", "float", "", "int" ],
					"patching_rect" : [ 695.5, 105.0, 142.0, 24.0 ],
					"style" : "",
					"text" : "info~ gran1-sample-1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-96",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 554.0, 69.5, 160.5, 24.0 ],
					"style" : "",
					"text" : "buffer~ gran1-sample-1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-25",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 613.0, 600.0, 50.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-24",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 531.0, 530.697021, 50.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"format" : 6,
					"id" : "obj-20",
					"maxclass" : "flonum",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 449.0, 602.697021, 50.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-17",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 366.5, 530.394043, 50.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-16",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 283.833282, 600.0, 50.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-15",
					"maxclass" : "number",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 201.833298, 530.394043, 50.0, 24.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-13",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 272.333313, 194.818146, 71.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 540.380737, 227.660004, 71.0, 24.0 ],
					"style" : "",
					"text" : "Scattering",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-11",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 613.0, 567.0, 103.0, 24.0 ],
					"style" : "",
					"text" : "pvar scattering"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 531.0, 495.0, 98.0, 24.0 ],
					"style" : "",
					"text" : "pvar rand-dur"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 449.0, 567.0, 80.0, 24.0 ],
					"style" : "",
					"text" : "pvar phi-jit"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 366.5, 494.697021, 112.0, 24.0 ],
					"style" : "",
					"text" : "pvar grain-delay"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-5",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 283.833282, 567.0, 92.0, 24.0 ],
					"style" : "",
					"text" : "pvar max-len"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 201.833298, 494.697021, 91.0, 24.0 ],
					"style" : "",
					"text" : "pvar min-len"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 17,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"patching_rect" : [ 119.307739, 630.0, 1334.692261, 24.0 ],
					"style" : "",
					"text" : "poly~ grain-generator-1 80 @target 0 @parallel 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-116",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "signal" ],
					"patching_rect" : [ 119.5, 450.0, 90.0, 24.0 ],
					"style" : "",
					"text" : "phasor~"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-3",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 45.0, 191.0, 70.0, 42.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 462.880737, 218.660004, 61.0, 42.0 ],
					"style" : "",
					"text" : "Random duration",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-93",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 255.833282, 74.000015, 79.0, 24.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 573.674683, 55.0, 79.0, 24.0 ],
					"style" : "",
					"text" : "Grain delay",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ],
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 11.0,
					"id" : "obj-92",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 449.0, 14.5, 69.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 195.014114, 242.160004, 64.0, 22.0 ],
					"style" : "",
					"text" : "MAX grain",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Avenir Book",
					"fontsize" : 11.0,
					"id" : "obj-71",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 259.333282, 104.500015, 66.0, 22.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 195.014114, 217.660004, 61.0, 22.0 ],
					"style" : "",
					"text" : "MIN grain",
					"textcolor" : [ 0.901961, 0.901961, 0.901961, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.909804, 0.909804, 0.909804, 0.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-89",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 829.0, 370.0, 51.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 5.5, 112.0, 57.0, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "normalize",
							"parameter_shortname" : "live.numbox[1]",
							"parameter_type" : 0,
							"parameter_mmax" : 100.0,
							"parameter_unitstyle" : 5
						}

					}
,
					"varname" : "normalize"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.572549, 0.615686, 0.658824, 0.0 ],
					"activebgoncolor" : [ 1.0, 1.0, 0.0, 0.0 ],
					"activetextoncolor" : [ 1.0, 0.0, 0.0, 1.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-113",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 978.357178, 370.0, 41.642822, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 334.357178, 120.0, 47.571075, 13.080265 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "Adjust",
							"parameter_shortname" : "live.text",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ]
						}

					}
,
					"text" : "Adjust",
					"texton" : "Adjust",
					"varname" : "Adjust"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.572549, 0.615686, 0.658824, 0.0 ],
					"activebgoncolor" : [ 1.0, 1.0, 0.0, 0.0 ],
					"activetextoncolor" : [ 1.0, 0.0, 0.0, 1.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-35",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 931.357178, 370.0, 41.642822, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 287.357178, 120.0, 46.639832, 13.080265 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "zoom",
							"parameter_shortname" : "live.text",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ]
						}

					}
,
					"text" : "Zoom",
					"texton" : "Zoom",
					"varname" : "zoom"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.572549, 0.615686, 0.658824, 0.0 ],
					"activebgoncolor" : [ 0.917647, 0.94902, 0.054902, 0.0 ],
					"activetextoncolor" : [ 1.0, 0.0, 0.0, 1.0 ],
					"bgoncolor" : [ 1.0, 1.0, 0.0, 0.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-34",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 884.5, 370.0, 41.642822, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 240.5, 120.0, 46.639816, 13.080265 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "select",
							"parameter_shortname" : "live.text",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ]
						}

					}
,
					"text" : "Select",
					"texton" : "Select",
					"varname" : "select"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 620.0, 156.499969, 67.0, 24.0 ],
					"style" : "",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-9",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 620.0, 191.499969, 126.0, 24.0 ],
					"style" : "",
					"text" : "set gran1-sample-1"
				}

			}
, 			{
				"box" : 				{
					"allowdrag" : 0,
					"bgcolor" : [ 0.235294, 0.698039, 0.678431, 1.0 ],
					"buffername" : "gran1-sample-1",
					"fontname" : "Helvetica Neue",
					"fontsize" : 8.0,
					"gridcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-29",
					"maxclass" : "waveform~",
					"numinlets" : 5,
					"numoutlets" : 6,
					"outlettype" : [ "float", "float", "float", "float", "list", "" ],
					"patching_rect" : [ 695.5, 286.0, 324.642822, 105.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 3.5, 74.0, 378.428253, 60.0 ],
					"selectioncolor" : [ 0.070206, 0.377472, 0.521117, 0.501961 ],
					"setmode" : 1,
					"style" : "",
					"vticks" : 0,
					"waveformcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-228",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 964.571411, 156.499969, 67.0, 24.0 ],
					"style" : "",
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.909804, 0.909804, 0.909804, 0.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-94",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1164.900024, 371.0, 57.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 5.0, 192.0, 57.0, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "normalize[1]",
							"parameter_shortname" : "live.numbox[1]",
							"parameter_type" : 0,
							"parameter_mmax" : 100.0,
							"parameter_unitstyle" : 5
						}

					}
,
					"varname" : "normalize[1]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.572549, 0.615686, 0.658824, 0.0 ],
					"activebgoncolor" : [ 1.0, 1.0, 0.0, 0.0 ],
					"activetextoncolor" : [ 1.0, 0.0, 0.0, 1.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-137",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1316.0, 371.0, 47.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 333.997009, 199.5, 47.931244, 12.661839 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "Adjust[1]",
							"parameter_shortname" : "live.text",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ]
						}

					}
,
					"text" : "Adjust",
					"texton" : "Adjust",
					"varname" : "Adjust[1]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.572549, 0.615686, 0.658824, 0.0 ],
					"activebgoncolor" : [ 1.0, 1.0, 0.0, 0.0 ],
					"activetextoncolor" : [ 1.0, 0.0, 0.0, 1.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-139",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1269.0, 371.0, 47.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 286.997009, 199.5, 47.0, 12.661839 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "zoom[1]",
							"parameter_shortname" : "live.text",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ]
						}

					}
,
					"text" : "Zoom",
					"texton" : "Zoom",
					"varname" : "zoom[1]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.572549, 0.615686, 0.658824, 0.0 ],
					"activebgoncolor" : [ 0.917647, 0.94902, 0.054902, 0.0 ],
					"activetextoncolor" : [ 1.0, 0.0, 0.0, 1.0 ],
					"bgoncolor" : [ 1.0, 1.0, 0.0, 0.0 ],
					"fontface" : 0,
					"fontname" : "Avenir Book",
					"fontsize" : 13.0,
					"id" : "obj-140",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1222.0, 371.0, 47.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 240.139832, 199.5, 47.0, 12.661839 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_linknames" : 1,
							"parameter_longname" : "select[1]",
							"parameter_shortname" : "live.text",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ]
						}

					}
,
					"text" : "Select",
					"texton" : "Select",
					"varname" : "select[1]"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Georgia",
					"fontsize" : 14.0,
					"id" : "obj-44",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 964.571411, 191.499969, 128.0, 24.0 ],
					"style" : "",
					"text" : "set gran1-sample-2"
				}

			}
, 			{
				"box" : 				{
					"allowdrag" : 0,
					"bgcolor" : [ 0.235294, 0.698039, 0.678431, 1.0 ],
					"buffername" : "gran1-sample-2",
					"fontname" : "Helvetica Neue",
					"fontsize" : 8.0,
					"gridcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-54",
					"maxclass" : "waveform~",
					"numinlets" : 5,
					"numoutlets" : 6,
					"offset" : -30.388853,
					"outlettype" : [ "float", "float", "float", "float", "list", "" ],
					"patching_rect" : [ 1034.5, 286.0, 330.0, 105.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 3.5, 154.0, 378.428253, 60.0 ],
					"selectioncolor" : [ 0.070206, 0.377472, 0.521117, 0.501961 ],
					"setmode" : 1,
					"style" : "",
					"vticks" : 0,
					"waveformcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"autofit" : 1,
					"id" : "obj-63",
					"maxclass" : "fpic",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "jit_matrix" ],
					"patching_rect" : [ 465.0, 375.0, 100.0, 50.0 ],
					"pic" : "swarm.jpg",
					"presentation" : 1,
					"presentation_rect" : [ -0.086792, -4.330028, 879.599976, 269.26001 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-149", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-1", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1444.5, 694.0, 252.0, 694.0 ],
					"source" : [ "obj-1", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-167", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-100", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-106", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 522.666748, 35.0, 522.666748, 35.0 ],
					"source" : [ "obj-101", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-110", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-106", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 622.5, 594.197021, 622.5, 594.197021 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-227", 5 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-113", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-123", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-118", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-118", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-119", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 7 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-89", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-120", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-94", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-120", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-96", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-122", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-123", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-116", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-126", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-118", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-129", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-130", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-130", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-131", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-246", 5 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-137", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-246", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-139", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-246", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-140", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-142", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-142", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-62", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-142", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-149", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 128.5, 799.0, 849.5, 799.0 ],
					"source" : [ "obj-149", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-15", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-154", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-152", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-149", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-154", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-159", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-16", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-126", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 797.25, 279.5, 129.0, 279.5 ],
					"source" : [ "obj-167", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-17", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-80", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-18", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-52", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-19", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-214", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-214", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-22", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-113", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-227", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-113", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-227", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-214", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-227", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-214", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-227", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 860.485718, 466.0, 687.349976, 466.0, 687.349976, 275.0, 705.0, 275.0 ],
					"source" : [ "obj-227", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-227", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-34", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-227", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-227", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-227", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-228", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-233", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-233", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 5 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-246", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-137", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-246", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-139", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-246", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-139", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-246", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-140", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-246", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-140", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-246", 4 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-233", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-246", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-233", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-246", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 1199.934326, 468.0, 1026.800049, 468.0, 1026.800049, 276.0, 1044.0, 276.0 ],
					"source" : [ "obj-246", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 6 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-27", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-65", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-28", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-227", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-227", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-30", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-29", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 8 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-30", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-81", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-227", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-227", 4 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 15 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 24.5, 621.0, 128.807739, 621.0 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 16 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-15", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-43", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 11 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 12 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-49", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-246", 2 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-54", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-246", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-54", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-72", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-54", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-73", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-54", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-21", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 13 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-126", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-126", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-66", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-69", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-20", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-70", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-68", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-70", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 10 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 9 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-73", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-9", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-76", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-84", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-79", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 14 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-82", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-227", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-89", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-90", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-10", 1 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-102", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"midpoints" : [ 252.0, 824.0, 849.5, 824.0 ],
					"source" : [ "obj-91", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-246", 3 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-94", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-100", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-96", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"disabled" : 0,
					"hidden" : 0,
					"source" : [ "obj-96", 1 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-1.28::obj-11" : [ "sample-1-amp[27]", "live.slider", 0 ],
			"obj-1.51::obj-23" : [ "sample-2-amp[50]", "live.slider", 0 ],
			"obj-81" : [ "morphing", "live.numbox", 0 ],
			"obj-21" : [ "grain-delay", "live.numbox", 0 ],
			"obj-1.10::obj-11" : [ "sample-1-amp[9]", "live.slider", 0 ],
			"obj-1.30::obj-11" : [ "sample-1-amp[29]", "live.slider", 0 ],
			"obj-1.72::obj-11" : [ "sample-1-amp[71]", "live.slider", 0 ],
			"obj-1.12::obj-11" : [ "sample-1-amp[11]", "live.slider", 0 ],
			"obj-1.54::obj-11" : [ "sample-1-amp[53]", "live.slider", 0 ],
			"obj-1.74::obj-23" : [ "sample-2-amp[73]", "live.slider", 0 ],
			"obj-34" : [ "select", "live.text", 0 ],
			"obj-1.33::obj-23" : [ "sample-2-amp[32]", "live.slider", 0 ],
			"obj-1.56::obj-23" : [ "sample-2-amp[55]", "live.slider", 0 ],
			"obj-1.15::obj-11" : [ "sample-1-amp[14]", "live.slider", 0 ],
			"obj-1.35::obj-11" : [ "sample-1-amp[34]", "live.slider", 0 ],
			"obj-1.77::obj-23" : [ "sample-2-amp[76]", "live.slider", 0 ],
			"obj-1.17::obj-23" : [ "sample-2-amp[16]", "live.slider", 0 ],
			"obj-1.59::obj-11" : [ "sample-1-amp[58]", "live.slider", 0 ],
			"obj-1.79::obj-23" : [ "sample-2-amp[78]", "live.slider", 0 ],
			"obj-1.38::obj-23" : [ "sample-2-amp[37]", "live.slider", 0 ],
			"obj-1.61::obj-11" : [ "sample-1-amp[60]", "live.slider", 0 ],
			"obj-1.20::obj-11" : [ "sample-1-amp[19]", "live.slider", 0 ],
			"obj-1.40::obj-11" : [ "sample-1-amp[39]", "live.slider", 0 ],
			"obj-1.43::obj-23" : [ "sample-2-amp[42]", "live.slider", 0 ],
			"obj-1.2::obj-23" : [ "sample-2-amp[1]", "live.slider", 0 ],
			"obj-1.22::obj-23" : [ "sample-2-amp[21]", "live.slider", 0 ],
			"obj-1.64::obj-23" : [ "sample-2-amp[63]", "live.slider", 0 ],
			"obj-56" : [ "min-amp", "live.numbox[1]", 0 ],
			"obj-1.4::obj-11" : [ "sample-1-amp[3]", "live.slider", 0 ],
			"obj-1.46::obj-11" : [ "sample-1-amp[45]", "live.slider", 0 ],
			"obj-1.66::obj-11" : [ "sample-1-amp[65]", "live.slider", 0 ],
			"obj-1.25::obj-11" : [ "sample-1-amp[24]", "live.slider", 0 ],
			"obj-1.48::obj-11" : [ "sample-1-amp[47]", "live.slider", 0 ],
			"obj-1.7::obj-11" : [ "sample-1-amp[6]", "live.slider", 0 ],
			"obj-1.27::obj-11" : [ "sample-1-amp[26]", "live.slider", 0 ],
			"obj-1.69::obj-23" : [ "sample-2-amp[68]", "live.slider", 0 ],
			"obj-1.9::obj-11" : [ "sample-1-amp[8]", "live.slider", 0 ],
			"obj-1.51::obj-11" : [ "sample-1-amp[50]", "live.slider", 0 ],
			"obj-1.71::obj-23" : [ "sample-2-amp[70]", "live.slider", 0 ],
			"obj-1.30::obj-23" : [ "sample-2-amp[29]", "live.slider", 0 ],
			"obj-1.53::obj-11" : [ "sample-1-amp[52]", "live.slider", 0 ],
			"obj-95::obj-2" : [ "sigma", "live.numbox", 0 ],
			"obj-1.12::obj-23" : [ "sample-2-amp[11]", "live.slider", 0 ],
			"obj-1.32::obj-11" : [ "sample-1-amp[31]", "live.slider", 0 ],
			"obj-1.74::obj-11" : [ "sample-1-amp[73]", "live.slider", 0 ],
			"obj-1.14::obj-11" : [ "sample-1-amp[13]", "live.slider", 0 ],
			"obj-1.56::obj-11" : [ "sample-1-amp[55]", "live.slider", 0 ],
			"obj-1.76::obj-11" : [ "sample-1-amp[75]", "live.slider", 0 ],
			"obj-89" : [ "normalize", "live.numbox[1]", 0 ],
			"obj-1.35::obj-23" : [ "sample-2-amp[34]", "live.slider", 0 ],
			"obj-1.58::obj-23" : [ "sample-2-amp[57]", "live.slider", 0 ],
			"obj-1.17::obj-11" : [ "sample-1-amp[16]", "live.slider", 0 ],
			"obj-1.37::obj-23" : [ "sample-2-amp[36]", "live.slider", 0 ],
			"obj-1.79::obj-11" : [ "sample-1-amp[78]", "live.slider", 0 ],
			"obj-1.19::obj-11" : [ "sample-1-amp[18]", "live.slider", 0 ],
			"obj-1.61::obj-23" : [ "sample-2-amp[60]", "live.slider", 0 ],
			"obj-119" : [ "phasor-speed", "live.numbox", 0 ],
			"obj-140" : [ "select[1]", "live.text", 0 ],
			"obj-58" : [ "max-amp", "live.numbox[1]", 0 ],
			"obj-113" : [ "Adjust", "live.text", 0 ],
			"obj-1.40::obj-23" : [ "sample-2-amp[39]", "live.slider", 0 ],
			"obj-1.43::obj-11" : [ "sample-1-amp[42]", "live.slider", 0 ],
			"obj-1.63::obj-23" : [ "sample-2-amp[62]", "live.slider", 0 ],
			"obj-62" : [ "pitch-2", "live.numbox[2]", 0 ],
			"obj-1.22::obj-11" : [ "sample-1-amp[21]", "live.slider", 0 ],
			"obj-1.42::obj-23" : [ "sample-2-amp[41]", "live.slider", 0 ],
			"obj-1.45::obj-23" : [ "sample-2-amp[44]", "live.slider", 0 ],
			"obj-41" : [ "pitch-1", "live.numbox[2]", 0 ],
			"obj-1.4::obj-23" : [ "sample-2-amp[3]", "live.slider", 0 ],
			"obj-1.24::obj-11" : [ "sample-1-amp[23]", "live.slider", 0 ],
			"obj-1.66::obj-23" : [ "sample-2-amp[65]", "live.slider", 0 ],
			"obj-1.6::obj-23" : [ "sample-2-amp[5]", "live.slider", 0 ],
			"obj-1.48::obj-23" : [ "sample-2-amp[47]", "live.slider", 0 ],
			"obj-1.68::obj-11" : [ "sample-1-amp[67]", "live.slider", 0 ],
			"obj-1.27::obj-23" : [ "sample-2-amp[26]", "live.slider", 0 ],
			"obj-1.50::obj-11" : [ "sample-1-amp[49]", "live.slider", 0 ],
			"obj-1.9::obj-23" : [ "sample-2-amp[8]", "live.slider", 0 ],
			"obj-1.29::obj-11" : [ "sample-1-amp[28]", "live.slider", 0 ],
			"obj-1.71::obj-11" : [ "sample-1-amp[70]", "live.slider", 0 ],
			"obj-40" : [ "scattering", "live.toggle", 0 ],
			"obj-1.11::obj-11" : [ "sample-1-amp[10]", "live.slider", 0 ],
			"obj-1.53::obj-23" : [ "sample-2-amp[52]", "live.slider", 0 ],
			"obj-1.73::obj-23" : [ "sample-2-amp[72]", "live.slider", 0 ],
			"obj-1.32::obj-23" : [ "sample-2-amp[31]", "live.slider", 0 ],
			"obj-1.55::obj-11" : [ "sample-1-amp[54]", "live.slider", 0 ],
			"obj-1.14::obj-23" : [ "sample-2-amp[13]", "live.slider", 0 ],
			"obj-1.34::obj-23" : [ "sample-2-amp[33]", "live.slider", 0 ],
			"obj-1.76::obj-23" : [ "sample-2-amp[75]", "live.slider", 0 ],
			"obj-1.16::obj-11" : [ "sample-1-amp[15]", "live.slider", 0 ],
			"obj-1.58::obj-11" : [ "sample-1-amp[57]", "live.slider", 0 ],
			"obj-1.78::obj-23" : [ "sample-2-amp[77]", "live.slider", 0 ],
			"obj-1.37::obj-11" : [ "sample-1-amp[36]", "live.slider", 0 ],
			"obj-1.60::obj-11" : [ "sample-1-amp[59]", "live.slider", 0 ],
			"obj-139" : [ "zoom[1]", "live.text", 0 ],
			"obj-1.19::obj-23" : [ "sample-2-amp[18]", "live.slider", 0 ],
			"obj-1.39::obj-23" : [ "sample-2-amp[38]", "live.slider", 0 ],
			"obj-1.21::obj-23" : [ "sample-2-amp[20]", "live.slider", 0 ],
			"obj-1.63::obj-11" : [ "sample-1-amp[62]", "live.slider", 0 ],
			"obj-1.3::obj-11" : [ "sample-1-amp[2]", "live.slider", 0 ],
			"obj-1.45::obj-11" : [ "sample-1-amp[44]", "live.slider", 0 ],
			"obj-1.65::obj-11" : [ "sample-1-amp[64]", "live.slider", 0 ],
			"obj-1.24::obj-23" : [ "sample-2-amp[23]", "live.slider", 0 ],
			"obj-1.47::obj-11" : [ "sample-1-amp[46]", "live.slider", 0 ],
			"obj-1.6::obj-11" : [ "sample-1-amp[5]", "live.slider", 0 ],
			"obj-1.26::obj-11" : [ "sample-1-amp[25]", "live.slider", 0 ],
			"obj-1.68::obj-23" : [ "sample-2-amp[67]", "live.slider", 0 ],
			"obj-1.8::obj-23" : [ "sample-2-amp[7]", "live.slider", 0 ],
			"obj-1.50::obj-23" : [ "sample-2-amp[49]", "live.slider", 0 ],
			"obj-1.70::obj-11" : [ "sample-1-amp[69]", "live.slider", 0 ],
			"obj-1.29::obj-23" : [ "sample-2-amp[28]", "live.slider", 0 ],
			"obj-1.52::obj-23" : [ "sample-2-amp[51]", "live.slider", 0 ],
			"obj-1.11::obj-23" : [ "sample-2-amp[10]", "live.slider", 0 ],
			"obj-1.31::obj-23" : [ "sample-2-amp[30]", "live.slider", 0 ],
			"obj-1.73::obj-11" : [ "sample-1-amp[72]", "live.slider", 0 ],
			"obj-1.13::obj-11" : [ "sample-1-amp[12]", "live.slider", 0 ],
			"obj-1.55::obj-23" : [ "sample-2-amp[54]", "live.slider", 0 ],
			"obj-1.75::obj-23" : [ "sample-2-amp[74]", "live.slider", 0 ],
			"obj-1.34::obj-11" : [ "sample-1-amp[33]", "live.slider", 0 ],
			"obj-1.57::obj-23" : [ "sample-2-amp[56]", "live.slider", 0 ],
			"obj-1.16::obj-23" : [ "sample-2-amp[15]", "live.slider", 0 ],
			"obj-1.36::obj-23" : [ "sample-2-amp[35]", "live.slider", 0 ],
			"obj-1.78::obj-11" : [ "sample-1-amp[77]", "live.slider", 0 ],
			"obj-137" : [ "Adjust[1]", "live.text", 0 ],
			"obj-1.18::obj-23" : [ "sample-2-amp[17]", "live.slider", 0 ],
			"obj-1.60::obj-23" : [ "sample-2-amp[59]", "live.slider", 0 ],
			"obj-1.80::obj-23" : [ "sample-2-amp[79]", "live.slider", 0 ],
			"obj-95::obj-31" : [ "scale", "live.numbox", 0 ],
			"obj-1.1::obj-11" : [ "sample-1-amp", "live.slider", 0 ],
			"obj-1.39::obj-11" : [ "sample-1-amp[38]", "live.slider", 0 ],
			"obj-1.42::obj-11" : [ "sample-1-amp[41]", "live.slider", 0 ],
			"obj-1.62::obj-11" : [ "sample-1-amp[61]", "live.slider", 0 ],
			"obj-79" : [ "density", "live.numbox", 0 ],
			"obj-1.21::obj-11" : [ "sample-1-amp[20]", "live.slider", 0 ],
			"obj-1.41::obj-11" : [ "sample-1-amp[40]", "live.slider", 0 ],
			"obj-1.44::obj-23" : [ "sample-2-amp[43]", "live.slider", 0 ],
			"obj-1.3::obj-23" : [ "sample-2-amp[2]", "live.slider", 0 ],
			"obj-1.23::obj-11" : [ "sample-1-amp[22]", "live.slider", 0 ],
			"obj-1.65::obj-23" : [ "sample-2-amp[64]", "live.slider", 0 ],
			"obj-51" : [ "min-len", "live.numbox[1]", 0 ],
			"obj-1.5::obj-23" : [ "sample-2-amp[4]", "live.slider", 0 ],
			"obj-1.47::obj-23" : [ "sample-2-amp[46]", "live.slider", 0 ],
			"obj-1.67::obj-23" : [ "sample-2-amp[66]", "live.slider", 0 ],
			"obj-1.26::obj-23" : [ "sample-2-amp[25]", "live.slider", 0 ],
			"obj-1.49::obj-23" : [ "sample-2-amp[48]", "live.slider", 0 ],
			"obj-1.8::obj-11" : [ "sample-1-amp[7]", "live.slider", 0 ],
			"obj-1.28::obj-23" : [ "sample-2-amp[27]", "live.slider", 0 ],
			"obj-1.70::obj-23" : [ "sample-2-amp[69]", "live.slider", 0 ],
			"obj-31" : [ "phi-jit", "live.numbox", 0 ],
			"obj-53" : [ "granulation", "live.toggle", 0 ],
			"obj-1.10::obj-23" : [ "sample-2-amp[9]", "live.slider", 0 ],
			"obj-1.52::obj-11" : [ "sample-1-amp[51]", "live.slider", 0 ],
			"obj-1.72::obj-23" : [ "sample-2-amp[71]", "live.slider", 0 ],
			"obj-1.31::obj-11" : [ "sample-1-amp[30]", "live.slider", 0 ],
			"obj-1.54::obj-23" : [ "sample-2-amp[53]", "live.slider", 0 ],
			"obj-1.13::obj-23" : [ "sample-2-amp[12]", "live.slider", 0 ],
			"obj-1.33::obj-11" : [ "sample-1-amp[32]", "live.slider", 0 ],
			"obj-1.75::obj-11" : [ "sample-1-amp[74]", "live.slider", 0 ],
			"obj-1.15::obj-23" : [ "sample-2-amp[14]", "live.slider", 0 ],
			"obj-1.57::obj-11" : [ "sample-1-amp[56]", "live.slider", 0 ],
			"obj-1.77::obj-11" : [ "sample-1-amp[76]", "live.slider", 0 ],
			"obj-94" : [ "normalize[1]", "live.numbox[1]", 0 ],
			"obj-1.36::obj-11" : [ "sample-1-amp[35]", "live.slider", 0 ],
			"obj-1.59::obj-23" : [ "sample-2-amp[58]", "live.slider", 0 ],
			"obj-1.1::obj-23" : [ "sample-2-amp", "live.slider", 0 ],
			"obj-1.18::obj-11" : [ "sample-1-amp[17]", "live.slider", 0 ],
			"obj-1.38::obj-11" : [ "sample-1-amp[37]", "live.slider", 0 ],
			"obj-1.80::obj-11" : [ "sample-1-amp[79]", "live.slider", 0 ],
			"obj-1.20::obj-23" : [ "sample-2-amp[19]", "live.slider", 0 ],
			"obj-1.62::obj-23" : [ "sample-2-amp[61]", "live.slider", 0 ],
			"obj-1.2::obj-11" : [ "sample-1-amp[1]", "live.slider", 0 ],
			"obj-1.41::obj-23" : [ "sample-2-amp[40]", "live.slider", 0 ],
			"obj-1.44::obj-11" : [ "sample-1-amp[43]", "live.slider", 0 ],
			"obj-1.64::obj-11" : [ "sample-1-amp[63]", "live.slider", 0 ],
			"obj-55" : [ "max-len", "live.numbox[1]", 0 ],
			"obj-101" : [ "pan-speed", "live.numbox", 0 ],
			"obj-1.23::obj-23" : [ "sample-2-amp[22]", "live.slider", 0 ],
			"obj-1.46::obj-23" : [ "sample-2-amp[45]", "live.slider", 0 ],
			"obj-150" : [ "main-scale", "live.numbox", 0 ],
			"obj-1.5::obj-11" : [ "sample-1-amp[4]", "live.slider", 0 ],
			"obj-1.25::obj-23" : [ "sample-2-amp[24]", "live.slider", 0 ],
			"obj-1.67::obj-11" : [ "sample-1-amp[66]", "live.slider", 0 ],
			"obj-1.7::obj-23" : [ "sample-2-amp[6]", "live.slider", 0 ],
			"obj-1.49::obj-11" : [ "sample-1-amp[48]", "live.slider", 0 ],
			"obj-1.69::obj-11" : [ "sample-1-amp[68]", "live.slider", 0 ],
			"obj-35" : [ "zoom", "live.text", 0 ],
			"obj-39" : [ "rand-dur", "live.toggle", 0 ]
		}
,
		"dependency_cache" : [ 			{
				"name" : "swarm.jpg",
				"bootpath" : "~/Google Drive/SMC/SMC 8/RTIP/eksamen/granulator",
				"type" : "JPEG",
				"implicit" : 1
			}
, 			{
				"name" : "grain-generator-1.maxpat",
				"bootpath" : "~/Google Drive/SMC/SMC 8/RTIP/eksamen/granulator",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "rand-pan.maxpat",
				"bootpath" : "~/Google Drive/SMC/SMC 8/RTIP/eksamen/granulator",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "bog.pan~.maxpat",
				"bootpath" : "~/Google Drive/SMC/SMC 8/RTIP/eksamen/granulator",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "ej.line.maxpat",
				"bootpath" : "~/Google Drive/Computer Music/Externals MSP/ejies_3.15/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "natural-freq.maxpat",
				"bootpath" : "~/Google Drive/SMC/SMC 8/RTIP/eksamen/granulator",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "fct-window.maxpat",
				"bootpath" : "~/Google Drive/SMC/SMC 8/RTIP/eksamen/granulator",
				"type" : "JSON",
				"implicit" : 1
			}
 ],
		"autosave" : 0
	}

}
