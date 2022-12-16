require "diary_entry"

describe DiaryEntry do 
  it "construct" do 
    first_chapter = DiaryEntry.new("title", "some new content")
    expect(first_chapter.title).to eq "title"
    expect(first_chapter.content).to eq "some new content"
  end

  it "should return the number of words in content" do 
    first_chapter = DiaryEntry.new("title", "some new content")
    expect(first_chapter.count_words).to eq 3
  end

  it "should return 0 if content is empty" do 
    first_chapter = DiaryEntry.new("title", "")
    expect(first_chapter.count_words).to eq 0
  end

  it "should return the reading time of content" do 
    first_chapter = DiaryEntry.new("title", "some new content")
    expect(first_chapter.reading_time(3)).to eq 1
  end

  it "should fail if reading_time argument is not positive" do 
    first_chapter = DiaryEntry.new("title", "some new content")
    expect{ first_chapter.reading_time(0) }.to raise_error "wpm must be positive"
  end

end