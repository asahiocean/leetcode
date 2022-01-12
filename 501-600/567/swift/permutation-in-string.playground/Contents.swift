import Foundation

// 567. Permutation in String
// https://leetcode.com/problems/permutation-in-string/

class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        let arrS2 = [Character](s2)
        
        var win: Dictionary<Character, Int> = [:]
        var need: Dictionary<Character, Int> = [:]
        
        s1.forEach({ need[$0, default: 0] += 1 })
        
        var left = 0, right = 0, match = 0
        
        while right < arrS2.count {
            let elr = arrS2[right]
            right += 1
            
            if need[elr] != nil {
                win[elr, default: 0] += 1
                if win[elr] == need[elr] { match += 1 }
            }
            
            while match == need.count {
                if right - left == s1.count { return true }
                let itemL = arrS2[left]
                left += 1
                if let ell = need[itemL] {
                    if win[itemL] == ell { match -= 1 }
                    win[itemL]! -= 1
                }
            }
        }
        return false
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.028 (0.031) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // s2 contains one permutation of s1 ("ba").
    func test0() {
        let value = solution.checkInclusion("ab", "eidbaooo")
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.checkInclusion("ab", "eidboaoo")
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()