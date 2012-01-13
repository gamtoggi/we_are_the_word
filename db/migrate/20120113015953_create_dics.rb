class CreateDics < ActiveRecord::Migration
  def change
    create_table :dics do |t|
      t.string :word, :null => false
      t.text :mean, :null => false

      t.timestamps
    end
    
    add_index :dics, :word
  end
end
