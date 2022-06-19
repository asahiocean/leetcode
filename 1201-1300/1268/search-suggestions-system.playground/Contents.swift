import Foundation

// 1268. Search Suggestions System
// https://leetcode.com/problems/search-suggestions-system/

class Solution {
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        let root = T()
        for p in products { root.add(p) }
        var res = [[String]](), node: T.N? = root.root
        for c in searchWord {
            if let child = node?.nodes[c] {
                res.append(Array(child.words.sorted().prefix(3)))
                node = child
            } else {
                res.append([])
                node = nil
            }
        }
        return res
    }
    
    private typealias T = Trie
    
    private class Trie {
        
        class Node { var nodes = [Character:N](), words = [String]() }
        typealias N = Node
        
        let root = N()
        
        func add(_ w: String) {
            var _node = root
            for c in w {
                if let node = _node.nodes[c] {
                    node.words.append(w)
                    _node = node
                } else {
                    let node = N()
                    node.words.append(w)
                    _node.nodes[c] = node
                    _node = node
                }
            }
        }
    }
}
