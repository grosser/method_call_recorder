$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
name = "method_call_recorder"
require "#{name}/version"

Gem::Specification.new name, MethodCallRecorder::VERSION do |s|
  s.summary = "Ruby: Record methods calls and replay them later"
  s.authors = ["Michael Grosser"]
  s.email = "michael@grosser.it"
  s.homepage = "http://github.com/grosser/#{name}"
  s.files = `git ls-files`.split("\n")
  s.license = "MIT"
end
