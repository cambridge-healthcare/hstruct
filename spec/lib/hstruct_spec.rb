require_relative '../spec_helper'

require 'hstruct'

Person = HStruct.new(:first_name, :last_name, :dob)

describe "Person defined from an HStruct" do
  it "is a Struct" do
    Person.ancestors.should include Struct
  end

  it "can be instantiated with no arguments" do
    expect { Person.new }.to_not raise_error(ArgumentError)
  end

  describe "instantiated from a hash" do
    subject { Person.new(:first_name => "Jimmy") }

    its(:first_name) { should eql "Jimmy" }

    its(:last_name) { should be_nil }

    it "when converting back to a hash, leaves empty values out" do
      subject.last_name = "Kiel"
      subject.to_hash.should eql Hash[:first_name => "Jimmy", :last_name => "Kiel"]
    end
  end
end

