require_relative '../spec_helper'

require 'hstruct'

Person = HStruct.new(:first_name, :last_name, :dob)

describe HStruct do
  it "is a Struct" do
    Person.ancestors.should include Struct
  end

  it "can be instantiated with no arguments" do
    expect { Person.new }.to_not raise_error(ArgumentError)
  end

  it "can be instantiated from hash" do
    person = Person.new(:first_name => "Jimmy")
    person.first_name.should eql "Jimmy"
    person.last_name.should be_nil
  end

  it "when converting back to a hash, leaves empty values out" do
    person = Person.new(:first_name => "Jimmy")
    person.last_name = "Kiel"
    person.to_hash.should eql Hash[:first_name => "Jimmy", :last_name => "Kiel"]
  end
end

