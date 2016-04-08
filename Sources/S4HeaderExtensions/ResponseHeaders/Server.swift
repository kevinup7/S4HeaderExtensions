import S4

extension Headers {

    /**
        The `Server` header field contains information about the software
        used by the origin server to handle the request, which is often used
        by clients to help identify the scope of reported interoperability
        problems, to work around or tailor requests to avoid particular
        server limitations, and for analytics regarding server or operating
        system use.  An origin server MAY generate a `Server` field in its
        responses.

        ## Example Headers
        `Server: CERN/3.0 libwww/2.17`


        ## Examples
            var response =  Response()
            response.headers.server = "CERN/3.0 libwww/2.17"


        - seealso: [RFC7231](http://tools.ietf.org/html/rfc7231#section-7.4.2)
    */
    public var server: String? {
        get {
            return headers["Server"]?.first
        }
        set {
            headers["Server"] = newValue?.headerValues
        }
    }
}
