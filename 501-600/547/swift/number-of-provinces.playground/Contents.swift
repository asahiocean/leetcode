import Foundation

// 547. Number of Provinces
// https://leetcode.com/problems/number-of-provinces/

class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        guard !isConnected.isEmpty else { return 0 }
        
        let len = isConnected.count
        var visited = [Bool](repeating: false, count: len)
        var num = 0
        
        for n in 0..<len where !visited[n] {
            num += 1
            visited[n] = true
            
            var queue = [n]
            
            while !queue.isEmpty {
                let city = queue.removeFirst()
                for j in 0..<len where !visited[j] && isConnected[city][j] == 1 {
                    visited[j] = true
                    queue.append(j)
                }
            }
        }
        return num
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.findCircleNum([[1,1,0],[1,1,0],[0,0,1]])
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.findCircleNum([[1,0,0],[0,1,0],[0,0,1]])
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()
