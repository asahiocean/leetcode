import Foundation

class Solution {
    func decompressRLElist(_ nums: [Int]) -> [Int] {
        var res = [Int]()
        for i in 0..<(nums.count/2) {
            for _ in 1...nums[2*i] { res.append(nums[2*i+1]) }
        }
        return res
    }
}

import XCTest

// Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func testExample1() {
        XCTAssert(s.decompressRLElist([1,2,3,4]) == [2,4,4,4]) // success
    }
    func testExample2() {
        XCTAssert(s.decompressRLElist([1,1,2,3]) == [1,3,3]) // success
    }
}

Tests.defaultTestSuite.run()
