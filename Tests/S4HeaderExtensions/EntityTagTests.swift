@testable import S4HeaderExtensions

import XCTest
import S4

class EntityTagTests: XCTestCase {

    func testWeakETags() {
        let etag = EntityTag(headerValue: "W/\"fklaj8093jpaf09djs0a9js\"")!
        XCTAssert(etag == EntityTag(tag: "fklaj8093jpaf09djs0a9js", weak: true))
    }

    func testStrongETags() {
        let etag = EntityTag(headerValue: "\"fklaj8093jpaf09djs0a9js\"")!
        XCTAssert(etag == EntityTag(tag: "fklaj8093jpaf09djs0a9js"))
    }

    func testETagEquality() {
        let weak = EntityTag(headerValue: "W/\"fklaj8093jpaf09djs0a9js\"")!
        let strong = EntityTag(headerValue: "\"fklaj8093jpaf09djs0a9js\"")!
        XCTAssert(weak != strong)

        let weakB = EntityTag(headerValue: "W/\"d023u9fdwsjvd0s9j\"")!
        let strongB = EntityTag(headerValue: "\"d023u9fdwsjvd0s9j\"")!

        XCTAssert(weak != weakB)
        XCTAssert(strong != strongB)
    }

    func testEmptyEtag() {
        let weak = EntityTag(headerValue: "W/\"\"")!
        let strong = EntityTag(headerValue: "\"\"")!

        XCTAssert(weak == EntityTag(tag: "", weak: true))
        XCTAssert(strong == EntityTag(tag: ""))
    }

    func testEtagErrors() {
        XCTAssert(EntityTag(headerValue:"notQuoted") == nil)
        XCTAssert(EntityTag(headerValue:"w/\"caseSensitive\"") == nil)
        XCTAssert(EntityTag(headerValue:"") == nil)
        XCTAssert(EntityTag(headerValue:"mismatched\"") == nil)
        XCTAssert(EntityTag(headerValue:"\"mismatched") == nil)
        XCTAssert(EntityTag(headerValue:"\"contains\"quote\"") == nil)
        XCTAssert(EntityTag(headerValue:"W/\"") == nil)
    }
}
