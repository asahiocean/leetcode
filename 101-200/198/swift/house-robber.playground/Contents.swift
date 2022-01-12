import Foundation

// 198. House Robber
// https://leetcode.com/problems/house-robber/

class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var rob = nums[0], notRob = 0
        
        for i in 1..<nums.count {
            let curRob = notRob + nums[i]
            let curNotRob = notRob < rob ? rob : notRob
            
            rob = curRob
            notRob = curNotRob
        }
        
        return rob < notRob ? notRob : rob
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Rob house 1 (money = 1) and then rob house 3 (money = 3).
    // Total amount you can rob = 1 + 3 = 4.
    func test0() {
        let value = solution.rob([1,2,3,1])
        XCTAssertEqual(value, 4)
    }
    
    // Rob house 1 (money = 2), rob house 3 (money = 9) and rob house 5 (money = 1).
    // Total amount you can rob = 2 + 9 + 1 = 12.
    func test1() {
        let value = solution.rob([2,7,9,3,1])
        XCTAssertEqual(value, 12)
    }
}

Tests.defaultTestSuite.run()
