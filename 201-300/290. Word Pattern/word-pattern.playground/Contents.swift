import Foundation

// 290. Word Pattern
// https://leetcode.com/problems/word-pattern/

class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        
        let chars = [Character](pattern), lenChars = chars.count
        let words = s.components(separatedBy: " "), lenWord = words.count
        
        guard lenChars == lenWord else { return false }
        
        var chMap: [Character:String] = [:]
        var sMap: [String:Character] = [:]
        
        for i in 0..<lenChars {
            
            let char = chars[i]
            let word = words[i]
            
            if chMap[char] == nil { chMap[char] = word }
            if sMap[word] == nil { sMap[word] = char }
            
            if sMap[word] != char || chMap[char] != word {
                return false
            }
        }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.024 (0.026) seconds

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
