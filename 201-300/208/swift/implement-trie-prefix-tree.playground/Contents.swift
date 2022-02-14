import Foundation

// 208. Implement Trie (Prefix Tree)
// https://leetcode.com/problems/implement-trie-prefix-tree/

class Trie {
    
    private var nodes: [Character:Trie]
    
    init() {
        self.nodes = [:]
    }
    
    func insert(_ word: String) {
        var trie = self
        for ch in word {
            if let subTrie = trie.nodes[ch] {
                trie = subTrie
            } else {
                let subTrie = Trie()
                trie.nodes[ch] = subTrie
                trie = subTrie
            }
        }
        trie.nodes["#"] = Trie()
    }
    
    func search(_ word: String) -> Bool {
        var trie = self
        for ch in word {
            if let subTrie = trie.nodes[ch] {
                trie = subTrie
            } else {
                return false
            }
        }
        return trie.nodes["#"] != nil
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var trie = self
        for ch in prefix {
            if let subTrie = trie.nodes[ch] {
                trie = subTrie
            } else {
                return false
            }
        }
        return true
    }
}

// MARK: - Test cases -

// Result: Executed 1 test, with 0 failures (0 unexpected) in 0.015 (0.017) seconds

import XCTest

class Tests: XCTestCase {
    
    func test0() {
        let trie = Trie()
        trie.insert("apple")
        XCTAssertEqual(trie.search("apple"), true)
        XCTAssertEqual(trie.search("app"), false)
        trie.startsWith("app")
        trie.insert("app")
        XCTAssertEqual(trie.search("app"), true)
    }
}

Tests.defaultTestSuite.run()
