# encoding: UTF-8
module CardBuilder
  def build(attributes)
    card = new(attributes)
    dic = find_dic(attributes[:word]) || create_dic(attributes[:word])
    card.mean = dic.mean
    card
  end
  
  def find_dic(word)
    Dic.find_by_word(word)
  end
  
  def create_dic(word)                        
    mean = YahooDic.search(word).join("\r\n")
    raise "단어를 찾을 수 없습니다" if mean.empty?
    Dic.create(word: word, mean: mean)
  end
end