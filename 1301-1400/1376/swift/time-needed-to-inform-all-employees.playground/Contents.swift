import Foundation

// 1376. Time Needed to Inform All Employees
// https://leetcode.com/problems/time-needed-to-inform-all-employees/

class Solution {
    func numOfMinutes(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
        var tree: [Int:[Int]] = [:], maxTime = Int.min
        for i in 0..<n {
            let mngr = manager[i]
            if tree[mngr] == nil {
                tree[mngr] = [i]
            } else {
                tree[mngr]?.append(i)
            }
        }
        func dfs(_ mngr: Int, _ t: Int) {
            guard let ees = tree[mngr] else {
                maxTime = max(t, maxTime)
                return
            }
            for e in ees { dfs(e, (t + informTime[mngr])) }
        }
        dfs(headID, 0)
        return maxTime
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The head of the company is the only employee in the company.
    func test0() {
        let value = solution.numOfMinutes(1, 0, [-1], [0])
        XCTAssertEqual(value, 0)
    }
    
    // The head of the company with id = 2 is the direct manager of all the employees
    // in the company and needs 1 minute to inform them all.
    // The tree structure of the employees in the company is shown.
    func test1() {
        let value = solution.numOfMinutes(6, 2, [2,2,-1,2,2,2], [0,0,1,0,0,0])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
