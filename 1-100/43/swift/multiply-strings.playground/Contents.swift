import Foundation

// 43. Multiply Strings
// https://leetcode.com/problems/multiply-strings/

class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        
        var arr = Array(repeating: 0, count: num1.count + num2.count)
        var result = ""
        
        for (i1,n1) in num1.reversed().enumerated() where n1.isNumber {
            for (i2,n2) in num2.reversed().enumerated() where n2.isNumber {
                arr[i1 + i2] += Int(String(n1))! * Int(String(n2))!
            }
        }
        for i in arr.indices {
            let n = arr[i]
            arr[i] = n % 10
            if i < arr.count - 1 { arr[i+1] += (n / 10) }
            result = String(arr[i]) + result
        }
        while !result.isEmpty && result.first == "0" {
            result.removeFirst()
        }
        return result.isEmpty ? "0" : result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.multiply("2", "3")
        XCTAssertEqual(value, "6")
    }
    
    func test1() {
        let value = solution.multiply("123", "456")
        XCTAssertEqual(value, "56088")
    }
}

Tests.defaultTestSuite.run()
