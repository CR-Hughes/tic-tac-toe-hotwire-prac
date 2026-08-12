class CreateMoves < ActiveRecord::Migration[8.1]
  def change
    create_table :moves do |t|
      t.references :game, null: false, foreign_key: true
      t.integer :position
      t.string :player

      t.timestamps
    end
  end
end
