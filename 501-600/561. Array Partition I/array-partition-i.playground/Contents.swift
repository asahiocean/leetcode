import Foundation

// 561. Array Partition I
// https://leetcode.com/problems/array-partition-i/

class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        var arr = nums, res = 0
        arr = arr.sorted()
        for i in 0..<arr.count {
            if i & 1 != 0 {
                res += min(arr[i], arr[i - 1])
            }
        }
        return res
    }
}

// MARK: - Test Cases -

import XCTest

//     Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        XCTAssertTrue(s.arrayPairSum([1,4,3,2]) == 4)
    }
    func test1() {
        XCTAssertTrue(s.arrayPairSum([6,2,6,5,1,2]) == 9)
    }
}

Tests.defaultTestSuite.run()
