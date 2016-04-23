require "./object"

module MRuby
  class String < Object
    def self.from(act, mrb)
      __return_value = LibMRuby.string_from(act, mrb && (mrb.to_unsafe as LibMRuby::Context*))
      cast MRuby::String.new(__return_value)
    end

    def self.new_internal(mrb, cstr)
      __return_value = LibMRuby.string_new((mrb.to_unsafe as LibMRuby::Context*), cstr)
      cast MRuby::String.new(__return_value)
    end
  end
end

