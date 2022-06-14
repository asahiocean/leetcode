import Foundation

// 583. Delete Operation for Two Strings
// https://leetcode.com/problems/delete-operation-for-two-strings/

class Solution {
    func minDistance(_ w1: String, _ w2: String) -> Int {
        guard !w1.isEmpty, !w2.isEmpty, w1 != w2 else { return 0 }
        let ln1 = w1.count, ln2 = w2.count, arr1 = Array(w1), arr2 = Array(w2)
        var dp = Array(repeating: Array(repeating: 0, count: ln2 + 1), count: ln1 + 1)
        
        for a in 1...ln1 {
            for b in 1...ln2 {
                dp[a][b] = max(dp[a][b], arr1[a-1] == arr2[b-1] ? max(dp[a][b], 1 + dp[a-1][b-1]) : max(dp[a-1][b], dp[a][b-1]))
            }
        }
        return ln1 + ln2 - dp[ln1][ln2] * 2
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.018 (0.020) seconds

class Tests {
    
    private typealias sol = Solution
    
    // You need one step to make "sea" to "ea" and another step to make "eat" to "ea".
    static func test0() {
        let value = sol().minDistance("sea", "eat")
        print(value == 2)
    }
    
    static func test1() {
        let value = sol().minDistance("leetcode", "etco")
        print(value == 4)
    }
}

Tests.test0()
Tests.test1()
