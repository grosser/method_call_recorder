require "method_call_recorder/version"

class MethodCallRecorder
  attr_accessor :recorded
  def initialize
    @recorded = []
  end

  def replay(subject)
    recorded.each do |name, args, block|
      subject.send(name, *args, &block)
    end
  end

  def method_missing(name, *args, &block)
    @recorded << [name, args, block]
  end
end
