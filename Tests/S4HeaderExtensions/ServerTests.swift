@testable import S4HeaderExtensions

import XCTest
import S4

class ServerTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["Server": "CERN/3.0 libwww/2.17"])
        XCTAssert(headers.server! == "CERN/3.0 libwww/2.17")
    }
}
