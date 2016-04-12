@testable import S4HeaderExtensions

import XCTest
import S4

class EntityTagMatchTests: XCTestCase {

    func testWildcard() {
        XCTAssert(EntityTagMatch(header: ["*"])! == EntityTagMatch.any)
    }
    
    func testSingleTag() {
        let strong = EntityTagMatch.tags([EntityTag(tag: "abc")])
        let strongFromString = EntityTagMatch(header: ["\"abc\""])!
        XCTAssert(strong == strongFromString)
        
        let weak = EntityTagMatch.tags([EntityTag(tag: "abc", weak: true)])
        let weakFromString = EntityTagMatch(header: ["W/\"abc\""])!
        XCTAssert(weak == weakFromString)
    }
    
    func testMultiple() {
        let weak = EntityTag(tag: "abc", weak: true)
        let strong = EntityTag(tag: "abc")
        let tags = EntityTagMatch.tags([weak, strong])
        
        let tagsString = EntityTagMatch(header: ["W/\"abc\"", "\"abc\""])!
        
        XCTAssert(tags == tagsString)
        
    }
    
    func testErrors() {
        XCTAssertNil(EntityTagMatch(header: [""]))
        XCTAssertNil(EntityTagMatch(header: ["abc"]))
        XCTAssertNil(EntityTagMatch(header: ["*W/\"abc\""]))
    }
}
