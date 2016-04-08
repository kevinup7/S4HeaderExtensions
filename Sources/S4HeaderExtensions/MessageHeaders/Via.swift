import S4

extension Headers {

    /**
        The `Via` header field indicates the presence of intermediate
        protocols and recipients between the user agent and the server (on
        requests) or between the origin server and the client (on responses),
        similar to the `Received` header field in email. `Via` can be used
        for tracking message forwards, avoiding request loops, and identifying
        the protocol capabilities of senders along the request/response chain.

        ## Example Headers
        `Via: 1.0 fred (Apache/1.1)`

        `Via: 1.0 fred, 1.1 p.example.net`


        ## Examples
            var response = Response()
            response.headers.via = [ViaHeader(protocolName: "HTTP", protocolVersion: "1.0", receivedBy: "fred")]

        - seealso: [RFC7230](http://tools.ietf.org/html/rfc7230#section-5.7.1)
    */
    public var via: [ViaHeader]? {
        get {
            if let headerValues = headers["Via"] {
                return ViaHeader.values(fromHeaderValues: headerValues)
            }
            return nil
        }
        set {
            headers["Via"] = newValue?.headerValues
        }
    }
}


/**
    The `Via` header field indicates the presence of intermediate
    protocols and recipients between the user agent and the server (on
    requests) or between the origin server and the client (on responses),
    similar to the `Received` header field in email. `Via` can be used
    for tracking message forwards, avoiding request loops, and identifying
    the protocol capabilities of senders along the request/response chain.

    - seealso: [RFC7230](http://tools.ietf.org/html/rfc7230#section-5.7.1)
 */
public struct ViaHeader: Equatable {
    public let protocolName: String
    public let protocolVersion: String
    public let receivedBy: String
    public let comment: String?

    public init(protocolName: String, protocolVersion: String, receivedBy: String, comment: String? = nil) {

        self.protocolName = protocolName
        self.protocolVersion = protocolVersion
        self.receivedBy = receivedBy
        self.comment = comment
    }
}

extension ViaHeader: HeaderValueInitializable {
    public init?(headerValue: String) {
        let components = headerValue.componentsSeparated(by: " ")

        guard components.count >= 2 else {
            return nil
        }

        let protocolString = components[0]

        let protocolComponents = protocolString.componentsSeparated(by: "/")
        if protocolComponents.count == 1 {
            self.protocolName = "HTTP"
            self.protocolVersion = protocolComponents[0]
        } else if protocolComponents.count == 2 {
            self.protocolName = protocolComponents[0]
            self.protocolVersion = protocolComponents[1]
        } else {
            return nil
        }

        self.receivedBy = components[1]

        if components.count >= 3 {
            self.comment = components[2]
        } else {
            self.comment = nil
        }
    }
}

extension ViaHeader: HeaderValueRepresentableType {
    public var headerValue: String {
        var value = "\(protocolName)/\(protocolVersion) \(receivedBy)"

        if let comment = comment {
            value += " \(comment)"
        }

        return value
    }
}

public func ==(lhs: ViaHeader, rhs: ViaHeader) -> Bool {
    return lhs.protocolName == rhs.protocolName && lhs.protocolVersion == rhs.protocolVersion && lhs.receivedBy == rhs.receivedBy && lhs.comment == rhs.comment
}
