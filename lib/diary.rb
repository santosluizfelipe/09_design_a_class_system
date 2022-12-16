class Diary 
  def initialize 
    @my_diary = []
  end

  def all_instances
    @my_diary
  end

  def add_chapter(entry)
    @my_diary << entry
  end

  def list_chapter
    @my_diary.select do |chapter|
      if chapter.class == DiaryEntry 
        chapter
      end
    end
  end

  def all_todos
    @my_diary.select do |chapter|
      if chapter.class == Todo 
        chapter
      end
    end
  end

  def all_contacts
    @my_diary.select do |chapter|
      if chapter.class == Contact
        chapter
      end
    end
  end

  def count_words 
    list_chapter.sum(&:count_words)
  end

  def reading_time(wpm)
    (count_words / wpm.to_f).ceil
  end

  def best_entry_to_read(wpm, min) 
    readable_chapters = @my_diary.filter do |chapter|
      chapter.reading_time(wpm) <= min
    end
    readable_chapters.max_by{ |chapter| chapter.count_words }
    readable_chapters[0].content
  end
end