import Foundation

// 784. Letter Case Permutation
// https://leetcode.com/problems/letter-case-permutation/

class Solution {
    func letterCasePermutation(_ s: String) -> [String] {
        guard !s.isEmpty else { return [] }
        
        let chars = [Character](s)
        var permutes: [[Character]] = [chars]
        
        for i in chars.indices where chars[i].isLetter {
            for n in 0..<permutes.count {
                var chars = permutes[n]
                chars[i] = Character(chars[i].isUppercase ? chars[i].lowercased() : chars[i].uppercased())
                permutes.append(chars)
            }
        }
        return permutes.map({String($0)}).sorted(by: >)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.letterCasePermutation("a1b2")
        XCTAssertEqual(value, ["a1b2","a1B2","A1b2","A1B2"])
    }
    
    func test1() {
        let value = solution.letterCasePermutation("3z4")
        XCTAssertEqual(value, ["3z4","3Z4"])
    }
}

Tests.defaultTestSuite.run()
