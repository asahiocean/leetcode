import Foundation

// 134. Gas Station
// https://leetcode.com/problems/gas-station/

class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        
        let allgas = gas.reduce(0) { $0 + $1 }, allcost = cost.reduce(0) { $0 + $1 }
        guard allgas >= allcost else { return -1 }
        
        var value = 0, gasSum = 0, costSum = 0
        
        for (i, curr) in gas.enumerated() {
            gasSum += curr
            costSum += cost[i]
            if gasSum < costSum {
                value = i + 1
                gasSum = 0
                costSum = 0
            }
        }
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Start at station 3 (index 3) and fill up with 4 unit of gas. Your tank = 0 + 4 = 4
    // Travel to station 4. Your tank = 4 - 1 + 5 = 8
    // Travel to station 0. Your tank = 8 - 2 + 1 = 7
    // Travel to station 1. Your tank = 7 - 3 + 2 = 6
    // Travel to station 2. Your tank = 6 - 4 + 3 = 5
    // Travel to station 3. The cost is 5. Your gas is just enough to travel back to station 3.
    // Therefore, return 3 as the starting index.
    func test0() {
        let value = solution.canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2])
        XCTAssertEqual(value, 3)
    }
    
    // You can't start at station 0 or 1, as there is not enough gas to travel to the next station.
    // Let's start at station 2 and fill up with 4 unit of gas. Your tank = 0 + 4 = 4
    // Travel to station 0. Your tank = 4 - 3 + 2 = 3
    // Travel to station 1. Your tank = 3 - 3 + 3 = 3
    // You cannot travel back to station 2, as it requires 4 unit of gas but you only have 3.
    // Therefore, you can't travel around the circuit once no matter where you start.
    func test1() {
        let value = solution.canCompleteCircuit([2,3,4], [3,4,3])
        XCTAssertEqual(value, -1)
    }
}

Tests.defaultTestSuite.run()
