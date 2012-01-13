module Html
  def self.remove_tag(string)
    string.gsub(/<\/?[^>]*>/, "")  
  end
  
  def self.unescape(string)
    CGI.unescapeHTML(string)
  end
  
  def self.escape(string)
    CGI.escapeHTML(string)
  end
end