<h1>
167. Two Sum II - Input Array Is Sorted
<img src="https://tinyurl.com/2p9x9jdz" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        let len = numbers.count
        guard len > 1 else { return [] }
        var left = 0, right = len - 1
        while left < right {
            switch numbers[left] + numbers[right] {
            case let val where val < target:
                left += 1
            case let val where val > target:
                right -= 1
            default:
                return [left + 1, right + 1]
            }
        }
        return []
    }
}
```

<p>
<a href="GITHUB_GIST_URL">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="LEECODE_PROBLEM_DISCUSS_URL">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

<h2>Description</h2>

Given an array of integers ```numbers``` that is already **sorted in ascending order**, find two numbers such that they add up to a specific **target** number.

Return the indices of the two numbers (**1-indexed**) as an integer array ```answer``` of size ```2```, where ```1 <= answer[0] < answer[1] <= numbers.length```.

You may assume that each input would have **exactly one solution** and you **may not** use the same element twice.

<h4>Example 1</h4>

<pre>
<b>Input:</b> numbers = [2,7,11,15], target = 9
<b>Output:</b> [1,2]
<b>Explanation:</b> The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> numbers = [2,3,4], target = 6
<b>Output:</b> [1,3]
</pre>

<h4>Example 3</h4>

<pre>
<b>Input:</b> numbers = [-1,0], target = -1
<b>Output:</b> [1,2]
</pre> 

#### Constraints:

<ul>
	<li><code>2 <= numbers.length <= 3 * 10<sup>4</sup></code></li>
	<li><code>-1000 <= numbers[i] <= 1000</code></li>
	<li><code>numbers</code> is sorted in <strong>non-decreasing order</strong>.</li>
	<li><code>-1000 <= target <= 1000</code></li>
	<li>The tests are generated such that there is <strong>exactly one solution</strong>.</li>
</ul>

<hr>

<b>Source:</b> https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/