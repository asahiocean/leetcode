import Foundation

// 15. 3Sum
// https://leetcode.com/problems/3sum/

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        
        var result: [[Int]] = []
        let nums = nums.sorted()
        let len = nums.count
        
        guard len >= 3 else { return result }
        
        for i in 0..<len {
            if i > 0 && nums[i] == nums[i-1] { continue }
            
            let num = 0 - nums[i]
            var a = i + 1, b = len - 1
            
            while a < b {
                let numA = nums[a], numB = nums[b]
                let sum = numA + numB
                if sum == num {
                    result.append([nums[i], numA, numB])
                    a += 1
                    b -= 1
                    while a < b && nums[a] == nums[a-1] { a += 1 }
                    while a < b && nums[b] == nums[b+1] { b -= 1 }
                } else {
                    sum > num ? b -= 1 : (a += 1)
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
