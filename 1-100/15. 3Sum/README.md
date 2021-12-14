## [15. 3Sum](https://leetcode.com/problems/3sum/)

[Solution](https://gist.github.com/asahiocean/ad5b43fc2fefa424cbd627395fd3b157) • [Discuss](https://leetcode.com/problems/3sum/discuss/1144266/Swift%3A-3Sum)

<hr>

### Description:

Given an integer array nums, return all the triplets ```[nums[i], nums[j], nums[k]]``` such that ```i != j```, ```i != k```, and ```j != k```, and ```nums[i] + nums[j] + nums[k] == 0```.

Notice that the solution set must not contain duplicate triplets.

#### Example 1:
```swift
Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
```

#### Example 2:
```swift
Input: nums = []
Output: []
```

#### Example 3:
```swift
Input: nums = [0]
Output: []
``` 

#### Constraints:
```swift
0 <= nums.length <= 3000
-105 <= nums[i] <= 105
```
