SMODS.Tag {
	key = "shop",
	config = { extra = { money = 5 } },
	atlas = "warehouse_tags", pos = {x = 0, y = 0},
	loc_vars = function(self, info_queue, tag)
		return { vars = {self.config.extra.money } }
	end,
	apply = function(self, tag, context)
		if context.type == 'immediate' and not WAREHOUSE.returning_to_shop then
			tag:yep("$", G.C.ATTENTION, function()
				ease_dollars(self.config.extra.money)
				WAREHOUSE.return_to_shop()
                return true
			end)
			WAREHOUSE.returning_to_shop = true
			tag.triggered = true
			return true
		end
	end
}
SMODS.Tag {
	key = "shrink",
	min_ante = 7,
	config = { extra = { blind_size = 0.8 } },
	atlas = "warehouse_tags", pos = {x = 1, y = 0},
	loc_vars = function(self, info_queue, tag)
		return { vars = { tag.config.extra.blind_size } }
	end,
	apply = function(self, tag, context)
		if context.type == 'round_start_bonus' then
			tag:yep(string.format("x%.01f", tag.config.extra.blind_size), G.C.ATTENTION, function()
				G.GAME.blind.chips = G.GAME.blind.chips * tag.config.extra.blind_size
        		G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                return true
			end)
			tag.triggered = true
		end
	end
}
SMODS.Tag {
	key = "booster",
	config = { extra = { extra_options = 2 } },
	atlas = "warehouse_tags", pos = {x = 2, y = 0},
	loc_vars = function(self, info_queue, tag)
		return { vars = { tag.config.extra.extra_options } }
	end,
	apply = function(self, tag, context)
		if context.type == 'open_booster' then
			tag:yep(string.format("+%d", tag.config.extra.extra_options), G.C.ATTENTION, function()
				context.card.ability.extra = context.card.ability.extra + tag.config.extra.extra_options
                return true
			end)
			tag.triggered = true
		end
	end
}
