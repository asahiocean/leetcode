import Foundation

// 66. Plus One
// https://leetcode.com/problems/plus-one/

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var offset = 1, result = digits
        for i in stride(from: digits.count - 1, through: 0, by: -1) {
            result[i] += offset
            offset = result[i] / 10
            result[i] %= 10
        }
        if offset > 0 { result.insert(offset, at: 0) }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /*
        The array represents the integer 123.
        Incrementing by one gives 123 + 1 = 124.
        Thus, the result should be [1,2,4].
    */
    func test0() {
        let res = solution.plusOne([1,2,3])
        XCTAssertEqual(res, [1,2,4])
    }
    
    /*
        The array represents the integer 4321.
        Incrementing by one gives 4321 + 1 = 4322.
        Thus, the result should be [4,3,2,2].
    */
    func test1() {
        let res = solution.plusOne([4,3,2,1])
        XCTAssertEqual(res, [4,3,2,2])
    }
    
    /*
        The array represents the integer 9.
        Incrementing by one gives 9 + 1 = 10.
        Thus, the result should be [1,0].
    */
    func test2() {
        let res = solution.plusOne([0])
        XCTAssertEqual(res, [1])
    }
}

Tests.defaultTestSuite.run()
