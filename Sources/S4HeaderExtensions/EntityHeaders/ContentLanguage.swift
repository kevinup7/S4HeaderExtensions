import S4

extension Headers {

    /**
        The `Content-Language` header field describes the natural language(s)
        of the intended audience for the representation.  Note that this
        might not be equivalent to all the languages used within the
        representation.

        ## Example Headers
        `Content-Language: da`

        `Content-Language: mi, en`


        ## Examples
            var response = Response()
            response.headers.contentLanguage = ["da"]

            var response = Response()
            response.headers.contentLanguage = ["mi", "en"]

        - seealso: [RFC7231](https://tools.ietf.org/html/rfc7231#section-3.1.3.2)
    */
    public var contentLanguage: [String]? {
        get {
            return String.values(fromHeader: headers["Content-Language"])
        }
        set {
            headers["Content-Language"] = newValue?.header
        }
    }
}
