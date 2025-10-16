SMODS.Joker {
	key = "sorcerer",
	rarity = 2,
	config = { extra = {per_mult = 10} },
	loc_vars = function(self, info_queue, card)
		table.insert(info_queue, { set = "Other", key = "warehouse_placeholder" })
		return {vars = {
			card.ability.extra.per_mult,
			card.ability.extra.per_mult * (
				G.GAME.consumeable_usage_total and
				G.GAME.consumeable_usage_total.spectral or 0
			)
		}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				mult = card.ability.extra.per_mult * (
					G.GAME.consumeable_usage_total and
					G.GAME.consumeable_usage_total.spectral or 0
				)
			}
		end
		if context.using_consumeable then
			print(context.consumeable.config.center)
		end
		if
			context.using_consumeable and
			context.consumeable.config.center.set == "Spectral"
		then
			return { message = localize "k_upgrade_ex" }
		end
	end
}


SMODS.Joker {
	key = "bartender",
	rarity = 2,
	config = { extra = {extra_discard = 1, hand_size = -1} },
	loc_vars = function(self, info_queue, card)
		table.insert(info_queue, { set = "Other", key = "warehouse_placeholder" })
		return {vars = {card.ability.extra.extra_discard, card.ability.extra.hand_size}}
	end,
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_discard_limit(card.ability.extra.extra_discard)
        G.hand:change_size(card.ability.extra.hand_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_discard_limit(-card.ability.extra.extra_discard)
        G.hand:change_size(-card.ability.extra.hand_size)
    end,
}

-- Hook scoring cards to tally how many unique cards have been scored this run

SMODS.Joker {
	key = "librarian",
	rarity = 1,
	config = { extra = {per_card = 10} },
	loc_vars = function(self, info_queue, card)
		table.insert(info_queue, { set = "Other", key = "warehouse_placeholder" })
		return {vars = {
			card.ability.extra.per_card,
			card.ability.extra.per_card * ((G.GAME.unique_scored_card_ids and G.GAME.unique_scored_card_ids.count) or 0)
		}}
	end,
	calculate = function(self, card, context)
		if context.joker_main then
			return {
				chips =
					card.ability.extra.per_card * ((
						G.GAME.unique_scored_card_ids and G.GAME.unique_scored_card_ids.count)
					or 0)
			}
		end
		if context.unique_card then
			return { message = localize "k_upgrade_ex" }
		end
	end
}
