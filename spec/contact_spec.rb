require "contact"

describe Contact do 
  it "construct" do 
    first_contact = Contact.new("Rachel", "099-555-333")
    expect(first_contact.name).to eq "Rachel"
    expect(first_contact.phone_num).to eq "099-555-333"
  end
end