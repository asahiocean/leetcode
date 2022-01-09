# [1457. Pseudo-Palindromic Paths in a Binary Tree](https://leetcode.com/problems/pseudo-palindromic-paths-in-a-binary-tree)

### Solution
```swift
class Solution {
    func pseudoPalindromicPaths (_ root: TreeNode?) -> Int {
        return calculate(root, Set())
    }
    
    private func calculate(_ node: TreeNode?, _ set: Set<Int>) -> Int {
        guard let node = node else { return 0 }
        var newSet = set
        if set.contains(node.val) {
            newSet.remove(node.val)
        } else {
            newSet.insert(node.val)
        }
        switch (node.left, node.right) {
        case let (left?,right?):
            return calculate(left, newSet) + calculate(right, newSet)
        case let (left?, nil):
            return calculate(left, newSet)
        case let (nil, right?):
            return calculate(right, newSet)
        case (nil, nil):
            return newSet.count <= 1 ? 1 : 0
        }
    }
}
```

### Description

<div><p>Given a binary tree where node values are digits from 1 to 9. A path in the binary tree is said to be <strong>pseudo-palindromic</strong> if at least one permutation of the node values in the path is a palindrome.</p>

<p><em>Return the number of <strong>pseudo-palindromic</strong> paths going from the root node to leaf nodes.</em></p>

<p><strong>Example 1:</strong></p>

<p><img alt="" src="https://assets.leetcode.com/uploads/2020/05/06/palindromic_paths_1.png" style="width: 300px; height: 201px;"></p>

<pre><strong>Input:</strong> root = [2,3,1,3,1,null,1]
<strong>Output:</strong> 2 
<strong>Explanation:</strong> The figure above represents the given binary tree. There are three paths going from the root node to leaf nodes: the red path [2,3,3], the green path [2,1,1], and the path [2,3,1]. Among these paths only red path and green path are pseudo-palindromic paths since the red path [2,3,3] can be rearranged in [3,2,3] (palindrome) and the green path [2,1,1] can be rearranged in [1,2,1] (palindrome).
</pre>

<p><strong>Example 2:</strong></p>

<p><strong><img alt="" src="https://assets.leetcode.com/uploads/2020/05/07/palindromic_paths_2.png" style="width: 300px; height: 314px;"></strong></p>

<pre><strong>Input:</strong> root = [2,1,1,1,3,null,null,null,null,null,1]
<strong>Output:</strong> 1 
<strong>Explanation:</strong> The figure above represents the given binary tree. There are three paths going from the root node to leaf nodes: the green path [2,1,1], the path [2,1,3,1], and the path [2,1]. Among these paths only the green path is pseudo-palindromic since [2,1,1] can be rearranged in [1,2,1] (palindrome).
</pre>

<p><strong>Example 3:</strong></p>

<pre><strong>Input:</strong> root = [9]
<strong>Output:</strong> 1
</pre>

<p><strong>Constraints:</strong></p>

<ul>
	<li>The number of nodes in the tree is in the range <code>[1, 10<sup>5</sup>]</code>.</li>
	<li><code>1 &lt;= Node.val &lt;= 9</code></li>
</ul>
</div>