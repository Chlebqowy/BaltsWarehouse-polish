SMODS.Voucher {
	key = "theres_options",
	config = { extra = {choices = 1} },
	loc_vars = function(self, info_queue, voucher)
		table.insert(info_queue, { set = "Other", key = "warehouse_todo" })
		table.insert(info_queue, { set = "Other", key = "warehouse_placeholder" })
		return {vars = {voucher.ability.extra.choices}}
	end
}
SMODS.Voucher {
	key = "more_options",
	requires = {"v_warehouse_theres_options"},
	config = { extra = {choices = 1} },
	loc_vars = function(self, info_queue, voucher)
		table.insert(info_queue, { set = "Other", key = "warehouse_todo" })
		table.insert(info_queue, { set = "Other", key = "warehouse_placeholder" })
		table.insert(info_queue,
			G.P_CENTERS.v_warehouse_theres_options
		)
		return {vars = {voucher.ability.extra.choices, localize{type = 'name_text', key="v_warehouse_theres_options", set="Voucher"}}}
	end
}
SMODS.Voucher {
	key = "1up",
	config = { extra = {extra_money = 20} },
	loc_vars = function(self, info_queue, voucher)
		table.insert(info_queue, { set = "Other", key = "warehouse_todo" })
		table.insert(info_queue, { set = "Other", key = "warehouse_placeholder" })
		return {vars = {voucher.ability.extra.extra_money}}
	end,
	calculate = function(self, card, context)
		print(context.end_of_round, context.game_over, not card.debuff, not context.cardarea)
		if context.end_of_round and context.game_over and not card.debuff and not context.cardarea then
			print("Saving!")
			SMODS.calculate_effect({message = "Saved!", colour = G.C.GREEN}, card)
			ease_dollars(card.ability.extra.extra_money)
			delay(0.7)
			return { return_to_shop = card }
		end
	end
}

SMODS.Voucher {
	key = "resurrection",
	requires = {"v_warehouse_1up"},
	config = { extra = {extra_money = 30} },
	loc_vars = function(self, info_queue, voucher)
		table.insert(info_queue, { set = "Tag", key = "tag_coupon" })
		table.insert(info_queue, { set = "Other", key = "warehouse_todo" })
		table.insert(info_queue, { set = "Other", key = "warehouse_placeholder" })
		return {vars = {voucher.ability.extra.extra_money, localize{type = 'name_text', key="tag_coupon", set="Tag"}}}
	end
}
SMODS.Voucher {
	key = "easy_button",
	config = { extra = {blind_size = 0.9} },
	loc_vars = function(self, info_queue, voucher)
		table.insert(info_queue, { set = "Other", key = "warehouse_placeholder" })
		return {vars = {voucher.ability.extra.blind_size}}
	end,
	calculate = function(self, card, context)
		if context.first_hand_drawn then
			G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blind_size
        	G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)

            SMODS.juice_up_blind()
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.06 * G.SETTINGS.GAMESPEED,
                blockable = false,
                blocking = false,
                func = function()
                    play_sound('tarot2', 0.76, 0.4)
                    return true
                end
            }))
            play_sound('tarot2', 1, 0.4)
		end
	end
}
SMODS.Voucher {
	key = "wimpmode",
	requires = {"v_warehouse_easy_button"},
	config = { extra = {ante_up = 0.8} },
	loc_vars = function(self, info_queue, voucher)
		table.insert(info_queue, { set = "Other", key = "warehouse_placeholder" })
		return {vars = {voucher.ability.extra.ante_up}}
	end,
	calculate = function(self, card, context)
		if context.modify_ante then
			return {modify = card.ability.extra.ante_up}
		end
	end
}
