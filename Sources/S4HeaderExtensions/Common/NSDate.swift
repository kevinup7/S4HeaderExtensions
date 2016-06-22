import Foundation
import S4

extension Date: HeaderValueInitializable {
    public init?(headerValue: String) {
        if let date = S4DateFormatter.formatter.date(fromHeaderValue: headerValue) {
            self = date
        } else {
            return nil
        }
    }
}

extension Date: HeaderValueRepresentable {
    public var headerValue: String {
        return S4DateFormatter.formatter.headerValue(forDate: self)
    }
}

class S4DateFormatter {
    static let formatter = S4DateFormatter()

    private let defaultFormatter: DateFormatter
    private let altFormatter: DateFormatter
    private let cFormatter: DateFormatter

    init() {
        defaultFormatter = DateFormatter()
        defaultFormatter.timeZone = TimeZone(abbreviation: "GMT")
        defaultFormatter.dateFormat = "EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'"

        altFormatter = DateFormatter()
        altFormatter.timeZone = TimeZone(abbreviation: "GMT")
        altFormatter.dateFormat = "EEEE',' dd-MMM-yy HH':'mm':'ss 'GMT"

        cFormatter = DateFormatter()
        cFormatter.timeZone = TimeZone(abbreviation: "GMT")
        cFormatter.dateFormat = "EEE MMM d HH':'mm':'ss yyyy"
    }

    func date(fromHeaderValue header: String) -> Date? {
        if let date = defaultFormatter.date(from: header) {
            return date
        }

        if let date = altFormatter.date(from: header) {
            return date
        }

        if let date = cFormatter.date(from: header) {
            return date
        }

        return nil
    }

    func headerValue(forDate date: Date) -> String {
        return defaultFormatter.string(from: date)
    }
}
