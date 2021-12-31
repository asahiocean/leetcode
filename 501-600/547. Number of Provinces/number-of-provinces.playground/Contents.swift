import Foundation

// 547. Number of Provinces
// https://leetcode.com/problems/number-of-provinces/

class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        guard !isConnected.isEmpty else { return 0 }
        
        let count = isConnected.count
        var visited = Array(repeating: false, count: count)
        var provinces = 0
        
        for n in 0..<count {
            guard !visited[n] else { continue }
            
            provinces += 1
            visited[n] = true
            
            var queue: [Int] = []
            queue.append(n)
            
            while !queue.isEmpty {
                let city = queue.removeFirst()
                for j in 0..<count where !visited[j] && isConnected[city][j] == 1 {
                    visited[j] = true
                    queue.append(j)
                }
            }
        }
        return provinces
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
