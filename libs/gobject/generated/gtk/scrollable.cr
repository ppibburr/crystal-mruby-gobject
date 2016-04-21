module Gtk
  module Scrollable
    def border(border)
      __return_value = LibGtk.scrollable_get_border((to_unsafe as LibGtk::Scrollable*), border)
      __return_value
    end

    def hadjustment
      __return_value = LibGtk.scrollable_get_hadjustment((to_unsafe as LibGtk::Scrollable*))
      Gtk::Adjustment.new(__return_value)
    end

    def hscroll_policy
      __return_value = LibGtk.scrollable_get_hscroll_policy((to_unsafe as LibGtk::Scrollable*))
      __return_value
    end

    def vadjustment
      __return_value = LibGtk.scrollable_get_vadjustment((to_unsafe as LibGtk::Scrollable*))
      Gtk::Adjustment.new(__return_value)
    end

    def vscroll_policy
      __return_value = LibGtk.scrollable_get_vscroll_policy((to_unsafe as LibGtk::Scrollable*))
      __return_value
    end

    def hadjustment=(hadjustment)
      __return_value = LibGtk.scrollable_set_hadjustment((to_unsafe as LibGtk::Scrollable*), hadjustment && (hadjustment.to_unsafe as LibGtk::Adjustment*))
      __return_value
    end

    def hscroll_policy=(policy)
      __return_value = LibGtk.scrollable_set_hscroll_policy((to_unsafe as LibGtk::Scrollable*), policy)
      __return_value
    end

    def vadjustment=(vadjustment)
      __return_value = LibGtk.scrollable_set_vadjustment((to_unsafe as LibGtk::Scrollable*), vadjustment && (vadjustment.to_unsafe as LibGtk::Adjustment*))
      __return_value
    end

    def vscroll_policy=(policy)
      __return_value = LibGtk.scrollable_set_vscroll_policy((to_unsafe as LibGtk::Scrollable*), policy)
      __return_value
    end

  end
end

