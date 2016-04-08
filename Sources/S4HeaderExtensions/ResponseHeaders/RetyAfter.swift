import S4
import Foundation

extension Headers {

    /**
        Servers send the `Retry-After` header field to indicate how long the
        user agent ought to wait before making a follow-up request.  When
        sent with a `503 (Service Unavailable)` response, `Retry-After` indicates
        how long the service is expected to be unavailable to the client.
        When sent with any `3xx (Redirection)` response, `Retry-After` indicates
        the minimum time that the user agent is asked to wait before issuing
        the redirected request.


        ## Example Headers
        `Retry-After: Fri, 31 Dec 1999 23:59:59 GMT`

        `Retry-After: 120`


        ## Examples
            var response = Response()
            response.headers.retryAfter = .seconds(120)

            var response = Response()
            response.headers.retryAfter = .date(NSDate())


        - seealso: [RFC7231](http://tools.ietf.org/html/rfc7231#section-7.1.2)
    */
    public var retryAfter: RetryAfter? {
        get {
            if let headerValue = headers["Retry-After"]?.first {
                return RetryAfter(headerValue: headerValue)
            }
            return nil
        }
        set {
            headers["Retry-After"] = newValue?.headerValues
        }
    }
}

public enum RetryAfter: Equatable {
    case seconds(Int)
    case date(NSDate)
}

extension RetryAfter: HeaderValueInitializable {
    public init?(headerValue: String) {
        if let seconds = Int(headerValue) {
            self = .seconds(seconds)
        } else if let date = NSDate.date(fromHeaderValue: headerValue) {
            self = .date(date)
        } else {
            return nil
        }
    }
}

extension RetryAfter: HeaderValueRepresentableType {
    public var headerValue: String {
        switch self {
        case .seconds(let seconds):
            return seconds.description
        case .date(let date):
            return date.headerValue
        }
    }
}

public func ==(lhs: RetryAfter, rhs: RetryAfter) -> Bool {
    switch (lhs, rhs) {
    case (.date(let lhsDate), .date(let rhsDate)):
        return lhsDate.compare(rhsDate) == .orderedSame
    case (.seconds(let lhsSeconds), .seconds(let rhsSeconds)):
        return lhsSeconds == rhsSeconds
    default:
        return false
    }
}