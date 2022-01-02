import Foundation

// 1010. Pairs of Songs With Total Durations Divisible by 60
// https://leetcode.com/problems/pairs-of-songs-with-total-durations-divisible-by-60/

class Solution {
    private let div: Int = 60
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var result: Int = 0
        var count = [Int](repeating: 0, count: div)
        time.forEach {
            result += count[(div - ($0 % div)) % div]
            count[$0 % div] += 1
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// Three pairs have a total duration divisible by 60:
    /// (time[0] = 30, time[2] = 150): total duration 180
    /// (time[1] = 20, time[3] = 100): total duration 120
    /// (time[1] = 20, time[4] = 40): total duration 60
    func test0() {
        let value = solution.numPairsDivisibleBy60([30,20,150,100,40])
        XCTAssertEqual(value, 3)
    }
    
    /// All three pairs have a total duration of 120, which is divisible by 60.
    func test1() {
        let value = solution.numPairsDivisibleBy60([60,60,60])
        XCTAssertEqual(value, 3)
    }
}

Tests.defaultTestSuite.run()
