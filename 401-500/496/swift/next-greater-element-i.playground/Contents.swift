import Foundation

// 496. Next Greater Element I
// https://leetcode.com/problems/next-greater-element-i/

class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var stack: [Int] = [], dict: [Int:Int] = [:]
        for n in nums2 {
            while let last = stack.last, last < n {
                dict[stack.removeLast()] = n
            }
            stack.append(n)
        }
        return nums1.map({ dict[$0] ?? -1 })
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The next greater element for each value of nums1 is as follows:
    // - 4 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.
    // - 1 is underlined in nums2 = [1,3,4,2]. The next greater element is 3.
    // - 2 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.
    func test0() {
        let value = solution.nextGreaterElement([4,1,2], [1,3,4,2])
        XCTAssertEqual(value, [-1,3,-1])
    }
    
    // The next greater element for each value of nums1 is as follows:
    // - 2 is underlined in nums2 = [1,2,3,4]. The next greater element is 3.
    // - 4 is underlined in nums2 = [1,2,3,4]. There is no next greater element, so the answer is -1.
    func test1() {
        let value = solution.nextGreaterElement([2,4], [1,2,3,4])
        XCTAssertEqual(value, [3,-1])
    }
}

Tests.defaultTestSuite.run()
