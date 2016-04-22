require "./libs/mruby-gobject/mruby"

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
pp MRuby.string(result)
pp MRuby.float(result)
pp MRuby.fixnum(result)
pp MRuby.bool result
pp MRuby.bool(mrb, false).to_string
pp MRuby.nil_value().to_string
pp (ary = MRuby.array(mrb, 1, true, Float32.new(3.3), nil, "Foo", result)).get(0).to_string
pp ary[2].to_string
ary[2] = Float32.new(5.5)
pp ary[2].to_string
