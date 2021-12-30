import Foundation

// 659. Split Array into Consecutive Subsequences
// https://leetcode.com/problems/split-array-into-consecutive-subsequences

typealias Counter = Dictionary<Int,Int>
extension Counter {
    subscript(k key: Int) -> Int {
        mutating get {
            return self[key] ?? 0
        }
        mutating set(value) {
            self[key] = self[k: key] + value
        }
    }
}

class Solution {
    func isPossible(_ nums: [Int]) -> Bool {
        guard nums.count >= 3 else { return false }
        
        var count = Counter(), tail = Counter()
        nums.forEach{ count[k: $0] = 1 }
        
        for n in nums where count[k: n] != 0 {
            switch tail[k: n] > 0 {
            case true:
                tail[k: n] = -1
                tail[k: n+1] = 1
            default:
                if count[k: n+1] > 0 && count[k: n+2] > 0 {
                    count[k: n+1] = -1
                    count[k: n+2] = -1
                    tail[k: n+3] = 1
                } else {
                    return false
                }
            }
            count[k: n] = -1
        }
        return true
    }
}

// MARK: - Test Cases -

import XCTest

// MARK: Executed 3 tests, with 0 failures (0 unexpected) in 0.146 (0.148) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.isPossible([1,2,3,3,4,5])
        XCTAssertEqual(res, true)
    }
    func test1() {
        let res = s.isPossible([1,2,3,3,4,4,5,5])
        XCTAssertEqual(res, true)
    }
    func test2() {
        let res = s.isPossible([1,2,3,4,4,5])
        XCTAssertEqual(res, false)
    }
}

Tests.defaultTestSuite.run()
