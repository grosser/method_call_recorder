require "spec_helper"

describe MethodCallRecorder do
  it "has a VERSION" do
    MethodCallRecorder::VERSION.should =~ /^[\.\da-z]+$/
  end
end
