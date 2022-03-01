import Foundation

// 338. Counting Bits
// https://leetcode.com/problems/counting-bits/

class Solution {
    func countBits(_ n: Int) -> [Int] {
        var arr = [0]
        if n == 0 { return arr }
        for i in 1...n {
            arr.append(arr[i & (i - 1)] + 1)
        }
        return arr
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // 0 --> 0
    // 1 --> 1
    // 2 --> 10
    func test0() {
        let value = solution.countBits(2)
        XCTAssertEqual(value, [0,1,1])
    }
    
    // 0 --> 0
    // 1 --> 1
    // 2 --> 10
    // 3 --> 11
    // 4 --> 100
    // 5 --> 101
    func test1() {
        let value = solution.countBits(5)
        XCTAssertEqual(value, [0,1,1,2,1,2])
    }
}

Tests.defaultTestSuite.run()
