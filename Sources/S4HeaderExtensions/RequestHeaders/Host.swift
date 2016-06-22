import S4

extension Headers {

    /**
        The `Host` header field in a request provides the host and port
        information from the target URI, enabling the origin server to
        distinguish among resources while servicing requests for multiple
        host names on a single IP address.

        ## Example Headers
        `Host: www.example.org`

        `Host: www.example.org:8080`


        ## Examples
            var request = Request()
            request.headers.host = URI(host: "www.example.org")
     
            var request = Request()
            request.headers.host = URI(host: "www.example.org", port: 8080)

        - seealso: [RFC7231](https://tools.ietf.org/html/rfc7231#section-5.5.1)
    */
    public var host: URI? {
        get {
            return headers["Host"].flatMap({ URI(headerValue: $0) })
        }
        set {
            headers["Host"] = newValue?.headerValue
        }
    }
}

extension URI {
    public init(host: String, port: Int? = nil) {
        self = URI(scheme: nil, userInfo: nil, host: host, port: port, path: nil, query: nil, fragment: nil)
    }
}

extension URI: HeaderValueInitializable {
    public init?(headerValue: String) {
        let components = headerValue.components(separatedBy: ":")

        guard components.count <= 2 else {
            return nil
        }

        if components.count == 2 {
            let port = Int(components[1])
            self = URI(scheme: nil, userInfo: nil, host: components[0], port: port, path: nil, query: nil, fragment: nil)
        } else {
            self = URI(scheme: nil, userInfo: nil, host: components[0], port: nil, path: nil, query: nil, fragment: nil)
        }
    }
}

extension URI: HeaderValueRepresentable {
    public var headerValue: String {
        guard var value = host else {
            return ""
        }

        if let port = port {
            value += ":\(port)"
        }

        return value
    }
}
