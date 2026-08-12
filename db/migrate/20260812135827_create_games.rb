class CreateGames < ActiveRecord::Migration[8.1]
  def change
    create_table :games do |t|
      t.string :board,          null: false, default: "-" * 9
      t.string :current_player, null: false, default: "X"
      t.string :status,         null: false, default: "in_progress"
      t.string :winner
      t.string :winning_line

      t.timestamps
    end
  end
end
