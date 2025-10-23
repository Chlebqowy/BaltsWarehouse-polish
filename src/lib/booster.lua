G.FUNCS.can_reserve_card = function(e)
	local c1 = e.config.ref_table
	local inc = 0
	if c1.edition and c1.edition.negative then inc = 1 end
	if
		#G.consumeables.cards < G.consumeables.config.card_limit + inc
	then
		e.config.colour = G.C.GREEN
		e.config.button = "reserve_card"
	else
		e.config.colour = G.C.UI.BACKGROUND_INACTIVE
		e.config.button = nil
	end
end

G.FUNCS.reserve_card = function(e)
	local c1 = e.config.ref_table
	G.E_MANAGER:add_event(Event({
		trigger = "after",
		delay = 0.1,
		func = function()
			c1.area:remove_card(c1)
			c1:add_to_deck()
			if c1.children.price then
				c1.children.price:remove()
			end
			c1.children.price = nil
			if c1.children.buy_button then
				c1.children.buy_button:remove()
			end
			c1.children.buy_button = nil
			remove_nils(c1.children)
			G.consumeables:emplace(c1)
			SMODS.calculate_context({ pull_card = true, card = c1 })
			G.GAME.pack_choices = G.GAME.pack_choices - 1
			if G.GAME.pack_choices <= 0 then
				G.FUNCS.end_consumeable(nil, delay_fac)
			end
			return true
		end,
	}))
end

local G_UIDEF_use_and_sell_buttons_ref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card)
	local ret = G_UIDEF_use_and_sell_buttons_ref(card)
	if (card.area == G.pack_cards and G.pack_cards) and
		card.ability and card.ability.extra and type(card.ability.extra) == "table" and card.ability.extra.pull_from_packs
	then
		return {
			n = G.UIT.ROOT,
			config = { padding = -0.1, colour = G.C.CLEAR },
			nodes = {
				{
					n = G.UIT.R,
					config = {
						ref_table = card,
						r = 0.08,
						padding = 0.1,
						align = "bm",
						minw = 0.5 * card.T.w - 0.15,
						maxw = 0.9 * card.T.w - 0.15,
						minh = 0.1 * card.T.h,
						hover = true,
						shadow = true,
						colour = G.C.UI.BACKGROUND_INACTIVE,
						one_press = true,
						button = "reserve_card",
						func = "can_reserve_card",
					},
					nodes = {
						{
							n = G.UIT.T,
							config = {
								text = localize("b_pull"),
								colour = G.C.UI.TEXT_LIGHT,
								scale = 0.55,
								shadow = true,
							},
						},
					},
				}
			}
		}
	end
	return ret
end
