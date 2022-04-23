import Foundation

// 41. First Missing Positive
// https://leetcode.com/problems/first-missing-positive/

class Solution {
    func firstMissingPositive(_ n: [Int]) -> Int {
        let set = Set(n)
        for i in 0..<n.count where !set.contains(i + 1) { return i + 1 }
        return n.count + 1
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.firstMissingPositive([1,2,0])
        XCTAssertEqual(value, 3)
    }
    
    func test1() {
        let value = solution.firstMissingPositive([3,4,-1,1])
        XCTAssertEqual(value, 2)
    }
    
    func test2() {
        let value = solution.firstMissingPositive([7,8,9,11,12])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
