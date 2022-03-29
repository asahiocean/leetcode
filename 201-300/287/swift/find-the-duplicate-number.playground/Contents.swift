import Foundation

// 287. Find the Duplicate Number
// https://leetcode.com/problems/find-the-duplicate-number/

class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var set: Set<Int> = []
        for n in nums {
            if set.contains(n) { return n }
            set.insert(n)
        }
        return 0
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.findDuplicate([1,3,4,2,2])
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.findDuplicate([3,1,3,4,2])
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()
