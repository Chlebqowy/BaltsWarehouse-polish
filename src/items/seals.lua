SMODS.Seal {
	key = "pink",
	atlas = 'warehouse_seals',
	pos = { x = 0, y = 0 },
	badge_colour = HEX('ff66cc'),
	config = { amount = 0.10 },
	loc_vars = function(self, info_queue, card)
		return {vars = {self.config.amount * 100}}
	end,
	calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
        	local total = mult + hand_chips
	        mult = mod_mult(mult * (1 - self.config.amount) + (total/2) * self.config.amount)
	        hand_chips = mod_chips(hand_chips * (1 - self.config.amount) + (total/2) * self.config.amount)
	        update_hand_text({delay = 0}, {chips = hand_chips, mult = mult})

	        G.E_MANAGER:add_event(Event({
	            func = (function()
	                -- scored_card:juice_up()
	                play_sound('gong', 1.24, 0.3)
	                play_sound('gong', 1.24*1.5, 0.2)
	                play_sound('tarot1', 1.5)
	                ease_colour(G.C.UI_CHIPS, {0.8, 0.45, 0.85, 1})
	                ease_colour(G.C.UI_MULT, {0.8, 0.45, 0.85, 1})
	                G.E_MANAGER:add_event(Event({
	                    trigger = 'after',
	                    blockable = false,
	                    blocking = false,
	                    delay = 0.4,
	                    func = (function()
	                            ease_colour(G.C.UI_CHIPS, G.C.BLUE, 0.4)
	                            ease_colour(G.C.UI_MULT, G.C.RED, 0.4)
	                        return true
	                    end)
	                }))
	                return true
	            end)
	        }))
	        delay(0.4)
        end
	end
}
