class TicTacToeController < ApplicationController

  # Set up a brand new game board
  def new
    @current_player = 'X'
    save_player(@current_player)

    render :game_board
  end

  # Handle submitted moves
  # Assume successful move for now
  def make_move
    @current_player = current_player

    # TODO: add logic here to play the turn

    @current_player = switched_player(current_player)
    save_player(@current_player)

    render :game_board
  end


  private

  def switched_player(player)
    player == 'X' ? 'O' : 'X'
  end

  # pull the current player from the session
  def current_player
    session[:current_player]
  end

  # save the specified player as the current player 
  # in the session
  def save_player(player)
    session[:current_player] = player
  end 

end
