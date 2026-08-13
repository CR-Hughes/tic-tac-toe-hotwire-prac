class Game < ApplicationRecord
  has_many :moves, dependent: :destroy

  # broadcast board changes to a stream unique to this game
  broadcasts_to ->(game) { game }, partial: 'games/board'

  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # columns
    [0, 4, 8], [2, 4, 6],             # diagonals
  ].freeze

  def cells
    board.chars
  end

  def make_move!(position)
    return if game_over? || cells[position] != '-'

    transaction do
      new_board = cells
      new_board[position] = current_player
      moves.create!(position: position, player: current_player)

      combo = WIN_COMBINATIONS.find do |a, b, c|
        new_board[a] != '-' && new_board[a] == new_board[b] && new_board[b] == new_board[c]
      end

      if combo
        update!(board: new_board.join, status: 'won', winner: current_player, winning_line: combo.join(','))
      elsif new_board.exclude?('-')
        update!(board: new_board.join, status: 'draw')
      else
        update!(board: new_board.join, current_player: current_player == 'X' ? 'O' : 'X')
      end
    end
  end

  def reset!
    moves.destroy_all
    update!(board: '-' * 9, current_player: 'X', status: 'in_progress', winner: nil, winning_line: nil)
  end

  def game_over?
    status != 'in_progress'
  end

  def winning_line_positions
    winning_line.to_s.split(',').map(&:to_i)
  end

  def result_message
    case status
    when 'won' then "Player #{winner} wins!"
    when 'draw' then "It's a draw!"
    else "Player #{current_player}'s turn"
    end
  end
end
