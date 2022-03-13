import Foundation

// 28. Implement strStr()
// https://leetcode.com/problems/implement-strstr/

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let lnH = haystack.count, lnN = needle.count
        if lnN == 0 || haystack == needle { return 0 }
        guard lnH >= lnN else { return -1 }
        
        var idxH = haystack.startIndex
        
        for i in 0...(lnH - lnN) {
            let idx = haystack.index(idxH, offsetBy: lnN)
            if haystack[idxH..<idx] == needle { return i }
            idxH = haystack.index(idxH, offsetBy: 1)
        }
        return -1
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.006 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.strStr("hello", "ll")
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.strStr("aaaaa", "bba")
        XCTAssertEqual(value, -1)
    }
    
    func test2() {
        let value = solution.strStr("", "")
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
