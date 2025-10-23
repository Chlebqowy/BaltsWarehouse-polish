local play_discard_hook = G.FUNCS.draw_from_play_to_discard

function G.FUNCS.draw_from_play_to_discard(e)
	-- Check if there are any non-virtual cards in the deck
	local any_nonvirtual = false
	for _, card in ipairs(G.deck.cards) do
		if not SMODS.has_enhancement(card, "m_warehouse_virtual") then
			any_nonvirtual = true
			break
		end
	end
	if not any_nonvirtual then return play_discard_hook(e) end
	local it = 1
	local play_count = #G.play.cards
	for _, card in ipairs(G.play.cards) do
		if SMODS.has_enhancement(card, "m_warehouse_virtual") then
			card.virtual_flag = true
			draw_card(G.play, G.deck, it * 100 / play_count, 'up', false, card, nil, nil)
			it = it + 1
		end
	end
	return play_discard_hook(e)
end

s = {}

SMODS.Enhancement {
	key = "virtual",
	atlas = "warehouse_enhancements", pos = {x = 2, y = 0}
}

SMODS.Enhancement {
	key = "worn",
	atlas = "warehouse_enhancements", pos = {x = 0, y = 0},
	config = { extra = { chance_denom = 2 } },
	loc_vars = function(self, info_queue, enha)
		return { vars = { G.GAME.probabilities.normal, enha.ability.extra.chance_denom } }
	end,
	calculate = function(self, card, context)
		if
			context.discard and context.other_card == card and
			SMODS.pseudorandom_probability(card, 'warehouse_worn', 1, card.ability.extra.chance_denom)
		then
			return { remove = true }
		end
	end
}

SMODS.Enhancement {
	key = "dog_eared",
	atlas = "warehouse_enhancements", pos = {x = 1, y = 0},
	config = { extra = { chance_denom = 4, inc_discard = 1 } },
	loc_vars = function(self, info_queue, enha)
		return { vars = { G.GAME.probabilities.normal, enha.ability.extra.chance_denom, enha.ability.extra.inc_discard } }
	end,
	calculate = function(self, card, context)
		if
			context.discard and context.other_card == card and
			SMODS.pseudorandom_probability(card, 'warehouse_dog_eared', 1, card.ability.extra.chance_denom)
		then
			ease_discard(card.ability.extra.inc_discard)
			return {
				message = ("+%d"):format(card.ability.extra.inc_discard),
				colour = G.C.RED
			}
		end
	end
}
