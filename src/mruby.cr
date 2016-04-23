require "../gobject/g_object"
require "./generated/m_ruby"


lib LibMRuby
  fun get_args = mruby_get_args(ctx : LibMRuby::Context*, len : Int32*) : LibMRuby::Value**
end

module MRuby
  def self.fixnum(mrb : MRuby::Context, v : Int32)
    _ret = LibMRuby.gval2mrb(mrb.to_unsafe, returns(v))
    MRuby::Value.new(_ret)
  end

  def self.float(v : MRuby::Value)
    v.context.to_flo(v)
  end
  
  def self.float(mrb : Context, v : Float32)
    _ret = LibMRuby.gval2mrb(mrb.to_unsafe, returns(v))
    MRuby::Value.new(_ret)
  end
  
  def self.string(v : MRuby::Value)
    (v as Value).to_string()
  end
  
  def self.string(mrb : Context, v : ::String)
    _ret = LibMRuby.gval2mrb(mrb.to_unsafe, returns(v))
    MRuby::String.new(_ret)
  end  
  
  def self.bool(v : MRuby::Value)
    return v.is_truthy? 
  end
  
  def self.bool(mrb : Context, v : ::Bool)
    _ret = LibMRuby.gval2mrb(mrb.to_unsafe, returns(v))
    ret = MRuby::Value.new(mrb, _ret)
  end  

  def self.returns(v : MRuby::Value)
    MRuby.mrb2gval(v.context, v)
  end
  
  def self.returns(mrb : MRuby::Context, v : MRuby::Value)
    MRuby.mrb2gval(mrb, v)
  end  
  
  def self.returns(v : ::Bool)
    gv = GObject::Value.new(GObject::Type::BOOLEAN)
    gv.boolean = v
    return gv.to_unsafe
  end
  
  def self.returns(v : ::String)
    gv = GObject::Value.new(GObject::Type::STRING)
    gv.string = v
    return gv.to_unsafe
  end
  
  def self.returns(v : Int32)
    gv = GObject::Value.new(GObject::Type::INT)
    gv.int = v
    return gv.to_unsafe
  end

  def self.returns(v : Float32)
    gv = GObject::Value.new(GObject::Type::FLOAT)
    gv.float = v
    return gv.to_unsafe
  end
  
  def self.returns(v : Double)
    gv = GObject::Value.new(GObject::Type::DOUBLE)
    gv.double = v
    return gv.to_unsafe
  end           
  
  def self.state(ctx, mrb_self)
   _mrb, this = MRuby::Context.from_body(ctx, mrb_self)  
   args = _mrb.get_args
   return _mrb, this, args
  end
  
  def self.upcast(v : MRuby::Value)
    case MRuby.type(v)
    when MRuby::TT::ARRAY
      return v if v.is_a?(MRuby::Array)
      MRuby::Array.new(v.to_unsafe)
    when MRuby::TT::STRING
      return v if v.is_a?(MRuby::String)    
      MRuby::String.new(v.to_unsafe)
    when MRuby::TT::OBJECT
      return v if v.is_a?(MRuby::Object)    
      MRuby::Object.new(v.to_unsafe)
    else
      v
    end
  end
  
  def self.value(mrb : MRuby::Context, v : Bool)
    bool(mrb, v)
  end
  
  def self.value(mrb : MRuby::Context, v : Int32)
    fixnum(mrb, v)
  end
  
  def self.value(mrb : MRuby::Context, v : Float32)
    float(mrb, v)
  end

  def self.value(mrb : MRuby::Context, v : ::String)
    string(mrb, v)
  end
  
  def self.value(mrb : MRuby::Context, v : Value)
    v
  end    
  
  def self.value(mrb : MRuby::Context, v : Nil)
    MRuby.nil_value
  end          
  
  def self.array(mrb : MRuby::Context, *a)
    ary = MRuby::Array.new_internal(mrb)
    a.each do |v|
      ary.push(MRuby.value(mrb, v), mrb)
    end
    
    return ary
  end 
  
  def self.array(a : MRuby::Value)
    MRuby::Array.new(a)    
  end
  
  def self.ary2vary(a : MRuby::Array)
    oa  = [] of MRuby::Value
    i   = -1
    len = a.length
    
    while i < len
      oa << a[i+=1]
    end
    
    return oa
  end
end

class MRuby::Value
  def to_gval
    f = GObject::Value.new(GObject::Type::OBJECT)
    f.object = self
    return f
  end
  
  def to_gval_ptr
    to_gval.to_unsafe as LibGObject::Value*
  end
  
  def is_proc?
    MRuby.type(self) == MRuby::TT::PROC
  end
  
  def is_true?
    MRuby.type(self) == MRuby::TT::TRUE  
  end
  
  def is_truthy?
    return true if is_true?
    !(is_false? || is_nil? || is_undef?)
  end
  
  def is_falsy?
    !is_truthy?
  end
  
  def is_undef?
    MRuby.type(self) == MRuby::TT::UNDEF 
  end
  
  def is_false?
    MRuby.type(self) == MRuby::TT::FALSE  
  end
  
  def is_nil?
    MRuby.obj_ptr(self) == MRuby.obj_ptr(MRuby.nil_value)
  end
  
  def is_string?
    MRuby.type(self) == MRuby::TT::STRING
  end
  
  def is_number?
    is_int? || is_float?
  end
  
  def is_float?
    MRuby.type(self) == MRuby::TT::FLOAT
  end
  
  def is_int?
    MRuby.type(self) == MRuby::TT::FIXNUM  
  end
  
  def is_obj?
    MRuby.type(self) == MRuby::TT::OBJECT  
  end
  
  def is_array?
    MRuby.type(self) == MRuby::TT::ARRAY  
  end
  
  def is_symbol?
    MRuby.type(self) == MRuby::TT::SYMBOL  
  end
  
  def upcast
    MRuby.upcast(self)
  end      
end

class MRuby::Context
  def run_file(pth)
    load_string File.read(pth)
  end
  
  def self.from_body(c, s)
    return MRuby::Context.new(c), MRuby::Object.new(s)
  end
  
  def self.new()
    new_internal()
  end

  def get_args()
    _ret = LibMRuby.get_args(to_unsafe, out len)
    a    = ::Array(MRuby::Value).new
    
    i = 0
    while i < len
      a << MRuby::Value.new(_ret[i] as LibMRuby::Value*)
      i+=1
    end
    
    return a
  end
  
  def returns(a)
    MRuby.returns a
  end
end
