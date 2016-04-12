import S4

extension Headers {

    /**
        The `Accept-Language` header field can be used by user agents to
        indicate the set of natural languages that are preferred in the
        response.

        ## Example Headers
        `Accept-Language: da, en-gb;q=0.8, en;q=0.7`

        `Accept-Language: en`


        ## Examples
            var request =  Request()
            request.headers.acceptLanguage = [QualityValue(value: "da"), QualityValue(value: "en-gb", quality: 800), QualityValue(value: "en", quality: 700)]

            var request =  Request()
            request.headers.acceptLanguage = [QualityValue(value: "en")]

        - seealso: [RFC7231](https://tools.ietf.org/html/rfc7231#section-3.1.3.2)
     */
    public var acceptLanguage: [QualityValue<String>]? {
        get {
            if let headerValues = headers["Accept-Language"] {
                return QualityValue<String>.values(fromHeader: headerValues)
            }
            return nil
        }
        set {
            headers["Accept-Language"] = newValue?.header
        }
    }
}
