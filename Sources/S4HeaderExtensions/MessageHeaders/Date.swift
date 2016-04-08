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
            response.headers.date = NSDate()

        - seealso: [RFC7231](https://tools.ietf.org/html/rfc7231#section-7.1.1.2)
    */
    public var date: NSDate? {
        get {
            if let headerValue = headers["Date"]?.first {
                return NSDate.date(fromHeaderValue: headerValue)
            }
            return nil
        }
        set {
            headers["Date"] = newValue?.headerValues
        }
    }
}