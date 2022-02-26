import Foundation

// 1281. Subtract the Product and Sum of Digits of an Integer
// https://leetcode.com/problems/subtract-the-product-and-sum-of-digits-of-an-integer/

class Solution {
    func subtractProductAndSum(_ n: Int) -> Int {
        guard n >= 1 else { return 0 }
        
        var num = n, products: [Int] = []
        
        while num > 0 {
            products.insert(num % 10, at: 0)
            num /= 10
        }
        return products.reduce(1, *) - products.reduce(0, +)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Product of digits = 2 * 3 * 4 = 24
    // Sum of digits = 2 + 3 + 4 = 9
    // Result = 24 - 9 = 15
    func test0() {
        let value = solution.subtractProductAndSum(234)
        XCTAssertEqual(value, 15)
    }
    
    // Product of digits = 4 * 4 * 2 * 1 = 32
    // Sum of digits = 4 + 4 + 2 + 1 = 11
    // Result = 32 - 11 = 21
    func test1() {
        let value = solution.subtractProductAndSum(4421)
        XCTAssertEqual(value, 21)
    }
}

Tests.defaultTestSuite.run()
