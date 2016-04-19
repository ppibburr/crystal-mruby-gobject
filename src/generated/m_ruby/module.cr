module MRuby
  class Module < GObject::Object
    def initialize(@m_ruby_module)
    end

    def to_unsafe
      @m_ruby_module.not_nil!
    end


    def value
      __return_value = LibMRuby.module_get_value((to_unsafe as LibMRuby::Module*))
      MRuby::Value.new(__return_value)
    end

    def self.new_internal(pointer)
      __return_value = LibMRuby.module_new(pointer && pointer)
      cast MRuby::Module.new(__return_value)
    end

    def self.from_value(value)
      __return_value = LibMRuby.module_from_value((value.to_unsafe as LibMRuby::Value*))
      cast MRuby::Module.new(__return_value)
    end

    def self.define(mrb, name, under)
      __return_value = LibMRuby.module_define((mrb.to_unsafe as LibMRuby::Context*), name, under && (under.to_unsafe as LibMRuby::Module*))
      cast MRuby::Module.new(__return_value)
    end

    def self.create(mrb)
      __return_value = LibMRuby.module_create((mrb.to_unsafe as LibMRuby::Context*))
      cast MRuby::Module.new(__return_value)
    end

    def self.get(mrb, name)
      __return_value = LibMRuby.module_get((mrb.to_unsafe as LibMRuby::Context*), name)
      cast MRuby::Module.new(__return_value)
    end

    def define_method(mrb, name, cb : LibMRuby::FuncCB, cb_target)
      __return_value = LibMRuby.module_define_method((to_unsafe as LibMRuby::Module*), (mrb.to_unsafe as LibMRuby::Context*), name, cb, cb_target && cb_target)
      __return_value
    end

    def define_static_method(mrb, name, cb : LibMRuby::FuncCB, cb_target)
      __return_value = LibMRuby.module_define_static_method((to_unsafe as LibMRuby::Module*), (mrb.to_unsafe as LibMRuby::Context*), name, cb, cb_target && cb_target)
      __return_value
    end

    def self.invoke_func_with_env(mrb, self)
      __return_value = LibMRuby.module_invoke_func_with_env((mrb.to_unsafe as LibMRuby::Context*), (self.to_unsafe as LibMRuby::Value*))
      MRuby::Value.new(__return_value)
    end

    def pointer
      __return_value = LibMRuby.module_get_pointer((to_unsafe as LibMRuby::Module*))
      __return_value
    end

    def pointer=(value)
      __return_value = LibMRuby.module_set_pointer((to_unsafe as LibMRuby::Module*), value && value)
      __return_value
    end

  end
end

