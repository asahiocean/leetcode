import Foundation

// 1345. Jump Game IV
// https://leetcode.com/problems/jump-game-iv/

class Solution {
    func minJumps(_ arr: [Int]) -> Int {
        let len = arr.count
        guard len > 1 else { return 0 }
        
        var map: [Int:[Int]] = [:]
        
        for i in 0..<len {
            map[arr[i], default: [0]].append(i)
        }
        
        var queue: [Int] = []
        queue.append(0)
        
        var visited: Set<Int> = []
        var steps = 0
        
        while !queue.isEmpty {
            var jumps: [Int] = []
            
            for n in queue {
                guard n != len - 1 else { return steps }
                
                for ch in (map[arr[n]] ?? []) where !visited.contains(ch) {
                    visited.insert(ch)
                    jumps.append(ch)
                }
                
                map.removeValue(forKey: arr[n])
                
                if n + 1 < len, !visited.contains(n + 1) {
                    visited.insert(n + 1)
                    jumps.append(n + 1)
                }
                
                if n - 1 >= 0, !visited.contains(n - 1) {
                    visited.insert(n - 1)
                    jumps.append(n - 1)
                }
            }
            
            queue = jumps
            steps += 1
        }
        return -1
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.036 (0.039) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // You need three jumps from index 0 --> 4 --> 3 --> 9. Note that index 9 is the last index of the array.
    func test0() {
        let value = solution.minJumps([100,-23,-23,404,100,23,23,23,3,404])
        XCTAssertEqual(value, 3)
    }
    
    // Start index is the last index. You do not need to jump.
    func test1() {
        let value = solution.minJumps([7])
        XCTAssertEqual(value, 0)
    }
    
    // You can jump directly from index 0 to index 7 which is last index of the array.
    func test2() {
        let value = solution.minJumps([7,6,9,6,9,6,9,7])
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
