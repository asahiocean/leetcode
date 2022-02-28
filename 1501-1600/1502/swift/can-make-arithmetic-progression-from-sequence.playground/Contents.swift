import Foundation

// 1502. Can Make Arithmetic Progression From Sequence
// https://leetcode.com/problems/can-make-arithmetic-progression-from-sequence/

class Solution {
    func canMakeArithmeticProgression(_ arr: [Int]) -> Bool {
        let sort = arr.sorted()
        let dist = sort[1] - sort[0]
        for i in 1..<sort.count where dist != sort[i] - sort[i-1] {
            return false
        }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // We can reorder the elements as [1,3,5] or [5,3,1] with
    // differences 2 and -2 respectively, between each consecutive elements.
    func test0() {
        let value = solution.canMakeArithmeticProgression([3,5,1])
        XCTAssertEqual(value, true)
    }
    
    // There is no way to reorder the elements to obtain an arithmetic progression.
    func test1() {
        let value = solution.canMakeArithmeticProgression([1,2,4])
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
