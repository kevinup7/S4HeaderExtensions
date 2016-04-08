@testable import S4HeaderExtensions

import XCTest
import S4

class AgeTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["Age": ["3600"]])
        XCTAssert(headers.age! == 3600)
        XCTAssert(headers.age! != 3601)
    }
}
