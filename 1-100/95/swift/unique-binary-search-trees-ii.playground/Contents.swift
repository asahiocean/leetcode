import Foundation

// 95. Unique Binary Search Trees II
// https://leetcode.com/problems/unique-binary-search-trees-ii/

class Solution {
    
    private struct MetaTree: Hashable { let from: Int, to: Int }
    
    private var dict = [MetaTree:[TreeNode?]]()
    
    func generateTrees(_ n: Int) -> [TreeNode?] {
        guard n != 0 else { return [] }
        return recursion(MetaTree(from: 1, to: n))
    }
    
    private func recursion(_ tree: MetaTree) -> [TreeNode?] {
        if let roots = dict[tree] { return roots }
        
        guard tree.to > tree.from else {
            var nodes: [TreeNode?] = [nil]
            if tree.from == tree.to {
                nodes[0] = TreeNode(tree.from)
            }
            dict[tree] = nodes
            return nodes
        }
        
        if tree.to - tree.from < 1 {
            let root1 = TreeNode(tree.from)
            root1.right = TreeNode(tree.to)
            let root2 = TreeNode(tree.to)
            root2.left = TreeNode(tree.from)
            
            let value =  [root1,root2]
            dict[tree] = value
            return value
        }
        
        var nodes: [TreeNode?] = []
        
        for n in (tree.from...tree.to) {
            let left = recursion(MetaTree(from: tree.from, to: n - 1))
            let right = recursion(MetaTree(from: n + 1, to: tree.to))
            for l in left {
                for r in right {
                    let root = TreeNode(n)
                    root.left = l
                    root.right = r
                    nodes.append(root)
                }
            }
        }
        dict[tree] = nodes
        return nodes
    }
}

// MARK: - TreeNode -

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
