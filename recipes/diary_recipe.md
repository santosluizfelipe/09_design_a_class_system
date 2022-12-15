# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System


```
                                     ┌────────────────────────────────────────┐
                                     │           Class Diary                  │
                                     │     -initializes as a empty array      │
                                     │     - add_chapter                      │
                                     │     -list chapter                      │
                                     │     -return entry based on time to rea │
                                     │     -keep track of tod list            │
                                     │     -keep track of contacts            │
                                     │                                        │
                                     │                                        │
                                     └─────┬────────────────┬────────┬────────┘
                                           │                │        │
                  ┌────────────────────────┘                │        └───────────────────────────────┐
                  │                                         │                                        │
                  ▼                                         │                                        ▼
┌──────────────────────────────────┐                        │
│            class entry           │                        ▼
│  -creates title -> string        │       ┌─────────────────────────────────────┐   ┌──────────────────────────────────┐
│  - creates a content -> string   │       │            class todo               │   │     class contact                │
│  -count words of content         │       │      creates a todo -> string       │   │ - creates a name -> string       │
│  - calculate the reading time of │       │      todo completed is a boolean    │   │ -creates a phone number -> int   │
│    contents                      │       │                                     │   │                                  │
│                                  │       └─────────────────────────────────────┘   └──────────────────────────────────┘
└──────────────────────────────────┘
```

_Also design the interface of each class in more detail._

```ruby
class Diary 
  def initialize 
    #initializes with an empty array
  end

  def all_instances
    # should return all intances from all classes
  end

  def add_chapter(entry)
    # it add an instance of another class to the array
  end

  def list_chapter
    # it returns a list with all instances of diary entry
  end

  def all_todos
    # it returns a list of all todos
  end

  def all_contacts
    #it returns a list of all contacts
  end

  def best_entry_to_read(wpm, minutes)
    #it returns the most suitable entry to read in the given time
  end
end

class DiaryEntry 
  def initialize(title, content)
    # it initializes with 2 different values
  end

  def title
    #returns the instance title
  end

  def content
    #returns the instance content
  end

  def count_words
    # it returns a integer of how many words are in contents
  end

  def reading_time(wpm)
    # it returns the amount of time the user takes to read the content
  end
end

class Todo
  def initialize(todo)
  # initializes with 2 values, todo as a string and completed as a boolean set to false
  end

  def todo
    #returns the todo
  end

  def mark_done
    # it mark the todo as completed -> true
  end

  def is_completed?
    # it check if the todo is done
  end
end

class Contact
  def initialize(name, phone_number)
    # initializes with 2 values
  end

  def name
    #returns name
  end

  def phone_num
    #returns the phone number
  end
end
```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby
# EXAMPLE Diary

# test1
diary = Diary.new
chapter = DiaryEntry.new("title", "content")
first_todo = Todo.new("walk the dog")
first_contact = Contact.new("Rachel", "099-555-333")
diary.add_chapter(chapter)
diary.add_chapter(first_todo)
diary.add_chapter(first_contact)
diary.all_instances # => [chapter, first_todo, first_contact]

# test2
diary = Diary.new
chapter = DiaryEntry.new("title", "content")
first_todo = Todo.new("walk the dog")
first_contact = Contact.new("Rachel", "099-555-333")
diary.add_chapter(chapter)
diary.add_chapter(first_todo)
diary.add_chapter(first_contact)
diary.list_chapter # => [chapter]

# test3
diary = Diary.new
chapter = DiaryEntry.new("title", "content")
first_todo = Todo.new("walk the dog")
first_contact = Contact.new("Rachel", "099-555-333")
diary.add_chapter(chapter)
diary.add_chapter(first_todo)
diary.add_chapter(first_contact)
diary.all_todos # => [first_todo]

# test4
diary = Diary.new
chapter = DiaryEntry.new("title", "content")
first_todo = Todo.new("walk the dog")
first_contact = Contact.new("Rachel", "099-555-333")
diary.add_chapter(chapter)
diary.add_chapter(first_todo)
diary.add_chapter(first_contact)
diary.all_contacts # => [first_contact]

# test5
diary = Diary.new
chapter = DiaryEntry.new("title", "content")
first_todo = Todo.new("walk the dog")
first_contact = Contact.new("Rachel", "099-555-333")
diary.add_chapter(chapter)
diary.add_chapter(first_todo)
diary.add_chapter(first_contact)
diary.best_entry_to_read(1, 1) # => ["content"]
```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE DiaryEntry

# test1
first_chapter = DiaryEntry.new("title", "some new content")
first_chapter.title # => "title
first_chapter.content # => "some new content"

#test2
first_chapter = DiaryEntry.new("title", "some new content")
first_chapter.count_words # => 3

# test3
first_chapter = DiaryEntry.new("title", "some new content")
first_chapter.reading_time(1) # => 3 (minutes)

# EXAMPLE Todo

# test1
todo = Todo.new("walk the dog")
todo.todo # => "walk the dog"
todo.mark_done
todo.is_completed? # => true

# EXAMPLE Contact

# test1
rachel = Contact.new("Rachel", "078-222-123")
rachel.name # => "Rachel"
rachel.phone_num # => "078-222-123"

```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._


