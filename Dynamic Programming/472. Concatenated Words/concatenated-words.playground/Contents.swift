import Foundation

// 472. Concatenated Words
// https://leetcode.com/problems/concatenated-words

class Solution {
    
    internal class Node {
        var child: [Character:Node] = [:]
        var isWord: Bool = false
    }
    
    private let trie = Node()
    
    func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
        var value: [String] = []
        for word in words.sorted(by: { $0.count < $1.count }) where word.count != 0 {
            let array = Array(word)
            dfs(array, 0) ? value.append(word) : insert(array)
        }
        return value
    }
    
    private func dfs(_ chars: [Character], _ idx: Int) -> Bool {
        let len = chars.count
        if idx == len { return true }
        var node = trie
        for i in idx..<len {
            guard let child = node.child[chars[i]] else { return false }
            node = child
            if node.isWord && dfs(chars, i + 1) { return true }
        }
        return false
    }
    
    private func insert(_ chars: [Character]) {
        var node = trie
        for c in chars {
            if node.child[c] == nil {
                node.child[c] = Node()
            }
            node = node.child[c]!
        }
        node.isWord = true
    }
}


// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.619 (0.621) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test1() {
        let words = ["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"]
        let value = solution.findAllConcatenatedWordsInADict(words)
        XCTAssertEqual(value, ["catsdogcats","dogcatsdog","ratcatdogcat"])
    }
    
    func test2() {
        let words = ["cat","dog","catdog"]
        let value = solution.findAllConcatenatedWordsInADict(words)
        XCTAssertEqual(value, ["catdog"])
    }
}

Tests.defaultTestSuite.run()
