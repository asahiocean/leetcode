import Foundation

// 709. To Lower Case
// https://leetcode.com/problems/to-lower-case/

class Solution {
    func toLowerCase(_ s: String) -> String {
        return s.lowercased()
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.toLowerCase("Hello")
        XCTAssertEqual(value, "hello")
    }
    
    func test1() {
        let value = solution.toLowerCase("here")
        XCTAssertEqual(value, "here")
    }
    
    func test2() {
        let value = solution.toLowerCase("LOVELY")
        XCTAssertEqual(value, "lovely")
    }
}

Tests.defaultTestSuite.run()
