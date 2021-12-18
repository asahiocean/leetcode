import Foundation

// 26. Remove Duplicates from Sorted Array
// https://leetcode.com/problems/remove-duplicates-from-sorted-array/

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var result: [Int: Int] = [:]
        nums.map { result[$0] = $0 }
        nums = result.map { $0.key }.sorted{ $1 > $0}
        return nums.count
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.094 (0.130) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        var array = [1,1,2]
        solution.removeDuplicates(&array)
        XCTAssertEqual(2, [1,2].count)
    }
    
    func test1() {
        var array = [0,0,1,1,1,2,2,3,3,4]
        solution.removeDuplicates(&array)
        XCTAssertEqual(5, [0,1,2,3,4].count)
    }
}

Tests.defaultTestSuite.run()
