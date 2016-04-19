module MRuby
  def self.cptr(val)
    __return_value = LibMRuby.cptr((val.to_unsafe as LibMRuby::Value*))
    __return_value
  end

  def self.nil_value
    __return_value = LibMRuby.nil_value
    MRuby::Value.new(__return_value)
  end

  def self.true_value
    __return_value = LibMRuby.true_value
    MRuby::Value.new(__return_value)
  end

  def self.false_value
    __return_value = LibMRuby.false_value
    MRuby::Value.new(__return_value)
  end

  def self.bool_value(val)
    __return_value = LibMRuby.bool_value(val)
    MRuby::Value.new(__return_value)
  end

  def self.fixnum_value(val)
    __return_value = LibMRuby.fixnum_value(Int32.new(val))
    MRuby::Value.new(__return_value)
  end

  def self.obj_ptr(obj)
    __return_value = LibMRuby.obj_ptr((obj.to_unsafe as LibMRuby::Value*))
    __return_value
  end

  def self.class_ptr(kls)
    __return_value = LibMRuby.class_ptr((kls.to_unsafe as LibMRuby::Value*))
    __return_value
  end

  def self.fixnum(v)
    __return_value = LibMRuby.fixnum((v.to_unsafe as LibMRuby::Value*))
    __return_value
  end

  def self.test(v)
    __return_value = LibMRuby.test((v.to_unsafe as LibMRuby::Value*))
    __return_value
  end

  def self.type(v)
    __return_value = LibMRuby.type((v.to_unsafe as LibMRuby::Value*))
    __return_value
  end

  def self.nil_p(v)
    __return_value = LibMRuby.nil_p((v.to_unsafe as LibMRuby::Value*))
    __return_value
  end

  def self.mrb2vary(m, m_length1, a, result_length1)
    __return_value = LibMRuby.mrb2vary(m, Int32.new(m_length1), a && a, Int32.new(result_length1))
    PointerIterator.new(__return_value) {|__item_12| MRuby::Value.new(__item_12) }
  end

  def self.vary2mrb(a, a_length1, result_length1)
    __return_value = LibMRuby.vary2mrb(a, Int32.new(a_length1), Int32.new(result_length1))
    PointerIterator.new(__return_value) {|__item_53| MRb::Value.new(__item_53) }
  end

  def self.mrb2gval(mrb, m)
    __return_value = LibMRuby.mrb2gval((mrb.to_unsafe as LibMRuby::Context*),  (m.to_unsafe as LibMRuby::Value*))
    p __return_value
    __return_value
  end

  def self.gval2mrb(mrb, val)
    __return_value = LibMRuby.gval2mrb((mrb.to_unsafe as LibMRuby::Context*), val && (val.to_unsafe as LibGObject::Value*))
    MRuby::Value.new(__return_value)
  end

  def self.obj_value(obj)
    __return_value = LibMRuby.obj_value(obj && obj)
    MRuby::Object.new(__return_value)
  end
end

