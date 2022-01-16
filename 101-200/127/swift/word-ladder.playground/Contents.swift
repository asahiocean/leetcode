import Foundation

// 127. Word Ladder
// https://leetcode.com/problems/word-ladder/

class Solution {
    private let alphabet = "abcdefghijklmnopqrstuvwxyz"
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        guard beginWord.count == endWord.count else { return 0 }
        
        var words = Set<String>(wordList)
        
        var queue = [(beginWord, 1)]
        
        while !queue.isEmpty {
            let (word, step) = queue.removeFirst()
            
            guard word != endWord else { return step }
            
            for i in 0..<word.count {
                var arrWord = Array(word)
                for ch in alphabet {
                    guard ch != arrWord[i] else { continue }
                    
                    arrWord[i] = ch
                    let transformWord = String(arrWord)
                    
                    guard words.contains(transformWord) else { continue }
                    
                    words.remove(transformWord)
                    queue.append((transformWord, step + 1))
                }
            }
        }
        return 0
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.039 (0.041) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // One shortest transformation sequence is "hit" -> "hot" -> "dot" -> "dog" -> cog", which is 5 words long.
    func test0() {
        let beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
        let value = solution.ladderLength(beginWord, endWord, wordList)
        XCTAssertEqual(value, 5)
    }
    
    // The endWord "cog" is not in wordList, therefore there is no valid transformation sequence.
    func test1() {
        let beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
        let value = solution.ladderLength(beginWord, endWord, wordList)
        XCTAssertEqual(value, 0)
    }
}

Tests.defaultTestSuite.run()
