require 'test_helper'

describe Itiel::Scripting::RubyScript do
  before :each do
    @step = Itiel::Scripting::RubyScript.new do |row|
      row["data"] = "bar"
    end
  end

  describe "#execute" do
    it "iterates through the input_stream and yields to given block" do
      stream = [ { "data" => "foo" } ]
      @step.execute(stream)
      assert_equal [ { "data" => "bar" } ], stream
    end
  end
end
