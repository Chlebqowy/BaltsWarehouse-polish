SMODS.Voucher {
	key = "theres_options",
	atlas = "warehouse_vouchers", pos = {x = 0, y = 0},
	config = { extra = {choices = 1} },
	loc_vars = function(self, info_queue, voucher)
		table.insert(info_queue, G.P_CENTERS.p_arcana_normal)
		table.insert(info_queue, G.P_CENTERS.p_celestial_normal)
		return {vars = {
			voucher.ability.extra.choices,
			localize{type = 'name_text', key="p_arcana_normal", set="Other"},
			localize{type = 'name_text', key="p_celestial_normal", set="Other"}
		}}
	end,
	calculate = function(self, card, context)
		if context.open_booster then
			local booster = context.card
			if booster.label and (
				booster.label:find("Arcana Pack") ~= nil or
				booster.label:find("Celestial Pack") ~= nil
			) then
				context.card.ability.extra = context.card.ability.extra + card.ability.extra.choices
				return {
					message = ("+%d"):format(card.ability.extra.choices),
					color = G.C.ATTENTION
				}
			end
		end
	end
}
SMODS.Voucher {
	key = "more_options",
	requires = {"v_warehouse_theres_options"},
	atlas = "warehouse_vouchers", pos = {x = 0, y = 1},
	config = { extra = {choices = 1} },
	loc_vars = function(self, info_queue, voucher)
		table.insert(info_queue,
			G.P_CENTERS.v_warehouse_theres_options
		)
		return {vars = {voucher.ability.extra.choices, localize{type = 'name_text', key="v_warehouse_theres_options", set="Voucher"}}}
	end,
	calculate = function(self, card, context)
		if context.open_booster then
			local booster = context.card
			if booster.label and not (
				booster.label:find("Arcana Pack") ~= nil or
				booster.label:find("Celestial Pack") ~= nil
			) then
				context.card.ability.extra = context.card.ability.extra + card.ability.extra.choices
				return {
					message = ("+%d"):format(card.ability.extra.choices),
					color = G.C.ATTENTION
				}
			end
		end
	end
}
SMODS.Voucher {
	key = "1up",
	config = { extra = {extra_money = 10, done = false} },
	atlas = "warehouse_vouchers", pos = {x = 1, y = 0},
	loc_vars = function(self, info_queue, voucher)
		table.insert(info_queue, { set = "Tag", key = "tag_d_six" })
		return {vars = {
			voucher.ability.extra.extra_money,
			localize{type = 'name_text', key="tag_d_six", set="Tag"}
		}}
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.game_over and not card.ability.extra.done and not context.cardarea then
			SMODS.calculate_effect({message = "Saved!", colour = G.C.GREEN}, card)
			ease_dollars(card.ability.extra.extra_money)
			G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_d_six'))
                    play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                    return true
                end)
            }))
			delay(0.7)
			return { return_to_shop = card }
		end
	end,
	update = function(self, card, dt)
		if card.ability.extra.done then
			card.debuff = true
		end
	end
}

SMODS.Voucher {
	key = "resurrection",
	requires = {"v_warehouse_1up"},
	atlas = "warehouse_vouchers", pos = {x = 1, y = 1},
	config = { extra = {extra_money = 10, done = false} },
	loc_vars = function(self, info_queue, voucher)
		table.insert(info_queue, { set = "Tag", key = "tag_coupon" })
		table.insert(info_queue, { set = "Tag", key = "tag_d_six" })
		return {vars = {
			voucher.ability.extra.extra_money,
			localize{type = 'name_text', key="tag_coupon", set="Tag"},
			localize{type = 'name_text', key="tag_d_six", set="Tag"},
			localize{type = 'name_text', key="v_warehouse_1up", set="Voucher"}
		}}
	end,
	calculate = function(self, card, context)
		if context.end_of_round and context.game_over and not card.ability.extra.done and not context.cardarea then
			SMODS.calculate_effect({message = "Saved!", colour = G.C.GREEN}, card)
			ease_dollars(card.ability.extra.extra_money)
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_coupon'))
                    add_tag(Tag('tag_d_six'))
                    play_sound('generic1', 0.9 + math.random()*0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random()*0.1, 0.4)
                    return true
                end)
            }))
			delay(0.7)
			return { return_to_shop = card }
		end
	end,
	update = function(self, card, dt)
		if card.ability.extra.done then
			card.debuff = true
		end
	end
}
SMODS.Voucher {
	key = "easy_button",
	config = { extra = {blind_size = 0.75} },
	atlas = "warehouse_vouchers", pos = {x = 2, y = 0},
	loc_vars = function(self, info_queue, voucher)
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
	atlas = "warehouse_vouchers", pos = {x = 2, y = 1},
	config = { extra = {ante_up = 0.75} },
	loc_vars = function(self, info_queue, voucher)
		return {vars = {voucher.ability.extra.ante_up}}
	end,
	calculate = function(self, card, context)
		if context.modify_ante then
			return {modify = card.ability.extra.ante_up}
		end
	end
}
