module FlagsHelper
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
