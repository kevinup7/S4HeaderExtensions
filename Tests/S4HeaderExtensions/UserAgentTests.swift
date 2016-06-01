@testable import S4HeaderExtensions

import XCTest
import S4

class UserAgentTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["User-Agent": "CERN-LineMode/2.15 libwww/2.17b3"])
        XCTAssert(headers.userAgent! == "CERN-LineMode/2.15 libwww/2.17b3")
    }
}
