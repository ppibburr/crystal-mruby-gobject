module Gdk
  class Seat < GObject::Object
    def initialize(@gdk_seat)
    end

    def to_unsafe
      @gdk_seat.not_nil!
    end


    def capabilities
      __return_value = LibGdk.seat_get_capabilities((to_unsafe as LibGdk::Seat*))
      __return_value
    end

    def display
      __return_value = LibGdk.seat_get_display((to_unsafe as LibGdk::Seat*))
      Gdk::Display.new(__return_value)
    end

    def keyboard
      __return_value = LibGdk.seat_get_keyboard((to_unsafe as LibGdk::Seat*))
      Gdk::Device.new(__return_value) if __return_value
    end

    def pointer
      __return_value = LibGdk.seat_get_pointer((to_unsafe as LibGdk::Seat*))
      Gdk::Device.new(__return_value) if __return_value
    end

    def slaves(capabilities)
      __return_value = LibGdk.seat_get_slaves((to_unsafe as LibGdk::Seat*), capabilities)
      __return_value
    end

    def grab(window, capabilities, owner_events, cursor, event, prepare_func : LibGdk::SeatGrabPrepareFunc?, prepare_func_data)
      __return_value = LibGdk.seat_grab((to_unsafe as LibGdk::Seat*), (window.to_unsafe as LibGdk::Window*), capabilities, owner_events, cursor && (cursor.to_unsafe as LibGdk::Cursor*), event && (event.to_unsafe as LibGdk::Event*), prepare_func && prepare_func, prepare_func_data && prepare_func_data)
      __return_value
    end

    def ungrab
      __return_value = LibGdk.seat_ungrab((to_unsafe as LibGdk::Seat*))
      __return_value
    end

    alias DeviceAddedSignal = Seat, Gdk::Device -> 
    def on_device_added(&__block : DeviceAddedSignal)
      __callback = ->(_arg0 : LibGdk::Seat*, _arg1 : LibGdk::LibGdk::Device*) {
       __return_value = __block.call(Seat.new(_arg0), Gdk::Device.new(_arg1))
       __return_value
      }
      connect("device-added", __callback)
    end

    alias DeviceRemovedSignal = Seat, Gdk::Device -> 
    def on_device_removed(&__block : DeviceRemovedSignal)
      __callback = ->(_arg0 : LibGdk::Seat*, _arg1 : LibGdk::LibGdk::Device*) {
       __return_value = __block.call(Seat.new(_arg0), Gdk::Device.new(_arg1))
       __return_value
      }
      connect("device-removed", __callback)
    end

  end
end

