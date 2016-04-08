import Foundation
import S4

extension Headers {

    /**
        The `If-Modified-Since` header field makes a GET or HEAD request
        method conditional on the selected representation's modification date
        being more recent than the date provided in the field-value.
        Transfer of the selected representation's data is avoided if that
        data has not changed.

        ## Example Headers
        `If-Modified-Since: Sat, 29 Oct 1994 19:43:31 GMT`


        ## Examples
            var request = Request()
            request.headers.ifModifiedSince = NSDate()

        - seealso: [RFC7232](https://tools.ietf.org/html/rfc7232#section-3.3)
    */
    public var ifModifiedSince: NSDate? {
        get {
            if let headerValue = headers["If-Modified-Since"]?.first {
                return NSDate.date(fromHeaderValue: headerValue)
            }
            return nil
        }
        set {
            headers["If-Modified-Since"] = newValue?.headerValues
        }
    }
}
