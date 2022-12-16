require "diary"
require "diary_entry"
require "todo"
require "contact"

describe "integretion" do 
  it "should return all instances when all_instances is called" do 
    diary = Diary.new
    chapter = DiaryEntry.new("title", "content")
    first_todo = Todo.new("walk the dog")
    first_contact = Contact.new("Rachel", "099-555-333")
    diary.add_chapter(chapter)
    diary.add_chapter(first_todo)
    diary.add_chapter(first_contact)
    expect(diary.all_instances).to eq [chapter, first_todo, first_contact]
  end

  it "should list all entries of diary entry" do 
    diary = Diary.new
    chapter = DiaryEntry.new("title", "content")
    first_todo = Todo.new("walk the dog")
    first_contact = Contact.new("Rachel", "099-555-333")
    diary.add_chapter(chapter)
    diary.add_chapter(first_todo)
    diary.add_chapter(first_contact)
    expect(diary.list_chapter).to eq [chapter]
  end

  it "should list all todos" do 
    diary = Diary.new
  chapter = DiaryEntry.new("title", "content")
  first_todo = Todo.new("walk the dog")
  first_contact = Contact.new("Rachel", "099-555-333")
  diary.add_chapter(chapter)
  diary.add_chapter(first_todo)
  diary.add_chapter(first_contact)
  expect(diary.all_todos).to eq [first_todo]
  end

  it "should list all contacts" do 
    diary = Diary.new
  chapter = DiaryEntry.new("title", "content")
  first_todo = Todo.new("walk the dog")
  first_contact = Contact.new("Rachel", "099-555-333")
  diary.add_chapter(chapter)
  diary.add_chapter(first_todo)
  diary.add_chapter(first_contact)
  expect(diary.all_contacts).to eq [first_contact]
  end

  it "shoiuld return a number of all words in content" do 
    diary = Diary.new
    chapter = DiaryEntry.new("title", "content")
    chapter2 = DiaryEntry.new("title", "a lot of content in this string")
    diary.add_chapter(chapter)
    diary.add_chapter(chapter2)
    expect(diary.count_words).to eq 8
  end

  it "should return the amount of time it takes to read all contents" do 
    diary = Diary.new
    chapter = DiaryEntry.new("title", "content")
    chapter2 = DiaryEntry.new("title", "a lot of content in this string")
    diary.add_chapter(chapter)
    diary.add_chapter(chapter2)
    expect(diary.reading_time(2)).to eq 4
  end

  it "should fail if wpm is not positive" do 
    diary = Diary.new
    chapter = DiaryEntry.new("title", "content")
    chapter2 = DiaryEntry.new("title", "a lot of content in this string")
    diary.add_chapter(chapter)
    diary.add_chapter(chapter2)
    expect{ diary.reading_time(0) }.to raise_error "wpm must be positive"
  end

  it "should return the chunk of contant what is possible to read with the given time" do 
    diary = Diary.new
    chapter1 = DiaryEntry.new("title", "one, two")
    chapter2 = DiaryEntry.new("title", "one, two, three")
    chapter3 = DiaryEntry.new("title", "one, two, three, four")
    chapter4 = DiaryEntry.new("title", "one, two, three, four, five")
    chapter5 = DiaryEntry.new("title", "one, two, three, four, five, six")
    diary.add_chapter(chapter4)
    diary.add_chapter(chapter1)
    diary.add_chapter(chapter5)
    diary.add_chapter(chapter3)
    diary.add_chapter(chapter2)
    expect(diary.best_entry_to_read(5, 1)).to eq "one, two, three, four, five"
  end
end