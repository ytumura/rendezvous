class SearchForm
  include ActiveModel::Model

  attr_accessor :q


  def tag?
    return true if '#'.include?(q[0])
    return false
  end

  def user?
    return true if '@'.include?(q[0])
    return false
  end
end
