import Foundation

// 207. Course Schedule
// https://leetcode.com/problems/course-schedule/

class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        guard !prerequisites.isEmpty else { return true }
        
        var graph = [[Int]](repeating: [], count: numCourses)
        var studied: Set<Int> = []
        var inDegree = [Int](repeating: 0, count: numCourses)
        
        for pr in prerequisites {
            graph[pr[1]].append(pr[0])
            inDegree[pr[0]] += 1
        }
        
        var queue: [Int] = []
        
        for i in 0..<numCourses where inDegree[i] == 0 {
            queue.append(i)
        }
        
        while !queue.isEmpty {
            let n = queue.removeFirst()
            studied.insert(n)
            for e in 0..<graph[n].count {
                let k = graph[n][e]
                inDegree[k] -= 1
                if inDegree[k] == 0 { queue.append(k) }
            }
        }
        return numCourses == studied.count
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // There are a total of 2 courses to take.
    // To take course 1 you should have finished course 0. So it is possible.
    func test0() {
        let value = solution.canFinish(2, [[1,0]])
        XCTAssertEqual(value, true)
    }
    
    // There are a total of 2 courses to take.
    // To take course 1 you should have finished course 0, and to take course 0 you should also have finished course 1. So it is impossible.
    func test1() {
        let value = solution.canFinish(2, [[1,0],[0,1]])
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
