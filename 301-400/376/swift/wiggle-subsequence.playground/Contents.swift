import Foundation

// 376. Wiggle Subsequence
// https://leetcode.com/problems/wiggle-subsequence/

class Solution {
    private typealias WiggleSubseqLen = (down: Int, up: Int)
    func wiggleMaxLength(_ nums: [Int]) -> Int {
        let len = nums.count
        
        guard len > 1 else { return nums.count }
        
        var last: WiggleSubseqLen = (1,1)
        
        for idx in 1..<len {
            var temp = last
            let curr = nums[idx], prev = nums[idx - 1]
            switch true {
            case curr > prev: temp = (last.down, last.down + 1)
            case curr < prev: temp = (last.up + 1, last.up)
            default: break
            }
            last = temp
        }
        return max(last.down, last.up)
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.017 (0.019) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The entire sequence is a wiggle sequence with differences (6, -3, 5, -7, 3).
    func test0() {
        let value = solution.wiggleMaxLength([1,7,4,9,2,5])
        XCTAssertEqual(value, 6)
    }
    
    // There are several subsequences that achieve this length.
    // One is [1, 17, 10, 13, 10, 16, 8] with differences (16, -7, 3, -3, 6, -8).
    func test1() {
        let value = solution.wiggleMaxLength([1,17,5,10,13,15,10,5,16,8])
        XCTAssertEqual(value, 7)
    }
    
    func test2() {
        let value = solution.wiggleMaxLength([1,2,3,4,5,6,7,8,9])
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()
