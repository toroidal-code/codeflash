module RedcarpetHelper
  class PygmentizeHTML < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end

  def self.redcarpet_helper
    renderer = PygmentizeHTML.new(optionize [
      :with_toc_data,
      :hard_wrap,
      :xhtml
    ])
    Redcarpet::Markdown.new(renderer, optionize([
      :fenced_code_blocks,
      :no_intra_emphasis,
      :tables,
      :autolink,
      :strikethrough
    ]))
  end

  def self.optionize(options)
    options.each_with_object({}) { |option, memo| memo[option] = true }
  end
end