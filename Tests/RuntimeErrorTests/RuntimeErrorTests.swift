import RuntimeError
import XCTest

final class RuntimeErrorTests: XCTestCase {
    func testInit() {
        let sut = RuntimeError("Lorem ipsum")
        XCTAssertEqual(sut.message, "Lorem ipsum")
    }

    func testLocalizedDescription() {
        let sut = RuntimeError("Lorem ipsum")
        XCTAssertEqual(sut.localizedDescription, "Lorem ipsum")
    }
}
