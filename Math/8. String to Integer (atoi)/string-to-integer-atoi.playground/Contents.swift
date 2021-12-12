import Foundation

// 8. String to Integer (atoi)
// https://leetcode.com/problems/string-to-integer-atoi/

class Solution {
    func myAtoi(_ s: String) -> Int {
        if s.contains("+ ") { return 0 }
        let int = (s as NSString).integerValue
        return int >= Int32.max ? Int(Int32.max) : max(Int(Int32.min), int)
    }
}

// MARK: - Test cases -

// Result: Executed 7 tests, with 0 failures (0 unexpected) in 0.005 (0.006) seconds

import XCTest

class Tests: XCTestCase {
    
    private let s = Solution()
    
    func test0() { XCTAssert(s.myAtoi("42") == 42) }
    func test1() { XCTAssert(s.myAtoi("   -42") == -42) }
    func test2() { XCTAssert(s.myAtoi("4193 with words") == 4193) }
    func test3() { XCTAssert(s.myAtoi("42") == 42) }
    func test4() { XCTAssert(s.myAtoi("words and 987") == 0) }
    func test5() { XCTAssert(s.myAtoi("-91283472332") == -2147483648) }
    func test6() { XCTAssert(s.myAtoi("  +  413") == 0) }
}

Tests.defaultTestSuite.run()
