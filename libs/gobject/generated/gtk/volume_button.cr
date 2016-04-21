require "./scale_button"

module Gtk
  class VolumeButton < ScaleButton
    def initialize(@gtk_volume_button)
    end

    def to_unsafe
      @gtk_volume_button.not_nil!
    end

    # Implements ImplementorIface
    # Implements Actionable
    # Implements Activatable
    # Implements Buildable
    # Implements Orientable

    def self.new
      __return_value = LibGtk.volume_button_new
      cast Gtk::Widget.new(__return_value)
    end

  end
end

