import Foundation

// 1574. Shortest Subarray to be Removed to Make Array Sorted
// https://leetcode.com/problems/shortest-subarray-to-be-removed-to-make-array-sorted/

class Solution {
    func findLengthOfShortestSubarray(_ a: [Int]) -> Int {
        var end = a.count - 1, lhs = 0, rhs = end
        var nolast: Bool { lhs < end }
        while nolast && a[lhs] <= a[lhs + 1] { lhs += 1 } // last index search
        guard nolast else { return 0 }
        while rhs > lhs && a[rhs] >= a[rhs - 1] { rhs -= 1 } // first index search
        var res = min(rhs, end - lhs), idx = 0
        while a[end] >= a[0] && idx <= lhs {
            if a[rhs] >= a[idx] {
                res = min(res, rhs - idx - 1)
                idx += 1
            } else if rhs < end { // bfs last element
                var tmp = end
                while rhs < tmp {
                    let mid = (tmp + rhs) / 2
                    a[mid] < a[idx] ? (rhs = mid + 1) : (tmp = mid)
                }
                rhs = tmp
            } else { break }
        }
        return res
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.011) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    // The shortest subarray we can remove is [10,4,2] of length 3.
    // The remaining elements after that will be [1,2,3,3,5] which are sorted.
    // Another correct solution is to remove the subarray [3,10,4].
    func test0() {
        let value = solution.findLengthOfShortestSubarray([1,2,3,10,4,2,3,5])
        XCTAssertEqual(value, 3)
    }
    
    // Since the array is strictly decreasing, we can only keep a single element.
    // Therefore we need to remove a subarray of length 4, either [5,4,3,2] or [4,3,2,1].
    func test1() {
        let value = solution.findLengthOfShortestSubarray([5,4,3,2,1])
        XCTAssertEqual(value, 4)
    }
    
    // The array is already non-decreasing. We do not need to remove any elements.
    func test2() {
        let value = solution.findLengthOfShortestSubarray([1,2,3])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
