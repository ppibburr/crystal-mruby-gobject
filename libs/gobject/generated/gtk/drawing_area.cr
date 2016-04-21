require "./widget"

module Gtk
  class DrawingArea < Widget
    def initialize(@gtk_drawing_area)
    end

    def to_unsafe
      @gtk_drawing_area.not_nil!
    end

    # Implements ImplementorIface
    # Implements Buildable
    def self.new
      __return_value = LibGtk.drawing_area_new
      cast Gtk::Widget.new(__return_value)
    end

  end
end

