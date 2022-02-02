import Foundation

// 135. Candy
// https://leetcode.com/problems/candy/

class Solution {
    func candy(_ ratings: [Int]) -> Int {
        let len = ratings.count
        guard len > 1 else { return len }
        
        var value = 0
        
        var lhs2rhs = [Int](repeating: 1, count: len)
        var rhs2lhs = [Int](repeating: 1, count: len)
        
        for i in 1..<len where ratings[i] > ratings[i - 1] {
            lhs2rhs[i] = lhs2rhs[i - 1] + 1
        }
        for i in (0..<(len - 1)).reversed() where ratings[i] > ratings[i + 1] {
            rhs2lhs[i] = rhs2lhs[ i + 1] + 1
        }
        for i in 0..<len {
            value += max(lhs2rhs[i], rhs2lhs[i])
        }
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // You can allocate to the first, second and third child with 2, 1, 2 candies respectively.
    func test0() {
        let value = solution.candy([1,0,2])
        XCTAssertEqual(value, 5)
    }
    
    // You can allocate to the first, second and third child with 1, 2, 1 candies respectively.
    // The third child gets 1 candy because it satisfies the above two conditions.
    func test1() {
        let value = solution.candy([1,2,2])
        XCTAssertEqual(value, 4)
    }
}

Tests.defaultTestSuite.run()
