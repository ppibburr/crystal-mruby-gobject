require "./value"

module MRuby
  class Object < Value
    def initialize(m)
      @m_ruby_object = m as LibMRuby::Value*
    end

    def to_unsafe
      @m_ruby_object.not_nil!
    end

    def self.from(act, mrb)
      __return_value = LibMRuby.object_from(act, mrb && (mrb.to_unsafe as LibMRuby::Context*))
      cast MRuby::Object.new(__return_value)
    end

    def self.new_internal(mrb, cls, argv, argv_length1)
      __return_value = LibMRuby.object_new((mrb.to_unsafe as LibMRuby::Context*), cls && cls, argv, Int32.new(argv_length1))
      cast MRuby::Object.new(__return_value)
    end

    def dup(c)
      __return_value = LibMRuby.object_dup((to_unsafe as LibMRuby::Object*), c && (c.to_unsafe as LibMRuby::Context*))
      MRuby::Object.new(__return_value)
    end

    def clone(c)
      __return_value = LibMRuby.object_clone((to_unsafe as LibMRuby::Object*), c && (c.to_unsafe as LibMRuby::Context*))
      MRuby::Object.new(__return_value)
    end

    def as_string(ctx)
      __return_value = LibMRuby.object_as_string((to_unsafe as LibMRuby::Object*), ctx && (ctx.to_unsafe as LibMRuby::Context*))
      MRuby::String.new(__return_value)
    end

    def instance_variables(ctx)
      __return_value = LibMRuby.object_instance_variables((to_unsafe as LibMRuby::Object*), ctx && (ctx.to_unsafe as LibMRuby::Context*))
      MRuby::Object.new(__return_value)
    end

    def respond_to(mid, ctx)
      __return_value = LibMRuby.object_respond_to((to_unsafe as LibMRuby::Object*), mid, ctx && (ctx.to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def to_sym(ctx)
      __return_value = LibMRuby.object_to_sym((to_unsafe as LibMRuby::Object*), ctx && (ctx.to_unsafe as LibMRuby::Context*))
      MRuby::Symbol.new(__return_value)
    end

    def eq(foo2, ctx)
      __return_value = LibMRuby.object_eq((to_unsafe as LibMRuby::Object*), (foo2.to_unsafe as LibMRuby::Object*), ctx && (ctx.to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def equal(foo2, ctx)
      __return_value = LibMRuby.object_equal((to_unsafe as LibMRuby::Object*), (foo2.to_unsafe as LibMRuby::Object*), ctx && (ctx.to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def classname(ctx)
      __return_value = LibMRuby.object_classname((to_unsafe as LibMRuby::Object*), (ctx.to_unsafe as LibMRuby::Context*))
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def _class(ctx)
      __return_value = LibMRuby.object_class((to_unsafe as LibMRuby::Object*), ctx && (ctx.to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def kind_of?(c, ctx)
      __return_value = LibMRuby.object_is_kind_of((to_unsafe as LibMRuby::Object*), c && c, ctx && (ctx.to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def _inspect(ctx)
      __return_value = LibMRuby.object_inspect((to_unsafe as LibMRuby::Object*), ctx && (ctx.to_unsafe as LibMRuby::Context*))
      MRuby::Object.new(__return_value)
    end

    def instance_of?(c, ctx)
      __return_value = LibMRuby.object_is_instance_of((to_unsafe as LibMRuby::Object*), c && c, ctx && (ctx.to_unsafe as LibMRuby::Context*))
      __return_value
    end
  end
end

