# [99. Recover Binary Search Tree](https://leetcode.com/problems/recover-binary-search-tree)

### Solution
```swift
class Solution {
    var left: TreeNode?, right: TreeNode?, prev: TreeNode?
    func recoverTree(_ root: TreeNode?) {
        bfs(root)
        if let l = left, let r = right {
            let temp = l.val
            l.val = r.val
            r.val = temp
        }
    }
    private func bfs(_ node: TreeNode?) {
        guard let node = node else { return }
        bfs(node.left)
        if left == nil, let prev = prev, prev.val > node.val {
            left = prev
        }
        if left != nil {
            if right == nil {
                right = node
            } else if node.val < right!.val {
                right = node
            }
        }
        prev = node
        bfs(node.right)
    }
}
```

### Description

<div><p>You are given the <code>root</code> of a binary search tree (BST), where exactly two nodes of the tree were swapped by mistake. <em>Recover the tree without changing its structure</em>.</p>

<p><strong>Follow up:</strong> A solution using <code>O(n)</code> space is pretty straight forward. Could you devise a constant space solution?</p>

<p><strong>Example 1:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2020/10/28/recover1.jpg" style="width: 422px; height: 302px;">
<pre><strong>Input:</strong> root = [1,3,null,null,2]
<strong>Output:</strong> [3,1,null,null,2]
<strong>Explanation:</strong> 3 cannot be a left child of 1 because 3 &gt; 1. Swapping 1 and 3 makes the BST valid.
</pre>

<p><strong>Example 2:</strong></p>
<img alt="" src="https://assets.leetcode.com/uploads/2020/10/28/recover2.jpg" style="width: 581px; height: 302px;">
<pre><strong>Input:</strong> root = [3,1,4,null,null,2]
<strong>Output:</strong> [2,1,4,null,null,3]
<strong>Explanation:</strong> 2 cannot be in the right subtree of 3 because 2 &lt; 3. Swapping 2 and 3 makes the BST valid.
</pre>

<p><strong>Constraints:</strong></p>

<ul>
	<li>The number of nodes in the tree is in the range <code>[2, 1000]</code>.</li>
	<li><code>-2<sup>31</sup> &lt;= Node.val &lt;= 2<sup>31</sup> - 1</code></li>
</ul>
</div>