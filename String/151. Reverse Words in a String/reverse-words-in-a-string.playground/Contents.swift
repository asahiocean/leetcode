import Foundation

// 151. Reverse Words in a String
// https://leetcode.com/problems/reverse-words-in-a-string/

class Solution {
    func reverseWords(_ s: String) -> String {
        let reversed = s.split(separator: " ").reversed()
        return reversed.joined(separator: " ")
    }
}

// MARK: - Test cases -

// Result: Executed 5 tests, with 0 failures (0 unexpected) in 0.012 (0.015) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.reverseWords("the sky is blue")
        XCTAssertEqual(value, "blue is sky the")
    }
    
    func test1() {
        let value = solution.reverseWords("  hello world  ")
        XCTAssertEqual(value, "world hello")
    }
    
    func test2() {
        let value = solution.reverseWords("a good   example")
        XCTAssertEqual(value, "example good a")
    }
    
    func test3() {
        let value = solution.reverseWords("  Bob    Loves  Alice   ")
        XCTAssertEqual(value, "Alice Loves Bob")
    }
    
    func test4() {
        let value = solution.reverseWords("Alice does not even like bob")
        XCTAssertEqual(value, "bob like even not does Alice")
    }
}

Tests.defaultTestSuite.run()
