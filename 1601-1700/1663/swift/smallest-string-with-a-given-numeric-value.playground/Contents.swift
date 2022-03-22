import Foundation

// 1663. Smallest String With A Given Numeric Value
// https://leetcode.com/problems/smallest-string-with-a-given-numeric-value/

class Solution {
    func getSmallestString(_ n: Int, _ k: Int) -> String {
        var arr = Array(repeating: "", count: n)
        var val = k
        for i in (0..<n).reversed() {
            let add = min(val - i, 26)
            arr[i] = "\(UnicodeScalar(UInt8(add - 1) + 97))"
            val -= add
        }
        return arr.joined()
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    // The numeric value of the string is 1 + 1 + 25 = 27,
    // and it is the smallest string with such a value and length equal to 3.
    func test0() {
        let value = solution.getSmallestString(3, 27)
        XCTAssertEqual(value, "aay")
    }
    
    func test1() {
        let value = solution.getSmallestString(5, 73)
        XCTAssertEqual(value, "aaszz")
    }
}

Tests.defaultTestSuite.run()
