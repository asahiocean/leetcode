import Foundation

// 1818. Minimum Absolute Sum Difference
// https://leetcode.com/problems/minimum-absolute-sum-difference/

class Solution {
    func minAbsoluteSumDiff(_ n1: [Int], _ n2: [Int]) -> Int {
        let ln1 = n1.count, n1s = n1.sorted()
        let raw = (0..<ln1).map({ abs(n1[$0] - n2[$0]) }).reduce(0, +)
        var res = raw
        
        func finder(_ val: Int) -> Int {
            var lhs = 0, rhs = ln1 - 1
            guard val > n1s[lhs] else { return -1 }
            guard val < n1s[rhs] else { return ln1 }
            while lhs < rhs {
                let mid = lhs + (rhs - lhs) >> 1
                switch n1s[mid] {
                case val: return mid
                case ...val: lhs = mid + 1
                case val...: rhs = mid - 1
                default: break
                }
            }
            return n1s[lhs] <= val ? lhs : (lhs - 1)
        }
        for i in 0..<ln1 {
            var tmp = raw - abs(n2[i] - n1[i])
            let id1 = finder(n2[i])
            switch id1 {
            case -1:
                tmp += abs(n1s[0] - n2[i])
            case ln1:
                tmp += abs(n1s[ln1 - 1] - n2[i])
            default:
                tmp += min(abs(n1s[id1] - n2[i]), abs(n1s[id1 + 1] - n2[i]))
            }
            res = min(res, tmp)
        }
        return res % 1_000_000_007
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.025 (0.027) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    // There are two possible optimal solutions:
    // - Replace the second element with the first: [1,7,5] => [1,1,5], or
    // - Replace the second element with the third: [1,7,5] => [1,5,5].
    // Both will yield an absolute sum difference of |1-2| + (|1-3| or |5-3|) + |5-5| = 3.
    func test0() {
        let value = solution.minAbsoluteSumDiff([1,7,5], [2,3,5])
        XCTAssertEqual(value, 3)
    }
    
    // nums1 is equal to nums2 so no replacement is needed. This will result in an
    // absolute sum difference of 0.
    func test1() {
        let value = solution.minAbsoluteSumDiff([2,4,6,8,10], [2,4,6,8,10])
        XCTAssertEqual(value, 0)
    }

    // Replace the first element with the second: [1,10,4,4,2,7] => [10,10,4,4,2,7].
    // This yields an absolute sum difference of |10-9| + |10-3| + |4-5| + |4-1| + |2-7| + |7-4| = 20
    func test2() {
        let value = solution.minAbsoluteSumDiff([1,10,4,4,2,7], [9,3,5,1,7,4])
        XCTAssertEqual(value, 20)
    }
}

Tests.defaultTestSuite.run()
