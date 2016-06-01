import S4

public protocol HeaderValueRepresentable {
    var headerValue: String { get }
}

extension Sequence where Iterator.Element: HeaderValueRepresentable {
    var headerValue: String {
        return self.map({ $0.headerValue }).joined(separator: ",")
    }
}