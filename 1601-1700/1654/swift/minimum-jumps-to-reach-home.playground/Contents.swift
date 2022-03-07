import Foundation

// 1654. Minimum Jumps to Reach Home
// https://leetcode.com/problems/minimum-jumps-to-reach-home/

class Solution {
    func minimumJumps(_ forbidden: [Int], _ a: Int, _ b: Int, _ x: Int) -> Int {
        guard x > 0 else { return 0 }
        let lenMax = 2000 + 2 * max(a, b) + 1
        
        typealias Jump = (Int, Bool)
        var queue: [Jump] = [(0, true)]
        
        var lands = Array(repeating: [Bool](repeating: true, count: 2), count: lenMax)
        var step = 1, result = -1
        
        for i in forbidden {
            lands[i][0] = false
            lands[i][1] = false
        }
        
        while !queue.isEmpty {
            var nextQueue: [Jump] = []
            for (i, canBack) in queue {
                let stepUp = i + a, stepBck = i - b
                if stepUp == x || canBack && stepBck == x {
                    result = step
                    break
                }
                if stepUp < lenMax && lands[stepUp][0] {
                    lands[stepUp][0] = false
                    nextQueue.append((stepUp, true))
                }
                if canBack && stepBck > 0 && lands[stepBck][1] {
                    lands[stepBck][1] = false
                    nextQueue.append((stepBck, false))
                }
            }
            queue = nextQueue
            step += 1
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.508 (0.510) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // 3 jumps forward (0 -> 3 -> 6 -> 9) will get the bug home.
    func test0() {
        let value = solution.minimumJumps([14,4,18,1,15], 3, 15, 9)
        XCTAssertEqual(value, 3)
    }
    
    func test1() {
        let value = solution.minimumJumps([8,3,16,6,12,20], 15, 13, 11)
        XCTAssertEqual(value, -1)
    }
    
    // One jump forward (0 -> 16) then one jump backward (16 -> 7) will get the bug home.
    func test2() {
        let value = solution.minimumJumps([1,6,2,14,5,17,4], 16, 9, 7)
        XCTAssertEqual(value, 2)
    }
}

Tests.defaultTestSuite.run()
