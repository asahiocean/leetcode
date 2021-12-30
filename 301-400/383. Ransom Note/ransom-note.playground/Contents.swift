import UIKit
import XCTest

// https://leetcode.com/problems/ransom-note/

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        let ransom = [Character](ransomNote)
        let magazine = [Character](magazine)
        
        var freq: [Character:Int] = [:]
        
        for i in 0..<magazine.count {
            if let count = freq[magazine[i]] {
                freq[magazine[i]] = count + 1
            } else {
                freq[magazine[i]] = 1
            }
        }
        
        for i in 0..<ransom.count {
            if let count = freq[ransom[i]] {
                if count == 0 { return false }
                freq[ransom[i]] = count - 1
            } else {
                return false
            }
        }
        return true
    }
}

class Tests: XCTestCase {
    let solution = Solution()
    
    func testAssert() {
        XCTAssertFalse(solution.canConstruct("a", "b"))
        XCTAssertFalse(solution.canConstruct("aa", "ab"))
        XCTAssertTrue(solution.canConstruct("aa", "aab"))
        XCTAssertFalse(solution.canConstruct("", ""))
    }
}

Tests.defaultTestSuite.run()
