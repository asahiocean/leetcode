import Foundation

// 115. Distinct Subsequences
// https://leetcode.com/problems/distinct-subsequences/

class Solution {
    func numDistinct(_ s: String, _ t: String) -> Int {
        let arrS = Array(s), arrT = Array(t)
        let lnS = arrS.count, lnT = arrT.count
        
        var dp = [[Int]](repeating: [Int](repeating: -1, count: lnT), count: lnS)
        
        func distinct(_ a: Int, _ b: Int) -> Int {
            guard b >= 0 else { return 1 }
            guard a >= 0 else { return 0 }
            if dp[a][b] != -1 { return dp[a][b] }
            dp[a][b] = distinct(a-1, b) + (arrS[a] == arrT[b] ? distinct(a-1, b-1) : 0)
            return dp[a][b]
        }
        
        return distinct(lnS - 1, lnT - 1)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.008 (0.010) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // As shown below, there are 3 ways you can generate "rabbit" from S.
    // "rabb" b "it"
    // "ra" b "bbit"
    // "rab" b "bit"
    func test0() {
        let value = solution.numDistinct("rabbbit", "rabbit")
        XCTAssertEqual(value, 3)
    }
    
    // As shown below, there are 5 ways you can generate "bag" from S.
    // "ba" b "g" bag
    // "ba" bgba "g"
    // "b" abgb "ag"
    // ba "b" gb "ag"
    // babg "bag"
    func test1() {
        let value = solution.numDistinct("babgbag", "bag")
        XCTAssertEqual(value, 5)
    }
}

Tests.defaultTestSuite.run()
