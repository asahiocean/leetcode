import Foundation

// 87. Scramble String
// https://leetcode.com/problems/scramble-string/

class Solution {
    func isScramble(_ s1: String, _ s2: String) -> Bool {
        guard s1.count == s2.count else { return false }
        
        let arrS1 = Array(s1), arrS2 = Array(s2)
        let len = arrS1.count
        
        var dp = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: len + 1), count: len), count: len)
        
        for i in 0..<len {
            for j in 0..<len {
                dp[i][j][1] = (arrS1[i] == arrS2[j])
            }
        }
        
        for a in 1...len {
            for b in 0...(len - a) {
                for c in 0...(len - a) {
                    for d in 1..<a {
                        let xyxy = dp[b][c][d] && dp[b + d][c + d][a - d]
                        let xyyx = dp[b][c + a - d][d] && dp[b + d][c][a - d]
                        if xyxy || xyyx {
                            dp[b][c][a] = true
                            break
                        }
                    }
                }
            }
        }
        return dp[0][0][len]
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.032 (0.034) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // One possible scenario applied on s1 is:
    // "great" --> "gr/eat" // divide at random index.
    // "gr/eat" --> "gr/eat" // random decision is not to swap the two substrings and keep them in order.
    // "gr/eat" --> "g/r / e/at" // apply the same algorithm recursively on both substrings. divide at ranom index each of them.
    // "g/r / e/at" --> "r/g / e/at" // random decision was to swap the first substring and to keep the second substring in the same order.
    // "r/g / e/at" --> "r/g / e/ a/t" // again apply the algorithm recursively, divide "at" to "a/t".
    // "r/g / e/ a/t" --> "r/g / e/ a/t" // random decision is to keep both substrings in the same order.
    // The algorithm stops now and the result string is "rgeat" which is s2.
    // As there is one possible scenario that led s1 to be scrambled to s2, we return true.
    func test0() {
        let value = solution.isScramble("great", "rgeat")
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.isScramble("abcde", "caebd")
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
