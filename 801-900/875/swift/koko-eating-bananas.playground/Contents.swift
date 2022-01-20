import Foundation

// 875. Koko Eating Bananas
// https://leetcode.com/problems/koko-eating-bananas/

class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        
        let map = piles.map({$0 - 1})
        var left = 1, right = piles.max()!
        
        func valid(_ b: Int) ->  Bool {
            var hours = 0
            for p in map { hours += (p / b) + 1 }
            return hours <= h
        }
        
        while left < right {
            let mid = left + (right - left) >> 1
            valid(mid) ? (right = mid) : (left = mid + 1)
        }
        return left
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.minEatingSpeed([3,6,7,11], 8)
        XCTAssertEqual(value, 4)
    }
    
    func test1() {
        let value = solution.minEatingSpeed([30,11,23,4,20], 5)
        XCTAssertEqual(value, 30)
    }
    
    func test2() {
        let value = solution.minEatingSpeed([30,11,23,4,20], 6)
        XCTAssertEqual(value, 23)
    }
}

Tests.defaultTestSuite.run()
