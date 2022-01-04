import Foundation

// 91. Decode Ways
// https://leetcode.com/problems/decode-ways/

class Solution {
    func numDecodings(_ s: String) -> Int {
        
        let arrS = Array<Character>(s)
        var dp = Array(repeating: 0, count: arrS.count + 1)
        dp[0] = 1
        
        for i in 1...arrS.count {
            if arrS[i-1] != "0" { dp[i] += dp[i-1] }
            if i > 1 && isValid(arrS, i - 2, i - 1) { dp[i] += dp[i-2] }
        }
        return dp[arrS.count]
    }
    
    private func isValid(_ chars: [Character], _ s: Int, _ e: Int) -> Bool {
        let num = Int(String(chars[s...e]))!
        return num >= 10 && num <= 26
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    /// "12" could be decoded as "AB" (1 2) or "L" (12).
    func test0() {
        let value = solution.numDecodings("12")
        XCTAssertEqual(value, 2)
    }
    
    /// "226" could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
    func test1() {
        let value = solution.numDecodings("226")
        XCTAssertEqual(value, 3)
    }
    
    /// "06" cannot be mapped to "F" because of the leading zero ("6" is different from "06").
    func test2() {
        let value = solution.numDecodings("06")
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
