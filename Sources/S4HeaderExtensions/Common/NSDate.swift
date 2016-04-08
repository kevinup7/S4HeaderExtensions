import Foundation
import S4

extension NSDate {
    public static func date(fromHeaderValue header: String) -> NSDate? {
        return S4DateFormatter.formatter.date(fromHeaderValue: header)
    }

    public var headerValue: String {
        return S4DateFormatter.formatter.headerValue(forDate: self)
    }

    public var headerValues: HeaderValues {
        return HeaderValues(headerValue)
    }
}

class S4DateFormatter {
    static let formatter = S4DateFormatter()

    private let defaultFormatter: NSDateFormatter
    private let altFormatter: NSDateFormatter
    private let cFormatter: NSDateFormatter

    init() {
        defaultFormatter = NSDateFormatter()
        defaultFormatter.timeZone = NSTimeZone(abbreviation: "GMT")
        defaultFormatter.dateFormat = "EEE',' dd MMM yyyy HH':'mm':'ss 'GMT'"

        altFormatter = NSDateFormatter()
        altFormatter.timeZone = NSTimeZone(abbreviation: "GMT")
        altFormatter.dateFormat = "EEEE',' dd-MMM-yy HH':'mm':'ss 'GMT"

        cFormatter = NSDateFormatter()
        cFormatter.timeZone = NSTimeZone(abbreviation: "GMT")
        cFormatter.dateFormat = "EEE MMM d HH':'mm':'ss yyyy"
    }

    func date(fromHeaderValue header: String) -> NSDate? {
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

    func headerValue(forDate date: NSDate) -> String {
        return defaultFormatter.string(from: date)
    }
}