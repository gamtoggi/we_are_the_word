require 'open-uri'

module Download
  def self.doc(url)   
    open(url) {|f| Hpricot(f)}
  end
end