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
    @board_arr = retrieve_board_arr

    # TODO: add logic here to play the turn

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

end
