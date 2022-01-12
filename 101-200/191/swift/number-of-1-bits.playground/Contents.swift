import Foundation

// 191. Number of 1 Bits
// https://leetcode.com/problems/number-of-1-bits/

class Solution {
    func hammingWeight(_ n: Int) -> Int {
        return n.nonzeroBitCount
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.025 (0.041) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The input binary string 00000000000000000000000000001011 has a total of three '1' bits.
    func test0() {
        let binary = "00000000000000000000000000001011"
        if let number = Int(binary, radix: 2) {
            let value = solution.hammingWeight(number)
            XCTAssertEqual(value, 3)
        }
        let number: UInt = strtoul(binary, nil, 2)
        let value = solution.hammingWeight(Int(number))
        XCTAssertEqual(value, 3)
    }
    
    // The input binary string 00000000000000000000000010000000 has a total of one '1' bit.
    func test1() {
        let binary = "00000000000000000000000010000000"
        if let number = Int(binary, radix: 2) {
            let value = solution.hammingWeight(number)
            XCTAssertEqual(value, 1)
        }
        let number: UInt = strtoul(binary, nil, 2)
        let value = solution.hammingWeight(Int(number))
        XCTAssertEqual(value, 1)
    }
    
    // The input binary string 11111111111111111111111111111101 has a total of thirty one '1' bits.
    func test2() {
        let binary = "11111111111111111111111111111101"
        if let number = Int(binary, radix: 2) {
            let value = solution.hammingWeight(number)
            XCTAssertEqual(value, 31)
        }
        let number: UInt = strtoul(binary, nil, 2)
        let value = solution.hammingWeight(Int(number))
        XCTAssertEqual(value, 31)
    }
}

Tests.defaultTestSuite.run()
