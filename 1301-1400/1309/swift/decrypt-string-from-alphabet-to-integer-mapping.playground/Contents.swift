import Foundation

// 1309. Decrypt String from Alphabet to Integer Mapping
// https://leetcode.com/problems/decrypt-string-from-alphabet-to-integer-mapping/

class Solution {
    func freqAlphabets(_ s: String) -> String {
        var str = s, idx = 26
        while idx > 0 {
            let digit = "\(idx)", codeStr = "\(UnicodeScalar(96+idx)!)"
            str = str.replacingOccurrences(of: idx > 9 ? digit + "#" : digit, with: codeStr)
            idx -= 1
        }
        return str
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.005 (0.007) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // "j" -> "10#" , "k" -> "11#" , "a" -> "1" , "b" -> "2"
    func test0() {
        let value = solution.freqAlphabets("10#11#12")
        XCTAssertEqual(value, "jkab")
    }
    
    func test1() {
        let value = solution.freqAlphabets("1326#")
        XCTAssertEqual(value, "acz")
    }
}

Tests.defaultTestSuite.run()
