# encoding: UTF-8

class Dic < ActiveRecord::Base
  def self.search(word)
    if dic = find_dic(word) || create_dic(word)
      dic.mean
    else 
      "단어를 찾을수 없습니다."
    end
  end
  
  protected
  def self.find_dic(word)
    find_by_word(word)
  end
  
  def self.create_dic(word)                        
    mean = YahooDic.search(word).join("\r\n")
    dic = create(word: word, mean: mean) unless mean.empty?
    dic
  end
  
end
