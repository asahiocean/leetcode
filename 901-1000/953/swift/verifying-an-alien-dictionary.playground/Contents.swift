import Foundation

// 953. Verifying an Alien Dictionary
// https://leetcode.com/problems/verifying-an-alien-dictionary/

class Solution {
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        let arrOrd = Array(order)
        var word = words[0]
        func fidx(_ str: String, _ i: Int) -> Int {
            return arrOrd.firstIndex(of: Array(str)[i]) ?? 0
        }
        for i in 1..<words.count {
            let nextWord = words[i], len = (cur: word.count, next: nextWord.count)
            let minLn = min(len.cur, len.next)
            for n in 0..<minLn {
                let curr = fidx(word, n), next = fidx(nextWord, n)
                if next > curr { break }
                if next < curr || (n == minLn - 1 && len.cur > len.next) { return false }
            }
            word = nextWord
        }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // As 'h' comes before 'l' in this language, then the sequence is sorted.
    func test0() {
        let value = solution.isAlienSorted(["hello","leetcode"],
                                            "hlabcdefgijkmnopqrstuvwxyz")
        XCTAssertEqual(value, true)
    }
    
    // As 'd' comes after 'l' in this language, then words[0] > words[1],
    // hence the sequence is unsorted.
    func test1() {
        let value = solution.isAlienSorted(["word","world","row"],
                                            "worldabcefghijkmnpqstuvxyz")
        XCTAssertEqual(value, false)
    }
    
    // The first three characters "app" match, and the second string is shorter (in size.)
    // According to lexicographical rules "apple" > "app", because 'l' > '∅', where '∅' is
    // defined as the blank character which is less than any other character (More info).
    func test2() {
        let value = solution.isAlienSorted(["apple","app"],
                                            "abcdefghijklmnopqrstuvwxyz")
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
