Ruby: Record methods calls and replay them later

Install
=======

    gem install method_call_recorder

Usage
=====

    recorder = MethodCallRecorder.new

    # nothing happens
    recorder.foo
    recorder.bar :abc
    recorder.baz :xyz do |blob|
      puts blob
    end

    puts recorder.recorded

    # calls get made to subject
    recorder.replay(subject)


TODO
====
 - make it possible to record #recorded or #replay by using recorder.proxy for recording which inheroits from e.g. BlankObject

Author
======
[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
License: MIT<br/>
[![Build Status](https://secure.travis-ci.org/grosser/method_call_recorder.png)](http://travis-ci.org/grosser/method_call_recorder)
