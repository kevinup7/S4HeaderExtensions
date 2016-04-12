import S4

extension Headers {

    /**
         When a message does not have a `Transfer-Encoding` header field, a
         `Content-Length` header field can provide the anticipated size, as a
         decimal number of octets, for a potential payload body.  For messages
         that do include a payload body, the Content-Length field-value
         provides the framing information necessary for determining where the
         body (and message) ends.  For messages that do not include a payload
         body, the Content-Length indicates the size of the selected
         representation (Section 3 of [RFC7231]).

         ## Example Headers
         `Content-Length: 3495`


         ## Examples
            var response = Response()
            response.headers.contentLength = 3495

         - seealso: [RFC7230](https://tools.ietf.org/html/rfc7230#section-3.3.2)
     */
    public var contentLength: Int? {
        get {
            if let headerValue = headers["Content-Length"]?.first {
                return Int(headerValue)
            }
            return nil
        }
        set {
            headers["Content-Length"] = newValue?.description.header
        }
    }
}
