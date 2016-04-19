module MRuby
  class Symbol
    include GObject::WrappedType

    def initialize(@m_ruby_symbol)
    end

    def to_unsafe
      @m_ruby_symbol.not_nil!
    end

  end
end

