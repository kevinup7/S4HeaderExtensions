@testable import S4HeaderExtensions

import XCTest
import S4

class IfRangeTests: XCTestCase {
	
	func testTags() {
		let headers = Headers(["If-Range": ["W/\"fklaj8093jpaf09djs0a9js\""]])
		XCTAssert(headers.ifRange! == IfRange.tag(EntityTag(tag: "fklaj8093jpaf09djs0a9js", weak: true)))
		
		let strong = Headers(["If-Range": ["\"fklaj8093jpaf09djs0a9js\""]])
		XCTAssert(strong.ifRange! == IfRange.tag(EntityTag(tag: "fklaj8093jpaf09djs0a9js")))
	}
	
	func testDates() {
		let dateString = "Tue, 15 Nov 1994 08:12:31 GMT"
		let headers = Headers(["If-Range": [dateString]])
		XCTAssert(headers.ifRange!.headerValue == dateString)
	}
}
