SMODS.Tag {
	key = "shop",
	loc_vars = function(self, info_queue, tag)
		table.insert(info_queue, { set = "Other", key = "warehouse_placeholder" })
		table.insert(info_queue, { set = "Other", key = "warehouse_todo" })
	end
}
SMODS.Tag {
	key = "luxury",
	min_ante = 3,
	loc_vars = function(self, info_queue, tag)
		table.insert(info_queue, { set = "Other", key = "warehouse_placeholder" })
		table.insert(info_queue, { set = "Other", key = "warehouse_todo" })
	end
}
SMODS.Tag {
	key = "shrink",
	min_ante = 7,
	config = { extra = {blind_size = 0.9} },
	loc_vars = function(self, info_queue, tag)
		table.insert(info_queue, { set = "Other", key = "warehouse_placeholder" })
		table.insert(info_queue, { set = "Other", key = "warehouse_todo" })
		return {vars = {tag.config.extra.blind_size}}
	end
}
SMODS.Tag {
	key = "booster",
	config = { extra = {extra_options = 2} },
	loc_vars = function(self, info_queue, tag)
		table.insert(info_queue, { set = "Other", key = "warehouse_placeholder" })
		table.insert(info_queue, { set = "Other", key = "warehouse_todo" })
		return {vars = {tag.config.extra.extra_options}}
	end
}
