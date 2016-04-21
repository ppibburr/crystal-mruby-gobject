module Gst
  class ParseContext
    include GObject::WrappedType

    def initialize(@gst_parse_context)
    end

    def to_unsafe
      @gst_parse_context.not_nil!
    end

    def self.new
      __return_value = LibGst.parse_context_new
      cast Gst::ParseContext.new(__return_value)
    end

    def free
      __return_value = LibGst.parse_context_free((to_unsafe as LibGst::ParseContext*))
      __return_value
    end

    def missing_elements
      __return_value = LibGst.parse_context_get_missing_elements((to_unsafe as LibGst::ParseContext*))
      PointerIterator.new(__return_value) {|__item| (raise "Expected string but got null" unless __item; ::String.new(__item)) }
    end

  end
end

