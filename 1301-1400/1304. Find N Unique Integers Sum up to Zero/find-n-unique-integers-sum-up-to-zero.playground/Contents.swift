import Foundation

// 1304. Find N Unique Integers Sum up to Zero
// https://leetcode.com/problems/find-n-unique-integers-sum-up-to-zero/

class Solution {
    func sumZero(_ n: Int) -> [Int] {
        if n <= 1 && 1000 >= n { return [0] }
        var sum = [Int](repeating: 0, count: n)
        for i in 1...(n >> 1) {
            sum[i-1] = i
            sum[n-i] = -i
        }
        return sum
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.sumZero(5)
        XCTAssertEqual(value, [1,2,0,-2,-1])
    }
    
    func test1() {
        let value = solution.sumZero(3)
        XCTAssertEqual(value, [1,0,-1])
    }
    
    func test2() {
        let value = solution.sumZero(1)
        XCTAssertEqual(value, [0])
    }
}

Tests.defaultTestSuite.run()
