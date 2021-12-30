import Foundation

// 448. Find All Numbers Disappeared in an Array
// https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/

class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var numsCopy: [Int] = nums
        var result: [Int] = [Int]()
        
        for i in numsCopy.indices {
            let ind = abs(numsCopy[i]) - 1
            if numsCopy[ind] > 0 { numsCopy[ind] = -numsCopy[ind] }
        }
        
        for i in 0..<numsCopy.count where numsCopy[i] > 0 {
            result.append(i + 1)
        }
        return result
    }
}

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.findDisappearedNumbers([4,3,2,7,8,2,3,1])
        XCTAssertEqual(value, [5,6])
    }
}

Tests.defaultTestSuite.run()
