@testable import S4HeaderExtensions

import XCTest
import S4

class AuthorizationTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["Authorization": "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ=="])
        XCTAssert(headers.authorization! == "Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==")
    }
}
