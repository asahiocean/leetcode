import Foundation

// 532. K-diff Pairs in an Array
// https://leetcode.com/problems/k-diff-pairs-in-an-array/

class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        guard k >= 0 else { return 0 }
        
        var set: Set<Int> = []
        var exist: Set<Int> = []
        var count = 0
        
        for n in nums {
            if k != 0 {
                guard !set.contains(n) else { continue }
                if set.contains(n + k) { count += 1 }
                if set.contains(n - k) { count += 1 }
                set.insert(n)
            } else {
                if set.contains(n) {
                    count += 1
                    set.remove(n)
                    exist.insert(n)
                }
                if !exist.contains(n) { set.insert(n) }
            }
        }
        return count
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // There are two 2-diff pairs in the array, (1, 3) and (3, 5).
    // Although we have two 1s in the input, we should only return the number of unique pairs.
    func test0() {
        let value = solution.findPairs([3,1,4,1,5], 2)
        XCTAssertEqual(value, 2)
    }
    
    // There are four 1-diff pairs in the array, (1, 2), (2, 3), (3, 4) and (4, 5).
    func test1() {
        let value = solution.findPairs([1,2,3,4,5], 1)
        XCTAssertEqual(value, 4)
    }
    
    // There is one 0-diff pair in the array, (1, 1).
    func test2() {
        let value = solution.findPairs([1,3,1,5,4], 0)
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
