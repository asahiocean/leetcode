import Foundation

// 150. Evaluate Reverse Polish Notation
// https://leetcode.com/problems/evaluate-reverse-polish-notation/

class Solution {
    func evalRPN(_ tokens: [String]) -> Int {
        let opers: Set<String> = ["*","+","/","-"]
        var stack: [Int] = []
        for t in tokens {
            if opers.contains(t) {
                let num1 = stack.removeLast()
                let idx = stack.count - 1
                switch t {
                case "*": stack[idx] *= num1
                case "-": stack[idx] -= num1
                case "+": stack[idx] += num1
                case "/": stack[idx] /= num1
                default: break
                }
                continue
            }
            if let token = Int(t) { stack.append(token) }
        }
        return stack[0]
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.015 (0.017) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // ((2 + 1) * 3) = 9
    func test0() {
        let value = solution.evalRPN(["2","1","+","3","*"])
        XCTAssertEqual(value, 9)
    }
    
    // (4 + (13 / 5)) = 6
    func test1() {
        let value = solution.evalRPN(["4","13","5","/","+"])
        XCTAssertEqual(value, 6)
    }
    
    /*
        ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
        = ((10 * (6 / (12 * -11))) + 17) + 5
        = ((10 * (6 / -132)) + 17) + 5
        = ((10 * 0) + 17) + 5
        = (0 + 17) + 5
        = 17 + 5
        = 22
    */
    func test2() {
        let value = solution.evalRPN(["10","6","9","3","+","-11","*","/","*","17","+","5","+"])
        XCTAssertEqual(value, 22)
    }
}

Tests.defaultTestSuite.run()
