import Foundation

// https://leetcode.com/problems/word-break

class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let l = s.count, set = Set<String>(wordDict)
        let maxWL = set.reduce(0, { max($0, $1.count) })
        let chars = [Character](s)
        
        var dp: [Bool] = Array(repeating: false, count: l + 1)
        dp[0] = true
        
        for k in 0..<s.count {
            if !dp[k] { continue }
            for i in k+1...(min(l, k+1+maxWL)) {
                let sub = String(Array(chars[k..<i]))
                if set.contains(sub) { dp[i] = true }
            }
        }
        
        return dp[l]
    }
}

// MARK: - Tests

import XCTest

//      Executed 3 tests, with 0 failures (0 unexpected) in 0.407 (0.409) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test1() {
        let res = s.wordBreak("leetcode", ["leet","code"])
        XCTAssertEqual(res, true)
    }
    func test2() {
        let res = s.wordBreak("applepenapple", ["apple","pen"])
        XCTAssertEqual(res, true)
    }
    func test3() {
        let res = s.wordBreak("catsandog", ["cats","dog","sand","and","cat"])
        XCTAssertEqual(res, false)
    }
}

Tests.defaultTestSuite.run()
