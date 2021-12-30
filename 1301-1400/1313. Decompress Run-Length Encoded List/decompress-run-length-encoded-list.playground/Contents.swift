import Foundation

// 1313. Decompress Run-Length Encoded List
// https://leetcode.com/problems/decompress-run-length-encoded-list/

class Solution {
    func decompressRLElist(_ nums: [Int]) -> [Int] {
        var values = [Int]()
        for i in 0..<(nums.count/2) {
            for _ in 1...nums[2*i] { values.append(nums[2*i+1]) }
        }
        return values
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.007 (0.009) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.decompressRLElist([1,2,3,4])
        XCTAssertEqual(value, [2,4,4,4])
    }
    func test1() {
        let value = solution.decompressRLElist([1,1,2,3])
        XCTAssertEqual(value, [1,3,3])
    }
}

Tests.defaultTestSuite.run()
