import Foundation

// 1029. Two City Scheduling
// https://leetcode.com/problems/two-city-scheduling/

class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        let sort = costs.sorted{($0[0] - $0[1]) <= ($1[0] - $1[1])}
        var val = 0
        for i in 0..<sort.count {
            val += sort[i][i < sort.count / 2 ? 0 : 1]
        }
        return val
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.014 (0.016) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /*
     The first person goes to city A for a cost of 10.
     The second person goes to city A for a cost of 30.
     The third person goes to city B for a cost of 50.
     The fourth person goes to city B for a cost of 20.
     
     The total minimum cost is 10 + 30 + 50 + 20 = 110 to have half the people interviewing in each city.
     */
    func test0() {
        let value = solution.twoCitySchedCost([[10,20],[30,200],[400,50],[30,20]])
        XCTAssertEqual(value, 110)
    }
    
    func test1() {
        let value = solution.twoCitySchedCost([[259,770],[448,54],[926,667],[184,139],[840,118],[577,469]])
        XCTAssertEqual(value, 1859)
    }
    
    func test2() {
        let value = solution.twoCitySchedCost([[515,563],[451,713],[537,709],[343,819],[855,779],[457,60],[650,359],[631,42]])
        XCTAssertEqual(value, 3086)
    }
}

Tests.defaultTestSuite.run()
