import Foundation

// 43. Multiply Strings
// https://leetcode.com/problems/multiply-strings/

class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        
        let num1rev = num1.reversed(), num2rev = num2.reversed()
        
        var arr: [Int] = [Int](repeating: 0, count: num1rev.count + num2rev.count)
        var result: String = ""
        
        for (i,ch1) in num1rev.enumerated() where ch1.isNumber {
            for (j, ch2) in num2rev.enumerated() where ch2.isNumber {
                let val = Int("\(ch1)")! * Int("\(ch2)")!
                arr[i + j] += val
            }
        }
        
        for i in arr.indices {
            let n = arr[i]
            arr[i] = n % 10
            if i < arr.count - 1 { arr[i + 1] += n / 10 }
            result = "\(arr[i])" + result
        }
        
        while !result.isEmpty && result.first == "0" { result.removeFirst() }
        
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
