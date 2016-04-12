@testable import S4HeaderExtensions

import XCTest
import S4

class VaryTests: XCTestCase {
	
	func testVary() {
		XCTAssert(Vary.any == Vary(header: ["*"]))
		XCTAssert(Vary.fields(["accept-encoding", "accept-language"]) == Vary(header: ["accept-encoding", "accept-language"]))
		XCTAssert(Vary.fields(["accept-encoding", "accept-language"]) == Vary(header: ["aCcept-Encoding", "accePt-lanGuage"]))
	}
}
