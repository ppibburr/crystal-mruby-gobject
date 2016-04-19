# crystal-mruby-gobject
mruby bindings for crystal

Example
===
```ruby
require "./src/mruby"

mrb = MRuby::Context.new

mrb.define_method("add3", LibMRuby::FuncCB.new() {|ctx, mrb_self, _|
  _mrb, this, args = MRuby.state(ctx, mrb_self)
  
  _mrb.returns(MRuby.fixnum(args[0]) + 3)
}, nil)

mrb.define_method("concat_bar", LibMRuby::FuncCB.new() {|ctx, mrb_self, _|
  _mrb, this, args = MRuby.state(ctx, mrb_self)
  
  _mrb.returns(MRuby.string(args[0]) + "bar")
}, nil)

result = mrb.load_string("
  puts concat_bar('foo')
  p add3(3)
")

puts "\n"
pp result

pp MRuby.float result
pp MRuby.string result
pp MRuby.bool result
```
