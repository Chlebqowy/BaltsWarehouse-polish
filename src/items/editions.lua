SMODS.Edition {
	key = "stellar",
	shader = "stellar",
	extra_cost = 4,
	get_weight = function(self)
		return G.GAME.edition_rate * self.weight
	end,
	weight = 5,
	sound = { sound = "holo1", per = 1.6, vol = 0.3 },
	in_shop = true,
	loc_vars = function(self, info_queue, tag)
		table.insert(info_queue, { set = "Other", key = "warehouse_todo" })
		table.insert(info_queue, { set = "Other", key = "warehouse_placeholder" })
	end
}
