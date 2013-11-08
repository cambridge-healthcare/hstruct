require_relative '../test_helper'

require 'hstruct'
require 'pry'

Person = HStruct.new(:first_name, :last_name)

describe "Person defined from an HStruct" do
  it "is a Struct" do
    Person.ancestors.must_include Struct
  end

  it "can be instantiated with no arguments" do
    Person.new.must_be_instance_of Person
  end

  it "argument must be enumerable" do
    not_enumerable = Object.new

    ->{ Person.new(not_enumerable) }.must_raise ArgumentError
  end
  describe "instantiated from a hash" do
    describe "with Symbol keys" do
      let(:person_hash) { {
        :first_name => "Jimmy",
      } }

      let(:person) { Person.new(person_hash) }

      it "first name" do
        person.first_name.must_equal "Jimmy"
      end

      it "last name" do
        person.last_name.must_equal nil
      end
    end

    describe "with String keys" do
      let(:person_hash) { {
        "first_name" => "Alex",
      } }

      let(:person) { Person.new(person_hash) }

      it "first name" do
        person.first_name.must_equal "Alex"
      end

      it "last name" do
        person.last_name.must_equal nil
      end
    end

    describe "when converting back to a hash" do
      let(:person) { Person.new( :first_name => "Jimmy" ) }

      it "includes empty values" do
        person.to_h.must_equal Hash[:first_name => "Jimmy", :last_name => nil]
      end
    end
  end

  describe "updated from a hash" do
    describe "with Symbol keys" do
      let(:person_hash) { {
          :first_name => "Jimmy",
      } }
      let(:updated_person_hash) { {
          :first_name => "Laura",
      } }

      let(:person) { Person.new(person_hash) }
      let(:updated_person) { person.update(updated_person_hash) }

      it "first name" do
        updated_person.first_name.must_equal "Laura"
      end

      it "last name" do
        updated_person.last_name.must_equal nil
      end
    end

    describe "with String keys" do
      let(:person_hash) { {
          "first_name" => "Alex",
      } }
      let(:updated_person_hash) { {
          "first_name" => "Elise",
      } }

      let(:person) { Person.new(person_hash) }
      let(:updated_person) { person.update(updated_person_hash) }

      it "first name" do
        updated_person.first_name.must_equal "Elise"
      end

      it "last name" do
        updated_person.last_name.must_equal nil
      end
    end

    describe "when converting back to a hash" do
      let(:person) { Person.new( :first_name => "Jimmy" ) }
      let(:updated_person) { person.update( :first_name => "Laura" ) }

      it "includes empty values" do
        updated_person.to_h.must_equal Hash[:first_name => "Laura", :last_name => nil]
      end
    end
  end
end

