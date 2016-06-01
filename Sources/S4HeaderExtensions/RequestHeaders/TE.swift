import S4

extension Headers {

    /**
        The `TE` header field in a request indicates what transfer codings,
        besides chunked, the client is willing to accept in response, and
        whether or not the client is willing to accept trailer fields in a
        chunked transfer coding.

        ## Example Headers
        `TE: trailers, deflate;q=0.5`


        ## Examples
            var request =  Request()
            request.headers.te = [QualityValue(value: .custom("trailers")), QualityValue(value: .deflate, quality: 500)]


        - seealso: [RFC7230](http://tools.ietf.org/html/rfc7230#section-4.3)
    */
    public var te: [QualityValue<Encoding>]? {
        get {
            return QualityValue<Encoding>.values(fromHeader: headers["TE"])
        }
        set {
            headers["TE"] = newValue?.headerValue
        }
    }
}
