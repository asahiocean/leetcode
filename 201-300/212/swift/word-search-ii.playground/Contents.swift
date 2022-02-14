import Foundation

// 212. Word Search II
// https://leetcode.com/problems/word-search-ii/

class Solution {
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let tree = TrieNode(" "), lnb = board.count
        
        words.forEach { tree.addWord($0) }
        
        var usedPos: [[Bool]] = []
        
        for i in 0..<lnb {
            usedPos.append([Bool](repeating: false, count: board[i].count))
        }
        
        var results: Set<String> = []
        
        for i in 0..<lnb {
            for j in 0..<board[i].count {
                let part = finder(board, &usedPos, (x : i, y : j), tree)
                for word in part { results.insert(word) }
            }
        }
        return [String](results)
    }
    
    private func finder(_ board: [[Character]], _ used: inout [[Bool]], _ pos: (x: Int, y: Int), _ parent: TrieNode) -> [String] {
        guard pos.x >= 0 && pos.x < board.count else { return [] }
        
        let line: [Character] = board[pos.x]
        
        guard pos.y >= 0 && pos.y < line.count else { return [] }
        
        if used[pos.x][pos.y] { return [] }
        
        guard let trieNode = parent.dict[line[pos.y]] else { return [] }
        
        var result: [String] = []
        
        if let word = trieNode.word { result.append(word) }
        
        used[pos.x][pos.y] = true
        
        enum directions: CaseIterable {
            case up, down, left, right
        }
        
        func helper(_ dir: directions) -> [String] {
            let pos = { () -> (x: Int, y: Int) in
                switch dir {
                case .up: return (x: pos.x - 1, y: pos.y)
                case .down: return (x: pos.x + 1, y: pos.y)
                case .left: return (x: pos.x, y: pos.y - 1)
                case .right: return (x: pos.x, y: pos.y + 1)
                }
            }()
            return finder(board, &used, pos, trieNode)
        }
        
        for dir in directions.allCases {
            result.append(contentsOf: helper(dir))
        }
        
        used[pos.x][pos.y] = false
        
        return result
    }
    
    class TrieNode {
        var char: Character
        var dict: [Character:TrieNode]
        var word: String?
        
        init(_ char: Character) {
            self.char = char
            self.dict = [:]
        }
        
        func addWord(_ word: String) {
            self.method(word, [Character](word), 0)
        }
        
        private func method(_ word: String, _ chars: [Character], _ chIdx: Int) {
            guard chIdx < chars.count else {
                self.word = word
                return
            }
            
            let char = chars[chIdx]
            var nextNode = dict[char]
            
            if nextNode == nil {
                nextNode = TrieNode(char)
                dict[char] = nextNode
            }
            
            nextNode!.method(word, chars, chIdx + 1)
        }
    }
}

// MARK: - Test cases -

// Result: Executed 2 tests, with 0 failures (0 unexpected) in 0.031 (0.033) seconds

import XCTest

class Tests: XCTestCase {
    
    private let solution = Solution()
    
    func test0() {
        let value = solution.findWords([["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], ["oath","pea","eat","rain"])
        XCTAssertEqual(value.sorted(), ["eat","oath"].sorted())
    }
    
    func test1() {
        let value = solution.findWords([["a","b"],["c","d"]], ["abcb"])
        XCTAssertEqual(value, [])
    }
}

Tests.defaultTestSuite.run()
