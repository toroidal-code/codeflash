module ProblemHelper
  def display_categories category_array
    categories = ""
    category_array.each do |category|
      categories += "#{category.name},"
    end
    categories
  end
end
