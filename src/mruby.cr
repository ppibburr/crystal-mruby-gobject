require "./g_object"
require "./generated/m_ruby"



lib LibMRuby
  fun get_args = mruby_get_args(ctx : LibMRuby::Context*, len : Int32*) : LibMRuby::Value**
end

module MRuby
  def self.float(v)
    v.context.to_flo(v)
  end
  
  def self.string(v : MRuby::Value)
    v.to_string(v.context)
  end
  
  def self.bool(v : MRuby::Value)
    return v.is_truthy? 
  end

  def self.returns(v : MRuby::Value)
    v.to_gval_ptr
  end
  
  def self.returns(v : Boolean)
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
    gv.boolean = v
    return gv.to_unsafe
  end
  
  def self.returns(v : Double)
    gv = GObject::Value.new(GObject::Type::DOUBLE)
    gv.double = v
    return gv.to_unsafe
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
end

class MRuby::Context
  def run_file(pth)
    load_string File.read(pth)
  end
  
  def self.from_body(c, s)
    return MRuby::Context.new(c), MRuby::Object.new(s as LibMRuby::Object*)
  end
  
  def self.new()
    new_internal()
  end
  
  def get_args()
    _ret = LibMRuby.get_args(to_unsafe, out len)
    a    = [] of MRuby::Value
    
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
