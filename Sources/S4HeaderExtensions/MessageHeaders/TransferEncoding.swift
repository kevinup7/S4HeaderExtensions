import S4

extension Headers {

    /**
        The `Transfer-Encoding` header field lists the transfer coding names
        corresponding to the sequence of transfer codings that have been (or
        will be) applied to the payload body in order to form the message
        body.

        ## Example Headers
        `Transfer-Encoding: gzip, chunked`

        `Transfer-Encoding: gzip`


        ## Examples
            var response =  Response()
            response.headers.transferEncoding = [.gzip, .chunked]

            var response =  Response()
            response.headers.transferEncoding = [.gzip]

        - seealso: [RFC7230](http://tools.ietf.org/html/rfc7230#section-3.3.1)
    */
    public var transferEncoding: [Encoding]? {
        get {
            return Encoding.values(fromHeader: headers["Transfer-Encoding"])
        }
        set {
            headers["Transfer-Encoding"] = newValue?.header
        }
    }
}