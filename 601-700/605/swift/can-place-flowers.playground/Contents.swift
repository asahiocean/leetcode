import Foundation

// 605. Can Place Flowers
// https://leetcode.com/problems/can-place-flowers/

class Solution {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var flowerbed = flowerbed
        var placed = 0
        
        for (idx, plot) in flowerbed.enumerated() where plot != 1 {
            let prevIdx = (idx - 1), nextIdx = (idx + 1)
            if prevIdx >= 0, flowerbed[prevIdx] != 0 { continue }
            if nextIdx < flowerbed.count, flowerbed[nextIdx] != 0 { continue }
            flowerbed[idx] = 1
            placed += 1
        }
        return placed >= n
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.009 (0.011) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.canPlaceFlowers([1,0,0,0,1], 1)
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.canPlaceFlowers([1,0,0,0,1], 2)
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
