@testable import S4HeaderExtensions

import XCTest
import S4

class MaxForwardsTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["Max-Forwards": "5"])
        XCTAssert(headers.maxForwards! == 5)
        XCTAssert(headers.maxForwards! != 6)
    }
}
