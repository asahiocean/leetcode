import Foundation

// 220. Contains Duplicate III
// https://leetcode.com/problems/contains-duplicate-iii/

class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        guard k > 0, nums.count > 1 else { return false }
        let range = 0 ..< nums.count, ids = [Int](range).sorted{ nums[$0] < nums[$1] }
        
        for i in range {
            for j in (i + 1) ..< nums.count {
                if (nums[ids[j]] - nums[ids[i]]) > t { break }
                if abs(ids[j] - ids[i]) <= k { return true }
            }
        }
        return false
    }
}

// MARK: - Test Cases -

import XCTest

// Executed 1 test, with 0 failures (0 unexpected) in 0.004 (0.005) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test() {
        XCTAssertEqual(s.containsNearbyAlmostDuplicate([1,2,3,1], 3, 0), true)
    }
}

Tests.defaultTestSuite.run()
