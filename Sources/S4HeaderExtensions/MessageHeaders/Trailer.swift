import S4

extension Headers {

    /**
        When a message includes a message body encoded with the chunked
        transfer coding and the sender desires to send metadata in the form
        of trailer fields at the end of the message, the sender SHOULD
        generate a Trailer header field before the message body to indicate
        which fields will be present in the trailers.  This allows the
        recipient to prepare for receipt of that metadata before it starts
        processing the body, which is useful if the message is being streamed
        and the recipient wishes to confirm an integrity check on the fly.

        ## Example Headers
        'Trailer: Date'


        ## Examples
            var response = Response()
            response.headers.trailer = ["Date"]

        - seealso: [RFC7230](https://tools.ietf.org/html/rfc7230#section-4.4)
    */
    public var trailer: [String]? {
        get {
            if let headerValues = headers["Trailer"] {
                return String.values(fromHeaderValues: headerValues)
            }
            return nil
        }
        set {
            headers["Trailer"] = newValue?.headerValues
        }
    }
}