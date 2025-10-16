local orig_get_blind_amount = get_blind_amount

function get_blind_amount(ante)
	local fract_ante = math.fmod(ante, 1.0)
	if fract_ante == 0 or fract_ante ~= fract_ante or not (fract_ante > -math.huge and fract_ante < math.huge) then
		return orig_get_blind_amount(ante)
	end
	-- Log-linear interpolation
	return
		(
			orig_get_blind_amount(math.floor(ante))
			^ (1 - fract_ante)
		) * (
			orig_get_blind_amount(math.floor(ante + 1))
			^ fract_ante
		)
end
