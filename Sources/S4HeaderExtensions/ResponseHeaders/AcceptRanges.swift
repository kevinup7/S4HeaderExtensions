import S4

extension Headers {

    /**
        The "Accept-Ranges" header field allows a server to indicate that it 
        supports range requests for the target resource.

        ## Example Headers
        `Accept-Ranges: bytes`

        `Accept-Ranges: none`

        ## Examples
            var response =  Response()
            response.headers.acceptRanges = .bytes

            var response =  Response()
            response.headers.acceptRanges = .none

        - seealso: [RFC7233](https://tools.ietf.org/html/rfc7233#section-2.3)
    */
    public var acceptRanges: AcceptRanges? {
        get {
            return headers["Accept-Ranges"].flatMap({ AcceptRanges(headerValue: $0) })
        }
        set {
            headers["Accept-Ranges"] = newValue?.headerValue
        }
    }
}

/// The type of scheme, if any, supported by the server.
public enum AcceptRanges: Equatable {
    case none
    case bytes
    case custom(String)
}

extension AcceptRanges: HeaderValueInitializable {
    public init?(headerValue: String) {
        guard headerValue != "" else {
            return nil
        }

        if headerValue == "none" {
            self = .none
        } else if headerValue == "bytes" {
            self = .bytes
        } else {
            self = .custom(headerValue)
        }
    }
}

extension AcceptRanges: HeaderValueRepresentable {
    public var headerValue: String {
        switch self {
        case .none:
            return "none"
        case .bytes:
            return "bytes"
        case .custom(let string):
            return string
        }
    }
}

public func ==(lhs: AcceptRanges, rhs: AcceptRanges) -> Bool {
    return lhs.headerValue == rhs.headerValue
}
