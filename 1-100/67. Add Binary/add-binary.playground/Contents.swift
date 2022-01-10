import Foundation

// 67. Add Binary
// https://leetcode.com/problems/add-binary/

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let arrA = Array(a), lenA = arrA.count, arrB = Array(b), lenB = arrB.count
        var result = "", carry = 0, i = (lenA - 1), j = (lenB - 1)
        
        while i >= 0 || j >= 0 || carry > 0 {
            var sum = carry
            i >= 0 ? (sum += Int("\(arrA[i])")!, i -= 1) : nil
            j >= 0 ? (sum += Int("\(arrB[j])")!, j -= 1) : nil
            result = "\(sum % 2)" + result
            carry = sum / 2
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.034 (0.036) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.addBinary("11", "1")
        XCTAssertEqual(value, "100")
    }
    
    func test1() {
        let value = solution.addBinary("1010", "1011")
        XCTAssertEqual(value, "10101")
    }
}

Tests.defaultTestSuite.run()
