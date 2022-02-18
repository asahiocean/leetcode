import Foundation

// 402. Remove K Digits
// https://leetcode.com/problems/remove-k-digits/

class Solution {
    func removeKdigits(_ num: String, _ k: Int) -> String {
        let zero: String = "0"
        guard num.count != k else { return zero }
        
        var stack = ""
        var count = 0
        
        for ch: Character in num {
            while !stack.isEmpty && stack.last! > ch && count < k {
                count += 1
                stack.removeLast()
            }
            stack.append(ch)
        }
        while count < k {
            stack.removeLast()
            count += 1
        }
        while !stack.isEmpty && stack.first! == Character(zero) {
            stack.removeFirst()
        }
        return stack.isEmpty ? zero : stack
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
    func test0() {
        let value = solution.removeKdigits("1432219", 3)
        XCTAssertEqual(value, "1219")
    }
    
    // Remove the leading 1 and the number is 200.
    // Note that the output must not contain leading zeroes.
    func test1() {
        let value = solution.removeKdigits("10200", 1)
        XCTAssertEqual(value, "200")
    }
    
    // Remove all the digits from the number and it is left with nothing which is 0.
    func test2() {
        let value = solution.removeKdigits("10", 2)
        XCTAssertEqual(value, "0")
    }
}

Tests.defaultTestSuite.run()
