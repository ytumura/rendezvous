class StringParse
  def self.tags(str, mark=nil)
    return "" if str.blank?
    tags = str.gsub(/,/, ' ').split.uniq
    tags.map{|tag|tag[0]==mark ? tag : mark+tag}.join(",") if mark.present?
  end

  def self.md2html(str)
    return "" if str.blank?
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    markdown.render(str).html_safe
  end
end
