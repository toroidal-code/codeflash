#Helper for the problem views
module ProblemHelper

  #lists the tag names for a problem in CSV format
  #
  # @param [Array] tag_array the array of tags
  #
  # @return a string of tag names comma deliminated
  def display_tags tag_array
    tag_array.map{|x| x.name}.join(',')
  end
end
