@testable import S4HeaderExtensions

import XCTest
import S4

class WWWAuthenticateTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["WWW-Authenticate": ["Newauth realm=\"apps\""]])
        XCTAssert(headers.wwwAuthenticate! == "Newauth realm=\"apps\"")
    }
}
