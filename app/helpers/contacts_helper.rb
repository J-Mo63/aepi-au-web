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

  def priority_name(priority)
  	if priority == 1
  		"High Priority"
  	elsif priority == 2
  		"Good Candidate"
  	elsif priority == 3
  		"Not Sure"
  	elsif priority == 4
  		"Not Interested"
  	else
  		"No Priority"
  	end
  end
end
