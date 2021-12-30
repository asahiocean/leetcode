### [475. Heaters](https://leetcode.com/problems/heaters/)

Winter is coming! During the contest, your first job is to design a standard heater with a fixed warm radius to warm all the houses.

Every house can be warmed, as long as the house is within the heater's warm radius range. 

Given the positions of houses and heaters on a horizontal line, return the minimum radius standard of heaters so that those heaters could cover all houses.

Notice that all the heaters follow your radius standard, and the warm radius will the same.

#### Example 1:
```swift
Input: houses = [1,2,3], heaters = [2]
Output: 1
Explanation: The only heater was placed in the position 2, and if we use the radius 1 standard, then all the houses can be warmed.
```

#### Example 2:
```swift
Input: houses = [1,2,3,4], heaters = [1,4]
Output: 1
Explanation: The two heater was placed in the position 1 and 4. We need to use radius 1 standard, then all the houses can be warmed.
```

#### Example 3:
```swift
Input: houses = [1,5], heaters = [2]
Output: 3
```

#### Constraints:
```swift
1 <= houses.length, heaters.length <= 3 * 104
1 <= houses[i], heaters[i] <= 109
```

### Solution
```swift
import Foundation

// https://leetcode.com/problems/heaters/

class Solution {
    func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
        var i = 0 // index
        var r = 0 // radius
        
        let heaters = heaters.sorted()
        
        for h in houses.sorted() {
            while i < heaters.count - 1 && (h * 2) >= heaters[i] + heaters[i+1] { i += 1 }
            r = max(r, abs(h - heaters[i]))
        }
        return r
    }
}

func tests() {
    let s = Solution()
    assert(s.findRadius([1,2,3], [2]) == 1)
    assert(s.findRadius([1,2,3,4], [1,4]) == 1)
    assert(s.findRadius([1,5], [2]) == 3)
}

tests()
```
