require "diary"

describe Diary do 
  it "construct" do 
    diary = Diary.new
    expect(diary.all_instances).to eq []
  end

  it "should return chapter values only" do 
    diary = Diary.new
    chapter_value = "chapter value"
    not_chapter_value = "not chapter value"
    diary.add_chapter(chapter_value)
    diary.add_chapter(not_chapter_value)
    expect(diary.list_chapter).to eq ["chapter value"]
  end
end