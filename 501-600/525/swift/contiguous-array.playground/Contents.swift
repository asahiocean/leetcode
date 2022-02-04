import Foundation

// 525. Contiguous Array
// https://leetcode.com/problems/contiguous-array/

class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        
        var cnt = 0, result = 0
        var firstIndex: [Int:Int] = [:]
        firstIndex[0] = -1
        
        for i in 0..<nums.count {
            cnt += nums[i] == 1 ? 1 : -1
            if let idx = firstIndex[cnt] {
                result = max(result, i - idx)
            } else {
                firstIndex[cnt] = i
            }
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // [0, 1] is the longest contiguous subarray with an equal number of 0 and 1.
    func test0() {
        let value = solution.findMaxLength([0,1])
        XCTAssertEqual(value, 2)
    }
    
    // [0, 1] (or [1, 0]) is a longest contiguous subarray with equal number of 0 and 1.
    func test1() {
        let value = solution.findMaxLength([0,1,0])
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()
