import Foundation

// 67. Add Binary
// https://leetcode.com/problems/add-binary/

class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let arrA = Array(a), arrB = Array(b)
        var result = "", carry = 0, idx1 = arrA.count - 1, idx2 = arrB.count - 1
        
        while idx1 >= 0 || idx2 >= 0 || carry > 0 {
            var sum = carry
            idx1 >= 0 ? (sum += Int("\(arrA[idx1])")!, idx1 -= 1) : nil
            idx2 >= 0 ? (sum += Int("\(arrB[idx2])")!, idx2 -= 1) : nil
            result = "\(sum % 2)" + result
            carry = sum / 2
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.016 (0.018) seconds

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
