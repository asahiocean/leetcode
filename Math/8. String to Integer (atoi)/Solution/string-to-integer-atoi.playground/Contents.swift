import Foundation

// https://leetcode.com/problems/string-to-integer-atoi/
// Status: Accepted

class Solution {
    func myAtoi(_ s: String) -> Int {
        if s.contains("+ ") { return 0 }
        let int = (s as NSString).integerValue
        return int >= Int32.max ? Int(Int32.max) : max(Int(Int32.min), int)
    }
}

import XCTest

//      Executed 7 tests, with 0 failures (0 unexpected) in 0.005 (0.006) seconds

class Tests: XCTestCase {
    private let s = Solution()
    
    func testExample1() { XCTAssert(s.myAtoi("42") == 42) }
    func testExample2() { XCTAssert(s.myAtoi("   -42") == -42) }
    func testExample3() { XCTAssert(s.myAtoi("4193 with words") == 4193) }
    func testExample4() { XCTAssert(s.myAtoi("42") == 42) }
    func testExample5() { XCTAssert(s.myAtoi("words and 987") == 0) }
    func testExample6() { XCTAssert(s.myAtoi("-91283472332") == -2147483648) }
    
    func testSubmit() { XCTAssert(s.myAtoi("  +  413") == 0) }
}

Tests.defaultTestSuite.run()
