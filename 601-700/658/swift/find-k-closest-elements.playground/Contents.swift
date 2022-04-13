import Foundation

// 658. Find K Closest Elements
// https://leetcode.com/problems/find-k-closest-elements/

class Solution {
    func findClosestElements(_ a: [Int], _ k: Int, _ x: Int) -> [Int] {
        var lhs = 0, rhs = a.count - k
        while lhs < rhs {
            let mid = lhs + (rhs - lhs) >> 1
            if x - a[mid] > a[mid+k] - x {
                lhs = mid + 1
            } else {
                rhs = mid
            }
        }
        return [Int](a[lhs..<(lhs + k)])
    }
}


// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    func test0() {
        let value = solution.findClosestElements([1,2,3,4,5], 4, 3)
        XCTAssertEqual(value, [1,2,3,4])
    }
    
    func test1() {
        let value = solution.findClosestElements([1,2,3,4,5], 4, -1)
        XCTAssertEqual(value, [1,2,3,4])
    }
}

Tests.defaultTestSuite.run()
