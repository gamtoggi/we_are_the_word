module Reminder
  def level_up!
    update_attributes level: next_level, remind_after: next_remind
  end
  
  def next_level
    level + 1
  end
  
  def next_remind       
    Time.zone.now.since fib(next_level).days
  end
  
  private
  def fib(n)
    n < 2 ? n : fib(n-1) + fib(n-2)
  end
end