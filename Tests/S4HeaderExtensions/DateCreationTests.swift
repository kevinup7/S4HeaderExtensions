@testable import S4HeaderExtensions

import XCTest

class DateCreationTests: XCTestCase {

    func test1123Date() {
        let dateString = "Sun, 06 Nov 1994 08:49:37 GMT"
        let date = NSDate.date(fromHeaderValue: dateString)!
        XCTAssert(date.headerValue == dateString)
    }

    func test1036Date() {
        let dateString = "Sunday, 06-Nov-94 08:49:37 GMT"
        let date = NSDate.date(fromHeaderValue: dateString)!
        XCTAssert(date.headerValue == "Sun, 06 Nov 1994 08:49:37 GMT")
    }

    func testCDate() {
        let dateString = "Sun Nov  6 08:49:37 1994"
        let date = NSDate.date(fromHeaderValue: dateString)!
        XCTAssert(date.headerValue == "Sun, 06 Nov 1994 08:49:37 GMT")
    }
}
