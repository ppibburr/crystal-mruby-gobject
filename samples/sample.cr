require "mruby-gobject/mruby"

mrb = MRuby::Context.new

mrb.define_method("add3", LibMRuby::FuncCB.new() {|ctx, mrb_self, _|
  _mrb, this, args = MRuby.state(ctx, mrb_self)
 
  _mrb.returns(MRuby.fixnum(args[0]) + 3)
}, nil)

mrb.define_method("concat_bar", LibMRuby::FuncCB.new() {|ctx, mrb_self, _|
  _mrb, this, args = MRuby.state(ctx, mrb_self)
 
  _mrb.returns(MRuby.array(_mrb, MRuby.string(args[0]) + "bar", 1, 2, nil, false))
}, nil)

result = mrb.load_string("
  puts concat_bar('foo')[2]
  p add3(3, [1,'foo'])
")

puts "\n"
pp result
pp MRuby.string(result)
pp MRuby.float(result)
pp MRuby.fixnum(result)
pp MRuby.bool result
pp MRuby.string(MRuby.bool(mrb, false))
pp MRuby.string(MRuby.bool(mrb, true))
pp MRuby.string(MRuby.nil_value())

ary = MRuby.array(mrb, 1, true, Float32.new(3.3), nil, "Foo", result)

pp MRuby.string(ary[1])

ary[1] = Float32.new(5.5)

pp MRuby.string(ary[1])

a2 = MRuby.array(mrb)
a2[0] = 1
a2[5] = true
pp a2[5].to_string


a3 = MRuby.array(mrb)
[1,2,3,4].each do |i|
  a3 << i
end

pp a3[3].to_string
