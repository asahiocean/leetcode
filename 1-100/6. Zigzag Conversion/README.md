## 6. Zigzag Conversion <img src="https://visitor-badge.glitch.me/badge?page_id=https://github.com/asahiocean/LeetCode/tree/main/String/6.%20Zigzag%20Conversion&left_color=black&right_color=yellow&left_text=views" alt="views" align="right">

🔗 **URL:** https://leetcode.com/problems/zigzag-conversion/

✅ **Solutions:** [GitHub Gist](https://git.io/JMYkm) • [Pastebin](https://pastebin.com/aAXWzFVi) • [ControlC](https://controlc.com/ed5ed1ac) • [TextBin](https://textbin.net/pdfgdkyqsj)

---

### Description

The string ```"PAYPALISHIRING"``` is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
```swift
P   A   H   N
A P L S I I G
Y   I   R
```
And then read line by line: ```"PAHNAPLSIIGYIR"```

Write the code that will take a string and make this conversion given a number of rows:
```swift
string convert(string s, int numRows);
```

#### Example 1:
```swift
Input: s = "PAYPALISHIRING", numRows = 3
Output: "PAHNAPLSIIGYIR"
```

#### Example 2:
```swift
Input: s = "PAYPALISHIRING", numRows = 4
Output: "PINALSIGYAHRPI"
Explanation:
P     I    N
A   L S  I G
Y A   H R
P     I
```

#### Example 3:
```swift
Input: s = "A", numRows = 1
Output: "A"
``` 

#### Constraints:
```swift
1 <= s.length <= 1000
s consists of English letters (lower-case and upper-case), ',' and '.'.
1 <= numRows <= 1000
```
