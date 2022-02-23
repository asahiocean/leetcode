import Foundation

// 132. Palindrome Partitioning II
// https://leetcode.com/problems/palindrome-partitioning-ii/

class Solution {
    func minCut(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        
        let lenStr = s.count, arr = Array(s)
        
        var palindromes = [[Bool]](repeating: [Bool](repeating: false, count: lenStr), count: lenStr)
        
        for n in 0..<lenStr {
            for i in 0...n where arr[i] == arr[n] && (n - i < 2 || palindromes[i+1][n-1]) {
                palindromes[i][n] = true
            }
        }
        
        var cuts = [Int](0..<lenStr)
        
        for a in stride(from: 1, to: lenStr, by: 1) {
            if palindromes[0][a] {
                cuts[a] = 0
            } else {
                for b in 0..<a where palindromes[b + 1][a] {
                    cuts[a] = min(cuts[b] + 1, cuts[a])
                }
            }
        }
        return cuts[lenStr - 1]
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.023 (0.025) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The palindrome partitioning ["aa","b"] could be produced using 1 cut.
    func test0() {
        let value = solution.minCut("aab")
        XCTAssertEqual(value, 1)
    }
    
    func test1() {
        let value = solution.minCut("a")
        XCTAssertEqual(value, 0)
    }
    
    func test2() {
        let value = solution.minCut("ab")
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
