import Foundation

// 60. Permutation Sequence
// https://leetcode.com/problems/permutation-sequence/

class Solution {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var numbers = [Int](1...n)
        var k = k, factorial = 1, diff = n - 1, result = ""
        
        for i in 1..<n { factorial *= i }
        
        for _ in 0..<n {
            for (i, num) in numbers.enumerated() {
                if k > factorial {
                    k -= factorial
                } else {
                    result += String(num)
                    numbers.remove(at: i)
                    break
                }
            }
            if diff > 1 {
                factorial /= diff
                diff -= 1
            }
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.getPermutation(3, 3)
        XCTAssertEqual(value, "213")
    }
    
    func test1() {
        let value = solution.getPermutation(4, 9)
        XCTAssertEqual(value, "2314")
    }
    
    func test2() {
        let value = solution.getPermutation(3, 1)
        XCTAssertEqual(value, "123")
    }
}

Tests.defaultTestSuite.run()
