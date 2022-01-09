import Foundation

// 481. Magical String
// https://leetcode.com/problems/magical-string/

class Solution {
    func magicalString(_ n: Int) -> Int {
        if n == 0 { return 0 }
        
        var queue = [1,2,2], num = 2
        
        while queue.count < n {
            let val = queue.last == 1 ? 2 : 1
            func add() { queue.append(val) }
            if queue[num] == 1 { add() } else { add(); add() }
            num += 1
        }
        if queue.count > n { queue.removeLast() }
        return queue.reduce(0, { $1 == 1 ? $0 + 1 : $0 })
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test1() {
        let value = solution.magicalString(6)
        XCTAssertEqual(value, 3)
    }
    
    func test2() {
        let value = solution.magicalString(3)
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
