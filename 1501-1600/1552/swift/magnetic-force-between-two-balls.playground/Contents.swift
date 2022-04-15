import Foundation

// 1552. Magnetic Force Between Two Balls
// https://leetcode.com/problems/magnetic-force-between-two-balls/

class Solution {
    func maxDistance(_ p: [Int], _ m: Int) -> Int {
        guard !p.isEmpty else { return 0 }
        let srt = p.sorted()
        var lhs = 0, rhs = srt.last! - srt[0]
        var res = Int.min
        func valid(_ d: Int) -> Bool {
            var cnt = 1, cur = srt[0]
            for i in 1..<p.count where srt[i] - cur >= d {
                cnt += 1
                cur = srt[i]
            }
            return cnt >= m
        }
        while lhs <= rhs {
            let mid = lhs + (rhs - lhs) >> 1
            if valid(mid) {
                res = max(res, mid)
                lhs = mid + 1
            } else {
                rhs = mid - 1
            }
        }
        return res
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    // Distributing the 3 balls into baskets 1, 4 and 7 will make the magnetic force between
    // ball pairs [3, 3, 6]. The minimum magnetic force is 3. We cannot achieve a larger
    // minimum magnetic force than 3.
    func test0() {
        let value = solution.maxDistance([1,2,3,4,7], 3)
        XCTAssertEqual(value, 3)
    }
    
    // We can use baskets 1 and 1000000000.
    func test1() {
        let value = solution.maxDistance([5,4,3,2,1,1000000000], 2)
        XCTAssertEqual(value, 999999999)
    }
}

Tests.defaultTestSuite.run()
