public struct MIMEType: Equatable {
    public let type: String
    public let subtype: String
    public let parameters: [String: String]?

    public init(type: String, subtype: String, parameters:[String: String]? = nil) {
        self.type = type
        self.subtype = subtype
        self.parameters = parameters
    }
}

extension MIMEType: CustomStringConvertible {
    public var description: String {
        var string = "\(type)/\(subtype)"

        if let parameters = parameters {
            string += parameters.reduce(";") { $0 + " \($1.0)=\($1.1)" }
        }

        return string
    }
}

extension MIMEType: HeaderValueInitializable {
    public init?(headerValue: String) {
        var tokens = headerValue.components(separatedBy: ";")
        var parameters: [String: String] = [:]

        let mediaType = tokens.removeFirst()
        let mediaTypeTokens = mediaType.components(separatedBy: "/")

        guard mediaTypeTokens.count == 2 else {
            return nil
        }

        for parameterString in tokens {
            let parameterTokens = parameterString.trim().components(separatedBy: "=")

            if parameterTokens.count == 2 {
                parameters[parameterTokens[0]] = parameterTokens[1]
            }
        }

        self.init(type: mediaTypeTokens[0], subtype: mediaTypeTokens[1], parameters: parameters)
    }
}

extension MIMEType: HeaderValueRepresentable {
    public var headerValue: String {
        return description
    }
}

public func ==(lhs: MIMEType, rhs: MIMEType) -> Bool {
    return lhs.type == rhs.type && lhs.subtype == rhs.subtype
}