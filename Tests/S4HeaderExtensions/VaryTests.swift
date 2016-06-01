@testable import S4HeaderExtensions

import XCTest
import S4

class VaryTests: XCTestCase {
	
	func testVary() {
		XCTAssert(Vary.any == Vary(headerValue: "*"))
		XCTAssert(Vary.fields(["accept-encoding", "accept-language"]) == Vary(headerValue: "accept-encoding,accept-language"))
		XCTAssert(Vary.fields(["accept-encoding", "accept-language"]) == Vary(headerValue: "aCcept-Encoding,accePt-lanGuage"))
	}
}
