local jd_def = JokerDisplay.Definitions -- You can assign it to a variable to use as shorthand

jd_def["j_warehouse_librarian"] = {
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "total", retrigger_type = "mult" },
    },
    text_config = { colour = G.C.CHIPS },
    calc_function = function(card)
        card.joker_display_values.total =
            card.ability.extra.per_card *
            ((G.GAME.unique_scored_cards and G.GAME.unique_scored_cards.count) or 0)
    end
}

jd_def["j_warehouse_sorcerer"] = {
    text = {
        { text = "+" },
        { ref_table = "card.joker_display_values", ref_value = "total", retrigger_type = "mult" },
    },
    text_config = { colour = G.C.MULT },
    calc_function = function(card)
        card.joker_display_values.total =
            card.ability.extra.per_mult * (
                G.GAME.consumeable_usage_total and
                G.GAME.consumeable_usage_total.spectral or 0
            )
    end
}

jd_def["j_warehouse_bartender"] = {}
