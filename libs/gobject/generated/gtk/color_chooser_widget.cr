require "./box"

module Gtk
  class ColorChooserWidget < Box
    def initialize(@gtk_color_chooser_widget)
    end

    def to_unsafe
      @gtk_color_chooser_widget.not_nil!
    end

    # Implements ImplementorIface
    # Implements Buildable
    # Implements ColorChooser
    # Implements Orientable

    def self.new
      __return_value = LibGtk.color_chooser_widget_new
      cast Gtk::Widget.new(__return_value)
    end

  end
end

