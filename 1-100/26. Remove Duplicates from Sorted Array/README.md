<h1>
26. Remove Duplicates from Sorted Array
<img src="https://tinyurl.com/4hy8te7s" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        let len = nums.count
        guard len > 1 else { return len }
        var idx = 0
        for n in nums where n != nums[idx] {
            idx += 1
            nums[idx] = n
        }
        return idx + 1
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/3338723dcbf01ffce5d5b6b2e6d551b8">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/remove-duplicates-from-sorted-array/discuss/1656824/">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

Given an integer array `nums` sorted in **non-decreasing order**, remove the duplicates [**in-place**](https://en.wikipedia.org/wiki/In-place_algorithm) such that each unique element appears only **once**. The **relative order** of the elements should be kept the **same**.

Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the **first part** of the array `nums`. More formally, if there are `k` elements after removing the duplicates, then the first `k` elements of `nums` should hold the final result. It does not matter what you leave beyond the first `k` elements.

Return `k` _after placing the final result in the first_ `k` _slots of_ `nums`.

Do **not** allocate extra space for another array. You must do this by **modifying the input array [in-place](https://en.wikipedia.org/wiki/In-place_algorithm)** with O(1) extra memory.

#### Custom Judge

The judge will test your solution with the following code:

<pre>
int[] nums = [...];         <b>// Input array</b>
int[] expectedNums = [...]; <b>// The expected answer with correct length</b>

int k = removeDuplicates(nums); <b>// Calls your implementation</b>

assert k == expectedNums.length;
for (int i = 0; i < k; i++) {
    assert nums[i] == expectedNums[i];
}
</pre>

If all assertions pass, then your solution will be **accepted**.

#### Example 1

<pre>
<b>Input:</b> nums = [1,1,2]
<b>Output:</b> 2, nums = [1,2,_]
<b>Explanation:</b> Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
It does not matter what you leave beyond the returned k (hence they are underscores).
</pre>

#### Example 2

<pre>
<b>Input:</b> nums = [0,0,1,1,1,2,2,3,3,4]
<b>Output:</b> 5, nums = [0,1,2,3,4,_,_,_,_,_]
<b>Explanation:</b> Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4 respectively.
It does not matter what you leave beyond the returned k (hence they are underscores).
</pre>

#### Constraints

* <code>0 <= nums.length <= 3 * 10<sup>4</sup></code>
* `-100 <= nums[i] <= 100`
* `nums` is sorted in **non-decreasing** order.

---

**Source:** https://leetcode.com/problems/remove-duplicates-from-sorted-array/
