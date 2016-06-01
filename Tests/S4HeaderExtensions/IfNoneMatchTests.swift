@testable import S4HeaderExtensions

import XCTest
import S4

class IfNoneMatchTests: XCTestCase {
	
	func testIfNoneMatchHeaders() {
		let weakHeaders = Headers(["If-None-Match": "W/\"abc\""])
		let weakTag = EntityTag(tag: "abc", weak: true)
		XCTAssert(weakHeaders.ifNoneMatch! == EntityTagMatch.tags([weakTag]))
		
		let strongHeaders = Headers(["If-None-Match": "\"abc\""])
		let strongTag = EntityTag(tag: "abc")
		XCTAssert(strongHeaders.ifNoneMatch! == EntityTagMatch.tags([strongTag]))
		
		let mixHeaders = Headers(["If-None-Match": "W/\"abc\",\"abc\""])
		XCTAssert(mixHeaders.ifNoneMatch! == EntityTagMatch.tags([weakTag, strongTag]))
	}
}
