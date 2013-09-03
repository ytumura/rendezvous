class SearchForm
  include ActiveModel::Model

  attr_accessor :q


  def tag?
    return true if q[0] == '#'
    return false
  end
end
