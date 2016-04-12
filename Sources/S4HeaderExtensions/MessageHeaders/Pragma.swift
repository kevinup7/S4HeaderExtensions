import S4

extension Headers {

    /**
        The `Pragma` header field allows backwards compatibility with
        HTTP/1.0 caches, so that clients can specify a `no-cache` request
        that they will understand (as `Cache-Control` was not defined until
        HTTP/1.1).  When the `Cache-Control` header field is also present and
        understood in a request, `Pragma` is ignored.

        ## Example Headers
        `Pragma: no-cache`


        ## Examples
            var request =  Request()
            request.headers.pragma = .NoCache

        - seealso: [RFC7234](https://tools.ietf.org/html/rfc7234#section-5.4)
    */
    public var pragma: Pragma? {
        get {
            if let headerValue = headers["Pragma"]?.first {
                return Pragma(headerValue: headerValue)
            }
            return nil
        }
        set {
            headers["Pragma"] = newValue?.header
        }
    }
}

public enum Pragma: Equatable {
    case noCache
    case custom(String)
}

extension Pragma: HeaderValueInitializable {
    public init?(headerValue: String) {
        guard headerValue != "" else {
            return nil
        }

        let lower = CaseInsensitiveString(headerValue)
        if lower == "no-cache" {
            self = .noCache
        } else {
            self = .custom(headerValue)
        }
    }
}

extension Pragma: HeaderValueRepresentable {
    public var headerValue: String {
        switch self {
        case .noCache:
            return "no-cache"
        case .custom(let string):
            return string
        }
    }
}

public func ==(lhs: Pragma, rhs: Pragma) -> Bool {
    return lhs.headerValue == rhs.headerValue
}
