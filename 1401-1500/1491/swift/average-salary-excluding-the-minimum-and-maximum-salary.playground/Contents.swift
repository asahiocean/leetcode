import Foundation

// 1491. Average Salary Excluding the Minimum and Maximum Salary
// https://leetcode.com/problems/average-salary-excluding-the-minimum-and-maximum-salary/

class Solution {
    func average(_ salary: [Int]) -> Double {
        var sortAsc = salary.sorted(by: >)
        sortAsc.removeFirst() // min
        sortAsc.removeLast() // max
        return Double(sortAsc.reduce(0, +)) / Double(sortAsc.count)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Minimum salary and maximum salary are 1000 and 4000 respectively.
    // Average salary excluding minimum and maximum salary is (2000+3000) / 2 = 2500
    func test0() {
        let value = solution.average([4000,3000,1000,2000])
        XCTAssertEqual(value, 2500.00000)
    }
    
    // Minimum salary and maximum salary are 1000 and 3000 respectively.
    // Average salary excluding minimum and maximum salary is (2000) / 1 = 2000
    func test1() {
        let value = solution.average([1000,2000,3000])
        XCTAssertEqual(value, 2000.00000)
    }
}

Tests.defaultTestSuite.run()
