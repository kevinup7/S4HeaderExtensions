@testable import S4HeaderExtensions

import XCTest
import S4

class VaryTests: XCTestCase {
	
	func testVary() {
		XCTAssert(Vary.any == Vary(headerValues: ["*"]))
		XCTAssert(Vary.fields(["accept-encoding", "accept-language"]) == Vary(headerValues: ["accept-encoding", "accept-language"]))
		XCTAssert(Vary.fields(["accept-encoding", "accept-language"]) == Vary(headerValues: ["aCcept-Encoding", "accePt-lanGuage"]))
	}
}
