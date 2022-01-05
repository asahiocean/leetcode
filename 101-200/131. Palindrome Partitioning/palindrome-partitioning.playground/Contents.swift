import Foundation

// 131. Palindrome Partitioning
// https://leetcode.com/problems/palindrome-partitioning/

class Solution {
    func partition(_ s: String) -> [[String]] {
        guard s.count > 1 else { return [[s]] }
        var path: [String] = [], paths: [[String]] = []
        dfs(&paths, &path, Array(s), 0)
        return paths
    }
    
    private func dfs(_ paths: inout [[String]], _ path: inout [String], _ s: [Character], _ idx: Int) {
        guard idx != s.count else { paths.append(Array(path)); return }
        
        for i in idx..<s.count {
            let curr = String(s[idx...i])
            if isPalindrome(curr) {
                path.append(curr)
                dfs(&paths, &path, s, i + 1)
                path.removeLast()
            }
        }
    }
    private func isPalindrome(_ s: String) -> Bool {
        guard s.count > 1 else { return true }
        let len = s.count, chars = [Character](s)
        for i in 0..<len >> 1 where chars[i] != chars[len - 1 - i] {
            return false
        }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.032 (0.035) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.partition("aab")
        XCTAssertEqual(value, [["a","a","b"],["aa","b"]])
    }
    
    func test1() {
        let value = solution.partition("a")
        XCTAssertEqual(value, [["a"]])
    }
}

Tests.defaultTestSuite.run()
