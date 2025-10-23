local make_upside_down = function(self, card, dt)
	if card and card.children and card.children.center then
		card.children.center.upside_down = true
	end
end

SMODS.Consumable {
	key = "i_hanged_man",
	set = "Tarot",
	pos = { x = 2, y = 1 },
	config = { max_highlighted = 5, mod_conv = 'm_warehouse_worn' },
	loc_vars = function(self, info_queue, card)
		table.insert(info_queue,
			G.P_CENTERS.m_warehouse_worn
		)
		return {
			vars = { card.ability.max_highlighted,
				localize { type = 'name_text', key = "m_warehouse_worn", set = "Enhanced" }
			}
		}
	end,
	update = make_upside_down
}

local function check_all_selected_are_suit(suit)
	if not G.hand then return end
	if not G.hand.highlighted then return end
	if #G.hand.highlighted == 0 then return end
	for _, card in ipairs(G.hand.highlighted) do
		if not card:is_suit(suit) then return false end
	end
	return true
end

SMODS.Consumable {
	key = "i_sun",
	set = "Tarot",
	pos = { x = 9, y = 1 },
	config = { max_highlighted = 5 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.max_highlighted } }
	end,
	update = make_upside_down,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.4,
			func = function()
				play_sound('tarot1')
				card:juice_up(0.3, 0.5)
				return true
			end
		}))
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.2,
			func = function()
				SMODS.destroy_cards(G.hand.highlighted)
				return true
			end
		}))
		delay(0.3)
	end,
	can_use = function(self, card)
		return check_all_selected_are_suit("Hearts")
	end
}
SMODS.Consumable {
	key = "i_moon",
	pos = { x = 8, y = 1 },
	set = "Tarot",
	config = { max_highlighted = 5 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.max_highlighted } }
	end,
	update = make_upside_down,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.4,
			func = function()
				play_sound('tarot1')
				card:juice_up(0.3, 0.5)
				return true
			end
		}))
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.2,
			func = function()
				SMODS.destroy_cards(G.hand.highlighted)
				return true
			end
		}))
		delay(0.3)
	end,
	can_use = function(self, card)
		return check_all_selected_are_suit("Clubs")
	end
}
SMODS.Consumable {
	key = "i_stars",
	pos = { x = 7, y = 1 },
	set = "Tarot",
	config = { max_highlighted = 5 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.max_highlighted } }
	end,
	update = make_upside_down,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.4,
			func = function()
				play_sound('tarot1')
				card:juice_up(0.3, 0.5)
				return true
			end
		}))
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.2,
			func = function()
				SMODS.destroy_cards(G.hand.highlighted)
				return true
			end
		}))
		delay(0.3)
	end,
	can_use = function(self, card)
		return check_all_selected_are_suit("Diamonds")
	end
}
SMODS.Consumable {
	key = "i_world",
	set = "Tarot",
	pos = { x = 1, y = 2 },
	config = { max_highlighted = 5 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.max_highlighted } }
	end,
	update = make_upside_down,
	use = function(self, card, area, copier)
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.4,
			func = function()
				play_sound('tarot1')
				card:juice_up(0.3, 0.5)
				return true
			end
		}))
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.2,
			func = function()
				SMODS.destroy_cards(G.hand.highlighted)
				return true
			end
		}))
		delay(0.3)
	end,
	can_use = function(self, card)
		return check_all_selected_are_suit("Hearts")
	end
}
SMODS.Consumable {
	key = "i_hermit",
	set = "Tarot",
	pos = { x = 9, y = 0 },
	config = { extra = { sell_amount = 3 } },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.sell_amount } }
	end,
	update = make_upside_down,
	use = function(self, card, area)
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.4,
			func = function()
				play_sound('tarot1')
				card:juice_up(0.3, 0.5)
				return true
			end
		}))
		G.E_MANAGER:add_event(Event({
			trigger = 'after',
			delay = 0.5,
			func = function()
				local joker_to_sell = G.jokers.highlighted[1]
				joker_to_sell.sell_cost = joker_to_sell.sell_cost * card.ability.extra.sell_amount
				joker_to_sell:sell_card()
				return true
			end
		}))
	end,
	can_use = function(self, card)
		return G.jokers.highlighted[1] and G.jokers.highlighted[1]:can_sell_card()
	end
}
SMODS.Consumable {
	key = "i_magician",
	set = "Tarot",
	pos = { x = 1, y = 0 },
	config = { extra = { chance_num = 2, chance_denom = 5 }, max_highlighted = 1 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.chance_num * G.GAME.probabilities.normal, card.ability.extra.chance_denom, card.ability.max_highlighted } }
	end,
	update = make_upside_down,
	use = function(self, card, context)
		if SMODS.pseudorandom_probability(card, 'warehouse_i_magician', card.ability.extra.chance_num, card.ability.extra.chance_denom) then
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.4,
				func = function()
					play_sound('tarot1')
					card:juice_up(0.3, 0.5)
					return true
				end
			}))
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.5,
				func = function()
					local _first_dissolve = nil
					local new_cards = {}
					for i = 1, card.ability.max_highlighted do
						G.playing_card = (G.playing_card and G.playing_card + 1) or 1
						local _card = copy_card(G.hand.highlighted[1], nil, nil, G.playing_card)
						_card:add_to_deck()
						G.deck.config.card_limit = G.deck.config.card_limit + 1
						table.insert(G.playing_cards, _card)
						G.hand:emplace(_card)
						_card:start_materialize(nil, _first_dissolve)
						_first_dissolve = true
						new_cards[#new_cards + 1] = _card
					end
					SMODS.calculate_context({ playing_card_added = true, cards = new_cards })
					return true
				end
			}))
			return true
		else
			WAREHOUSE.nope(card)
		end
	end
}

SMODS.Consumable {
	key = "i_justice",
	set = "Tarot",
	pos = { x = 8, y = 0 },
	config = { max_highlighted = 1, mod_conv = 'm_warehouse_dog_eared' },
	loc_vars = function(self, info_queue, card)
		table.insert(info_queue,
			G.P_CENTERS.m_warehouse_dog_eared
		)
		return {
			vars = { card.ability.max_highlighted,
				localize { type = 'name_text', key = "m_warehouse_dog_eared", set = "Enhanced" }
			}
		}
	end,
	update = make_upside_down
}

SMODS.Consumable {
	key = "i_heirophant",
	set = "Tarot",
	pos = { x = 5, y = 0 },
	config = { max_highlighted = 1, mod_conv = 'm_warehouse_virtual' },
	loc_vars = function(self, info_queue, card)
		table.insert(info_queue,
			G.P_CENTERS.m_warehouse_virtual
		)
		return {
			vars = { card.ability.max_highlighted,
				localize { type = 'name_text', key = "m_warehouse_virtual", set = "Enhanced" }
			}
		}
	end,
	update = make_upside_down
}

SMODS.Consumable {
	key = "i_wheel",
	set = "Tarot",
	pos = { x = 0, y = 1 },
	config = { extra = { chance_num = 1, chance_denom = 3 }, max_highlighted = 1 },
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.chance_num,
				card.ability.extra.chance_denom,
				card.ability.max_highlighted,
			}
		}
	end,
	update = make_upside_down,
	use = function(self, card, area)
		if SMODS.pseudorandom_probability(card, 'warehouse_i_wheel', card.ability.extra.chance_num, card.ability.extra.chance_denom) then
			G.E_MANAGER:add_event(Event({
				trigger = 'after',
				delay = 0.5,
				func = function()
					local joker_to_strip = G.jokers.highlighted[1]
	                play_sound('gold_seal')
	                card:juice_up(0.3, 0.5)
	                joker_to_strip:set_edition({})
					return true
				end
			}))
		else
			WAREHOUSE.nope(card)
		end
	end,
	can_use = function(self, card)
		return G.jokers.highlighted[1] and G.jokers.highlighted[1].edition
	end
}
