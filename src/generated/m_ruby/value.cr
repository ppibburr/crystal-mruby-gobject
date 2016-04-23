module MRuby
  class Value < GObject::Object
    def initialize( ptr )
      @m_ruby_value = ptr as  LibMRuby::Value*
      @ctx = nil
    end
    
    def initialize(ctx : MRuby::Context, ptr : LibMRuby::Value*)
      @ctx = ctx
      @m_ruby_value = ptr
    end    

    private def init; @ctx ||= context end

    def to_unsafe
      @m_ruby_value.not_nil!
    end

    def self.new_internal(act, mrb)
      __return_value = LibMRuby.value_new(act, (mrb.to_unsafe as LibMRuby::Context*))
      cast MRuby::Value.new(__return_value)
    end

    def to_string(c : MRuby::Context)
      __return_value = LibMRuby.value_to_string((to_unsafe as LibMRuby::Value*),  (c.to_unsafe as LibMRuby::Context*))
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end
    
    def to_string()
      v = ""
      v = "nil" if is_nil?  
      v = "false" if is_false? && !is_nil?
      v = "true" if is_true?
      
      return v if !v.empty?
          
      to_string(context)
    end

    def context(c : MRuby::Context = nil)
      __return_value = LibMRuby.value_get_context((to_unsafe as LibMRuby::Value*), c && (c as LibMRuby::Context*))
      ret = MRuby::Context.new(__return_value)
      return ret if ret.to_unsafe.not_nil!
      @ctx as MRuby::Context      
    end
  end
end

