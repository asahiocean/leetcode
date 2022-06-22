import Foundation

// 215. Kth Largest Element in an Array
// https://leetcode.com/problems/kth-largest-element-in-an-array/

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        return nums.isEmpty ? 0 : nums.sorted()[nums.count - k]
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.015 (0.017) seconds

class Tests {
    
    private typealias sol = Solution
    
    static func testExample1() {
        let val = sol().findKthLargest([3,2,1,5,6,4], 2)
        print(val == 5)
    }
    
    static func testExample2() {
        let val = sol().findKthLargest([3,2,3,1,2,4,5,5,6], 4)
        print(val == 4)
    }
}

Tests.testExample1()
Tests.testExample2()
