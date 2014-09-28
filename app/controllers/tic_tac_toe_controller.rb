class TicTacToeController < ApplicationController

  # Set up a brand new game board
  def new
    @current_player = 'X'
    @board_arr = Board.blank_board

    save_player
    save_board_arr

    render :game_board
  end

  # Handle submitted moves
  # Assume successful move for now
  def make_move
    @current_player = retrieve_current_player

    # Make @board the only place where our board_arr
    # lives for now so we don't get confused by @board_arr
    @board = Board.new(retrieve_board_arr)

    @board.add_piece(retrieve_coords, @current_player)

    # Check for game-ending conditions
    if @board.winning_combination?(@current_player)
      @game_over = "Game over, player #{@current_player} WINS!"
    elsif @board.full?
      @game_over = "Game Over! You've drawn."
    end

    # Now pass our board array back to the view
    # and save everything we want to save
    @board_arr = @board.board_arr
    switch_player
    save_player
    save_board_arr

    render :game_board
  end

  private

  # switch the current player
  def switch_player
    @current_player = (@current_player == 'X' ? 'O' : 'X')
  end

  # pull the current player from the session
  def retrieve_current_player
    session[:current_player]
  end

  # save the current player in the session
  def save_player
    session[:current_player] = @current_player
  end 

  # save the board into the session
  def save_board_arr
    session[:saved_board_arr] = @board_arr
  end

  # pull the board from the session
  def retrieve_board_arr
    session[:saved_board_arr]
  end

  # Grab and clean up the coordinates our form submitted
  def retrieve_coords
    params[:move].split(",").map(&:to_i)
  end

end
