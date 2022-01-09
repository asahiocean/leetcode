import Foundation

// 205. Isomorphic Strings
// https://leetcode.com/problems/isomorphic-strings/

class Solution {
    private typealias DICT = [Character:Character]
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        
        var src: DICT = [:]
        var trg: DICT = [:]
        
        let arrayS = Array(s), arrayT = Array(t)
        
        for (i, chS) in arrayS.enumerated() {
            let chT = arrayT[i]
            if src[chS] == nil && trg[chT] == nil {
                src[chS] = chT
                trg[chT] = chS
            } else if src[chS] != chT || trg[chT] != chS {
                return false
            }
        }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.012 (0.014) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.isIsomorphic("egg", "add")
        XCTAssertTrue(value)
    }
    
    func test1() {
        let value = solution.isIsomorphic("foo", "bar")
        XCTAssertFalse(value)
    }
    
    func test2() {
        let value = solution.isIsomorphic("paper", "title")
        XCTAssertTrue(value)
    }
}

Tests.defaultTestSuite.run()
