<h2>
6. Zigzag Conversion
<img src="https://tinyurl.com/39hvyaxx" align="right" alt="views badge">
</h2>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        
        var lines = [[Character]](repeating: [], count: numRows)
        var index: Int = 0
        var flag: Bool = false
        
        for ch in s {
            lines[index].append(ch)
            if flag {
                index -= 1
                if index == -1 {
                    flag = false
                    index += 2
                }
            } else {
                index += 1
                if index == numRows {
                    flag = true
                    index -= 2
                }
            }
        }
        return lines.map { String($0) }.joined()
    }
}
```

<p>
<a href="https://gist.github.com/asahiocean/af4d0ae056750b09ea58e67c72d066c9">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/zigzag-conversion/discuss/1597244">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

The string ```"PAYPALISHIRING"``` is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

```
P   A   H   N
A P L S I I G
Y   I   R
```

And then read line by line: ```"PAHNAPLSIIGYIR"```

Write the code that will take a string and make this conversion given a number of rows:

```
string convert(string s, int numRows);
```

#### Example 1

```
Input: s = "PAYPALISHIRING", numRows = 3
Output: "PAHNAPLSIIGYIR"
```

#### Example 2

```
Input: s = "PAYPALISHIRING", numRows = 4
Output: "PINALSIGYAHRPI"
Explanation:
P     I    N
A   L S  I G
Y A   H R
P     I
```

#### Example 3

```
Input: s = "A", numRows = 1
Output: "A"
``` 

#### Constraints

```
1 <= s.length <= 1000
s consists of English letters (lower-case and upper-case), ',' and '.'.
1 <= numRows <= 1000
```

---

**Source:** https://leetcode.com/problems/zigzag-conversion/