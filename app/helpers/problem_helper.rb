module ProblemHelper
  def display_categories category_array
    category_array.map{|x| x.name}.join(',')
  end
end
