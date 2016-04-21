module Gio
  module DtlsConnection
    def close(cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.dtls_connection_close((to_unsafe as LibGio::DtlsConnection*), cancellable && (cancellable.to_unsafe as LibGio::Cancellable*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def close_async(io_priority, cancellable, callback : LibGio::AsyncReadyCallback?, user_data)
      __return_value = LibGio.dtls_connection_close_async((to_unsafe as LibGio::DtlsConnection*), Int32.new(io_priority), cancellable && (cancellable.to_unsafe as LibGio::Cancellable*), callback && callback, user_data && user_data)
      __return_value
    end

    def close_finish(result)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.dtls_connection_close_finish((to_unsafe as LibGio::DtlsConnection*), (result.to_unsafe as LibGio::AsyncResult*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def emit_accept_certificate(peer_cert, errors)
      __return_value = LibGio.dtls_connection_emit_accept_certificate((to_unsafe as LibGio::DtlsConnection*), (peer_cert.to_unsafe as LibGio::TlsCertificate*), errors)
      __return_value
    end

    def certificate
      __return_value = LibGio.dtls_connection_get_certificate((to_unsafe as LibGio::DtlsConnection*))
      Gio::TlsCertificate.new(__return_value)
    end

    def database
      __return_value = LibGio.dtls_connection_get_database((to_unsafe as LibGio::DtlsConnection*))
      Gio::TlsDatabase.new(__return_value)
    end

    def interaction
      __return_value = LibGio.dtls_connection_get_interaction((to_unsafe as LibGio::DtlsConnection*))
      Gio::TlsInteraction.new(__return_value)
    end

    def peer_certificate
      __return_value = LibGio.dtls_connection_get_peer_certificate((to_unsafe as LibGio::DtlsConnection*))
      Gio::TlsCertificate.new(__return_value)
    end

    def peer_certificate_errors
      __return_value = LibGio.dtls_connection_get_peer_certificate_errors((to_unsafe as LibGio::DtlsConnection*))
      __return_value
    end

    def rehandshake_mode
      __return_value = LibGio.dtls_connection_get_rehandshake_mode((to_unsafe as LibGio::DtlsConnection*))
      __return_value
    end

    def require_close_notify
      __return_value = LibGio.dtls_connection_get_require_close_notify((to_unsafe as LibGio::DtlsConnection*))
      __return_value
    end

    def handshake(cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.dtls_connection_handshake((to_unsafe as LibGio::DtlsConnection*), cancellable && (cancellable.to_unsafe as LibGio::Cancellable*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def handshake_async(io_priority, cancellable, callback : LibGio::AsyncReadyCallback?, user_data)
      __return_value = LibGio.dtls_connection_handshake_async((to_unsafe as LibGio::DtlsConnection*), Int32.new(io_priority), cancellable && (cancellable.to_unsafe as LibGio::Cancellable*), callback && callback, user_data && user_data)
      __return_value
    end

    def handshake_finish(result)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.dtls_connection_handshake_finish((to_unsafe as LibGio::DtlsConnection*), (result.to_unsafe as LibGio::AsyncResult*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def certificate=(certificate)
      __return_value = LibGio.dtls_connection_set_certificate((to_unsafe as LibGio::DtlsConnection*), (certificate.to_unsafe as LibGio::TlsCertificate*))
      __return_value
    end

    def database=(database)
      __return_value = LibGio.dtls_connection_set_database((to_unsafe as LibGio::DtlsConnection*), (database.to_unsafe as LibGio::TlsDatabase*))
      __return_value
    end

    def interaction=(interaction)
      __return_value = LibGio.dtls_connection_set_interaction((to_unsafe as LibGio::DtlsConnection*), interaction && (interaction.to_unsafe as LibGio::TlsInteraction*))
      __return_value
    end

    def rehandshake_mode=(mode)
      __return_value = LibGio.dtls_connection_set_rehandshake_mode((to_unsafe as LibGio::DtlsConnection*), mode)
      __return_value
    end

    def require_close_notify=(require_close_notify)
      __return_value = LibGio.dtls_connection_set_require_close_notify((to_unsafe as LibGio::DtlsConnection*), require_close_notify)
      __return_value
    end

    def shutdown(shutdown_read, shutdown_write, cancellable)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.dtls_connection_shutdown((to_unsafe as LibGio::DtlsConnection*), shutdown_read, shutdown_write, cancellable && (cancellable.to_unsafe as LibGio::Cancellable*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    def shutdown_async(shutdown_read, shutdown_write, io_priority, cancellable, callback : LibGio::AsyncReadyCallback?, user_data)
      __return_value = LibGio.dtls_connection_shutdown_async((to_unsafe as LibGio::DtlsConnection*), shutdown_read, shutdown_write, Int32.new(io_priority), cancellable && (cancellable.to_unsafe as LibGio::Cancellable*), callback && callback, user_data && user_data)
      __return_value
    end

    def shutdown_finish(result)
      __error = Pointer(LibGLib::Error).null
      __return_value = LibGio.dtls_connection_shutdown_finish((to_unsafe as LibGio::DtlsConnection*), (result.to_unsafe as LibGio::AsyncResult*), pointerof(__error))
      GLib::Error.assert __error
      __return_value
    end

    alias AcceptCertificateSignal = DtlsConnection, Gio::TlsCertificate, Gio::TlsCertificateFlags -> Bool
    def on_accept_certificate(&__block : AcceptCertificateSignal)
      __callback = ->(_arg0 : LibGio::DtlsConnection*, _arg1 : LibGio::LibGio::TlsCertificate*, _arg2 : LibGio::LibGio::TlsCertificateFlags*) {
       __return_value = __block.call(DtlsConnection.new(_arg0), Gio::TlsCertificate.new(_arg1), _arg2)
       __return_value
      }
      connect("accept-certificate", __callback)
    end

  end
end

