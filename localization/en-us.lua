return {
	descriptions={
		Edition={
			e_warehouse_stellar = {
                name="Stellar",
                text={
                    "Played hand has a",
                    "temporary {C:attention}extra level{}",
                },
            }
		},
		Enhanced={
            m_warehouse_virtual = {
            	name="Virtual Card",
            	text = {
            		"{C:attention}Returns to the deck{} once played",
            		"if deck has any non-Virtual cards"
            	}
            },
            m_warehouse_worn = {
            	name = "Worn Card",
            	text = {
            		"{C:green}#1# in #2#{} chance to {C:red}destroy{}",
            		"this card when {C:attention}discarded{}"
            	}
            },
            m_warehouse_dog_eared = {
            	name = "Dog-Eared Card",
            	text = {
            		"Discards containing this card",
            		"have a {C:green}#1# in #2#{} chance",
            		"to {C:attention}retain{} the discard"
            	}
            }
		},
		Voucher={
			v_warehouse_theres_options = {
				name = "There's Options",
				text = {
					"{C:attention}+#1#{} choice in each",
					"{C:attention}Standard{}, {C:tarot}Arcana{},",
					"or {C:planet}Planet{} pack"
				}
			},
			v_warehouse_more_options = {
				name = "More Options",
				text = {
					"{C:attention}+#1#{} choice in each",
					"Booster Pack not covered by",
					"{C:attention}There's Options",
				}
			},
			v_warehouse_1up = {
				name = "1-Up",
				text = {
					"Returns to the previous shop",
					"upon death with {C:attention}+$#1#{}",
					"{C:red}Debuffed once used",
				}
			},
			v_warehouse_resurrection = {
				name = "Resurrection",
				text = {
					"Returns to the previous shop",
					"upon death with",
					"{C:attention}+$#1#{} and a {C:attention}#2#",
					"{C:red}Debuffed once used",
				}
			},
			v_warehouse_easy_button = {
				name = "Easy Button",
				text = {"{C:attention}x#1#{} Blind size"}
			},
			v_warehouse_wimpmode = {
				name = "Wimpmode",
				text = {
					"Increase Ante by {C:attention}#1#{}",
					"at the end of each Ante"
				}
			}
		},
		Tag = {
			tag_warehouse_shop = {
				name = "Shop Tag",
				text = {"Return to the {C:attention}Shop{}"}
			},
			tag_warehouse_luxury = {
				name = "Luxury Tag",
				text = {
					"Next {C:attention}Shop{} cannot have",
					"{C:white,X:blue}Common{} Jokers, and",
					"may have {C:white,X:tarot}Legendary{} Jokers"
				}
			},
			tag_warehouse_shrink = {
				name = "Shrink Tag",
				text = {
					"{C:attention}x#1#{} Blind size next round"
				}
			},
			tag_warehouse_booster = {
				name = "Booster Tag",
				text = {
					"Next Booster Pack has {C:attention}+#1#{} options"
				}
			}
		},
		Tarot = {
			c_warehouse_i_hanged_man = {
				name = "The Hanged Man?",
				text = {
                    "Enhances {C:attention}#1#",
                    "selected cards to",
                    "{C:attention}#2#s",
				}
			},
            c_warehouse_i_sun={
                name="The Sun?",
                text={
                    "Destroys up to",
                    "{C:attention}#1#{} {C:hearts}Hearts",
                },
            },
            c_warehouse_i_moon={
                name="The Moon?",
                text={
                    "Destroys up to",
                    "{C:attention}#1#{} {C:clubs}Clubs",
                },
            },
            c_warehouse_i_stars={
                name="The Star?",
                text={
                    "Destroys up to",
                    "{C:attention}#1#{} {C:diamonds}Diamonds",
                },
            },
            c_warehouse_i_world={
                name="The World?",
                text={
                    "Destroys up to",
                    "{C:attention}#1#{} {C:spades}Spades",
                },
            },
            c_warehouse_i_hermit={
                name="The Hermit?",
                text={
                    "Sells a selected {C:attention}Joker{}",
                    "for {C:attention}x#1#{} its sell value",
                },
            },
            c_warehouse_i_lovers={
                name="The Lovers?",
                text={
                    "Convert {C:attention}#1#{} selected card",
                    "into a {C:attention}#2#{}",
                },
            },
            c_warehouse_i_magician={
                name="The Magician?",
                text={
                    "{C:green}#1# in #2#{} chance to copy",
                    "{C:attention}#3#{} selected card",
                },
            },
            c_warehouse_i_chariot={
                name="The Chariot?",
                text={
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
            c_warehouse_i_justice={
                name="Justice?",
                text={
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
            c_warehouse_i_heirophant={
                name="The Heirophant?",
                text={
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
		},
		Spectral = {
            c_warehouse_hyperdrive={
                name="Hyperdrive",
                text={
                    "Add a {C:red}Pink Seal{}",
                    "to {C:attention}#1#{} selected",
                    "card in your hand",
                },
            },
            c_warehouse_do_over={
                name="Do-Over",
                text={
                    "Reshuffle the deck",
                    "Reset Hands and Discards",
                    "Set round score to {C:attention}#1#{}"
                },
            },
		},
		Joker = {
			j_warehouse_sorcerer={
				name="Sorcerer",
				text={
					"{C:red}+#1#{} Mult per",
					"{C:attention}Spectral{} card",
					"used this run",
					"{C:inactive}(Currently {C:red}+#2#{C:inactive})"
				}
			},
			j_warehouse_bartender={
				name="Bartender",
				text={
					"Can discard {C:attention}#1#{} extra",
					"card per discard",
					"{C:attention}-#1#{} hand size"
				}
			},
			j_warehouse_librarian={
				name="Librarian",
				text={
					"{C:blue}+#1#{} Chips per {C:attention}unique{}",
					"scored card this run",
					"{C:inactive}(Currently {C:blue}+#2#{C:inactive})"
				}
			},
			j_warehouse_sketch={
                name="Police Sketch",
                text={
                    "Copies the ability",
                    "of the last sold {C:attention}Joker{}",
                },
			}
		},
		Other = {
            warehouse_pink_seal={
                name="Pink Seal",
                text={
                    "Balances {C:attention}#1#%{} of {C:blue}Chips{} and {C:red}Mult{}",
                },
            },
            warehouse_blank_card={
            	name="Blank Card",
            	text={
            		"Copies suit and rank of card to the {C:attention}right{}"
            	}
            },
            warehouse_todo={
            	name="TODO",
            	text={
            		"This feature has not been implemented yet."
            	}
            },
            warehouse_placeholder={
            	name="Placeholder",
            	text={
            		"This addition uses placeholder assets",
            		"that are subject to change."
            	}
            }
		},
	},
	misc={
		labels = {
			warehouse_pink_seal="Pink Seal"
		},
		dictionary = {
			b_pull = "PULL",
			k_warehouse_retained = "Retained!"
		}
	}
}
