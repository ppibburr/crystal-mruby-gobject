require "../src/mruby"

mrb = MRuby::Context.new

class So
  def a
    @a
  end
  
  def a=(val)
    @a=val
  end
end

mrb.define_method("add3", LibMRuby::FuncCB.new() {|ctx, mrb_self, _|  
  _mrb, this = MRuby::Context.from_body(ctx, mrb_self)
  args       = _mrb.get_args
  
  return MRuby.returns(MRuby.fixnum(args[0]) + 3)
}, nil)

mrb.define_method("concat_bar", LibMRuby::FuncCB.new() {|ctx, mrb_self, _|
  _mrb, this = MRuby::Context.from_body(ctx, mrb_self)
  args       = _mrb.get_args
  
  MRuby.returns(MRuby.string(args[0]) + "bar")
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
