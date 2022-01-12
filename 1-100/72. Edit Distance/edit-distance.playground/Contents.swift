import Foundation

// 72. Edit Distance
// https://leetcode.com/problems/edit-distance/

class Solution {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        
        let lenW1 = word1.count, lenW2 = word2.count
        
        guard lenW1 > 0 && lenW2 > 0 else { return max(lenW2,lenW1) }
        
        let arrW1ch = [Character](word1), arrW2ch = [Character](word2)
        
        var editDist = [[Int]](repeating: [Int](repeating: 0, count: lenW2), count: lenW1)
        
        for j in 0..<lenW2 {
            editDist[0][j] = arrW1ch[0] == arrW2ch[j] ? j : (j == 0 ? 0 : editDist[0][j-1]) + 1
        }
        for i in 0..<lenW1 {
            editDist[i][0] = arrW1ch[i] == arrW2ch[0] ? i : (1 + (i == 0 ? 0 : editDist[i - 1][0]))
        }
        for i in 1..<lenW1 {
            for j in 1..<lenW2 {
                editDist[i][j] = min(editDist[i-1][j] + 1,
                                     editDist[i][j-1] + 1,
                                     editDist[i-1][j-1] + (arrW2ch[j] == arrW1ch[i] ? 0 : 1))
            }
        }
        return editDist[lenW1-1][lenW2-1]
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.010 (0.012) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // horse -> rorse (replace 'h' with 'r')
    // rorse -> rose (remove 'r')
    // rose -> ros (remove 'e')
    func test0() {
        let value = solution.minDistance("horse", "ros")
        XCTAssertEqual(value, 3)
    }
    
    // intention -> inention (remove 't')
    // inention -> enention (replace 'i' with 'e')
    // enention -> exention (replace 'n' with 'x')
    // exention -> exection (replace 'n' with 'c')
    // exection -> execution (insert 'u')
    func test1() {
        let value = solution.minDistance("intention", "execution")
        XCTAssertEqual(value, 5)
    }
}

Tests.defaultTestSuite.run()
