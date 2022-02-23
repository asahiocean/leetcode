import Foundation

// 126. Word Ladder II
// https://leetcode.com/problems/word-ladder-ii/

class Solution {
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        
        var result: [[String]] = []
        var patterns: [String: [String]] = [:]
        
        for w in wordList {
            for i in 0..<w.count {
                patterns[template(w, i), default: []].append(w)
            }
        }
        
        var queue: [[String]] = []
        queue.append([beginWord])
        
        var visited: Set<String> = []
        
        while !queue.isEmpty {
            var found = false
            var visitLvl: Set<String> = []
            for _ in 0..<queue.count {
                let path = queue.removeFirst(), word = path.last!
                
                for i in 0..<word.count {
                    guard let arr = patterns[template(word, i)] else { continue }
                    
                    for w in arr where !visited.contains(w) {
                        visitLvl.insert(w)
                        
                        let newPath = (path + [w])
                        queue.append(newPath)
                        
                        if w == endWord {
                            result.append(newPath)
                            found = true
                        }
                    }
                }
            }
            visited.formUnion(visitLvl)
            if found { break }
        }
        return result
    }
    private func template(_ s: String, _ i: Int) -> String {
        var chars = Array(s)
        chars[i] = "*"
        return String(chars)
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.050 (0.052) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    // There are 2 shortest transformation sequences:
    // "hit" -> "hot" -> "dot" -> "dog" -> "cog"
    // "hit" -> "hot" -> "lot" -> "log" -> "cog"
    func test0() {
        let beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log","cog"]
        let value = solution.findLadders(beginWord, endWord, wordList)
        XCTAssertEqual(value, [["hit","hot","dot","dog","cog"],
                               ["hit","hot","lot","log","cog"]])
    }
    
    // The endWord "cog" is not in wordList, therefore there is no valid transformation sequence.
    func test1() {
        let beginWord = "hit", endWord = "cog", wordList = ["hot","dot","dog","lot","log"]
        let value = solution.findLadders(beginWord, endWord, wordList)
        XCTAssertEqual(value, [])
    }
}

Tests.defaultTestSuite.run()
