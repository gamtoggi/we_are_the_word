class Card < ActiveRecord::Base
  paginates_per 100
  
  belongs_to :user
  
  validates_presence_of :user_id, :word, :mean, :level
  validates_numericality_of :level, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 3
  validates_length_of :word, :mean, :maximum => 255
                                                     
  scope :create_asc, order("cards.created_at ASC")
  scope :create_desc, order("cards.created_at DESC")
  scope :today, where("cards.created_at >= ?", Time.zone.today)
  scope :week, where("cards.created_at >= ? AND cards.created_at < ?", 1.week.ago.to_date, Time.zone.today)
end
