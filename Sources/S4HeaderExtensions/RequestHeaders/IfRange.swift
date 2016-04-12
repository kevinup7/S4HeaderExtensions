import Foundation
import S4

extension Headers {

    /**
        If a client has a partial copy of a representation and wishes to have
        an up-to-date copy of the entire representation, it could use the
        `Range` header field with a conditional GET (using either or both of
        `If-Unmodified-Since` and `If-Match`.)  However, if the precondition
        fails because the representation has been modified, the client would
        then have to make a second request to obtain the entire current
        representation.

        The `If-Range` header field allows a client to "short-circuit" the
        second request.  Informally, its meaning is as follows: if the
        representation is unchanged, send me the part(s) that I am requesting
        in `Range`; otherwise, send me the entire representation.


        ## Example Headers
        `If-Range: W/"xyzzy"`

        `If-Range: Tue, 15 Nov 1994 08:12:31 GMT`


        ## Examples
            var request =  Request()
            request.headers.ifRange = .Tag(EntityTag(tag: "xyzzy"))

            var request =  Request()
            request.headers.ifRange = .Date(NSDate())


        - seealso: [RFC7232](https://tools.ietf.org/html/rfc7233#section-3.2)
    */
    public var ifRange: IfRange? {
        get {
            if let headerValue = headers["If-Range"]?.first {
                return IfRange(headerValue: headerValue)
            }
            return nil
        }
        set {
            headers["If-Range"] = newValue?.header
        }
    }
}

public enum IfRange: Equatable {
    case tag(EntityTag)
    case date(NSDate)
}

extension IfRange: HeaderValueInitializable {
    public init?(headerValue: String) {
        if let tag = EntityTag(headerValue: headerValue) {
            self = .tag(tag)
        } else if let date = NSDate.date(fromHeaderValue: headerValue) {
            self = .date(date)
        } else {
            return nil
        }
    }
}

extension IfRange: HeaderValueRepresentable {
    public var headerValue: String {
        switch self {
        case .tag(let tag):
            return tag.headerValue
        case .date(let date):
            return date.headerValue
        }
    }
}

public func ==(lhs: IfRange, rhs: IfRange) -> Bool {
    switch (lhs, rhs) {
    case (.date(let lhsDate), .date(let rhsDate)):
        return lhsDate.compare(rhsDate) == .orderedSame
    case (.tag(let lhsTag), .tag(let rhsTag)):
        return lhsTag == rhsTag
    default:
        return false
    }
}
