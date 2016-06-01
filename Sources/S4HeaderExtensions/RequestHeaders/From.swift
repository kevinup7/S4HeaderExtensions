import S4

extension Headers {

    /**
        The `From` header field contains an Internet email address for a
        human user who controls the requesting user agent.

        ## Example Headers
        `From: webmaster@example.org`


        ## Examples
            var request = Request()
            request.headers.from = "webmaster@example.org"

        - seealso: [RFC7231](https://tools.ietf.org/html/rfc7231#section-5.5.1)
    */
    public var from: String? {
        get {
            return headers["From"]
        }
        set {
            headers["From"] = newValue?.headerValue
        }
    }
}
