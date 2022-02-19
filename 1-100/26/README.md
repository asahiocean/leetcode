<h1>
26. Remove Duplicates from Sorted Array
<img src="https://tinyurl.com/5n6pacuu" align="right" alt="views badge">
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

<h2>Description</h2>

<p>
Given an integer array <code>nums</code> sorted in <b>non-decreasing order</b>, remove the duplicates <a href="https://en.wikipedia.org/wiki/In-place_algorithm"><b>in-place</b></a> such that each unique element appears only <b>once</b>. The <b>relative order</b> of the elements should be kept the <b>same</b>.

Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the <b>first part</b> of the array <code>nums</code>. More formally, if there are <code>k</code> elements after removing the duplicates, then the first <code>k</code> elements of <code>nums</code> should hold the final result. It does not matter what you leave beyond the first <code>k</code> elements.

Return <code>k</code> <em>after placing the final result in the first</em> <code>k</code> <em>slots of</em> <code>nums</code>.

Do <b>not</b> allocate extra space for another array. You must do this by <b>modifying the input array <a href="https://en.wikipedia.org/wiki/In-place_algorithm">in-place</a></b> with O(1) extra memory.</p>

<h4>Custom Judge</h4>

<p>The judge will test your solution with the following code:</p>

<pre>
int[] nums = [...];         // Input array
int[] expectedNums = [...]; // The expected answer with correct length

int k = removeDuplicates(nums); // Calls your implementation

assert k == expectedNums.length;
for (int i = 0; i < k; i++) {
    assert nums[i] == expectedNums[i];
}
</pre>

<p>If all assertions pass, then your solution will be <b>accepted</b>.</p>

<h4>Example 1</h4>

<pre>
<b>Input:</b> nums = [1,1,2]
<b>Output:</b> 2, nums = [1,2,_]
<b>Explanation:</b> Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
It does not matter what you leave beyond the returned k (hence they are underscores).
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> nums = [0,0,1,1,1,2,2,3,3,4]
<b>Output:</b> 5, nums = [0,1,2,3,4,_,_,_,_,_]
<b>Explanation:</b> Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4 respectively.
It does not matter what you leave beyond the returned k (hence they are underscores).
</pre>

<h4>Constraints</h4>

<ul>
<li><code>0 <= nums.length <= 3 * 10<sup>4</sup></code></li>
<li><code>-100 <= nums[i] <= 100</code></li>
<li><code>nums</code> is sorted in <b>non-decreasing</b> order.</li>
</ul>

<hr>

<b>Source:</b> https://leetcode.com/problems/remove-duplicates-from-sorted-array/