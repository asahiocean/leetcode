import Foundation

// 139. Word Break
// https://leetcode.com/problems/word-break/

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        
        let len = s.count, wdset = Set(wordDict)
        
        let maxWL = wdset.reduce(0, { max($0, $1.count) })
        let chars = [Character](s)
        
        var dp = [Bool](repeating: false, count: len + 1)
        dp[0] = true
        
        for k in 0..<len where dp[k] {
            let nxtK = k + 1
            for i in nxtK...(min(len, nxtK + maxWL)) where wdset.contains(String(chars[k..<i])) {
                dp[i] = true
            }
        }
        
        return dp[len]
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.026 (0.029) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.wordBreak("leetcode", ["leet","code"])
        XCTAssertEqual(value, true)
    }
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
