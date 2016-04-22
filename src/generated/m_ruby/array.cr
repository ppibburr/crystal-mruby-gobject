require "./object"

module MRuby
  class Array < Object
    def initialize(ptr)
      @m_ruby_array =  ptr as LibMRuby::Value*
      @ctx = MRuby::Context.new(nil)
    end

    def to_unsafe
      @m_ruby_array.not_nil!
    end



    def self.new_internal(mrb)
      __return_value = LibMRuby.array_new((mrb.to_unsafe as LibMRuby::Context*))
      cast MRuby::Array.new(__return_value)
    end

    def self.from(act, c)
      __return_value = LibMRuby.array_from(act, c && (c.to_unsafe as LibMRuby::Context*))
      cast MRuby::Array.new(__return_value)
    end

    def context_get(idx, c)
      __return_value = LibMRuby.array_context_get((to_unsafe as LibMRuby::Array*), Int32.new(idx), c && (c.to_unsafe as LibMRuby::Context*))
      MRuby::Object.new(__return_value)
    end

    def context_set(i, val, ctx)
      __return_value = LibMRuby.array_context_set((to_unsafe as LibMRuby::Array*), Int32.new(i), (val.to_unsafe as LibMRuby::Value*), ctx && (ctx.to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def set(i, v)
      __return_value = LibMRuby.array_set((to_unsafe as LibMRuby::Array*), Int32.new(i), (v.to_unsafe as LibMRuby::Value*))
      __return_value
    end

    def get(i)
      __return_value = LibMRuby.array_get((to_unsafe as LibMRuby::Array*), Int32.new(i))
      MRuby::Object.new(__return_value)
    end

    def concat(foo2, ctx)
      __return_value = LibMRuby.array_concat((to_unsafe as LibMRuby::Array*), (foo2.to_unsafe as LibMRuby::Object*), ctx && (ctx.to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def splat(ctx)
      __return_value = LibMRuby.array_splat((to_unsafe as LibMRuby::Array*), ctx && (ctx.to_unsafe as LibMRuby::Context*))
      MRuby::Object.new(__return_value)
    end

    def push(foo2, ctx)
      __return_value = LibMRuby.array_push((to_unsafe as LibMRuby::Array*), (foo2.to_unsafe as LibMRuby::Object*),(ctx.to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def pop(ctx)
      __return_value = LibMRuby.array_pop((to_unsafe as LibMRuby::Array*), ctx && (ctx.to_unsafe as LibMRuby::Context*))
      MRuby::Object.new(__return_value)
    end

    def replace(b, ctx)
      __return_value = LibMRuby.array_replace((to_unsafe as LibMRuby::Array*), (b.to_unsafe as LibMRuby::Object*), ctx && (ctx.to_unsafe as LibMRuby::Context*))
      __return_value
    end

    def unshift(item, ctx)
      __return_value = LibMRuby.array_unshift((to_unsafe as LibMRuby::Array*), (item.to_unsafe as LibMRuby::Object*), ctx && (ctx.to_unsafe as LibMRuby::Context*))
      MRuby::Object.new(__return_value)
    end

    def shift(ctx)
      __return_value = LibMRuby.array_shift((to_unsafe as LibMRuby::Array*), ctx && (ctx.to_unsafe as LibMRuby::Context*))
      MRuby::Object.new(__return_value)
    end

    def clear(ctx)
      __return_value = LibMRuby.array_clear((to_unsafe as LibMRuby::Array*), ctx && (ctx.to_unsafe as LibMRuby::Context*))
      MRuby::Object.new(__return_value)
    end

    def join(sep, ctx)
      __return_value = LibMRuby.array_join((to_unsafe as LibMRuby::Array*), (sep.to_unsafe as LibMRuby::Object*), ctx && (ctx.to_unsafe as LibMRuby::Context*))
      MRuby::Object.new(__return_value)
    end

    def resize(len, ctx)
      __return_value = LibMRuby.array_resize((to_unsafe as LibMRuby::Array*), Int32.new(len), ctx && (ctx.to_unsafe as LibMRuby::Context*))
      MRuby::Object.new(__return_value)
    end

    def length
      __return_value = LibMRuby.array_get_length((to_unsafe as LibMRuby::Array*))
      __return_value
    end

    def size
      __return_value = LibMRuby.array_get_size((to_unsafe as LibMRuby::Array*))
      __return_value
    end
    
    def [](i)
      get(i)
    end
    
    def []=(i : Int32, v)
      set(i, MRuby.value(context, v))
    end
  end
end

