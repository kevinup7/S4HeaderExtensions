@testable import S4HeaderExtensions

import XCTest
import S4

class PragmaTests: XCTestCase {
	
	func testAny() {
		XCTAssert(Pragma.noCache == Pragma(headerValue: "no-cache"))
		XCTAssert(Pragma.noCache == Pragma(headerValue: "no-Cache"))
		
		XCTAssert(Pragma.custom("foo") == Pragma(headerValue: "foo"))
		
		XCTAssertNil(Pragma(headerValue: ""))
	}
}
