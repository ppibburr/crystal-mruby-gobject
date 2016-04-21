# crystal-mruby-gobject
mruby bindings for crystal

Dependencies
===
* girepository
[mruby-vala]: https://github.com/ppibburr/mruby-vala

Ubuntu:  
---
Install gobject-introspection
`sudo apt-get install libgirepository1.0-dev`

Clone and install mruby-vala:
```sh
git clone https://github.com/ppibburr/mruby-vala
cd mruby-vala
sudo make mruby
make
sudo make install
cd ..
```

alternatively `mruby-vala` .debs provided here
[Ubuntu 15.10 amd64]: https://github.com/ppibburr/ppibburr.github.com/raw/master/mruby-vala_0.1-1_amd64.deb 
[Ubuntu 15.10 x86]: https://github.com/ppibburr/ppibburr.github.com/raw/master/mruby-vala_0.1-1_i386.deb


Clone the repo
===
```
git clone https://github.com/ppibburr/crystal-mruby-gobject
cd crystal-mruby-gobject
```

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
