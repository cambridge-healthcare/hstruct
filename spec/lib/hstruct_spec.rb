require_relative '../spec_helper'

require 'hstruct'

Person = HStruct.new(:first_name, :last_name)

describe HStruct do
  let(:person) {  }

  it "is a Struct" do
    Person.ancestors.should include Struct
  end

  it "can be instantiated from hash" do
    person = Person.new(:first_name => "Jimmy")
    person.first_name.should eql "Jimmy"
    person.last_name.should be_nil
  end

  it "can be converted back to a hash" do
    person = Person.new(:first_name => "Jimmy")
    person.last_name = "Kiel"
    person.to_hash.should eql Hash[:first_name => "Jimmy", :last_name => "Kiel"]
  end
end

