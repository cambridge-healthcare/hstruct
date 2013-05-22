require_relative '../test_helper'

require 'hstruct'

Person = HStruct.new(:first_name, :last_name)

describe "Person defined from an HStruct" do
  it "is a Struct" do
    Person.ancestors.must_include Struct
  end

  it "can be instantiated with no arguments" do
    Person.new.must_be_instance_of Person
  end

  describe "instantiated from a hash" do
    let(:person) { Person.new(:first_name => "Jimmy") }

    it "first name" do
      person.first_name.must_equal "Jimmy"
    end

    it "last name" do
      person.last_name.must_equal nil
    end

    describe "when converting back to a hash" do
      it "includes empty values" do
        person.to_hash.must_equal Hash[:first_name => "Jimmy", :last_name => nil]
      end
    end
  end
end

