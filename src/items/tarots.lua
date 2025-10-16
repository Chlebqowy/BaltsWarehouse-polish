local make_upside_down = function(self, card, dt)
	if card and card.children and card.children.center then
		card.children.center.upside_down = true
	end
end

SMODS.Consumable {
	key = "i_hanged_man",
	set = "Tarot",
    pos = { x = 2, y = 1 },
	config = { max_highlighted = 5, mod_conv = 'm_warehouse_worn' },
	loc_vars = function(self, info_queue, card)
		table.insert(info_queue,
			G.P_CENTERS.m_warehouse_worn
		)
		return {
			vars = {card.ability.max_highlighted,
			localize{type = 'name_text', key="m_warehouse_worn", set="Enhanced"}
		}}
	end,
	update = make_upside_down
}

local function check_all_selected_are_suit(suit)
	if not G.hand then return end
	if not G.hand.highlighted then return end
	if #G.hand.highlighted == 0 then return end
    for _, card in ipairs(G.hand.highlighted) do
    	if not card:is_suit(suit) then return false end
    end
    return true
end

SMODS.Consumable {
	key = "i_sun",
	set = "Tarot",
    pos = { x = 9, y = 1 },
	config = { max_highlighted = 5 },
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.max_highlighted}}
	end,
	update = make_upside_down,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                SMODS.destroy_cards(G.hand.highlighted)
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
        return check_all_selected_are_suit("Hearts")
    end
}
SMODS.Consumable {
	key = "i_moon",
    pos = { x = 8, y = 1 },
	set = "Tarot",
	config = { max_highlighted = 5 },
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.max_highlighted}}
	end,
	update = make_upside_down,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                SMODS.destroy_cards(G.hand.highlighted)
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
    	return check_all_selected_are_suit("Clubs")
    end
}
SMODS.Consumable {
	key = "i_stars",
    pos = { x = 7, y = 1 },
	set = "Tarot",
	config = { max_highlighted = 5 },
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.max_highlighted}}
	end,
	update = make_upside_down,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                SMODS.destroy_cards(G.hand.highlighted)
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
    	return check_all_selected_are_suit("Diamonds")
    end
}
SMODS.Consumable {
	key = "i_world",
	set = "Tarot",
    pos = { x = 1, y = 2 },
	config = { max_highlighted = 5 },
	loc_vars = function(self, info_queue, card)
		return {vars = {card.ability.max_highlighted}}
	end,
	update = make_upside_down,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.2,
            func = function()
                SMODS.destroy_cards(G.hand.highlighted)
                return true
            end
        }))
        delay(0.3)
    end,
    can_use = function(self, card)
    	return check_all_selected_are_suit("Hearts")
    end
}
SMODS.Consumable {
	key = "i_hermit",
	set = "Tarot",
    pos = { x = 9, y = 0 },
	config = { extra = {sell_amount = 3} },
	loc_vars = function(self, info_queue, card)
		table.insert(info_queue, { set = "Other", key = "warehouse_todo" })
		return {vars = {card.ability.extra.sell_amount}}
	end,
	update = make_upside_down
}
SMODS.Consumable {
	key = "i_lovers",
	set = "Tarot",
    pos = { x = 6, y = 0 },
	config = { max_highlighted = 1 },
	loc_vars = function(self, info_queue, card)
		table.insert(info_queue, { set = "Other", key = "warehouse_blank_card" })
		table.insert(info_queue, { set = "Other", key = "warehouse_todo" })
		return {vars = {
			card.ability.max_highlighted,
			localize{type = 'name_text', key="warehouse_blank_card", set="Other"}
		}}
	end,
	update = make_upside_down
}
SMODS.Consumable {
	key = "i_magician",
	set = "Tarot",
    pos = { x = 1, y = 0 },
	config = { extra = {chance_num = 2, chance_denom = 5}, max_highlighted = 1 },
	loc_vars = function(self, info_queue, card)
		table.insert(info_queue, { set = "Other", key = "warehouse_todo" })
		return {vars = {card.ability.extra.chance_num * G.GAME.probabilities.normal, card.ability.extra.chance_denom, card.ability.max_highlighted}}
	end,
	update = make_upside_down
}
SMODS.Consumable {
	key = "i_justice",
	set = "Tarot",
    pos = { x = 8, y = 0 },
	config = { max_highlighted = 1, mod_conv = 'm_warehouse_dog_eared' },
	loc_vars = function(self, info_queue, card)
		table.insert(info_queue,
			G.P_CENTERS.m_warehouse_dog_eared
		)
		return {
			vars = {card.ability.max_highlighted,
			localize{type = 'name_text', key="m_warehouse_dog_eared", set="Enhanced"}
		}}
	end,
	update = make_upside_down
}
SMODS.Consumable {
	key = "i_heirophant",
	set = "Tarot",
    pos = { x = 5, y = 0 },
	config = { max_highlighted = 1, mod_conv = 'm_warehouse_virtual' },
	loc_vars = function(self, info_queue, card)
		table.insert(info_queue,
			G.P_CENTERS.m_warehouse_virtual
		)
		return {
			vars = {card.ability.max_highlighted,
			localize{type = 'name_text', key="m_warehouse_virtual", set="Enhanced"}
		}}
	end,
	update = make_upside_down
}
