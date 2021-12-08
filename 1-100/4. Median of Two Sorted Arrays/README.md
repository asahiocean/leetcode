## 4. Median of Two Sorted Arrays <img src="https://visitor-badge.glitch.me/badge?page_id=https://github.com/asahiocean/LeetCode/tree/main/Array/4.%20Median%20of%20Two%20Sorted%20Arrays&left_color=black&right_color=yellow&left_text=views" alt="views" align="right">

🔗 **URL:** https://leetcode.com/problems/median-of-two-sorted-arrays/

✅ **Solutions:** [GitHub Gist](https://git.io/J1DkY) • [Pastebin](https://pastebin.com/6LmatwU9) • [ControlC](https://controlc.com/97a6c515) • [TextBin](https://textbin.net/apez7hs8td)

💡 **[Go to discuss on LeetCode](https://leetcode.com/problems/median-of-two-sorted-arrays/discuss/1134918/Swift:-Median-of-Two-Sorted-Arrays)**

---

### Description:

Given two sorted arrays ```nums1``` and ```nums2``` of size ```m``` and ```n``` respectively, return **the median** of the two sorted arrays.

#### Example 1:
```swift
Input: nums1 = [1,3], nums2 = [2]
Output: 2.00000
Explanation: merged array = [1,2,3] and median is 2.
```

#### Example 2:
```swift
Input: nums1 = [1,2], nums2 = [3,4]
Output: 2.50000
Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
```

#### Example 3:
```swift
Input: nums1 = [0,0], nums2 = [0,0]
Output: 0.00000
```

#### Example 4:
```swift
Input: nums1 = [], nums2 = [1]
Output: 1.00000
```

#### Example 5:
```swift
Input: nums1 = [2], nums2 = []
Output: 2.00000
```

#### Constraints:
```swift
nums1.length == m
nums2.length == n
0 <= m <= 1000
0 <= n <= 1000
1 <= m + n <= 2000
-106 <= nums1[i], nums2[i] <= 106
```
