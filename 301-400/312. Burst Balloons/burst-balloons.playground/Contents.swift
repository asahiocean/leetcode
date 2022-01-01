import Foundation

// 312. Burst Balloons
// https://leetcode.com/problems/burst-balloons/

class Solution {
    func maxCoins(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        let nums = ([1] + nums + [1])
        let count = nums.count
        
        var collect = [[Int]](repeating: [Int](repeating: 0, count: count), count: count)
        
        for ln in 1...(count - 2) {
            for i in 1...(count - 1 - ln) {
                
                let pcs = (i + ln - 1)
                
                for n in i...pcs {
                    let val = collect[i][n-1] + (nums[i-1] * (nums[n] * nums[pcs+1])) + collect[n+1][pcs]
                    collect[i][pcs] = max(collect[i][pcs], val)
                }
            }
        }
        return collect[1][count - 2]
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// nums = [3,1,5,8] --> [3,5,8] --> [3,8] --> [8] --> []
    /// coins =  3*1*5    +   3*5*8   +  1*3*8  + 1*8*1 = 167
    func test0() {
        let value = solution.maxCoins([3,1,5,8])
        XCTAssertEqual(value, 167)
    }
    
    func test1() {
        let value = solution.maxCoins([1,5])
        XCTAssertEqual(value, 10)
    }
}

Tests.defaultTestSuite.run()
