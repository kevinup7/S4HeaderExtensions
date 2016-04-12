import S4

extension Headers {

    /**
        The `Allow` header field lists the set of methods advertised as
        supported by the target resource.  The purpose of this field is
        strictly to inform the recipient of valid request methods associated
        with the resource.

        The actual set of allowed methods is defined by the origin server at
        the time of each request.  An origin server MUST generate an `Allow`
        field in a `405 (Method Not Allowed)` response and MAY do so in any
        other response.  An empty Allow field value indicates that the
        resource allows no methods, which might occur in a 405 response if
        the resource has been temporarily disabled by configuration.

        ## Example Headers
        `Allow: GET, HEAD, PUT`

        `Allow: GET`


        ## Examples
            var response =  Response(status: .MethodNotAllowed)
            response.headers.allow = [.GET, .HEAD, .PUT]

            var response =  Response(status: .MethodNotAllowed)
            response.headers.allow = [.GET]

        - seealso: [RFC7231](https://tools.ietf.org/html/rfc7231#section-7.4.1)
    */
    public var allow: [Method]? {
        get {
            return Method.values(fromHeader: headers["Allow"])
        }
        set {
            headers["Allow"] = newValue?.header
        }
    }
}
