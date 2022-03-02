import Foundation

// 1588. Sum of All Odd Length Subarrays
// https://leetcode.com/problems/sum-of-all-odd-length-subarrays/

class Solution {
    func sumOddLengthSubarrays(_ arr: [Int]) -> Int {
        let len = arr.count
        var lenSub = 0, result = 0
        while lenSub <= len {
            for i in 0..<(len - lenSub) {
                result += arr[i...i + lenSub].reduce(0, +)
            }
            lenSub += 2
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /*
     The odd-length subarrays of arr and their sums are:
     [1] = 1
     [4] = 4
     [2] = 2
     [5] = 5
     [3] = 3
     [1,4,2] = 7
     [4,2,5] = 11
     [2,5,3] = 10
     [1,4,2,5,3] = 15
     If we add all these together we get 1 + 4 + 2 + 5 + 3 + 7 + 11 + 10 + 15 = 58
     */
    func test0() {
        let value = solution.sumOddLengthSubarrays([1,4,2,5,3])
        XCTAssertEqual(value, 58)
    }
    
    // There are only 2 subarrays of odd length, [1] and [2]. Their sum is 3.
    func test1() {
        let value = solution.sumOddLengthSubarrays([1,2])
        XCTAssertEqual(value, 3)
    }
    
    func test2() {
        let value = solution.sumOddLengthSubarrays([10,11,12])
        XCTAssertEqual(value, 66)
    }
}

Tests.defaultTestSuite.run()
