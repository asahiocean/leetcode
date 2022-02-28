import Foundation

// 228. Summary Ranges
// https://leetcode.com/problems/summary-ranges/

class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        let len = nums.count
        guard len > 1 else { return nums.isEmpty ? [] : ["\(nums[0])"] }
        
        var result: [String] = []
        var idx = 0, next = 1
        
        func addStr(_ i: Int) {
            let numStr = "\(nums[i])"
            result.append((next - 1 - i == 0) ? numStr : (numStr + "->\(nums[next-1])"))
        }
        
        while next < len {
            while next < len && nums[next] - nums[next-1] == 1 {
                next += 1
            }
            addStr(idx)
            idx = next
            next += 1
        }
        if idx < len { addStr(idx) }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The ranges are:
    // [0,2] --> "0->2"
    // [4,5] --> "4->5"
    // [7,7] --> "7"
    func test0() {
        let value = solution.summaryRanges([0,1,2,4,5,7])
        XCTAssertEqual(value, ["0->2","4->5","7"])
    }
    
    // The ranges are:
    // [0,0] --> "0"
    // [2,4] --> "2->4"
    // [6,6] --> "6"
    // [8,9] --> "8->9"
    func test1() {
        let value = solution.summaryRanges([0,2,3,4,6,8,9])
        XCTAssertEqual(value, ["0","2->4","6","8->9"])
    }
}

Tests.defaultTestSuite.run()
