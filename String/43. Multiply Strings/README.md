### [43. Multiply Strings](https://leetcode.com/problems/multiply-strings/)

Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.

**Note:** You must not use any built-in BigInteger library or convert the inputs to integer directly.

### Example 1:
```swift
Input: num1 = "2", num2 = "3"
Output: "6"
```

#### Example 2:
```swift
Input: num1 = "123", num2 = "456"
Output: "56088"
``` 

#### Constraints:
```swift
1 <= num1.length, num2.length <= 200
num1 and num2 consist of digits only.
Both num1 and num2 do not contain any leading zero, except the number 0 itself.
```

### Solution
```swift
import Foundation

class Solution {
    func multiply(_ num1: String, _ num2: String) -> String {
        let num1 = num1.reversed(), num2 = num2.reversed()
        var arr = Array(repeating: 0, count: num1.count + num2.count)
        var result = ""
        
        for (i,ch1) in num1.enumerated() {
            
            guard let d1 = Int(String(ch1)) else { fatalError("num1") }
            
            for (j, ch2) in num2.enumerated() {
                guard let d2 = Int(String(ch2)) else { fatalError("num2") }
                arr[i + j] += d1 * d2
            }
        }
        
        for i in arr.indices {
            let n = arr[i]
            arr[i] = n % 10
            if i < arr.count - 1 { arr[i + 1] += n / 10 }
            result = "\(arr[i])" + result
        }
        
        while !result.isEmpty && result.first == "0" { result.removeFirst() }
        return result.isEmpty ? "0" : result
        
    }
}

func tests() {
    let s = Solution()
    assert(s.multiply("2", "3") == "6")
    assert(s.multiply("123", "456") == "56088")
}

tests()
```
