import Foundation

// 350. Intersection of Two Arrays II
// https://leetcode.com/problems/intersection-of-two-arrays-ii/

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        
        var map: [Int:Int] = [:], result: [Int] = []
        
        for n in nums1 { map[n, default: 0] += 1 }
        
        for n in nums2 where (map[n] ?? 0) > 0 {
            result.append(n)
            map[n]! -= 1
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.023 (0.025) seconds

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
