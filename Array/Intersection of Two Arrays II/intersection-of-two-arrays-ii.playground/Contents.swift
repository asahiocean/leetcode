import Foundation

// 350. Intersection of Two Arrays II
// https://leetcode.com/problems/intersection-of-two-arrays-ii

class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var map = [Int: Int](), res = [Int]()
        nums1.forEach({ map[$0, default: 0] += 1 })
        for n in nums2 where map[n] ?? 0 > 0 {
            res.append(n)
            map[n]! -= 1
        }
        return res
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.023 (0.025) seconds

class Tests: XCTestCase {
    let s = Solution()
    func test0() {
        let res = s.intersect([1,2,2,1], [2,2])
        XCTAssertEqual(res, [2,2])
    }
    func test1() {
        let res = s.intersect([4,9,5], [9,4,9,8,4])
        XCTAssertEqual(res, [9,4])
    }
}

Tests.defaultTestSuite.run()
