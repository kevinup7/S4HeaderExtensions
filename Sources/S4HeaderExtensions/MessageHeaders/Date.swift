import Foundation
import S4

extension Headers {

    /**
        The `Date` header field represents the date and time at which the
        message was originated. The field value is an HTTP-date.

        ## Example Headers
        `Date: Tue, 15 Nov 1994 08:12:31 GMT`


        ## Examples
            var response = Response()
            response.headers.date = Date()

        - seealso: [RFC7231](https://tools.ietf.org/html/rfc7231#section-7.1.1.2)
    */
    public var date: Date? {
        get {
            return headers["Date"].flatMap({ Date(headerValue: $0) })
        }
        set {
            headers["Date"] = newValue?.headerValue
        }
    }
}
