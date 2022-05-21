import Foundation

// 322. Coin Change
// https://leetcode.com/problems/coin-change/

class Solution {
    func coinChange(_ coins: [Int], _ a: Int) -> Int {
        guard a > 0 else { return a == 0 ? 0 : -1 }
        
        var depth = 0, queue = [Int](), vis: Set<Int> = [a]
        
        for c in coins {
            guard a != c || a > c else { return 1 }
            queue.append(a - c)
        }
        
        while !queue.isEmpty {
            depth += 1
            for _ in 0..<queue.count {
                let tgt = queue.removeFirst()
                for c in coins {
                    let val = (tgt - c)
                    guard val != 0 else { return depth + 1 }
                    if val > 0 && !vis.contains(val) {
                        queue.append(val)
                        vis.insert(val)
                    }
                }
            }
        }
        return -1
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.022 (0.024) seconds

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
