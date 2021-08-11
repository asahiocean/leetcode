import Foundation

// 44. Wildcard Matching
// https://leetcode.com/problems/wildcard-matching
// Discuss: https://vk.cc/c4e27x

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let sArr = Array(s), pArr = Array(p)
        let pBools = [Bool](repeating: false, count: p.count + 1)
        var dp = Array(repeating: pBools, count: s.count + 1)
        dp[0][0] = true
        (0...s.count).forEach {
            for j in 0...p.count where j > 0 {
                let cp = pArr[j-1]
                if cp != "*" {
                    dp[$0][j] = $0 > 0 && dp[$0-1][j-1] && (cp == sArr[$0-1] || cp == "?")
                } else {
                    var flag = false
                    for k in 0...$0 where dp[k][j-1] {
                        flag = true
                    }
                    dp[$0][j] = flag || j == 1
                }
            }
        }
        return dp[s.count][p.count]
    }
}

import XCTest

// Executed 5 tests, with 0 failures (0 unexpected) in 0.045 (0.047) seconds

class Tests: XCTestCase {
    private let s = Solution()
    func test0() {
        let res = s.isMatch("aa","a")
        XCTAssertEqual(res, false)
    }
    func test1() {
        let res = s.isMatch("aa","*")
        XCTAssertEqual(res, true)
    }
    func test2() {
        let res = s.isMatch("cb","?a")
        XCTAssertEqual(res, false)
    }
    func test3() {
        let res = s.isMatch("adceb","*a*b")
        XCTAssertEqual(res, true)
    }
    func test4() {
        let res = s.isMatch("acdcb","a*c?b")
        XCTAssertEqual(res, false)
    }
}

Tests.defaultTestSuite.run()
