import Foundation

// 127. Word Ladder
// https://leetcode.com/problems/word-ladder/

class Solution {
    private let alphabet = "abcdefghijklmnopqrstuvwxyz"
    func ladderLength(_ begin: String, _ end: String, _ list: [String]) -> Int {
        guard begin.count == end.count else { return 0 }
        
        var words = Set(list), queue = [(begin, 1)]
        
        while !queue.isEmpty {
            let (word, step) = queue.removeFirst()
            guard word != end else { return step }
            
            for i in 0..<word.count {
                var chars = Array(word)
                for ch in alphabet where ch != chars[i] {
                    chars[i] = ch
                    let modStr = String(chars)
                    guard words.contains(modStr) else { continue }
                    words.remove(modStr)
                    queue.append((modStr, step + 1))
                }
            }
        }
        return 0
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.019 (0.021) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // One shortest transformation sequence is "hit" -> "hot" -> "dot" -> "dog" -> cog", which is 5 words long.
    func test0() {
        let value = solution.ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"])
        XCTAssertEqual(value, 5)
    }
    
    // The endWord "cog" is not in wordList, therefore there is no valid transformation sequence.
    func test1() {
        let value = solution.ladderLength("hit", "cog", ["hot","dot","dog","lot","log"])
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
