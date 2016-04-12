import S4

extension Headers {

    /**
        The `Vary` header field in a response describes what parts of a
        request message, aside from the method, Host header field, and
        request target, might influence the origin server's process for
        selecting and representing this response.  The value consists of
        either a single asterisk ("*") or a list of header field names
        (case-insensitive).

        ## Example Headers
        `Vary: accept-encoding, accept-language`

        `Vary: *`


        ## Examples
            var response = Response()
            request.headers.vary = .Any
     
            var response = Response()
            response.headers.vary = .Fields(["accept-encoding", "accept-language"])

        - seealso: [RFC7231](https://tools.ietf.org/html/rfc7231#section-7.1.4)
    */
    public var vary: Vary? {
        get {
            if let headerValues = headers["Vary"] {
                return Vary(header: headerValues)
            }
            return nil
        }
        set {
            headers["Vary"] = newValue?.header
        }
    }
}

public enum Vary: Equatable {
    case any
    case fields([CaseInsensitiveString])
}

extension Vary {
    public init?(header: Header) {
        guard let first = header.first else {
            return nil
        }

        if first == "*" {
            self = .any
        } else {
            if let strings = CaseInsensitiveString.values(fromHeader: header) {
                self = .fields(strings)
            } else {
                return nil
            }
        }
    }
}

extension Vary: HeaderValueRepresentable {
    public var headerValue: String {
        return ""
    }

    public var header: Header {
        switch  self {
        case .any:
            return "*"
        case .fields(let fields):
            return fields.header
        }
    }
}

public func ==(lhs: Vary, rhs: Vary) -> Bool {
    switch (lhs, rhs) {
    case (.any, .any):
        return true
    case (.fields(let lhsFields), .fields(let rhsFields)):
        return lhsFields == rhsFields
    default:
        return false
    }
}
