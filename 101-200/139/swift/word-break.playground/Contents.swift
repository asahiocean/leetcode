import Foundation

// 139. Word Break
// https://leetcode.com/problems/word-break/

class Solution {
    func wordBreak(_ s: String, _ wd: [String]) -> Bool {
        guard !s.isEmpty else { return false }
        let len = s.count, wdset = Set(wd)
        let arrS = Array(s), maxw = wdset.reduce(0, { max($0, $1.count) })
        
        var dp = [Bool](repeating: false, count: len + 1)
        dp[0] = true
        
        for a in 0..<len where dp[a] {
            for b in a + 1...(min(len, a + 1 + maxw)) where wdset.contains(String(arrS[a..<b])) {
                dp[b] = true
            }
        }
        return dp[len]
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.016 (0.018) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Return true because "leetcode" can be segmented as "leet code".
    func test0() {
        let value = solution.wordBreak("leetcode", ["leet","code"])
        XCTAssertEqual(value, true)
    }
    
    // Return true because "applepenapple" can be segmented as "apple pen apple".
    // Note that you are allowed to reuse a dictionary word.
    func test1() {
        let value = solution.wordBreak("applepenapple", ["apple","pen"])
        XCTAssertEqual(value, true)
    }
    
    func test2() {
        let value = solution.wordBreak("catsandog", ["cats","dog","sand","and","cat"])
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
