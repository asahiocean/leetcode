import Foundation

// 28. Implement strStr()
// https://leetcode.com/problems/implement-strstr/

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let nc = needle.count, hc = haystack.count
        if nc == 0 || haystack == needle { return 0 }
        
        guard hc >= nc else { return -1 }
        
        var hsi = haystack.startIndex
        for i in 0...(hc-nc) {
            let end = haystack.index(hsi, offsetBy: nc)
            if haystack[hsi..<end] == needle { return i }
            hsi = haystack.index(hsi, offsetBy: 1)
        }
        return -1
    }
}

// MARK: Tests

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
