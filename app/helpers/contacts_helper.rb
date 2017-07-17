module ContactsHelper
	def get_state_colour_hex(state)
		if state
			tag_colour = state.colour.present? ? state.colour : '#000000'
		else
			'#000000'
		end
  end

  def get_active_class(link)
  	if params[:list] == link
  		"btn-selected"
  	else
  		""
  	end
  end

  def get_active_class_for_index
  	if !params.has_key?(:list)
  		"btn-selected"
  	else
  		""
  	end
  end
end
