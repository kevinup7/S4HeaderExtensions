import S4

extension Headers {

    /**
        The `Range` header field on a `GET` request modifies the method
        semantics to request transfer of only one or more subranges of the
        selected representation data, rather than the entire selected
        representation data.

        ## Example Headers
        `Range: bytes=0-42`
        
        `Range: bytes=43-`
     
        `Range: bytes=-1024`

        `Range: bytes=0-42,-1024`


        ## Examples
            var request = Request()
            request.range = .bytes([.between(0, 42)])
            
            var request = Request()
            request.range = .bytes([.startingAt(43)])
     
            var request = Request()
            request.range = .bytes([.between(0, 42), .last(1024)])

        - seealso: [RFC7233](https://tools.ietf.org/html/rfc7233#section-3.1)
    */
    public var range: RangeType? {
        get {
            return headers["Range"].flatMap({ RangeType(headerValue: $0) })
        }
        set {
            headers["Range"] = newValue?.headerValue
        }
    }
}


/// The scheme used in a `Range` header.
/// Supports the use of either a byte range scheme or any custom scheme
public enum RangeType: Equatable {
    case bytes([BytesRange])
    case custom(unit: String, value: String)
}

extension RangeType: HeaderValueInitializable {
    public init?(headerValue: String) {
        let split = headerValue.components(separatedBy: "=")
        guard split.count == 2 else {
            return nil
        }

        let unitString = split[0]
        let valueString = split[1]

        if unitString == "bytes" {
            guard let values = BytesRange.values(fromHeader: valueString) else {
                return nil
            }

            self = .bytes(values)
        } else {
            guard unitString != "" else {
                return nil
            }

            self = .custom(unit: unitString, value: valueString)
        }
    }
}

extension RangeType: HeaderValueRepresentable {
    public var headerValue: String {
        switch self {
        case .bytes(let ranges):
            let rangesString = ranges.map({ $0.headerValue }).joined(separator: ",")
            return "bytes=\(rangesString)"
        case .custom(unit: let unit, value: let value):
            return "\(unit)=\(value)"
        }
    }
}

public func ==(lhs: RangeType, rhs: RangeType) -> Bool {
    return lhs.headerValue == rhs.headerValue
}


/// A range of bytes used in a `Range` header for a request
public enum BytesRange: Equatable {
    case between(Int64, Int64)
    case startingAt(Int64)
    case last(Int64)
}

extension BytesRange: HeaderValueInitializable {
    public init?(headerValue: String) {
        guard headerValue != "" else {
            return nil
        }

        let values = headerValue.components(separatedBy: "-").map({ Int64($0) }).flatMap { $0 }
        guard values.count > 0 else {
            return nil
        }

        if headerValue.hasPrefix("-") {
            self = .last(values[0])
        } else if headerValue.hasSuffix("-") {
            self = .startingAt(values[0])
        } else if values.count == 2 {
            self = .between(values[0], values[1])
        } else {
            return nil
        }
    }
}

extension BytesRange: HeaderValueRepresentable {
    public var headerValue: String {
        switch self {
        case .between(let start, let end):
            return "\(start)-\(end)"
        case .startingAt(let index):
            return "\(index)-"
        case .last(let index):
            return "-\(index)"
        }
    }
}

public func ==(lhs: BytesRange, rhs: BytesRange) -> Bool {
    return lhs.headerValue == rhs.headerValue
}
