import Foundation

// 211. Design Add and Search Words Data Structure
// https://leetcode.com/problems/design-add-and-search-words-data-structure/

class TrieNode {
    var children: [TrieNode?]
    var isEndOfWord: Bool
    
    init() {
        children = Array(repeating: nil, count: 26)
        isEndOfWord = false
    }
}

class WordDictionary {
    
    private let root: TrieNode
    private let asciiZ = Character("z").asciiValue!
    
    init() {
        self.root = TrieNode()
    }
    
    private func setup(idx: Int, _ trieNode: inout TrieNode) {
        if let child = trieNode.children[idx] {
            trieNode = child
        } else {
            trieNode.children[idx] = TrieNode()
            trieNode = trieNode.children[idx]!
        }
    }
    
    func addWord(_ word: String) {
        var trieNode: TrieNode = root
        
        for (i, ch) in word.enumerated() {
            if let ascii = ch.asciiValue {
                setup(idx: 25 - Int(asciiZ - ascii), &trieNode)
                if i == word.count - 1 {
                    trieNode.isEndOfWord = true
                }
            }
        }
    }
    
    func search(_ word: String) -> Bool {
        return search(word, root: root)
    }
    
    func search(_ word: String, root: TrieNode) -> Bool {
        var trieNode: TrieNode = root
        
        for (i, ch) in word.enumerated() {
            if ch == Character(".") {
                var exist = false
                for child in trieNode.children where child != nil {
                    let fromIndex = word.index(word.startIndex, offsetBy: i + 1)
                    let str = String(word[fromIndex...])
                    if str.isEmpty, child!.isEndOfWord {
                        exist = true
                    } else if search(str, root: child!) {
                        exist = true
                    }
                }
                return exist
            }
            if let charAscii = ch.asciiValue {
                setup(idx: 25 - Int(asciiZ - charAscii), &trieNode)
                if i == word.count - 1 {
                    return trieNode.isEndOfWord == true
                }
            }
        }
        return false
    }
}
/**
 * Your WordDictionary object will be instantiated and called as such:
 * let obj = WordDictionary()
 * obj.addWord(word)
 * let ret_2: Bool = obj.search(word)
 */

// MARK: - Test cases -

// Result:

import XCTest

class Tests: XCTestCase {
    
    func test0() {
        let wordDictionary = WordDictionary()
        wordDictionary.addWord("bad")
        wordDictionary.addWord("dad")
        wordDictionary.addWord("mad")
        XCTAssertFalse(wordDictionary.search("pad")) // return False
        XCTAssertTrue(wordDictionary.search("bad")) // return True
        XCTAssertTrue(wordDictionary.search(".ad")) // return True
        XCTAssertTrue(wordDictionary.search("b..")) // return True
        
    }
}

Tests.defaultTestSuite.run()
