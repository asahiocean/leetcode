import Foundation

// 350. Intersection of Two Arrays II
// https://leetcode.com/problems/intersection-of-two-arrays-ii/

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

        var res: [Int] = []
        var map = Dictionary(nums1.map {($0, 1)}, uniquingKeysWith: +)
        
        for n in nums2 where map[n, default: 0] > 0 {
            res.append(n)
            map[n]! -= 1
        }
        return res
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.intersect([1,2,2,1], [2,2])
        XCTAssertEqual(value, [2,2])
    }
    
    // [9,4] is also accepted.
    func test1() {
        let value = solution.intersect([4,9,5], [9,4,9,8,4])
        XCTAssertEqual(value, [9,4])
    }
}

Tests.defaultTestSuite.run()
