import UIKit

// 739. Daily Temperatures
// https://leetcode.com/problems/daily-temperatures/

class Solution {
    func dailyTemperatures(_ t: [Int]) -> [Int] {
        var arr = [Int](repeating: 0, count: t.count)
        for i in stride(from: t.count - 2, through: 0, by: -1) {
            var val = i + 1
            while (arr[val] != 0 && t[i] >= t[val]) {
                val += arr[val]
            }
            if (t[i] < t[val]) { arr[i] = val - i }
        }
        return arr
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.dailyTemperatures([73,74,75,71,69,72,76,73])
        XCTAssertEqual(value, [1,1,4,2,1,1,0,0])
    }
    
    func test1() {
        let value = solution.dailyTemperatures([30,40,50,60])
        XCTAssertEqual(value, [1,1,1,0])
    }
    
    func test2() {
        let value = solution.dailyTemperatures([30,60,90])
        XCTAssertEqual(value, [1,1,0])
    }
}

Tests.defaultTestSuite.run()
