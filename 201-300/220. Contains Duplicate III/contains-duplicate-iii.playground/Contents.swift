import Foundation

// 220. Contains Duplicate III
// https://leetcode.com/problems/contains-duplicate-iii/

class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        guard !nums.isEmpty else { return false }
        let ids = [Int](0..<nums.count).sorted{ nums[$0] < nums[$1] }
        
        for a in 0...ids.count - 1 {
            for b in (a + 1)..<nums.count {
                let lhs = ids[a], rhs = ids[b]
                if nums[rhs] - nums[lhs] > t { break }
                if abs(rhs - lhs) <= k { return true }
            }
        }
        return false
    }
}

// MARK: - Test Cases -

// Result: Executed 1 test, with 0 failures (0 unexpected) in 0.004 (0.005) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test() {
        XCTAssertEqual(solution.containsNearbyAlmostDuplicate([1,2,3,1], 3, 0), true)
    }
}

Tests.defaultTestSuite.run()
