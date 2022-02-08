import Foundation

// 16. 3Sum Closest
// https://leetcode.com/problems/3sum-closest/

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        
        let sort = nums.sorted()
        let len = sort.count
        
        var diff = Int.max
        var result = 0
        
        for i in 0..<len - 2 {
            var valA = i + 1, valB = len - 1
            while valA < valB {
                let sum = sort[i] + sort[valA] + sort[valB]
                
                if sum > target { valB -= 1 } else { valA += 1 }
                
                let value = abs(sum - target)
                
                if value < diff {
                    diff = value
                    result = sum
                }
            }
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 test, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
    func test0() {
        let value = solution.threeSumClosest([-1,2,1,-4], 1)
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.threeSumClosest([0,0,0], 1)
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
