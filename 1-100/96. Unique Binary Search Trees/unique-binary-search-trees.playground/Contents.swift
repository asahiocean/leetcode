import Foundation

// 96. Unique Binary Search Trees
// https://leetcode.com/problems/unique-binary-search-trees/

class Solution {
    func numTrees(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        
        var arr = [Int](repeating: 0, count: n + 1)
        arr[0] = 1
        arr[1] = 1
        
        for i in 2...n where n >= 2 {
            for j in 0..<i {
                arr[i] += arr[j] * arr[i - 1 - j]
            }
        }
        return arr[n]
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.numTrees(3)
        XCTAssertEqual(value, 5)
    }
    
    func test1() {
        let value = solution.numTrees(1)
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
