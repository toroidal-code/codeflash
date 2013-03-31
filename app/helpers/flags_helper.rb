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

  def get_flag_path_array problem, solution, comment, flag
    if solution.nil?
      path = [problem, comment, flag]
    elsif comment.nil?
      path = [problem, solution, flag]
    else
      path = [problem, solution, comment, flag]
    end
    path
  end

  def get_flaggable_path flag
    if flag.flaggable.class == Solution
      path = problem_solution_path(flag.flaggable.problem, flag.flaggable)
    else
      if flag.flaggable.commentable.class == Solution
        path = problem_solution_comment_path(flag.flaggable.commentable.problem, flag.flaggable.commentable, flag.flaggable)
      else
        path = problem_comment_path(flag.flaggable.commentable, flag.flaggable)
      end
    end
    path
  end

  def get_flag_path_with_flag flag
    if flag.flaggable.class == Solution
      path = problem_solution_flag_path(flag.flaggable.problem, flag.flaggable, flag)
    else
      if flag.flaggable.commentable.class == Solution
        path = problem_solution_comment_flag_path(flag.flaggable.commentable.problem, flag.flaggable.commentable, flag.flaggable, flag)
      else
        path = problem_comment_flag_path(flag.flaggable.commentable, flag.flaggable, flag)
      end
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

  def type comment
    comment.nil? ? 'Solution' : 'Comment'
  end

end
