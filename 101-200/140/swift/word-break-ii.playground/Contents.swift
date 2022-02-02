import Foundation

// 140. Word Break II
// https://leetcode.com/problems/word-break-ii/

class Solution {
    private var memo: [String:[String]] = [:]
    private var words: [String] = []
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        var wChars: Set<Character> = []
        
        for w in wordDict { w.forEach { wChars.insert($0) } }
        
        self.words = wordDict
        
        guard Set<Character>(s).isSubset(of: wChars) else {
            return []
        }
        return dfs(s)
    }
    
    private func dfs(_ s: String) -> [String] {
        guard memo[s] == nil else { return memo[s]! }
        
        var arr: [String] = []
        
        guard !s.isEmpty else {
            arr.append("")
            return arr
        }
        
        for w in words where s.hasPrefix(w) {
            let subList = dfs(String(s[s.index(s.startIndex, offsetBy: w.count)...]))
            for s in subList { arr.append(w + (s.isEmpty ? "" : " ") + s) }
        }
        memo[s] = arr
        return arr
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.029 (0.031) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.wordBreak("catsanddog", ["cat","cats","and","sand","dog"])
        XCTAssertEqual(value.sorted(), ["cats and dog","cat sand dog"].sorted())
    }
    
    // Note that you are allowed to reuse a dictionary word.
    func test1() {
        let value = solution.wordBreak("pineapplepenapple", ["apple","pen","applepen","pine","pineapple"])
        XCTAssertEqual(value.sorted(), ["pine apple pen apple","pineapple pen apple","pine applepen apple"].sorted())
    }
    
    func test2() {
        let value = solution.wordBreak("catsandog", ["cats","dog","sand","and","cat"])
        XCTAssertEqual(value, [])
    }
}

Tests.defaultTestSuite.run()
