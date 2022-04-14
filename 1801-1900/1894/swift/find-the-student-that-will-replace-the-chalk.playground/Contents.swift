import Foundation

// 1894. Find the Student that Will Replace the Chalk
// https://leetcode.com/problems/find-the-student-that-will-replace-the-chalk/

class Solution {
    func chalkReplacer(_ ch: [Int], _ k: Int) -> Int {
        var pref = [0]
        for c in ch {
            pref.append(pref.last! + c)
        }
        let rmn = k % pref.last!
        if rmn == 0 { return 0 }
        for i in 1...ch.count where rmn < pref[i] {
            return i - 1
        }
        return -1
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    func test0() {
        let value = solution.chalkReplacer([5,1,5], 22)
        XCTAssertEqual(value, 0)
    }
    
    func test1() {
        let value = solution.chalkReplacer([3,4,1,2], 25)
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
