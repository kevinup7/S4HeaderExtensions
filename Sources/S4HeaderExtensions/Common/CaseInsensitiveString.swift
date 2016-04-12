import S4

extension CaseInsensitiveString: HeaderValueRepresentable {
    public var headerValue: String {
        return self.string
    }
}

extension CaseInsensitiveString: HeaderValueInitializable {
    public init?(headerValue: String) {
        self = CaseInsensitiveString.init(headerValue)
    }
}
