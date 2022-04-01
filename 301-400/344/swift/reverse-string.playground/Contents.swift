import Foundation

// 344. Reverse String
// https://leetcode.com/problems/reverse-string/

class Solution {
    func reverseString(_ s: inout [Character]) {
        s = s.reversed()
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    private typealias Ch = Character
    
    func test0() {
        var arr = ["h","e","l","l","o"] as [Ch]
        solution.reverseString(&arr)
        XCTAssertEqual(arr, ["o","l","l","e","h"])
    }
    
    func test1() {
        var arr = ["H","a","n","n","a","h"] as [Ch]
        solution.reverseString(&arr)
        XCTAssertEqual(arr, ["h","a","n","n","a","H"])
    }
}

Tests.defaultTestSuite.run()
