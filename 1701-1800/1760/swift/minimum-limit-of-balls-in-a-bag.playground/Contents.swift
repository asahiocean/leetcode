import Foundation

// 1760. Minimum Limit of Balls in a Bag
// https://leetcode.com/problems/minimum-limit-of-balls-in-a-bag/

class Solution {
    func minimumSize(_ nums: [Int], _ mo: Int) -> Int {
        guard !nums.isEmpty else { return 0 }
        let srt = nums.sorted()
        func valid(_ mc: Int) -> Bool {
            guard mc > 0 else { return false }
            var cnt = mo
            for i in stride(from: srt.count - 1, through: 0, by: -1) where srt[i] > mc {
                cnt -= srt[i] / mc
                if srt[i] % mc == 0 { cnt += 1 }
            }
            return cnt >= 0
        }
        var lhs = 0, rhs = srt.last!, val = Int.max
        while lhs < rhs {
            let mid = lhs + (rhs - lhs) >> 1
            if valid(mid) {
                val = min(val, mid)
                rhs = mid - 1
            } else {
                lhs = mid + 1
            }
        }
        return valid(lhs) ? min(lhs, val) : val
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.025 (0.027) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    // - Divide the bag with 9 balls into two bags of sizes 6 and 3. [9] -> [6,3].
    // - Divide the bag with 6 balls into two bags of sizes 3 and 3. [6,3] -> [3,3,3].
    // The bag with the most number of balls has 3 balls, so your penalty is 3 and you should return 3.
    func test0() {
        let value = solution.minimumSize([9],2)
        XCTAssertEqual(value, 3)
    }
    
    // - Divide the bag with 8 balls into two bags of sizes 4 and 4. [2,4,8,2] -> [2,4,4,4,2].
    // - Divide the bag with 4 balls into two bags of sizes 2 and 2. [2,4,4,4,2] -> [2,2,2,4,4,2].
    // - Divide the bag with 4 balls into two bags of sizes 2 and 2. [2,2,2,4,4,2] -> [2,2,2,2,2,4,2].
    // - Divide the bag with 4 balls into two bags of sizes 2 and 2. [2,2,2,2,2,4,2] -> [2,2,2,2,2,2,2,2].
    // The bag with the most number of balls has 2 balls, so your penalty is 2 an you should return 2.
    func test1() {
        let value = solution.minimumSize([2,4,8,2],4)
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()
