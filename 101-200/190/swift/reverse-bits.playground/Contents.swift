import Foundation

// 190. Reverse Bits
// https://leetcode.com/problems/reverse-bits/

class Solution {
    func reverseBits(_ n: Int) -> Int {
        var val = n, result = 0
        for bit in 0 ..< Int32.bitWidth {
            result += (val & 1) << (Int32.bitWidth - 1 - bit)
            val >>= 1
        }
        return result
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // The input binary string 00000010100101000001111010011100 represents
    // the unsigned integer 43261596, so return 964176192 which its binary
    // representation is 00111001011110000010100101000000.
    func test0() {
        let binary = "00000010100101000001111010011100"
        if let number = Int(binary, radix: 2) {
            let value = solution.reverseBits(number)
            XCTAssertEqual(value, 964176192)
        }
        let number: UInt = strtoul(binary, nil, 2)
        let value = solution.reverseBits(Int(number))
        XCTAssertEqual(value, 964176192)
    }
    
    // The input binary string 11111111111111111111111111111101 represents
    // the unsigned integer 4294967293, so return 3221225471 which its binary
    // representation is 10111111111111111111111111111111.
    func test1() {
        let binary = "11111111111111111111111111111101"
        if let number = Int(binary, radix: 2) {
            let value = solution.reverseBits(number)
            XCTAssertEqual(value, 3221225471)
        }
        let number: UInt = strtoul(binary, nil, 2)
        let value = solution.reverseBits(Int(number))
        XCTAssertEqual(value, 3221225471)
        
    }
}

Tests.defaultTestSuite.run()
