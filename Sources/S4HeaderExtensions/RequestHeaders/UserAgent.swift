import S4

extension Headers {

    /**
        The `User-Agent` header field contains information about the user
        agent originating the request, which is often used by servers to help
        identify the scope of reported interoperability problems, to work
        around or tailor responses to avoid particular user agent
        limitations, and for analytics regarding browser or operating system
        use.  A user agent SHOULD send a User-Agent field in each request
        unless specifically configured not to do so.

        ## Example Headers
        `User-Agent: CERN-LineMode/2.15 libwww/2.17b3`


        ## Examples
            var request =  Request()
            request.headers.userAgent = "CERN-LineMode/2.15 libwww/2.17b3"


        - seealso: [RFC7231](http://tools.ietf.org/html/rfc7231#section-5.5.3)
    */
    public var userAgent: String? {
        get {
            return headers["User-Agent"]?.first
        }
        set {
            headers["User-Agent"] = newValue?.headerValues
        }
    }
}
