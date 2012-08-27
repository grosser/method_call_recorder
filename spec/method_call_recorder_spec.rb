require "spec_helper"

describe MethodCallRecorder do
  let(:recorder){ MethodCallRecorder.new }

  it "has a VERSION" do
    MethodCallRecorder::VERSION.should =~ /^[\.\da-z]+$/
  end

  describe "#record" do
    it "records simple call" do
      recorder.foo
      recorder.recorded.should == [[:foo, [], nil]]
    end

    it "records call with arguments" do
      recorder.foo 1, 2, :bar => 1
      recorder.recorded.should == [[:foo, [1, 2, {:bar => 1}], nil]]
    end

    it "records call with block" do
      recorder.foo 1 do
        raise "FAIL"
      end
      recorder.recorded.size.should == 1
      recorder.recorded.first.size.should == 3
      recorder.recorded.first[0].should == :foo
      recorder.recorded.first[1].should == [1]
      recorder.recorded.first[2].should be_a(Proc)
    end

    it "records multiple calls" do
      recorder.foo
      recorder.bar
      recorder.foo
      recorder.recorded.should == [
        [:foo, [], nil],
        [:bar, [], nil],
        [:foo, [], nil]
      ]
    end
  end

  describe "#replay" do
    it "can replay simple calls" do
      recorder.foo
      stub = stub()
      stub.should_receive(:foo).with()
      recorder.replay(stub)
    end

    it "can replay calls with args" do
      recorder.foo 1, 2, :bar => 1
      stub = stub()
      stub.should_receive(:foo).with(1, 2, :bar => 1)
      recorder.replay(stub)
    end

    it "can replay calls with blocks" do
      arg = nil
      recorder.foo do |blob|
        arg = blob
      end
      stub = stub()
      stub.should_receive(:foo).with().and_yield(1)
      recorder.replay(stub)
      arg.should == 1
    end
  end
end
