import Foundation
import S4

extension Headers {

    /**
        The `If-Unmodified-Since` header field makes the request method
        conditional on the selected representation's last modification date
        being earlier than or equal to the date provided in the field-value.
        This field accomplishes the same purpose as `If-Match` for cases where
        the user agent does not have an entity-tag for the representation.

        ## Example Headers
        `If-Unmodified-Since: Sat, 29 Oct 1994 19:43:31 GMT`


        ## Examples
            var request = Request()
            request.headers.ifUnmodifiedSince = NSDate()

        - seealso: [RFC7232](https://tools.ietf.org/html/rfc7232#section-3.4)
    */
    public var ifUnmodifiedSince: NSDate? {
        get {
            if let headerValue = headers["If-Unmodified-Since"]?.first {
                return NSDate.date(fromHeaderValue: headerValue)
            }
            return nil
        }
        set {
            headers["If-Unmodified-Since"] = newValue?.header
        }
    }
}
