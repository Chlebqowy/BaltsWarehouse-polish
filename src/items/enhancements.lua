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

SMODS.Enhancement {
	key = "virtual",
	loc_vars = function(self, info_queue, tag)
		table.insert(info_queue, { set = "Other", key = "warehouse_placeholder" })
	end
}

SMODS.Enhancement {
	key = "worn",
	config = { extra = { chance_denom = 2 } },
	loc_vars = function(self, info_queue, enha)
		table.insert(info_queue, { set = "Other", key = "warehouse_placeholder" })
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
	config = { extra = { chance_denom = 3 } },
	loc_vars = function(self, info_queue, enha)
		table.insert(info_queue, { set = "Other", key = "warehouse_placeholder" })
		return { vars = { G.GAME.probabilities.normal, enha.ability.extra.chance_denom } }
	end,
	calculate = function(self, card, context)
		if
			context.discard and
			context.other_card == context.full_hand[#context.full_hand]
		then
			local dog_card = nil
			for _, discarded_card in ipairs(context.full_hand) do
				print(discarded_card)
				if SMODS.has_enhancement(discarded_card, "m_warehouse_dog_eared") then
					dog_card = discarded_card
					break
				end
			end
			print(dog_card)
			if
				dog_card and
				SMODS.pseudorandom_probability(dog_card, 'warehouse_dog_eared', 1, card.ability.extra.chance_denom)
			then
				ease_discard(1)
				SMODS.calculate_effect({
					message = localize('k_warehouse_retained'),
					colour = G.C.YELLOW
				}, dog_card)
			end
		end
	end
}
