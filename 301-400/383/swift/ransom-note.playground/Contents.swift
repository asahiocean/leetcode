import Foundation

// 383. Ransom Note
// https://leetcode.com/problems/ransom-note/

class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        
        let ran = [Character](ransomNote)
        let mag = [Character](magazine)
        
        var freq: [Character:Int] = [:]
        
        for i in 0..<mag.count {
            var result = 1
            if let val = freq[mag[i]] { result = val + 1 }
            freq[mag[i]] = result
        }
        
        for i in 0..<ran.count {
            if let val = freq[ran[i]], val != 0 {
                freq[ran[i]] = val - 1
            } else {
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
        let value = solution.canConstruct("a", "b")
        XCTAssertEqual(value, false)
    }
    
    func test1() {
        let value = solution.canConstruct("aa", "ab")
        XCTAssertEqual(value, false)
    }
    
    func test2() {
        let value = solution.canConstruct("aa", "aab")
        XCTAssertEqual(value, true)
    }
}

Tests.defaultTestSuite.run()
