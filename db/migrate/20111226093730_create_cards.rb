class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.belongs_to :user, null: false
      t.string :word, null: false
      t.string :mean, null: false
      t.integer :level, null: false, default: 0

      t.timestamps
    end
    add_index :cards, :user_id
  end
end
