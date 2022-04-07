import Foundation

// 1046. Last Stone Weight
// https://leetcode.com/problems/last-stone-weight/

class Solution {
    func lastStoneWeight(_ s: [Int]) -> Int {
        guard s.count >= 1 else { return s[0] }
        var stn = s
        while stn.count > 1 {
            stn.sort()
            let el1 = stn.removeLast(), el2 = stn.removeLast()
            if el1 != el2 { stn.append(el1 - el2) }
        }
        return stn.isEmpty ? 0 : stn[0]
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {

    private let solution = Solution()
    
    // We combine 7 and 8 to get 1 so the array converts to [2,4,1,1,1] then,
    // we combine 2 and 4 to get 2 so the array converts to [2,1,1,1] then,
    // we combine 2 and 1 to get 1 so the array converts to [1,1,1] then,
    // we combine 1 and 1 to get 0 so the array converts to [1] then
    // that's the value of the last stone.
    func test0() {
        let value = solution.lastStoneWeight([2,7,4,1,8,1])
        XCTAssertEqual(value, 1)
    }
    
    func test1() {
        let value = solution.lastStoneWeight([1])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
