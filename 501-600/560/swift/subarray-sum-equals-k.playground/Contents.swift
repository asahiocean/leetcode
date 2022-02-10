import Foundation

// 560. Subarray Sum Equals K
// https://leetcode.com/problems/subarray-sum-equals-k/

class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var prefSum: [Int:Int] = [:]
        prefSum[0] = 1
        
        var sum = 0, value = 0
        
        for i in 0..<nums.count {
            sum += nums[i]
            let prev = prefSum[sum-k]
            value += prev != nil ? prev! : 0
            prefSum[sum] = (prefSum[sum] ?? 0) + 1
        }
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.subarraySum([1,1,1], 2)
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.subarraySum([1,2,3], 3)
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()
