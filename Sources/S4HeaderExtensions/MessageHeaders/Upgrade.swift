import S4

extension Headers {

    /**
        The `Upgrade` header field is intended to provide a simple mechanism
        for transitioning from HTTP/1.1 to some other protocol on the same
        connection.  A client MAY send a list of protocols in the `Upgrade`
        header field of a request to invite the server to switch to one or
        more of those protocols, in order of descending preference, before
        sending the final response.  A server MAY ignore a received `Upgrade`
        header field if it wishes to continue using the current protocol on
        that connection.  `Upgrade` cannot be used to insist on a protocol
        change.

        ## Example Headers
        `Upgrade: HTTP/2.0, SHTTP/1.3, IRC/6.9, RTA/x11`

        `Upgrade: websocket`


        ## Examples
            var request = Request()
            request.headers.upgrade = [UpgradeProtocol(name: "HTTP", version: "2.0"), UpgradeProtocol(name: "SHTTP", version: "1.3")]

            var request = Request()
            request.headers.upgrade = [UpgradeProtocol(name: "websocket")]

        - seealso: [RFC7230](http://tools.ietf.org/html/rfc7230#section-6.7)
    */
    public var upgrade: [UpgradeProtocol]? {
        get {
            if let headerValues = headers["Upgrade"] {
                return UpgradeProtocol.values(fromHeaderValues: headerValues)
            }
            return nil
        }
        set {
            headers["Upgrade"] = newValue?.headerValues
        }
    }
}

public struct UpgradeProtocol: Equatable {
    let name: String
    let version: String?

    init(name: String, version: String? = nil) {
        self.name = name
        self.version = version
    }
}

extension UpgradeProtocol: HeaderValueInitializable {
    public init?(headerValue: String) {
        let split = headerValue.componentsSeparated(by: "/")

        if split.count == 2 {
            self = UpgradeProtocol(name: split[0].trim(), version: split[1].trim())
        } else if split.count == 1 {
            self = UpgradeProtocol(name: split[0].trim())
        } else {
            return nil
        }
    }
}

extension UpgradeProtocol: HeaderValueRepresentableType {
    public var headerValue: String {
        if let version = version {
            return "\(name)/\(version)"
        } else {
            return name
        }
    }
}

public func ==(lhs: UpgradeProtocol, rhs: UpgradeProtocol) -> Bool {
    return lhs.name == rhs.name && lhs.version == rhs.version
}
