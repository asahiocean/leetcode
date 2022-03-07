import Foundation

// 1356. Sort Integers by The Number of 1 Bits
// https://leetcode.com/problems/sort-integers-by-the-number-of-1-bits/

class Solution {
    func sortByBits(_ arr: [Int]) -> [Int] {
        return arr.sorted {
            let non = ($0.nonzeroBitCount, $1.nonzeroBitCount)
            return non.0 == non.1 ? $0 < $1 : non.0 < non.1
        }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.026 (0.028) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /*
        [0] is the only integer with 0 bits.
        [1,2,4,8] all have 1 bit.
        [3,5,6] have 2 bits.
        [7] has 3 bits.
        The sorted array by bits is [0,1,2,4,8,3,5,6,7]
     */
    func test0() {
        let value = solution.sortByBits([0,1,2,3,4,5,6,7,8])
        XCTAssertEqual(value, [0,1,2,4,8,3,5,6,7])
    }
    
    // All integers have 1 bit in the binary representation,
    // you should just sort them in ascending order.
    func test1() {
        let value = solution.sortByBits([1024,512,256,128,64,32,16,8,4,2,1])
        XCTAssertEqual(value, [1,2,4,8,16,32,64,128,256,512,1024])
    }
}

Tests.defaultTestSuite.run()
