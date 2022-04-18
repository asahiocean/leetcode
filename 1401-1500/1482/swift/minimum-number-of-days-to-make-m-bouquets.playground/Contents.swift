import Foundation

// 1482. Minimum Number of Days to Make m Bouquets
// https://leetcode.com/problems/minimum-number-of-days-to-make-m-bouquets/

class Solution {
    func minDays(_ bd: [Int], _ m: Int, _ k: Int) -> Int {
        guard bd.count >= m * k else { return -1 }
        var lhs = 0, rhs = 0, valid = Set<Int>(), res = Int.max

        for d in bd {
            if d > rhs { rhs = d }
            if d <= lhs { lhs = d }
        }
        
        func match(_ t: Int) -> Bool {
            var cnt = 0, sum = 0
            for d in bd {
                if d <= t { sum += 1 } else { cnt += sum / k; sum = 0 }
            }
            return cnt + sum / k >= m
        }

        while lhs < rhs {
            let mid = lhs + (rhs - lhs) >> 1
            valid.insert(mid)
            if match(mid) {
                res = min(res, mid)
                rhs = mid - 1
            } else {
                lhs = mid + 1
            }
        }
        return valid.contains(lhs) ? res : min(res, match(lhs) ? lhs : .max)
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.017 (0.019) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    // Let us see what happened in the first three days. x means flower bloomed and _ means flower did not bloom in the garden.
    // We need 3 bouquets each should contain 1 flower.
    // After day 1: [x, _, _, _, _]   // we can only make one bouquet.
    // After day 2: [x, _, _, _, x]   // we can only make two bouquets.
    // After day 3: [x, _, x, _, x]   // we can make 3 bouquets. The answer is 3.
    func test0() {
        let value = solution.minDays([1,10,3,10,2], 3, 1)
        XCTAssertEqual(value, 3)
    }
    
    // We need 3 bouquets each has 2 flowers, that means we need 6 flowers.
    // We only have 5 flowers so it is impossible to get the needed bouquets and we return -1.
    func test1() {
        let value = solution.minDays([1,10,3,10,2], 3, 2)
        XCTAssertEqual(value, -1)
    }
    
    // We need 2 bouquets each should have 3 flowers.
    // Here is the garden after the 7 and 12 days:
    // After day 7: [x, x, x, x, _, x, x]
    // We can make one bouquet of the first three flowers that bloomed. We cannot make another bouquet from the last three flowers that bloomed because they are not adjacent.
    // After day 12: [x, x, x, x, x, x, x]
    // It is obvious that we can make two bouquets in different ways.
    func test2() {
        let value = solution.minDays([7,7,7,7,12,7,7], 2, 3)
        XCTAssertEqual(value, 12)
    }
}

Tests.defaultTestSuite.run()
