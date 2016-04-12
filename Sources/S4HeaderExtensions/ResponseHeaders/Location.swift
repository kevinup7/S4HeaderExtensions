import S4

extension Headers {

    /**
        The "Location" header field is used in some responses to refer to a
        specific resource in relation to the response.  The type of
        relationship is defined by the combination of request method and
        status code semantics.

        ## Example Headers
        `Location: http://www.example.net/index.html`


        ## Examples
            var response = Response()
            response.headers.location = "http://www.example.net/index.html"


        - seealso: [RFC7231](http://tools.ietf.org/html/rfc7231#section-7.1.2)
    */
    public var location: String? {
        get {
            return headers["Location"]?.first
        }
        set {
            headers["Host"] = newValue?.header
        }
    }
}
