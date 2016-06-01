import S4

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