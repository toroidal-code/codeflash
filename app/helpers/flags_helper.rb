# Helper for the flags views
module FlagsHelper
  # Gets the proper path for a flag
  #
  # @param [Problem] problem  the problem that the flag is associated with
  # @param [Solution] solution the solution that the flag is associated with (might be nil)
  # @param [Comment] comment the comment that the flag is associated with (might be nil)
  # @param [Flag] flag the flag itself
  #
  # @return the path
  def get_flag_path problem, solution, comment, flag
    if solution.nil?
      path = problem_comment_flag_path(problem, comment, flag)
    elsif comment.nil?
      path = problem_solution_flag_path(problem, solution, flag)
    else
      path = problem_solution_comment_flag_path(problem, solution, comment, flag)
    end
    path
  end

  #Gets the proper new path for a flag
  #
  # @param [Problem] problem  the problem that the flag is associated with
  # @param [Solution] solution the solution that the flag is associated with (might be nil)
  # @param [Comment] comment the comment that the flag is associated with (might be nil)
  #
  # @return the path
  def get_new_flag_path problem, solution, comment
    if solution.nil?
      path = new_problem_comment_flag_path(problem, comment)
    elsif comment.nil?
      path = new_problem_solution_flag_path(problem, solution)
    else
      path = new_problem_solution_comment_flag_path(problem, solution, comment)
    end
  end

end
