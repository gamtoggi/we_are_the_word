module YahooDic
  def self.search(word)
    doc = Download.doc(url(word))                     
    elem = doc.search("//div[@class='cnt']//dt").first          
    
    results =  []
    if elem
      while (elem = elem.next_sibling) && elem.pathname == "dd"
        results << Html.unescape(Html.remove_tag(elem.inner_html))
      end
    end
    results
  end    
  
  private
  def self.url(word)
    "http://kr.dictionary.search.yahoo.com/search/dictionaryp?subtype=eng&prop=1&p=#{word}"
  end
end