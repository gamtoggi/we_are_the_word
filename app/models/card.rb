class Card < ActiveRecord::Base
  extend CardBuilder
  include Reminder
  
  paginates_per 200
  
  belongs_to :user
                                                     
  scope :create_asc, order("cards.created_at ASC")
  scope :create_desc, order("cards.created_at DESC")
  scope :today, where("cards.created_at >= ?", Time.zone.today)
  scope :week, where("cards.created_at >= ? AND cards.created_at < ?", 1.week.ago.to_date, Time.zone.today)
  
  
end
