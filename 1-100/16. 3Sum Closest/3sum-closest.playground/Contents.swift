import Foundation

// 16. 3Sum Closest
// https://leetcode.com/problems/3sum-closest

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        
        let sorted = nums.sorted()
        let length = sorted.count
        
        var diff: Int = .max
        var result = 0
        
        for i in 0..<length - 2 {
            var n = i + 1, q = length - 1
            while n < q {
                let sum = sorted[i] + sorted[n] + sorted[q]
                
                sum > target ? (q -= 1) : (n += 1)
                
                let value =  abs(sum - target)
                
                if value < diff {
                    diff = value
                    result = sum
                }
            }
        }
        return result
    }
}

// MARK: - Test case -

// Result: Executed 1 test, with 0 failures (0 unexpected) in 0.004 (0.006) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test() {
        let value = solution.threeSumClosest([-1,2,1,-4], 1)
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()
