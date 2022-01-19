<h1>
6. Zigzag Conversion
<img src="https://tinyurl.com/mr3usu3v" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left" alt="swift">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard s.count > 1 && numRows > 1 else { return s }
        
        var lines = [[Character]](repeating: [], count: numRows)
        var idx = 0
        var flag = false
        
        for ch in s {
            lines[idx].append(ch)
            idx += flag ? -1 : 1
            guard idx == -1 || idx == numRows else { continue }
            idx += flag ? 2 : -2
            flag.toggle()
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

<h2>Description</h2>

<p>
The string <code>"PAYPALISHIRING"</code> is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

<pre>
P   A   H   N
A P L S I I G
Y   I   R
</pre>

And then read line by line: <code>"PAHNAPLSIIGYIR"</code>

Write the code that will take a string and make this conversion given a number of rows:

<pre>
string convert(string s, int numRows);
</pre>

</p>

<h4>Example 1</h4>

<pre>
<b>Input:</b> s = "PAYPALISHIRING", numRows = 3
<b>Output:</b> "PAHNAPLSIIGYIR"
</pre>

<h4>Example 2</h4>

<pre>
<b>Input:</b> s = "PAYPALISHIRING", numRows = 4
<b>Output:</b> "PINALSIGYAHRPI"
<b>Explanation:</b>
P     I    N
A   L S  I G
Y A   H R
P     I
</pre>

<h4>Example 3</h4>

<pre>
<b>Input:</b> s = "A", numRows = 1
<b>Output:</b> "A"
</pre>

<h4>Constraints</h4>

<ul>
<li><code>1 <= s.length <= 1000</code></li>
<li><code>s</code> consists of English letters (lower-case and upper-case), <code>','</code> and <code>'.'</code>.</li>
<li><code>1 <= numRows <= 1000</code></li>
</ul>

<hr>

<b>Source:</b> https://leetcode.com/problems/zigzag-conversion/