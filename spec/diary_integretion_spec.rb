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

  it "should return the chunk of contant what is possible to read with the given time" do 
    diary = Diary.new
    chapter = DiaryEntry.new("title", "content")
    first_todo = Todo.new("walk the dog")
    first_contact = Contact.new("Rachel", "099-555-333")
    diary.add_chapter(chapter)
    diary.add_chapter(first_todo)
    diary.add_chapter(first_contact)
    (diary.best_entry_to_read(1, 1)).to eq ["content"]
  end
end