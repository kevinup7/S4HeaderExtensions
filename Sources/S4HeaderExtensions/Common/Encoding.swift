import S4

/**
    Values commonly used in encoding header fields.

    - chunked: chunked `Encoding` value

    - compress: compress `Encoding` value

    - deflate: deflate `Encoding` value

    - gzip: gzip `Encoding` value

    - identity: identity `Encoding` value

    - custom: A custom `Encoding` value.

    
    - note: Not all values can be used in every encoding header field.

    - seealso: [RFC7230](http://tools.ietf.org/html/rfc7230#section-6.1)
*/
public enum Encoding: Equatable {
    case chunked
    case compress
    case deflate
    case gzip
    case identity
    case custom(String)
}

extension Encoding: HeaderValueInitializable {
    public init?(headerValue: String) {
        let lowercase = headerValue.lowercased()
        switch lowercase {
        case "chunked":
            self = .chunked
        case "compress":
            self = .compress
        case "deflate":
            self = .deflate
        case "gzip":
            self = .gzip
        case "identity":
            self = .identity
        default:
            self = .custom(headerValue)
        }
    }
}

extension Encoding: HeaderValueRepresentable {
    public var headerValue: String {
        switch self {
        case .chunked:
            return "chunked"
        case .compress:
            return "compress"
        case .deflate:
            return "deflate"
        case .gzip:
            return "gzip"
        case identity:
            return "identity"
        case .custom(let encoding):
            return encoding
        }
    }
}

public func ==(lhs: Encoding, rhs: Encoding) -> Bool {
    return lhs.headerValue == rhs.headerValue
}