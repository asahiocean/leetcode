import Foundation

// 934. Shortest Bridge
// https://leetcode.com/problems/shortest-bridge/

class Solution {
    func shortestBridge(_ grid: [[Int]]) -> Int {
        guard !grid.isEmpty else { return 0 }
        let len = grid.count
        
        var island: Set<[Int]> = [], visited = island
        let dir = (x: [0,0,-1,1], y: [1,-1,0,0])
        
        func valid(_ x: Int, _ y: Int) -> Bool {
            return (x >= 0 && x < len) && (y >= 0  && y < len)
        }
        
        func bfsGetIsland(_ x: Int, _ y: Int) {
            var ones: [[Int]] = [[x,y]]
            while !ones.isEmpty {
                for _ in 0..<ones.count {
                    let pos = ones.removeFirst()
                    for i in 0...3 {
                        let nxt = (x: pos[0] + dir.x[i], y: pos[1] + dir.y[i])
                        let nxtp = [nxt.x,nxt.y]
                        guard valid(nxt.x, nxt.y) && !visited.contains(nxtp) else { continue }
                        if grid[nxt.x][nxt.y] == 1 {
                            visited.insert(nxtp)
                            island.insert(nxtp)
                            ones.append(nxtp)
                        }
                    }
                }
            }
        }
        
        for x in 0..<len where island.isEmpty {
            for y in 0..<len where grid[x][y] == 1 && island.isEmpty {
                let pos = [x,y]
                visited.insert(pos)
                island.insert(pos)
                bfsGetIsland(x, y)
                break
            }
        }
        
        visited = Set<[Int]>(island)
        
        func bfsShortBridge() -> Int {
            var nodes = [[Int]](island)
            var depth = 0
            while !nodes.isEmpty {
                depth += 1
                for _ in 0..<nodes.count {
                    let pos = nodes.removeFirst()
                    for i in 0...3 {
                        let nxt = (x: pos[0] + dir.x[i], y: pos[1] + dir.y[i])
                        let nxtp = [nxt.x, nxt.y]
                        guard valid(nxt.x, nxt.y) && !visited.contains(nxtp) else { continue }
                        if grid[nxt.x][nxt.y] == 1 { return depth - 1 }
                        visited.insert(nxtp)
                        nodes.append(nxtp)
                    }
                }
            }
            return 0
        }
        return bfsShortBridge()
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.030 (0.032) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.shortestBridge([[0,1],
                                             [1,0]])
        XCTAssertEqual(value, 1)
    }
    
    func test1() {
        let value = solution.shortestBridge([[0,1,0],
                                             [0,0,0],
                                             [0,0,1]])
        XCTAssertEqual(value, 2)
    }
    
    func test2() {
        let value = solution.shortestBridge([[1,1,1,1,1],
                                             [1,0,0,0,1],
                                             [1,0,1,0,1],
                                             [1,0,0,0,1],
                                             [1,1,1,1,1]])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
