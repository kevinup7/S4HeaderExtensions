@testable import S4HeaderExtensions

import XCTest
import S4

class CacheControlTests: XCTestCase {
	
	func testStringInitialization() {
		XCTAssert(CacheControl.noCache == CacheControl(headerValue: "no-cache")!)
		XCTAssert(CacheControl.noStore == CacheControl(headerValue: "no-store")!)
		XCTAssert(CacheControl.noTransform == CacheControl(headerValue: "no-transform")!)
		XCTAssert(CacheControl.onlyIfCached == CacheControl(headerValue: "only-if-cached")!)
		XCTAssert(CacheControl.mustRevalidate == CacheControl(headerValue: "must-revalidate")!)
		XCTAssert(CacheControl.public_ == CacheControl(headerValue: "public")!)
		XCTAssert(CacheControl.private_ == CacheControl(headerValue: "private")!)
		XCTAssert(CacheControl.proxyRevalidate == CacheControl(headerValue: "proxy-revalidate")!)
		XCTAssert(CacheControl.maxAge(1000) == CacheControl(headerValue: "max-age=1000")!)
		XCTAssert(CacheControl.maxStale(1000) == CacheControl(headerValue: "max-stale=1000")!)
		XCTAssert(CacheControl.minFresh(1000) == CacheControl(headerValue: "min-fresh=1000")!)
		XCTAssert(CacheControl.sMaxAge(1000) == CacheControl(headerValue: "s-maxage=1000")!)
		
		XCTAssert(CacheControl.maxAge(1000) == CacheControl(headerValue: "max-age= 1000")!)
		XCTAssert(CacheControl.maxAge(1000) == CacheControl(headerValue: "max-age =1000")!)
		XCTAssert(CacheControl.maxAge(1000) == CacheControl(headerValue: "max-age = 1000")!)
		XCTAssert(CacheControl.maxAge(1000) == CacheControl(headerValue: "max-age = 1000 ")!)

		XCTAssertNil(CacheControl(headerValue: "max-age="))
		XCTAssertNil(CacheControl(headerValue: "max-age=1s"))
		XCTAssertNil(CacheControl(headerValue: "max-age=s"))
		XCTAssertNil(CacheControl(headerValue: "max-age=5, no-cache"))
	}
	
	func testSingle() {
		let single = Headers(["Cache-Control": "no-cache"])
		XCTAssert(single.cacheControl! == [.noCache])
		
		let singleWithValue = Headers(["Cache-Control": "max-age=1000"])
		XCTAssert(singleWithValue.cacheControl! == [.maxAge(1000)])
	}

    func testMultiple() {
        let multiple = Headers(["Cache-Control": "no-cache,max-age=1000"])
        XCTAssert(multiple.cacheControl! == [.noCache, .maxAge(1000)])

        let multipleWithValues = Headers(["Cache-Control": "max-stale=100,max-age=1000"])
        XCTAssert(multipleWithValues.cacheControl! == [.maxStale(100), .maxAge(1000)])
    }
}
