class AddUsersCardsCount < ActiveRecord::Migration
  def up
    add_column :users, :cards_count, :integer, :default => 0
    
    User.all.each do |user|
      User.update_all ["cards_count = ?", user.cards.count], ["id = ?", user.id]
    end
  end

  def down
    remove_column :users, :cards_count
  end
end
