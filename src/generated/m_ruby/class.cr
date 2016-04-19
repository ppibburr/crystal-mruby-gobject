require "./module"

module MRuby
  class Class < Module
    def initialize(@m_ruby_class)
    end

    def to_unsafe
      @m_ruby_class.not_nil!
    end

    def self.new_internal(pointer)
      __return_value = LibMRuby.class_new(pointer && pointer)
      cast MRuby::Class.new(__return_value)
    end

    def self.define(mrb, name, super, under)
      __return_value = LibMRuby.class_define((mrb.to_unsafe as LibMRuby::Context*), name, super && (super.to_unsafe as LibMRuby::Class*), under && (under.to_unsafe as LibMRuby::Module*))
      cast MRuby::Class.new(__return_value)
    end

    def self.create(mrb, super)
      __return_value = LibMRuby.class_create((mrb.to_unsafe as LibMRuby::Context*), super && (super.to_unsafe as LibMRuby::Class*))
      cast MRuby::Class.new(__return_value)
    end

    def self.get(mrb, name)
      __return_value = LibMRuby.class_get((mrb.to_unsafe as LibMRuby::Context*), name)
      cast MRuby::Class.new(__return_value)
    end

  end
end

