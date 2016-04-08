@testable import S4HeaderExtensions

import XCTest
import S4

class RetryAfterTests: XCTestCase {

    func testSeconds() {
        let headers = Headers(["Retry-After": ["120"]])
        XCTAssert(headers.retryAfter! == .seconds(120))
    }

    func testDates() {
        let dateString = "Tue, 15 Nov 1994 08:12:31 GMT"
        let headers = Headers(["Retry-After": [dateString]])
        XCTAssert(headers.retryAfter!.headerValue == dateString)
    }
}
