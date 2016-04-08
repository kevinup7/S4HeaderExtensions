import S4

extension Headers {

    /**
        The `Referer` header field allows the user agent to specify a
        URI reference for the resource from which the target URI was obtained
        (i.e., the "referrer", though the field name is misspelled).  A user
        agent MUST NOT include the fragment and userinfo components of the
        URI reference, if any, when generating the Referer field
        value.

        ## Example Headers
        `Referer: http://www.example.org/hypertext/Overview.html`


        ## Examples
            var request =  Request()
            request.headers.referer = "http://www.example.org/hypertext/Overview.html"


        - seealso: [RFC7231](http://tools.ietf.org/html/rfc7231#section-5.5.2)
    */
    public var referer: String? {
        get {
            return headers["Referer"]?.first
        }
        set {
            headers["Referer"] = newValue?.headerValues
        }
    }
}
