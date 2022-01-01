import Foundation

// 290. Word Pattern
// https://leetcode.com/problems/word-pattern/

class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        
        let chars = Array<Character>(pattern)
        let words  = s.components(separatedBy: " ")
        
        if chars.count != words.count { return false }
        
        var chMap: Dictionary<Character,String> = [:]
        var sMap: Dictionary<String,Character> = [:]
        
        for i in 0..<chars.count {
            
            let ch = chars[i]
            let word = words[i]
            
            if chMap[ch] == nil { chMap[ch] = word }
            if sMap[word] == nil { sMap[word] = ch }
            
            if sMap[word] != ch || chMap[ch] != word {
                return false
            }
        }
        return true
    }
}

// MARK: - Test cases -

// Result:

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.wordPattern("abba", "dog cat cat dog")
        XCTAssertEqual(value, true)
    }
    
    func test1() {
        let value = solution.wordPattern("abba", "dog cat cat fish")
        XCTAssertEqual(value, false)
    }
    
    func test2() {
        let value = solution.wordPattern("aaaa", "dog cat cat dog")
        XCTAssertEqual(value, false)
    }
}

Tests.defaultTestSuite.run()
