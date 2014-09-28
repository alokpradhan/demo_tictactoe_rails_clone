class Board
  attr_reader :board_arr

  # initialize board
  def initialize(board_arr = nil)
      # set up blank data structure if none given
      @board_arr = board_arr || blank_board
  end

  def self.blank_board
    Array.new(3){Array.new(3)}
  end

  # add the player's piece to the board
  def add_piece(coords, piece)
    @board_arr[coords[0]][coords[1]] = piece
  end
end