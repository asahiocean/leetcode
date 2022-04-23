import Foundation

// 8. String to Integer (atoi)
// https://leetcode.com/problems/string-to-integer-atoi/

class Solution {
    func myAtoi(_ s: String) -> Int {
        guard !s.contains("+ ") else { return 0 }
        let val = (s as NSString).integerValue
        return val >= Int32.max ? Int(Int32.max) : max(Int(Int32.min), val)
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.005 (0.006) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The underlined characters are what is read in, the caret is the current reader position.
    // Step 1: "42" (no characters read because there is no leading whitespace)
    //          ^
    // Step 2: "42" (no characters read because there is neither a '-' nor '+')
    //          ^
    // Step 3: "42" ("42" is read in)
    //            ^
    // The parsed integer is 42.
    // Since 42 is in the range [-231, 231 - 1], the final result is 42.
    func test0() {
        let value = solution.myAtoi("42")
        XCTAssertEqual(value, 42)
    }
    
    // Step 1: "   -42" (leading whitespace is read and ignored)
    //             ^
    // Step 2: "   -42" ('-' is read, so the result should be negative)
    //              ^
    // Step 3: "   -42" ("42" is read in)
    //                ^
    // The parsed integer is -42.
    // Since -42 is in the range [-231, 231 - 1], the final result is -42.
    func test2() {
        let value = solution.myAtoi("   -42")
        XCTAssertEqual(value, -42)
    }
    
    // Step 1: "4193 with words" (no characters read because there is no leading whitespace)
    //          ^
    // Step 2: "4193 with words" (no characters read because there is neither a '-' nor '+')
    //          ^
    // Step 3: "4193 with words" ("4193" is read in; reading stops because the next character is a non-digit)
    //              ^
    // The parsed integer is 4193.
    // Since 4193 is in the range [-231, 231 - 1], the final result is 4193.
    func test3() {
        let value = solution.myAtoi("4193 with words")
        XCTAssertEqual(value, 4193)
    }
}

Tests.defaultTestSuite.run()
