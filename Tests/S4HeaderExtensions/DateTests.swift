@testable import S4HeaderExtensions

import XCTest
import S4

class DateTests: XCTestCase {

    func testIfModifiedSince() {
        let dateString = "Tue, 15 Nov 1994 08:12:31 GMT"
        let headers = Headers(["Date": [dateString]])
        XCTAssert(headers.date!.headerValue == dateString)
    }
}
