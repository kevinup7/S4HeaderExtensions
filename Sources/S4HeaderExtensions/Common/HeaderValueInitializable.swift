import S4

public protocol HeaderValueInitializable {
    init?(headerValue: String)
}

extension HeaderValueInitializable {
    public static func values(fromHeaderValues values: HeaderValues) -> [Self]? {
        let values = values.map({ Self.init(headerValue: $0) }).flatMap { $0 }
        return values.count > 0 ? values : nil
    }
}

public typealias HeaderType = protocol<HeaderValueInitializable, HeaderValueRepresentableType, Equatable>