import Foundation

// 149. Max Points on a Line
// https://leetcode.com/problems/max-points-on-a-line/

class Solution {
    
    private struct Point { let x: Int, y: Int }
    
    func maxPoints(_ points: [[Int]]) -> Int {
        let count = points.count
        guard count >= 1 && count <= 300 else { return count }
        
        let points: [Point] = points.map({ Point(x: $0[0], y: $0[1]) })
        let sort = points.sorted { $0.x == $1.x ? ($0.y < $1.y) : ($0.x < $1.x) }
        
        var value = 0
        
        for idxStart in 0..<count {
            
            let start = sort[idxStart]
            var idxEnd = idxStart + 1
            
            while idxEnd < count {
                let dx = sort[idxEnd].x - start.x
                let dy = sort[idxEnd].y - start.y
                
                var pointsCount = [dx,dy].count
                
                var idx = idxEnd + 1
                while idx < count {
                    if (sort[idx].x - start.x) * dy == (sort[idx].y - start.y) * dx {
                        pointsCount += 1
                    }
                    idx += 1
                }
                value = max(value, pointsCount)
                idxEnd += 1
            }
        }
        return value
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.036 (0.038) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.maxPoints([[1,1],[2,2],[3,3]])
        XCTAssertEqual(value, 3)
    }
    
    func test1() {
        let value = solution.maxPoints([[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]])
        XCTAssertEqual(value, 4)
    }
}

Tests.defaultTestSuite.run()
