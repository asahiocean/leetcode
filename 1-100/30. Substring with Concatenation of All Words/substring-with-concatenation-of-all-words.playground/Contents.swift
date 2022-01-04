import Foundation

// 30. Substring with Concatenation of All Words
// https://leetcode.com/problems/substring-with-concatenation-of-all-words/

class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        guard !(s.isEmpty) || !(words.isEmpty) else { return [] }
        
        let n = s.count, chars = Array(s)
        let size = words[0].count, length = words.count * size
        
        guard n >= length else { return [] }
        
        var wordDict = [[Character]:Int]()
        
        for word in words {
            let arr: [Character] = word.map({$0})
            wordDict[arr, default: 0] = (wordDict[arr] ?? 0) + 1
        }
        
        var result = [Int]()
        
        for i in 0..<size {
            var val = i
            while val <= (n - length) {
                var r = (val + length)
                var dict = [[Character]:Int]()
                var equal: Bool = true
                while val < r {
                    let temp: [Character] = chars[(r - size)..<r].map({$0})
                    dict[temp] = (dict[temp] ?? 0) + 1
                    if let char = dict[temp], char > (wordDict[temp] ?? 0) {
                        equal = false
                        break
                    }
                    r -= size
                }
                if dict == wordDict { result.append(val) }
                if equal { val += size } else { val = r }
            }
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.157 (0.160) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// Substrings starting at index 0 and 9 are "barfoo" and "foobar" respectively.
    /// The output order does not matter, returning [9,0] is fine too.
    func test0() {
        let value = solution.findSubstring("barfoothefoobarman", ["foo","bar"])
        XCTAssertEqual(value, [0,9])
    }
    
    func test1() {
        let value = solution.findSubstring("wordgoodgoodgoodbestword", ["word","good","best","word"])
        XCTAssertEqual(value, [])
    }
    
    func test2() {
        let value = solution.findSubstring("barfoofoobarthefoobarman", ["bar","foo","the"])
        XCTAssertEqual(value, [6,9,12])
    }
}

Tests.defaultTestSuite.run()
