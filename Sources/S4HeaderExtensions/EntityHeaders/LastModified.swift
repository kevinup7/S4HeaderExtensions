import Foundation
import S4

extension Headers {

    /**
        The `Last-Modified` header field in a response provides a timestamp
        indicating the date and time at which the origin server believes the
        selected representation was last modified, as determined at the
        conclusion of handling the request.

        ## Example Headers
        `Last-Modified: Tue, 15 Nov 1994 12:45:26 GMT`


        ## Examples
            var response =  Response()
            response.headers.lastModified = NSDate()

        - seealso: [RFC7232](https://tools.ietf.org/html/rfc7232#section-2.2)
    */
    public var lastModified: NSDate? {
        get {
            if let headerValue = headers["Last-Modified"]?.first {
                return NSDate.date(fromHeaderValue: headerValue)
            }
            return nil
        }
        set {
            headers["Last-Modified"] = newValue?.headerValues
        }
    }
}
