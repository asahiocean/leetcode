import Foundation

// 1365. How Many Numbers Are Smaller Than the Current Number
// https://leetcode.com/problems/how-many-numbers-are-smaller-than-the-current-number/

class Solution {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        var counts = Array(repeating: 0, count: 101), arr = counts, sum = 0
        nums.map{ counts[$0] += 1 }
        
        for i in 1...counts.count - 1 {
            sum += counts[i-1]
            arr[i] = sum
        }
        
        var ans = Array(repeating: 0, count: nums.count)
        for i in 0..<nums.count { ans[i] = arr[nums[i]]}
        return ans
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.057 (0.058) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.smallerNumbersThanCurrent([8,1,2,2,3])
        XCTAssertEqual(value, [4,0,1,1,3])
    }
    
    func test1() {
        let value = solution.smallerNumbersThanCurrent([6,5,4,8])
        XCTAssertEqual(value, [2,1,0,3])
    }
    
    func test2() {
        let value = solution.smallerNumbersThanCurrent([7,7,7,7])
        XCTAssertEqual(value, [0,0,0,0])
    }
}

Tests.defaultTestSuite.run()
