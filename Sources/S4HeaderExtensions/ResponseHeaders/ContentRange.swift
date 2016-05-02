import S4

extension Headers {
	
	/**
        The `Content-Range` header field is sent in a single part `206
        (Partial Content)` response to indicate the partial range of the
        selected representation enclosed as the message payload, sent in each
        part of a multipart 206 response to indicate the range enclosed
        within each body part, and sent in `416 (Range Not Satisfiable)`
        responses to provide information about the selected representation.
        
        ## Example Headers
        `Content-Range: bytes 42-1233/1234`
        
        `Content-Range: bytes 42-1233\/\*`
        
        
        ## Examples
            var response = Response()
            response.headers.contentRange = .bytes(ContentRange(range: 42 ..< 1233, totalLength: 1234))
        
            var response = Response()
            response.headers.contentRange = .bytes(ContentRange(range: 42 ..< 1233, totalLength: nil))
        
        - seealso: [RFC7233](https://tools.ietf.org/html/rfc7233#section-4.2)
	*/
	public var contentRange: ContentRangeType? {
		get {
			return headers["Content-Range"]?.first.flatMap({ ContentRangeType(headerValue: $0) })
		}
		set {
			headers["Content-Range"] = newValue?.header
		}
	}
}


/**
The scheme used in a `Content-Range` header.
Supports the use of either a byte range scheme or any custom scheme
 
- Bytes: The range and total length is expressed using `ContentRange`
- Custom: Custom schemes consist of a unit and a value, separated by a space
*/
public enum ContentRangeType: Equatable {
    case bytes(ContentRange)
    case custom(unit: String, value: String)
}

extension ContentRangeType: HeaderValueInitializable {
    public init?(headerValue: String) {
        guard headerValue != "" else {
            return nil
        }

        let split = headerValue.components(separatedBy: " ")
        guard split.count == 2 else {
            return nil
        }

        let rangeUnit = split[0]
        let rangeValue = split[1]

        if rangeUnit == "bytes" {
            guard let byteRange = ContentRange(headerValue: rangeValue) else {
                return nil
            }

            self = .bytes(byteRange)
        } else {
            guard rangeValue != "" else {
                return nil
            }

            self = .custom(unit: rangeUnit, value: rangeValue)
        }
    }
}

extension ContentRangeType: HeaderValueRepresentable {
    public var headerValue: String {
        switch self {
        case .bytes(let byteRange):
            return "bytes \(byteRange.headerValue)"
        case .custom(let unit, let value):
            return "\(unit) \(value)"
        }
    }
}

public func ==(lhs: ContentRangeType, rhs: ContentRangeType) -> Bool {
    return lhs.headerValue == rhs.headerValue
}




/// The byte range used in the `Content-Range` header
public struct ContentRange: Equatable {

    /// Range of bytes being sent. Nil value indicates an unsatisfied-range value
    /// (e.g. when returning a `416` response)
    public let range: Range<Int64>?

    /// Complete length of the representation from which the range has been extracted.
    /// Nil value indicates the complete length is unknown
    public let totalLength: Int64?
}

extension ContentRange: HeaderValueInitializable {
    public init?(headerValue: String) {
        guard headerValue != "" else {
            return nil
        }

        let split = headerValue.components(separatedBy: "/")
        guard split.count == 2 else {
            return nil
        }


        // Parse range segment
        let rangeString = split[0]
        if rangeString == "*" {
            self.range = nil
        } else {
            let splitRange = rangeString.components(separatedBy: "-")
            guard splitRange.count == 2 else {
                return nil
            }

            guard let start = Int64(splitRange[0]), let end = Int64(splitRange[1]) else {
                return nil
            }

            self.range = start ..< end
        }


        // Parse total length segment
        let totalString = split[1]
        if totalString == "*" {
            self.totalLength = nil
        } else {
            guard let total = Int64(totalString) else {
                return nil
            }

            self.totalLength = total
        }
    }
}

extension ContentRange: HeaderValueRepresentable {
    public var headerValue: String {
        let rangeString = range != nil ? "\(range!.startIndex)-\(range!.endIndex)" : "*"
        let totalString = totalLength != nil ? "\(totalLength!)" : "*"

        return rangeString + "/" + totalString
    }
}

public func ==(lhs: ContentRange, rhs: ContentRange) -> Bool {
    return lhs.range == rhs.range && lhs.totalLength == rhs.totalLength
}
