import S4
import Foundation

extension String {
//    func between(left: String, _ right: String) -> String? {
//        if let leftRange = range(of: left), rightRange = range(of: right, options: .backwardsSearch) {
//            return self[leftRange.endIndex ..< rightRange.startIndex]
//        }
//        return nil
//    }

    func between(left: String, _ right: String) -> String? {
        var string = self.replacingOccurrences(of: left, with: "")
        string = string.replacingOccurrences(of: right, with: "")

        return string
    }

    func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaceAndNewline())
    }
}

extension String: HeaderValueInitializable {
    public init?(headerValue: String) {
        self = headerValue
    }
}

extension String: HeaderValueRepresentable {
    public var headerValue: String {
        return self
    }
}
