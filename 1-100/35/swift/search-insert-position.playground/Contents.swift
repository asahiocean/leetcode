import Foundation

// 35. Search Insert Position
// https://leetcode.com/problems/search-insert-position/

class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        
        var count = 0, idx = (nums.count - 1)
        
        while count <= idx {
            let n = count + ((idx - count) / 2)
            switch nums[n] {
            case let val where val < target:
                count = n + 1
            case let val where val > target:
                idx = n - 1
            default:
                return n
            }
        }
        return count
    }
}

// MARK: - Test cases -

// Result: Executed 5 tests, with 0 failuvalue (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    private let nums = [1,3,5,6]
    
    /* Example 1 */
    func test0() {
        let value = solution.searchInsert(nums, 5)
        XCTAssertEqual(value, 2)
    }
    
    /* Example 2 */
    func test1() {
        let value = solution.searchInsert(nums, 2)
        XCTAssertEqual(value, 1)
    }
    
    /* Example 3 */
    func test2() {
        let value = solution.searchInsert(nums, 7)
        XCTAssertEqual(value, 4)
    }
    
    func test3() {
        let value = solution.searchInsert(nums, 0)
        XCTAssertEqual(value, 0)
    }
    
    func test4() {
        let value = solution.searchInsert([1], 0)
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
