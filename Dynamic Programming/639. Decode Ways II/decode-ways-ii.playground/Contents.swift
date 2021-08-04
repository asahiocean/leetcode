import Foundation

// 639. Decode Ways II
// https://leetcode.com/problems/decode-ways-ii/

class Solution {
    func numDecodings(_ s: String) -> Int {
        let chars = Array(s)
        var dp = Array<Int?>(repeating: nil, count: s.count + 1)
        
        func helper(_ endIndex: Int) -> Int {
            if endIndex < 0 { return 1 }
            if let value = dp[endIndex] { return value }
            
            let char = chars[endIndex]
            let prev = { helper(endIndex-1) }, penult = { helper(endIndex-2) }
            var res: Int
            
            switch char {
            case "*":
                res = 9 * prev()
                if endIndex > 0 {
                    switch chars[endIndex-1] {
                    case "1":
                        res += 9 * penult()
                    case "2":
                        res += 6 * penult()
                    case "*":
                        res += 15 * penult()
                    default:
                        break
                    }
                }
            default:
                res = char == "0" ? 0 : prev()
                if endIndex > 0 {
                    switch chars[endIndex-1] {
                    case "1":
                        res += penult()
                    case "2" where char <= "6":
                        res += penult()
                    case "*":
                        res += (char <= "6" ? 2 : 1) * penult()
                    default:
                        break
                    }
                }
            }
            res %= Int(1e9+7)
            dp[endIndex] = res
            return res
        }
        return helper(chars.endIndex-1)
    }
}

import XCTest

// Executed 3 tests, with 0 failures (0 unexpected) in 0.096 (0.097) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.numDecodings("*")
        XCTAssertEqual(res, 9)
    }
    func test1() {
        let res = s.numDecodings("1*")
        XCTAssertEqual(res, 18)
    }
    func test2() {
        let res = s.numDecodings("2*")
        XCTAssertEqual(res, 15)
    }
}

Tests.defaultTestSuite.run()
