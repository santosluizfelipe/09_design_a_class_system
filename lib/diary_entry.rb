class DiaryEntry 
  def initialize(title, content)
    @title = title 
    @content = content
  end

  def title
    @title
  end

  def content
    @content
  end

  def count_words
    @content.split(" ").length
  end

  def reading_time(wpm)
    fail "wpm must be positive" if wpm < 1
    (count_words / wpm.to_f).ceil
  end
end