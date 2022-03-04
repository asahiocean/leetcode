import Foundation

// 1768. Merge Strings Alternately
// https://leetcode.com/problems/merge-strings-alternately/

class Solution {
    func mergeAlternately(_ word1: String, _ word2: String) -> String {
        let ln1 = word1.count, ln2 = word2.count
        let arr1 = Array(word1), arr2 = Array(word2)
        var res = ""
        for i in 0..<max(ln1, ln2) {
            if i < ln1 { res += "\(arr1[i])" }
            if i < ln2 { res += "\(arr2[i])" }
        }
        return res
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The merged string will be merged as so:
    // word1:  a   b   c
    // word2:    p   q   r
    // merged: a p b q c r
    func test0() {
        let value = solution.mergeAlternately("abc", "pqr")
        XCTAssertEqual(value, "apbqcr")
    }
    
    // Notice that as word2 is longer, "rs" is appended to the end.
    // word1:  a   b
    // word2:    p   q   r   s
    // merged: a p b q   r   s
    func test1() {
        let value = solution.mergeAlternately("ab", "pqrs")
        XCTAssertEqual(value, "apbqrs")
    }
    
    // Notice that as word1 is longer, "cd" is appended to the end.
    // word1:  a   b   c   d
    // word2:    p   q
    // merged: a p b q c   d
    func test2() {
        let value = solution.mergeAlternately("abcd", "pq")
        XCTAssertEqual(value, "apbqcd")
    }
}

Tests.defaultTestSuite.run()
