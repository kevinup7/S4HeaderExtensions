import S4

extension Headers {

    /**
        The `Max-Forwards` header field provides a mechanism with the TRACE
        (Section 4.3.8) and OPTIONS (Section 4.3.7) request methods to limit
        the number of times that the request is forwarded by proxies.  This
        can be useful when the client is attempting to trace a request that
        appears to be failing or looping mid-chain.

        ## Example Headers
        `Max-Forwards: 5`


        ## Examples
            var request = Request()
            request.headers.maxForwards = 5

        - seealso: [RFC7231](https://tools.ietf.org/html/rfc7231#section-5.1.2)
    */
    public var maxForwards: Int? {
        get {
            if let headerValue = headers["Max-Forwards"]?.first {
                return Int(headerValue)
            }
            return nil
        }
        set {
            headers["Max-Forwards"] = newValue?.description.header
        }
    }
}
