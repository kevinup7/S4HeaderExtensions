@testable import S4HeaderExtensions

import XCTest
import S4

class IfMatchTests: XCTestCase {
	
	func testIfMatchHeaders() {
		let weakHeaders = Headers(["If-Match": "W/\"abc\""])
		let weakTag = EntityTag(tag: "abc", weak: true)
		XCTAssert(weakHeaders.ifMatch! == EntityTagMatch.tags([weakTag]))
		
		let strongHeaders = Headers(["If-Match": "\"abc\""])
		let strongTag = EntityTag(tag: "abc")
		XCTAssert(strongHeaders.ifMatch! == EntityTagMatch.tags([strongTag]))
		
		let mixHeaders = Headers(["If-Match": "W/\"abc\",\"abc\""])
		XCTAssert(mixHeaders.ifMatch! == EntityTagMatch.tags([weakTag, strongTag]))
	}
}
