class WordPresenter

  def initialize(word)
    @service = OxfordService.new(word)
  end

  def display_word_root
    if @service.word_root
      "'#{@service.word}' is a valid word and its root form is '#{@service.word_root}'."
    else
      "'#{@service.word}' is not a valid word."
    end
  end
end
