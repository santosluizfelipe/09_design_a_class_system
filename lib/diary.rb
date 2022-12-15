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

  def best_entry_to_read(wpm, min)

  end
end