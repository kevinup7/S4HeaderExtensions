import Foundation
import S4

extension Headers {

    /**
        The `Expires` header field gives the date/time after which the
        response is considered stale.  See [Section 4.2](https://tools.ietf.org/html/rfc7234#section-4.2)
        for further discussion of the freshness model.

        The presence of an `Expires` field does not imply that the original
        resource will change or cease to exist at, before, or after that
        time.

        ## Example Headers
        `Expires: Thu, 01 Dec 1994 16:00:00 GMT`


        ## Examples
            var response =  Response()
            response.headers.expires = NSDate()

        - seealso: [RFC7234](https://tools.ietf.org/html/rfc7234#section-5.3)
    */
    public var expires: NSDate? {
        get {
            if let headerValue = headers["Expires"]?.first {
                return NSDate.date(fromHeaderValue: headerValue)
            }
            return nil
        }
        set {
            headers["Expires"] = newValue?.headerValues
        }
    }
}
