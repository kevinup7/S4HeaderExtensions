import S4

extension Headers {

    /**
        The `Age` header field conveys the sender's estimate of the amount of
        time since the response was generated or successfully validated at
        the origin server.

        ## Example Headers
        `Age: 3600`


        ## Examples
            var response = Response()
            response.headers.age = 3600

        - seealso: [RFC7234](https://tools.ietf.org/html/rfc7234#section-5.1)
    */
    public var age: Int? {
        get {
            return headers["Age"].flatMap({ Int($0) })
        }
        set {
            headers["Age"] = newValue?.description.headerValue
        }
    }
}
