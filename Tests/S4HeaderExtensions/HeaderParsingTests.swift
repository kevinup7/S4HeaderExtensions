@testable import S4HeaderExtensions

import XCTest
import S4

class HeaderParsingTests: XCTestCase {

    func testSingle() {
        let headers = Headers(["foo": "bar1"])
        XCTAssert(headers.foo! == [.bar1])
    }

    func testMultipleWithSpace() {
        let headers = Headers(["foo": "bar1, bar2"])
        XCTAssert(headers.foo! == [.bar1, .bar2])
    }

    func testMultiple() {
        let headers = Headers(["foo": "bar1,bar2"])
        XCTAssert(headers.foo! == [.bar1, .bar2])
    }

    func testFailure() {
        let headers = Headers(["foo": "bar1,bar2,bar3"])
        XCTAssert(headers.foo! == [.bar1, .bar2])
    }
}

enum TestHeader: String, HeaderValueInitializable, HeaderValueRepresentable {
    case bar1
    case bar2

    init?(headerValue: String) {
        guard let header = TestHeader(rawValue: headerValue) else {
            return nil
        }
        self = header
    }

    var headerValue: String {
        return self.rawValue
    }
}

extension Headers {
    var foo: [TestHeader]? {
        get {
            return TestHeader.values(fromHeader: headers["foo"])
        }
        set {
            headers["foo"] = newValue?.headerValue
        }
    }
}
