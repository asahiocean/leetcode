import Foundation

// 1291. Sequential Digits
// https://leetcode.com/problems/sequential-digits/

class Solution {
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        var result: [Int] = []
        guard low >= 10 && high >= low && high <= Int(10e8) else { return result }
        
        for n in 1...9 { backtracking(low, high, n, 1, &result) }
        
        return result.sorted()
    }
    
    private func backtracking(_ l: Int, _ h: Int, _ n: Int, _ c: Int, _ res: inout [Int]) {
        if n > h { return }
        if n >= l && n <= h { res.append(n) }
        let rsd = (n % 10 + 1) // residue
        if rsd <= 9 { backtracking(l, h, (n * 10) + rsd, c + 1, &res) }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.016 (0.018) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.sequentialDigits(100, 300)
        XCTAssertEqual(value, [123,234])
    }
    
    func test1() {
        let value = solution.sequentialDigits(1000, 13000)
        XCTAssertEqual(value, [1234,2345,3456,4567,5678,6789,12345])
    }
}

Tests.defaultTestSuite.run()
