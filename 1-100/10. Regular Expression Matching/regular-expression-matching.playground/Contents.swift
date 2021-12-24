import Foundation

// 10. Regular Expression Matching
// https://leetcode.com/problems/regular-expression-matching/

class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        
        var visit = [[Bool]]()
        let sLength = s.count, pCount = p.count
        
        for _ in 0...sLength + 1 {
            visit.append([Bool](repeating: false, count: pCount + 1))
        }
        
        visit[sLength][pCount] = true
        
        for i in stride(from: sLength, through: 0, by: -1) {
            for j in stride(from: pCount - 1, through: 0, by: -1) {
                
                let arrS = Array(s), arrP = Array(p)
                
                let first = i < sLength && (arrS[i] == arrP[j] || arrP[j] == ".")
                
                if j + 1 < pCount && arrP[j + 1] == "*" {
                    visit[i][j] = visit[i][j + 2] || first && visit[i + 1][j]
                } else {
                    visit[i][j] = first && visit[i + 1][j + 1]
                }
            }
        }
        return visit[0][0]
    }
}

// MARK: - Test cases -

// Result: Executed 5 tests, with 0 failures (0 unexpected) in 0.080 (0.082) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        XCTAssertFalse(solution.isMatch("aa", "a"))
    }
    func test1() {
        XCTAssertTrue(solution.isMatch("aa", "a*"))
    }
    func test2() {
        XCTAssertTrue(solution.isMatch("ab", ".*"))
    }
    func test3() {
        XCTAssertTrue(solution.isMatch("aab", "c*a*b"))
    }
    func test4() {
        XCTAssertFalse(solution.isMatch("mississippi", "mis*is*p*."))
    }
}

Tests.defaultTestSuite.run()
