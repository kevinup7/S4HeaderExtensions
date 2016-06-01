import S4
import C7

public protocol HeaderValueInitializable {
    init?(headerValue: String)
}

extension HeaderValueInitializable {
    static func values(fromHeader header: String?) -> [Self]? {
        guard let headerString = header else { return nil }

        let valueStrings = headerString.components(separatedBy: ",")
        let values = valueStrings.map({ Self.init(headerValue: $0.trim()) }).flatMap { $0 }
        return values.count > 0 ? values : nil
    }
}

public typealias HeaderType = protocol<HeaderValueInitializable, HeaderValueRepresentable, Equatable>
