import Foundation

// 451. Sort Characters By Frequency
// https://leetcode.com/problems/sort-characters-by-frequency/

class Solution {
    func frequencySort(_ s: String) -> String {
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 128)
        
        for (i, _) in dp.enumerated() { dp[i][0] = i }
        
        for (_,ch) in s.enumerated() {
            if let ascii: UInt8 = ch.asciiValue {
                let val = Int(ascii)
                dp[val][1] += 1
            }
        }
        
        dp.sort { $0[1] > $1[1] }
        
        var value = ""
        
        for i in dp {
            let str = String(Character(UnicodeScalar(i[0])!))
            for _ in 0..<i[1] { value += str }
        }
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.031 (0.033) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // 'e' appears twice while 'r' and 't' both appear once.
    // So 'e' must appear before both 'r' and 't'. Therefore "eetr" is also a valid answer.
    func test0() {
        let value = solution.frequencySort("tree")
        XCTAssertEqual(value, "eert")
    }
    
    // Both 'c' and 'a' appear three times, so both "cccaaa" and "aaaccc" are valid answers.
    // Note that "cacaca" is incorrect, as the same characters must be together.
    func test1() {
        let value = solution.frequencySort("cccaaa")
        XCTAssertEqual(value, "aaaccc")
    }
}

Tests.defaultTestSuite.run()
