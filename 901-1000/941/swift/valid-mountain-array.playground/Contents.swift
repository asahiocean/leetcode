import Foundation

// 941. Valid Mountain Array
// https://leetcode.com/problems/valid-mountain-array/

class Solution {
    func validMountainArray(_ arr: [Int]) -> Bool {
        
        let len = arr.count
        guard len > 2 else { return false }
        
        var inc = 1
        
        while inc < len && arr[inc] > arr[inc - 1] {
            inc += 1
        }
        
        if inc == len || inc == 1 { return false }
        
        var dec = len - 2
        
        while dec >= 0 && arr[dec + 1] < arr[dec] {
            dec -= 1
        }
        
        return (inc - 1) == (dec + 1)
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.validMountainArray([2,1])
        XCTAssertEqual(value, false)
    }
    
    func test1() {
        let value = solution.validMountainArray([3,5,5])
        XCTAssertEqual(value, false)
    }
    
    func test2() {
        let value = solution.validMountainArray([0,3,2,1])
        XCTAssertEqual(value, true)
    }
}

Tests.defaultTestSuite.run()
