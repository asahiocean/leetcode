<h1>
27. Remove Element
<img src="https://tinyurl.com/dfbaz7wn" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums = nums.filter { $0 != val }
        return nums.count
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/4ebb33d184627e51be46e5328bcc8154">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/remove-element/discuss/1656827/">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

Given an integer array `nums` and an integer `val`, remove all occurrences of `val` in `nums` [**in-place**](https://en.wikipedia.org/wiki/In-place_algorithm). The relative order of the elements may be changed.

Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the **first part** of the array `nums`. More formally, if there are `k` elements after removing the duplicates, then the first `k` elements of `nums` should hold the final result. It does not matter what you leave beyond the first `k` elements.

Return `k` _after placing the final result in the first_ `k` _slots of_ `nums`.

Do **not** allocate extra space for another array. You must do this by **modifying the input array [in-place](https://en.wikipedia.org/wiki/In-place_algorithm)** with O(1) extra memory.

#### Custom Judge

The judge will test your solution with the following code:

<pre>
int[] nums = [...]; <b>// Input array</b>
int val = ...;      <b>// Value to remove</b>
int[] expectedNums = [...]; <b>// The expected answer with correct length.</b>
                            <b>// It is sorted with no values equaling val.</b>

int k = removeElement(nums, val); <b>// Calls your implementation</b>

assert k == expectedNums.length;
sort(nums, 0, k); <b>// Sort the first k elements of nums</b>
for (int i = 0; i < actualLength; i++) {
    assert nums[i] == expectedNums[i];
}
</pre>

If all assertions pass, then your solution will be **accepted**.

#### Example 1

<pre>
<b>Input:</b> nums = [3,2,2,3], val = 3
<b>Output:</b> 2, nums = [2,2,_,_]
<b>Explanation:</b> Your function should return k = 2, with the first two elements of nums being 2.
It does not matter what you leave beyond the returned k (hence they are underscores).
</pre>

#### Example 2

<pre>
<b>Input:</b> nums = [0,1,2,2,3,0,4,2], val = 2
<b>Output:</b> 5, nums = [0,1,4,0,3,_,_,_]
<b>Explanation:</b> Your function should return k = 5, with the first five elements of nums containing 0, 0, 1, 3, and 4.
Note that the five elements can be returned in any order.
It does not matter what you leave beyond the returned k (hence they are underscores).
</pre>

#### Constraints

* `0 <= nums.length <= 100`
* `0 <= nums[i] <= 50`
* `0 <= val <= 100`

---

**Source:** https://leetcode.com/problems/remove-element/
