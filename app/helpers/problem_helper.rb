#Helper for the problem views
module ProblemHelper

  #lists the category names for a problem in CSV format
  #
  # @param [Array] category_array the array of categories
  #
  # @return a string of category names comma deliminated
  def display_categories category_array
    category_array.map{|x| x.name}.join(',')
  end
end
