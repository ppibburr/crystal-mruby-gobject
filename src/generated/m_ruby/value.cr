module MRuby
  class Value < GObject::Object
    def initialize(@m_ruby_value)
    end

    def to_unsafe
      @m_ruby_value.not_nil!
    end

    def self.new_internal(act, mrb)
      __return_value = LibMRuby.value_new(act, (mrb.to_unsafe as LibMRuby::Context*))
      cast MRuby::Value.new(__return_value)
    end

    def to_string(c : MRuby::Context = nil)
      __return_value = LibMRuby.value_to_string((to_unsafe as LibMRuby::Value*),  (c.to_unsafe as LibMRuby::Context*))
      (raise "Expected string but got null" unless __return_value; ::String.new(__return_value))
    end

    def context(c : MRuby::Context = nil)
      __return_value = LibMRuby.value_get_context((to_unsafe as LibMRuby::Value*), c && (c.to_unsafe as LibMRuby::Context*))
      MRuby::Context.new(__return_value)
    end

  end
end

