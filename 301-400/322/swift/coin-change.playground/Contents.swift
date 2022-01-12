import Foundation

// 322. Coin Change
// https://leetcode.com/problems/coin-change/

class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else { return amount == 0 ? 0 : -1 }
        
        var queue: [Int] = []
        var visited: Set<Int> = []
        
        visited.insert(amount)
        
        for c in coins {
            guard amount != c else { return 1 }
            if amount > c { queue.append(amount - c) }
        }
        
        guard !queue.isEmpty else { return -1 }
        
        var depth = 0
        
        while !queue.isEmpty {
            depth += 1
            for _ in 0..<queue.count {
                let target = queue.removeFirst()
                for c in coins {
                    let next = (target - c)
                    guard next != 0 else { return depth + 1 }
                    if next > 0 && !visited.contains(next) {
                        visited.insert(next)
                        queue.append(next)
                    }
                }
            }
        }
        return -1
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.031 (0.033) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // 11 = 5 + 5 + 1
    func test0() {
        let value = solution.coinChange([1,2,5], 11)
        XCTAssertEqual(value, 3)
    }
    
    func test1() {
        let value = solution.coinChange([2], 3)
        XCTAssertEqual(value, -1)
    }
    
    func test2() {
        let value = solution.coinChange([1], 0)
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
