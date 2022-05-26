import Foundation

// 191. Number of 1 Bits
// https://leetcode.com/problems/number-of-1-bits/

class Solution {
    func hammingWeight(_ n: Int) -> Int {
        return n.nonzeroBitCount
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The input binary string 00000000000000000000000000001011 has a total of three '1' bits.
    func test0() {
        let binary = "00000000000000000000000000001011"
        let value = solution.hammingWeight(int(binary))
        XCTAssertEqual(value, 3)
    }
    
    // The input binary string 00000000000000000000000010000000 has a total of one '1' bit.
    func test1() {
        let binary = "00000000000000000000000010000000"
        let value = solution.hammingWeight(int(binary))
        XCTAssertEqual(value, 1)
    }
    
    // The input binary string 11111111111111111111111111111101 has a total of thirty one '1' bits.
    func test2() {
        let binary = "11111111111111111111111111111101"
        let value = solution.hammingWeight(int(binary))
        XCTAssertEqual(value, 31)
    }
    
    private func int(_ strbin: String) -> Int {
        return Int(strtoul(strbin, nil, 2))
    }
}

Tests.defaultTestSuite.run()
