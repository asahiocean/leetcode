import Foundation

// 392. Is Subsequence
// https://leetcode.com/problems/is-subsequence/

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.isEmpty { return true }
        if t.isEmpty { return false }
        
        var arrS = Array(s), arrT = Array(t)
        
        var cnt = 0
        var less: Bool { cnt < t.count }
        
        while less && !arrS.isEmpty {
            while less && arrT[cnt] != arrS[0] { cnt += 1 }
            if less { arrS.removeFirst() }
            cnt += 1
        }
        return arrS.isEmpty
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
