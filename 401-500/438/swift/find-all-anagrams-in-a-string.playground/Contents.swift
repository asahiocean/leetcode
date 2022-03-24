import Foundation

// 438. Find All Anagrams in a String
// https://leetcode.com/problems/find-all-anagrams-in-a-string/

class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        
        let lnS = s.count, lnP = p.count
        let arrS = Array(s), arrP = Array(p)
        
        guard lnS >= lnP else { return [] }
        
        var chs1 = [Int](repeating: 0, count: 26)
        var chs2 = chs1
        
        for c in arrP { chs2[diff(c, "a")] += 1 }
        
        var lhs = 0, rhs = 0, result: [Int] = []
        
        while rhs < lnS {
            chs1[diff(arrS[rhs], "a")] += 1
            if rhs - lhs == lnP - 1 {
                if valid(chs1, chs2) { result.append(lhs) }
                chs1[diff(arrS[lhs], "a")] -= 1
                lhs += 1
            }
            rhs += 1
        }
        return result
    }
    private func diff(_ a: Character, _ b: Character) -> Int {
        return Int(a.asciiValue! - b.asciiValue!)
    }
    private func valid(_ lhs: [Int], _ rhs: [Int]) -> Bool {
        for i in lhs.indices where lhs[i] != rhs[i] { return false }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The substring with start index = 0 is "cba", which is an anagram of "abc".
    // The substring with start index = 6 is "bac", which is an anagram of "abc".
    func test0() {
        let value = solution.findAnagrams("cbaebabacd", "abc")
        XCTAssertEqual(value, [0,6])
    }
    
    // The substring with start index = 0 is "ab", which is an anagram of "ab".
    // The substring with start index = 1 is "ba", which is an anagram of "ab".
    // The substring with start index = 2 is "ab", which is an anagram of "ab".
    func test1() {
        let value = solution.findAnagrams("abab", "ab")
        XCTAssertEqual(value, [0,1,2])
    }
}

Tests.defaultTestSuite.run()
