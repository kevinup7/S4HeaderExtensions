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
                return Vary(headerValues: headerValues)
            }
            return nil
        }
        set {
            headers["Vary"] = newValue?.headerValues
        }
    }
}

public enum Vary: Equatable {
    case any
    case fields([CaseInsensitiveString])
}

extension Vary {
    public init?(headerValues: HeaderValues) {
        guard let first = headerValues.first else {
            return nil
        }

        if first == "*" {
            self = .any
        } else {
            if let strings = CaseInsensitiveString.values(fromHeaderValues: headerValues) {
                self = .fields(strings)
            } else {
                return nil
            }
        }
    }
}

extension Vary: HeaderValueRepresentableType {
    public var headerValue: String {
        return ""
    }

    public var headerValues: HeaderValues {
        switch  self {
        case .any:
            return "*"
        case .fields(let fields):
            return fields.headerValues
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
