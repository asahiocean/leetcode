import Foundation

// 392. Is Subsequence
// https://leetcode.com/problems/is-subsequence/

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.isEmpty { return true }
        if t.isEmpty { return false }
        
        var subArr = [Character](s)
        let strArr = [Character](t)
        
        let strSize = strArr.count
        
        var val = 0
        
        while val < strSize && !subArr.isEmpty {
            while val < strSize && strArr[val] != subArr[0] {
                val += 1
            }
            if val < strSize { subArr.removeFirst() }
            val += 1
        }
        
        return subArr.isEmpty
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.isSubsequence("abc", "ahbgdc")
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.isSubsequence("axc", "ahbgdc")
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
