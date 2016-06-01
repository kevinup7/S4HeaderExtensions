import S4

extension Headers {

    /**
        The "Connection" header field allows the sender to indicate desired
        control options for the current connection.  In order to avoid
        confusing downstream recipients, a proxy or gateway MUST remove or
        replace any received connection options before forwarding the
        message.

        When a header field aside from Connection is used to supply control
        information for or about the current connection, the sender MUST list
        the corresponding field-name within the Connection header field.  A
        proxy or gateway MUST parse a received Connection header field before
        a message is forwarded and, for each connection-option in this field,
        remove any header field(s) from the message with the same name as the
        connection-option, and then remove the Connection header field itself
        (or replace it with the intermediary's own connection options for the
        forwarded message).

        ## Example Headers
        `Connection: keep-alive`

        `Connection: upgrade`


        ## Examples
            var request =  Request()
            request.headers.connection = [.keepAlive]

            var response =  Response()
            response.headers.headers.connection = [.close]

        - seealso: [RFC7230](http://tools.ietf.org/html/rfc7230#section-6.1)
    */
    public var connection: [ConnectionType]? {
        get {
            return ConnectionType.values(fromHeader: headers["Connection"])
        }
        set {
            headers["Connection"] = newValue?.headerValue
        }
    }
}

public enum ConnectionType: Equatable {
    case close
    case keepAlive
    case connectionHeader(CaseInsensitiveString)
}

extension ConnectionType: HeaderValueInitializable {
    public init(headerValue: String) {
        let lower = CaseInsensitiveString(headerValue)
        switch lower {
        case "close":
            self = .close
        case "keep-alive":
            self = .keepAlive
        default:
            self = .connectionHeader(lower)
        }
    }
}

extension ConnectionType: HeaderValueRepresentable {
    public var headerValue: String {
        switch self {
        case .close:
            return "close"
        case .keepAlive:
            return "keep-alive"
        case .connectionHeader(let headerName):
            return headerName.description
        }
    }
}

public func ==(lhs: ConnectionType, rhs: ConnectionType) -> Bool {
    return lhs.headerValue == rhs.headerValue
}
