import S4

extension Headers {

    /**
        The `Content-Location` header field references a URI that can be used
        as an identifier for a specific resource corresponding to the
        representation in this message's payload.  In other words, if one
        were to perform a GET request on this URI at the time of this
        message's generation, then a 200 (OK) response would contain the same
        representation that is enclosed as payload in this message.

        ## Example Headers
        `Content-Location: /index.htm`

        `Content-Location: http://example.com/index.htm`


        ## Examples
            var response = Response()
            response.headers.contentLocation = "/index.htm"

            var response = Response()
            response.headers.contentLocation = "http://example.com/index.htm"

        - seealso: [RFC7231](https://tools.ietf.org/html/rfc7231#section-3.1.4.2)
    */
    public var contentLocation: String? {
        get {
            if let headerValue = headers["Content-Location"]?.first {
                return String(headerValue: headerValue)
            }
            return nil
        }
        set {
            headers["Content-Location"] = newValue?.headerValues
        }
    }
}
