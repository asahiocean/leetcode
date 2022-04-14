import Foundation

// 30. Substring with Concatenation of All Words
// https://leetcode.com/problems/substring-with-concatenation-of-all-words/

class Solution {
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        guard !(s.isEmpty) || !(words.isEmpty) else { return [] }
        let lnwf = words[0].count, len = words.count * lnwf
        guard s.count >= len else { return [] }
        
        typealias Ch = Character
        let chars = [Ch](s)
        var dictW = [[Ch]:Int]()
        
        for w in words {
            let arr = w.map({$0})
            dictW[arr, default: 0] = (dictW[arr] ?? 0) + 1
        }
        
        var result = [Int]()
        
        for i in 0..<lnwf {
            var idx = i
            while idx <= (s.count - len) {
                var diff = (idx + len)
                var dict = [[Ch]:Int]()
                var equal = true
                while idx < diff {
                    let tmp = chars[(diff - lnwf)..<diff].map({$0})
                    dict[tmp] = (dict[tmp] ?? 0) + 1
                    if let chr = dict[tmp], chr > (dictW[tmp] ?? 0) {
                        equal = false
                        break
                    }
                    diff -= lnwf
                }
                if dict == dictW { result.append(idx) }
                equal ? (idx += lnwf) : (idx = diff)
            }
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.050 (0.052) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Substrings starting at index 0 and 9 are "barfoo" and "foobar" respectively.
    // The output order does not matter, returning [9,0] is fine too.
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
