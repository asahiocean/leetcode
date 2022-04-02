import Foundation

// 1385. Find the Distance Value Between Two Arrays
// https://leetcode.com/problems/find-the-distance-value-between-two-arrays/

class Solution {
    func findTheDistanceValue(_ arr1: [Int], _ arr2: [Int], _ d: Int) -> Int {
        var val = 0, exist: [Int:Bool] = [:]
        for a in arr2 {
            for b in (a - d)...(a + d) {
                exist[b] = false
            }
        }
        for n in arr1 where exist[n] == nil {
            val += 1
        }
        return val
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.findTheDistanceValue([4,5,8],[10,9,1,8],2)
        XCTAssertEqual(value, 2)
    }
    
    func test1() {
        let value = solution.findTheDistanceValue([1,4,2,3], [-4,-3,6,10,20,30], 3)
        XCTAssertEqual(value, 2)
    }
    
    func test2() {
        let value = solution.findTheDistanceValue([2,1,100,3], [-5,-2,10,-3,7], 6)
        XCTAssertEqual(value, 1)
    }
}

Tests.defaultTestSuite.run()
