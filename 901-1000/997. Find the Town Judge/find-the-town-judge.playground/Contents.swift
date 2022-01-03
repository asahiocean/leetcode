import Foundation

// 997. Find the Town Judge
// https://leetcode.com/problems/find-the-town-judge/

class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        
        guard !(trust.isEmpty) else { return n == 1 ? 1 : -1 }
        
        var map: [Int:Set<Int>] = [:] // trust hash
        var nojudges: Set<Int> = []
        var judge = -1
        
        for arr in trust {
            map[arr[1], default: []].insert(arr[0])
            nojudges.insert(arr[0])
            if map[arr[1]]!.count == n - 1 { judge = arr[1] }
        }
        
        return !nojudges.contains(judge) ? judge : -1
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.findJudge(2, [[1,2]])
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.findJudge(3, [[1,3],[2,3]])
        XCTAssertEqual(value, 3)
    }
    
    func test2() {
        let value = solution.findJudge(3, [[1,3],[2,3],[3,1]])
        XCTAssertEqual(value, -1)
    }
}

Tests.defaultTestSuite.run()
