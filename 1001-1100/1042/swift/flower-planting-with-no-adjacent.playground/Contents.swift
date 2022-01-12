import Foundation

// 1042. Flower Planting With No Adjacent
// https://leetcode.com/problems/flower-planting-with-no-adjacent/

class Solution {
    func gardenNoAdj(_ n: Int, _ paths: [[Int]]) -> [Int] {
        
        guard n > 4 else { return [Int](1...n) }
        
        var graph = [[Int]](repeating: [Int](), count: n + 1)
        
        for p in paths {
            graph[p[0]].append(p[1])
            graph[p[1]].append(p[0])
        }
        
        var result = [Int](repeating: 0, count: n + 1)
        
        for i in 1...n {
            var colour = [Bool](repeating: false, count: 4)
            for gard in graph[i] where result[gard] != 0 {
                colour[result[gard] - 1] = true
            }
            
            for j in 0..<4 where colour[j] == false {
                result[i] = j + 1
                break
            }
        }
        result.removeFirst()
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Gardens 1 and 2 have different types.
    // Gardens 2 and 3 have different types.
    // Gardens 3 and 1 have different types.
    // Hence, [1,2,3] is a valid answer. Other valid answers include [1,2,4], [1,4,2], and [3,2,1].
    func test0() {
        let value = solution.gardenNoAdj(3, [[1,2],[2,3],[3,1]])
        XCTAssertEqual(value, [1,2,3])
    }
    
    func test() {
        let value = solution.gardenNoAdj(4, [[1,2],[2,3],[3,4],[4,1],[1,3],[2,4]])
        XCTAssertEqual(value, [1,2,3,4])
    }
}

Tests.defaultTestSuite.run()
