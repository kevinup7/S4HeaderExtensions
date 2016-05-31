import S4
import C7

public protocol HeaderValueInitializable {
    init?(headerValue: String)
}

extension HeaderValueInitializable {
    static func values(fromHeader header: Header?) -> [Self]? {
        guard let header = header else {
            return nil
        }

        // Each header string can contain multiple actual values
        // e.g. ["foo": ["bar1", "bar2, bar3"]]
        // We need to parse the strings into the actual values
        var headerValues: [String] = []
        header.forEach { (headerString) in
            let splitValues = headerString.components(separatedBy: ",")
            headerValues.append(contentsOf: splitValues)
        }
        
        let values = headerValues.map({ Self.init(headerValue: $0.trim()) }).flatMap { $0 }
        return values.count > 0 ? values : nil
    }
}

public typealias HeaderType = protocol<HeaderValueInitializable, HeaderValueRepresentable, Equatable>
