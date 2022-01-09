import Foundation

// 58. Length of Last Word
// https://leetcode.com/problems/length-of-last-word/

class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        guard let word = s.split(separator: " ").last else { return 0 }
        return word.count
    }
}

// MARK: - Test cases -

// Result: Executed 4 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The last word is "World" with length 5.
    func test0() {
        let value = solution.lengthOfLastWord("Hello World")
        XCTAssertEqual(value, 5)
    }
    
    // The last word is "moon" with length 4.
    func test1() {
        let value = solution.lengthOfLastWord("   fly me   to   the moon  ")
        XCTAssertEqual(value, 4)
    }
    
    // The last word is "joyboy" with length 6.
    func test2() {
        let value = solution.lengthOfLastWord("luffy is still joyboy")
        XCTAssertEqual(value, 6)
    }
    
    func test3() {
        let value = solution.lengthOfLastWord(" ")
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
