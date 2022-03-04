import Foundation

// 1319. Number of Operations to Make Network Connected
// https://leetcode.com/problems/number-of-operations-to-make-network-connected/

class Solution {
    func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
        let len = connections.count
        guard len >= n - 1 else { return -1 }
        
        var arr: [Int] = []
        var num = n
        for i in 0..<n { arr.append(i) }
        
        func find(_ n: Int) -> Int {
            var idx = n
            while idx != arr[idx] {
                idx = arr[idx]
            }
            return idx
        }
        
        func union(_ p: Int, _ q: Int) {
            let idP = find(p), idQ = find(q)
            guard idP != idQ else { return }
            arr[idP] = idQ
            num -= 1
        }
        for i in 0..<len {
            let elem = connections[i]
            union(elem[0], elem[1])
        }
        return num - 1
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.016 (0.018) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // Remove cable between computer 1 and 2 and place between computers 1 and 3.
    func test0() {
        let value = solution.makeConnected(4, [[0,1],[0,2],[1,2]])
        XCTAssertEqual(value, 1)
    }
    
    func test1() {
        let value = solution.makeConnected(6, [[0,1],[0,2],[0,3],[1,2],[1,3]])
        XCTAssertEqual(value, 2)
    }
    
    // There are not enough cables.
    func test2() {
        let value = solution.makeConnected(6, [[0,1],[0,2],[0,3],[1,2]])
        XCTAssertEqual(value, -1)
    }
}

Tests.defaultTestSuite.run()
