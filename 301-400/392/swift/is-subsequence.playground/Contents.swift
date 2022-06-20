import Foundation

// 392. Is Subsequence
// https://leetcode.com/problems/is-subsequence/

class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        var ars = Array(s)
        for c in t where c == ars.first { ars.removeFirst() }
        return ars.isEmpty
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

class Tests {
    
    private typealias sol = Solution
    
    static func test1() {
        let val = sol().isSubsequence("abc", "ahbgdc")
        print(val == true)
    }
    
    static func test2() {
        let val = sol().isSubsequence("axc", "ahbgdc")
        print(val == false)
    }
}

Tests.test1()
Tests.test2()
