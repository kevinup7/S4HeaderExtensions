import S4

public enum EntityTagMatch: Equatable {
    case any
    case tags([EntityTag])
}

extension EntityTagMatch {
    public init?(headerValues: HeaderValues) {
        guard let first = headerValues.first else {
            return nil
        }

        if first == "*" {
            self = .any
        } else {
            if let tags = EntityTag.values(fromHeaderValues: headerValues) {
                self = .tags(tags)
            } else {
                return nil
            }
        }
    }
}

extension EntityTagMatch: HeaderValueRepresentableType {
    public var headerValue: String {
        return ""
    }

    public var headerValues: HeaderValues {
        switch self {
        case .any:
            return "*"
        case .tags(let tags):
            return tags.headerValues
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