import Foundation

// 482. License Key Formatting
// https://leetcode.com/problems/license-key-formatting/

class Solution {
    func licenseKeyFormatting(_ s: String, _ k: Int) -> String {
        let chars = [Character](s.uppercased()).filter{$0 != "-"}
        let l = chars.count
        if chars.isEmpty { return "" }
        if l < k { return String(chars) }
        if k == 1 {
            var res = chars.reduce("", { $0 + "-\($1)"})
            res.removeFirst()
            return res
        }
        
        var result = ""
        func add(f: Int = 0, _ end: Int) { result += String(chars[f..<end]) + "-" }
        var start  = l % k
        if start != 0 { add(start) }
        while start < l {
            add(f: start, start + k)
            start += k
        }
        result.removeLast()
        return result
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.017 (0.019) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.licenseKeyFormatting("5F3Z-2e-9-w", 4)
        XCTAssertEqual(res, "5F3Z-2E9W")
    }
    func test1() {
        let res = s.licenseKeyFormatting("2-5g-3-J", 2)
        XCTAssertEqual(res, "2-5G-3J")
    }
}

Tests.defaultTestSuite.run()
