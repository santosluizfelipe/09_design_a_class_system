require "todo"

describe Todo do 
  it "construct" do 
    first_todo = Todo.new("walk the dog")
    expect(first_todo.todo).to eq "walk the dog"
  end
end