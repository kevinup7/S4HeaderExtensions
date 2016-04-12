import S4

extension Headers {
    /**
        The "Expect" header field in a request indicates a certain set of
        behaviors (expectations) that need to be supported by the server in
        order to properly handle this request.  The only such expectation
        defined by this specification is 100-continue.

        ## Example Headers
        `Expect: 100-continue`


        ## Examples
            var request =  Request()
            request.headers.expect = .Continue

        - seealso: [RFC7231](https://tools.ietf.org/html/rfc7231#section-5.1.1)
    */
    public var expect: Expect? {
        get {
            if let headerValue = headers["Expect"]?.first {
                return Expect(headerValue: headerValue)
            }
            return nil
        }
        set {
            headers["Expect"] = newValue?.header
        }
    }
}


public enum Expect: String {
    case Continue = "100-continue"
}

extension Expect: HeaderValueInitializable {
    public init?(headerValue: String) {
        if headerValue.lowercased() == "100-continue" {
            self = .Continue
        } else {
            return nil
        }
    }
}

extension Expect: HeaderValueRepresentable {
    public var headerValue: String {
        return self.headerValue
    }
}
