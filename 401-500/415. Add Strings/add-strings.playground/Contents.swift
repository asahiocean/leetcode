import Foundation

// 415. Add Strings
// https://leetcode.com/problems/add-strings/

class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        
        let num1chars = [Character](num1.reversed())
        let num2chars = [Character](num2.reversed())
        
        var i = 0, j = 0, sum = 0, carry = 0
        var value: String = ""
        
        while i < num1chars.count || j < num2chars.count || carry != 0 {
            sum = carry
            
            if i < num1chars.count, num1chars[i].isNumber {
                sum += Int(String(num1chars[i]))!
                i += 1
            }
            if j < num2chars.count, num2chars[j].isNumber {
                sum += Int(String(num2chars[j]))!
                j += 1
            }
            
            carry = sum / 10
            sum = sum % 10
            
            value.append(String(sum))
        }
        
        return String(value.reversed())
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.addStrings("11", "123")
        XCTAssertEqual(value, "134")
    }
    
    func test1() {
        let value = solution.addStrings("456", "77")
        XCTAssertEqual(value, "533")
    }
    
    func test2() {
        let value = solution.addStrings("0", "0")
        XCTAssertEqual(value, "0")
    }
}

Tests.defaultTestSuite.run()
