class Card < ActiveRecord::Base
  paginates_per 20
  before_create :set_default_remind_after
  
  belongs_to :user, :counter_cache => true
  
  scope :today, where("cards.remind_after <= ?", Time.zone.now.to_s)
  
  def set_default_remind_after
    self.remind_after = Time.zone.now
  end
  
  def level_up!
    update_attributes level: next_level, remind_after: next_remind
  end
  
  def next_level
    level + 1
  end
  
  def next_remind       
    Time.zone.now.beginning_of_day.since fib(next_level).days
  end
  
  private
  def fib(n)
    n < 2 ? n : fib(n-1) + fib(n-2)
  end
end
