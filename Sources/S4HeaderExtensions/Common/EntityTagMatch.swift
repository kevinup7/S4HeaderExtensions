import S4

/**
    Used in `If-Match` and `If-None-Match` to describe pre-conditions that
    must be met on a `Request`.
 
    - any: Represented by a `*` value
    
    - tags: An array of `EntityTag` objects to check for a match.
*/
public enum EntityTagMatch: Equatable {
    case any
    case tags([EntityTag])
}

extension EntityTagMatch: HeaderValueInitializable {
    public init?(headerValue: String) {
        if headerValue == "*" {
            self = .any
        } else {
            if let tags = EntityTag.values(fromHeader: headerValue) {
                self = .tags(tags)
            } else {
                return nil
            }
        }
    }
}

extension EntityTagMatch: HeaderValueRepresentable {
    public var headerValue: String {
        switch self {
        case .any:
            return "*"
        case .tags(let tags):
            return tags.headerValue
        }
    }
}

public func ==(lhs: EntityTagMatch, rhs: EntityTagMatch) -> Bool {
    switch (lhs, rhs) {
    case (.any, .any):
        return true
    case (.tags(let lhsTags), .tags(let rhsTags)):
        return lhsTags == rhsTags
    default:
        return false
    }
}