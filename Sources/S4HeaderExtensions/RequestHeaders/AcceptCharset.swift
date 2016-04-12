import S4

// TODO: Replace String with an actual enum using the values from:
// http://www.iana.org/assignments/character-sets/character-sets.xhtml
extension Headers {

    /**
        The `Accept-Charset` header field can be sent by a user agent to
        indicate what charsets are acceptable in textual response content.
        This field allows user agents capable of understanding more
        comprehensive or special-purpose charsets to signal that capability
        to an origin server that is capable of representing information in
        those charsets.

        ## Example Headers
        `Accept-Charset: iso-8859-5, unicode-1-1;q=0.8`

        `Accept-Charset: iso-8859-5`


        ## Examples
            var request =  Request()
            request.headers.acceptCharset = [QualityValue(value: "iso-8859-5"), QualityValue(value: "unicode-1-1", quality: 800)]
     
            var request =  Request()
            request.headers.acceptCharset = [QualityValue(value: "iso-8859-5"), QualityValue(value: "unicode-1-1", quality: 800)]


        - seealso: [RFC7231](https://tools.ietf.org/html/rfc7231#section-5.3.3)
     */
    public var acceptCharset: [QualityValue<String>]? {
        get {
            return QualityValue<String>.values(fromHeader: headers["Accept-Charset"])
        }
        set {
            headers["Accept-Charset"] = newValue?.header
        }
    }
}
