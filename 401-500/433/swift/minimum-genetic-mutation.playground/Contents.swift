import Foundation

// 433. Minimum Genetic Mutation
// https://leetcode.com/problems/minimum-genetic-mutation/

class Solution {
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        guard bank.contains(end) else { return -1 }
        
        let chStart = Array(start), chEnd = Array(end)
        let chBank = bank.map({Array($0)})
        
        var visited = [chStart], queue = [chStart], depth = 0
        
        while !queue.isEmpty {
            depth += 1
            var nextLvl: [[Character]] = []
            for q in queue {
                for b in chBank where !visited.contains(b) {
                    var cnt = 0
                    for i in 0..<8 where b[i] != q[i] { cnt += 1 }
                    guard cnt == 1 else { continue }
                    guard b != chEnd else { return depth }
                    visited.append(b)
                    nextLvl.append(b)
                }
            }
            queue = nextLvl
        }
        return -1
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.027 (0.029) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.minMutation("AACCGGTT", "AACCGGTA", ["AACCGGTA"])
        XCTAssertEqual(value, 1)
    }
    
    func test1() {
        let value = solution.minMutation("AACCGGTT", "AAACGGTA", ["AACCGGTA","AACCGCTA","AAACGGTA"])
        XCTAssertEqual(value, 2)
    }
    
    func test2() {
        let value = solution.minMutation("AAAAACCC", "AACCCCCC", ["AAAACCCC","AAACCCCC","AACCCCCC"])
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()
