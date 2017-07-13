module ForumsHelper
	def get_board_colour_hex(board)
		tag_colour = board.colour.present? ? board.colour : '#000000'
  end
end
