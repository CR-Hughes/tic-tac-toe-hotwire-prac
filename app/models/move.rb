class Move < ApplicationRecord
  belongs_to :game

  broadcasts_to :game, target: "move_history"
end
