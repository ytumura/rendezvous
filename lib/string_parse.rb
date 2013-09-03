class StringParse
  def self.tags(str)
    tags = str.split.delete_if{|word|word[0] != "#"}.uniq
    tags.map{|tag|tag[1..-1]}.join(",")
  end
end
