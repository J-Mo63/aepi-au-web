module ContactsHelper
	def get_state_colour_hex(state)
		if state
			tag_colour = state.colour.present? ? state.colour : '#000000'
		else
			'#000000'
		end
  end
end
