import S4

public protocol HeaderValueRepresentableType {
    var headerValue: String { get }
    var headerValues: HeaderValues { get }
}

extension HeaderValueRepresentableType {
    public var headerValues: HeaderValues {
        return HeaderValues(self.headerValue)
    }
}

extension Sequence where Iterator.Element: HeaderValueRepresentableType {
    var headerValues: HeaderValues {
        return HeaderValues(self.map({ $0.headerValue }))
    }
}