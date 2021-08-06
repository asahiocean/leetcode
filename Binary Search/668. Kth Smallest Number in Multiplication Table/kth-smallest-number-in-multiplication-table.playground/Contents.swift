import Foundation

// 668. Kth Smallest Number in Multiplication Table
// https://leetcode.com/problems/kth-smallest-number-in-multiplication-table/

class Solution {
    func findKthNumber(_ m: Int, _ n: Int, _ k: Int) -> Int {
        func bordersKth(_ num: Int, _ m: Int, _ n: Int, _ k: Int) -> Bool {
            var count = 0
            for i in 1...m { count += min(num/i, n) }
            return count >= k
        }
        var l = 1, h = m*n
        while l < h {
            let mid = (l+h)/2
            bordersKth(mid,m,n,k) ? (h = mid) : (l = mid + 1)
        }
        return l
    }
}

// MARK: - Test Cases -

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.007) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        XCTAssertEqual(s.findKthNumber(3, 3, 5), 3)
    }
    func test1() {
        XCTAssertEqual(s.findKthNumber(2, 3, 6), 6)
    }
}

Tests.defaultTestSuite.run()
