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
        words.forEach {
            let arr = Array($0)
            wordDict[arr, default: 0] = (wordDict[arr] ?? 0) + 1
        }
        var result = Array<Int>()
        (0..<size).forEach {
            var l = $0
            while l <= (n - length) {
                var r = (l + length)
                var dict = [[Character]:Int]()
                var equal: Bool = true
                while l < r {
                    let temp = Array(chars[(r - size)..<r])
                    dict[temp] = (dict[temp] ?? 0) + 1
                    if dict[temp]! > (wordDict[temp] ?? 0) {
                        equal = false
                        break
                    }
                    r -= size
                }
                if equal {
                    if dict == wordDict { result.append(l) }
                    l += size
                } else {
                    l = r
                }
            }
        }
        return result
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.157 (0.160) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.findSubstring("barfoothefoobarman", ["foo","bar"])
        XCTAssertEqual(res, [0,9])
    }
    func test1() {
        let res = s.findSubstring("wordgoodgoodgoodbestword", ["word","good","best","word"])
        XCTAssertEqual(res, [])
    }
    func test2() {
        let res = s.findSubstring("barfoofoobarthefoobarman", ["bar","foo","the"])
        XCTAssertEqual(res, [6,9,12])
    }
}

Tests.defaultTestSuite.run()
