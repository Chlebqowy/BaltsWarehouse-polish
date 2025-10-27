return {
	descriptions={
		Edition={
			e_warehouse_stellar = {
                name="Gwiezdna",
                text={
                    "Każdy zagrany układ pokerowy",
                    "ma tymczasowy {C:attention}dodatkowy poziom{}",
                },
            }
		},
		Enhanced={
            m_warehouse_virtual = {
            	name="Karta Wirtualna",
            	text = {
            		"{C:attention}Wraca do talii{} po zagraniu",
            		"jeśli ma ona nie-wirtualne karty"
            	}
            },
            m_warehouse_worn = {
            	name = "Karta Przetarta",
            	text = {
            		"{C:green}#1# na #2#{} szans {C:red}zniszczenia{}",
            		"tej karty gdy jest {C:attention}odrucona{}"
            	}
            },
            m_warehouse_dog_eared = {
            	name = "Karta z Zagiętymi Rogami",
            	text = {
            		"{C:green}#1# na #2#{} szans by otrzymać #3# zrzutki",
            		"gdy ta karta jest {C:attention}odrzucona{}"
            	}
            }
		},
		Voucher={
			v_warehouse_theres_options = {
				name = "Są opcje",
				text = {
					"{C:attention}+#1#{} wybór w każdej",
					"{C:tarot}#2#{} lub {C:planet}#3#{}"
				}
			},
			v_warehouse_more_options = {
				name = "Więcej opcji",
				text = {
					"{C:attention}+#1#{} wybór w każdej",
					"paczce wzmacniającej nie wspomnianej w ",
					"{C:attention}są opcje",
				}
			},
			v_warehouse_1up = {
				name = "1-Up",
				text = {
					"Przy śmierci cofa cię do",
					"poprzedniego sklepu z {C:attention}+$#1#{}",
					"i {C:attention}#2#",
					"{C:red}Tylko aktywuje się raz",
				}
			},
			v_warehouse_resurrection = {
				name = "Zmartwychstanie",
				text = {
					"Przy śmierci cofa cię do",
					"poprzedniego sklepu z {C:attention}+$#1#{},",
					"{C:attention}#2#{} i {C:attention}#3#",
					"{C:red}Tylko aktywuje się raz",
					"{C:red}Nie nakłada się na {C:attention}#4#",
				}
			},
			v_warehouse_easy_button = {
				name = "Przycisk \"łatwy\"",
				text = {"{C:attention}x#1#{} wartości Przeszkadzajki"}
			},
			v_warehouse_wimpmode = {
				name = "Tryb mięczaka",
				text = {
					"Powiększ ilość wejść o {C:attention}#1#{}",
					"na końcu każdego wejścia"
				}
			}
		},
		Tag = {
			tag_warehouse_shop = {
				name = "Znacznik sklepu",
				text = {"Powróć do {C:attention}sklepu{}", "z {C:attention}+$#1#{}"}
			},
			tag_warehouse_luxury = {
				name = "Znacznik luksusu",
				text = {
					"Następny {C:attention}sklep{} nie może mieć",
					"{C:white,X:blue}pospolitych{} jokerów, a także",
					"może posiadać {C:white,X:tarot}legendarne{} jokery"
				}
			},
			tag_warehouse_shrink = {
				name = "Znacznik pomniejszenia",
				text = {
					"{C:attention}x#1#{} wartości Przeszkadzajki w następnej rundzie"
				}
			},
			tag_warehouse_booster = {
				name = "Znacznik wzmacniający",
				text = {
					"Następna paczka wzmacniająca ma {C:attention}+#1#{} opcji"
				}
			}
		},
		Tarot = {
			c_warehouse_i_hanged_man = {
				name = "Wisielec?",
				text = {
                    "Ulepsza {C:attention}#1#",
                    "wybraną kartę do:",
                    "{C:attention}#2#s",
				}
			},
            c_warehouse_i_sun={
                name="Słońce?",
                text={
                    "Niszczy maks.",
                    "{C:attention}#1#{} wybrane {C:hearts}Kiery",
                },
            },
            c_warehouse_i_moon={
                name="Księżyc?",
                text={
                    "Niszczy maks.",
                    "{C:attention}#1#{} wybrane {C:clubs}Trefle",
                },
            },
            c_warehouse_i_stars={
                name="Gwiazda?",
                text={
                    "Niszczy maks.",
                    "{C:attention}#1#{} wybrane {C:diamonds}Karo",
                },
            },
            c_warehouse_i_world={
                name="Świat?",
                text={
                    "Niszczy maks.",
                    "{C:attention}#1#{} wybrane {C:spades}Piki",
                },
            },
            c_warehouse_i_hermit={
                name="Pustelnik?",
                text={
                    "Sprzedaje wybranego {C:attention}jokera{}",
                    "za {C:attention}#1#x{} jego wartość sprzedaży",
                },
            },
            c_warehouse_i_lovers={
                name="Kochankowie?",
                text={
                    "Ulepsza {C:attention}#1#{} wybraną kartę",
                    "w {C:attention}#2#{}",
                },
            },
            c_warehouse_i_magician={
                name="Mag?",
                text={
                    "{C:green}#1# na #2#{} chance to copy",
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
                name="Hierofant?",
                text={
                    "Enhances {C:attention}#1#{} selected",
                    "card into a",
                    "{C:attention}#2#",
                },
            },
            c_warehouse_i_wheel={
                name="Koło fortuny?",
                text={
                    "{C:green}#1# na #2#{} szans by usunąć",
                    "{C:attention}wersję{} z #3# wybranych {C:attention}jokeróœ{}",
                },
            },
		},
		Spectral = {
            c_warehouse_hyperdrive={
                name="Zjawa",
                text={
                    "Dodaj {C:red}różową pieczęć{}",
                    "do {C:attention}#1#{} wybranej",
                    "karty w swojej ręce",
                },
            },
            c_warehouse_do_over={
                name="Odrodzenie",
                text={
                    "Ponownie potasuj talię.",
                    "Zresetuj liczbę rąk i zrzutek",
                    "Ustawia wynik rundy jako {C:attention}#1#{}"
                },
            },
		},
		Joker = {
			j_warehouse_sorcerer={
				name="Czarnoksiężnik",
				text={
					"{C:red}+#1#{} mnoż. za każdą",
					"kartę {C:attention}ducha{}",
					"użytą w tym podejściu",
					"{C:inactive}(obecnie mnoż. {C:red}+#2#{C:inactive})"
				}
			},
			j_warehouse_bartender={
				name="Barman",
				text={
					"Możesz odrzucić {C:attention}#1#{} dodatkową",
					"kartę na zrzutkę.",
					"{C:attention}-#1#{} do rozmiaru ręki"
				}
			},
			j_warehouse_librarian={
				name="Bibliotekarz",
				text={
					"{C:blue}+#1#{} żet. za każdą {C:attention}różną{} kombinacje",
					"koloru/rangi punktowaną w tym podejściu",
					"{C:inactive}(obecnie: {C:blue}+#2#{C:inactive} żet.)"
				}
			},
			j_warehouse_sketch={
                name="Szkic policyjny",
                text={
                    "Powiela zdolność",
                    "ostatniego sprzedanego {C:attention}jokera{}",
                },
			}
		},
		Other = {
            warehouse_pink_seal={
                name="Różowa pieczęć",
                text={
                    "Wyrównuje {C:attention}#1#%{} {C:blue}żet.{} i {C:red}mnoż.{}",
                },
            },
            warehouse_blank_card={
            	name="Pusta karta",
            	text={
            		"Kopiuje kolor i rangę karty na {C:attention}prawo{}"
            	}
            },
            warehouse_todo={
            	name="Do zrobienia",
            	text={
            		"Ta funkcja jeszcze nie jest skończona"
            	}
            },
            warehouse_placeholder={
            	name="Element tymczasowy",
            	text={
            		"Ten dodatek używa tymczasowych zasobów",
            		"które mogą się zmienić."
            	}
            }
		},
	},
	misc={
		labels = {
			warehouse_pink_seal="Różowa pieczęć"
		},
		dictionary = {
			b_pull = "WYCIĄGNIĘCIE",
			k_warehouse_retained = "Zatrzymano!"
		}
	}
}
