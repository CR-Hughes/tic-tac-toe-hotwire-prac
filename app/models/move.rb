class Move < ApplicationRecord
  belongs_to :game

  # broadcast new moves to that same stream
  broadcasts_to :game, target: 'move_history'
end
