import Foundation

// 67. Add Binary
// https://leetcode.com/problems/add-binary/

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let a = Array(a), al = a.count, b = Array(b), bl = b.count
        var result = "", carry = 0, i = (al - 1), j = (bl - 1)
        
        while i >= 0 || j >= 0 || carry > 0 {
            var sum = carry
            i >= 0 ? (sum += Int("\(a[i])")!, i -= 1) : nil
            j >= 0 ? (sum += Int("\(b[j])")!, j -= 1) : nil
            result = "\(sum % 2)" + result
            carry = sum / 2
        }
        return result
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.034 (0.036) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.addBinary("11", "1")
        XCTAssertEqual(res, "100")
    }
    func test1() {
        let res = s.addBinary("1010", "1011")
        XCTAssertEqual(res, "10101")
    }
}

Tests.defaultTestSuite.run()
