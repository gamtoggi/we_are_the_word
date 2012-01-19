class AddRemindAfterToCards < ActiveRecord::Migration
  def change
    add_column :cards, :remind_after, :datetime
  end
end
