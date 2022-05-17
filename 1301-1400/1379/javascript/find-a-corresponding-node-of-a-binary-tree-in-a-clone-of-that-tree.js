/**
* 1379. Find a Corresponding Node of a Binary Tree in a Clone of That Tree
* https://leetcode.com/problems/find-a-corresponding-node-of-a-binary-tree-in-a-clone-of-that-tree/
*/

var getTargetCopy = function(original, cloned, target) {
    function dfs(orig, copy) {
        if (!orig) return;
        if (orig === target) return copy;
        return dfs(orig.left, copy.left) || dfs(orig.right, copy.right);
    }
    return dfs(original, cloned);
};