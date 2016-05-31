import S4

extension Headers {

    /**
        The `Authorization` header field allows a user agent to authenticate
        itself with an origin server -- usually, but not necessarily, after
        receiving a `401 (Unauthorized)` response.  Its value consists of
        credentials containing the authentication information of the user
        agent for the realm of the resource being requested.
     
        Authorization schemes, like Basic or Bearer, should be handled by
        Middleware libraries or directly from a framework. This header is
        provided for convenience.

        ## Example Headers
        `Authorization: Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==`

        `Authorization: Digest username="Mufasa",realm="testrealm@host.com"`


        ## Examples
            var request = Request()
            request.headers.authorization = "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ=="


        - seealso: [RFC7235](https://tools.ietf.org/html/rfc7235#section-4.1)
    */
    public var authorization: String? {
        get {
            if let headerValue = headers["Authorization"]?.first {
                return headerValue
            }
            return nil
        }
        set {
            headers["Authorization"] = newValue?.header
        }
    }
}
