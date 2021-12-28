import Foundation

// 1267. Count Servers that Communicate
// https://leetcode.com/problems/count-servers-that-communicate

class Solution {
    func countServers(_ grid: [[Int]]) -> Int {
        
        var rows = Array(repeating: 0, count: grid.count)
        var cols = Array(repeating: 0, count: grid[0].count)
        var servers = 0
        
        for i in 0..<grid.count {
            for j in 0..<grid[0].count where grid[i][j] == 1 {
                rows[i] += 1
                cols[j] += 1
                servers += 1
            }
        }
        
        for i in 0..<grid.count {
            for j in 0..<grid[0].count where grid[i][j] == 1 && rows[i] == 1 && cols[j] == 1 {
                servers -= 1
            }
        }
        return servers
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.007 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.countServers([[1,0],[0,1]])
        XCTAssertEqual(value, 0)
    }
    func test1() {
        let value = solution.countServers([[1,0],[1,1]])
        XCTAssertEqual(value, 3)
    }
    func test2() {
        let value = solution.countServers([[1,1,0,0],[0,0,1,0],[0,0,1,0],[0,0,0,1]])
        XCTAssertEqual(value, 4)
    }
}

Tests.defaultTestSuite.run()
