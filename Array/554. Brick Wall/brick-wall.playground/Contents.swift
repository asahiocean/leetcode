import Foundation

// 554. Brick Wall
// https://leetcode.com/problems/brick-wall/

class Solution {
    func leastBricks(_ wall: [[Int]]) -> Int {
        var path = [Int:Int]()
        for row in wall {
            var index = 0
            for i in (0..<row.count-1) {
                index += row[i]
                path[index, default: 0] += 1
            }
        }
        let result = wall.count - path.reduce(0) { max($0, $1.1)}
        return result
    }
}

// MARK: - Test cases

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test1() {
        let value = solution.leastBricks([[1,2,2,1],[3,1,2],[1,3,2],[2,4],[3,1,2],[1,3,1,1]])
        XCTAssertEqual(value, 2)
    }
    func test2() {
        let value = solution.leastBricks([[1],[1],[1]])
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()
