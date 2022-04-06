import Foundation

// 923. 3Sum With Multiplicity
// https://leetcode.com/problems/3sum-with-multiplicity/

class Solution {
    func threeSumMulti(_ a: [Int], _ t: Int) -> Int {
        var val = 0
        for i in a.indices {
            var nums = [Int](repeating: 0, count: 101)
            for n in i + 1..<a.count {
                let num = t - a[i] - a[n]
                if num >= 0, num <= 100, nums[num] > 0 {
                    val += nums[num]
                    val %= 1_000_000_007
                }
                nums[a[n]] += 1
            }
        }
        return val
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.022 (0.025) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // by the values (arr[i], arr[j], arr[k]):
    // (1, 2, 5) occurs 8 times
    // (1, 3, 4) occurs 8 times
    // (2, 2, 4) occurs 2 times
    // (2, 3, 3) occurs 2 times
    func test0() {
        let value = solution.threeSumMulti([1,1,2,2,3,3,4,4,5,5], 8)
        XCTAssertEqual(value, 20)
    }
    
    // arr[i] = 1, arr[j] = arr[k] = 2 occurs 12 times:
    // We choose one 1 from [1,1] in 2 ways,
    // and two 2s from [2,2,2,2] in 6 ways.
    func test1() {
        let value = solution.threeSumMulti([1,1,2,2,2,2], 5)
        XCTAssertEqual(value, 12)
    }
}

Tests.defaultTestSuite.run()
