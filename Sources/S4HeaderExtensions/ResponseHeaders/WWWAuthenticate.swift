import S4

extension Headers {

    /**
        The `WWW-Authenticate` header field indicates the authentication
        scheme(s) and parameters applicable to the target resource.

        Authorization schemes, like Basic or Bearer, should be handled by
        Middleware libraries or directly from a framework. This header is 
        provided for convenience.

        ## Example Headers
        `WWW-Authenticate: Newauth realm="apps"`

        ## Examples
            var response = Response()
            response.headers.wwwAuthenticate = "Newauth realm=\"apps\""


        - seealso: [RFC7235](https://tools.ietf.org/html/rfc7235#section-4.2)
    */
    public var wwwAuthenticate: String? {
        get {
            return headers["WWW-Authenticate"]
        }
        set {
            headers["WWW-Authenticate"] = newValue?.headerValue
        }
    }
}
