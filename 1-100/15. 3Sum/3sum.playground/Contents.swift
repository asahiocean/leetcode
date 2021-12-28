import Foundation

// 15. 3Sum
// https://leetcode.com/problems/3sum

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else { return [[Int]]() }
        
        var result = [[Int]]()
        let nums = nums.sorted()
        
        for i in 0..<nums.count {
            if i > 0 && nums[i] == nums[i-1] { continue }
            
            let num = 0 - nums[i]
            var n = i + 1, c = nums.count - 1
            
            while n < c {
                let nn = nums[n], nc = nums[c]
                let sum = nn + nc
                if sum == num {
                    result.append([nums[i], nn, nc])
                    n += 1; c -= 1;
                    while n < c && nums[n] == nums[n-1] { n += 1 }
                    while n < c && nums[c] == nums[c+1] { c -= 1 }
                } else {
                    sum > num ? c -= 1 : (n += 1)
                }
            }
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.029 (0.031) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.threeSum([-1,0,1,2,-1,-4])
        XCTAssertEqual(value, [[-1,-1,2],[-1,0,1]])
    }
    func test1() {
        let value = solution.threeSum([])
        XCTAssertEqual(value, [])
    }
    func test2() {
        let value = solution.threeSum([0])
        XCTAssertEqual(value, [])
    }
}

Tests.defaultTestSuite.run()
