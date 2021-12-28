<h1>
17. Letter Combinations of a Phone Number
<img src="https://tinyurl.com/yvmt728e" align="right" alt="views badge">
</h1>

<details>
<summary>
    <img src="https://git.io/JDE5D" height="24" align="left">
    <b>Solution</b>
</summary>

<br/>

```swift
class Solution {
    private let matrix: [Character:[Character]] = ["2":["a","b","c"],
                                                   "3":["d","e","f"],
                                                   "4":["g","h","i"],
                                                   "5":["j","k","l"],
                                                   "6":["m","n","o"],
                                                   "7":["p","q","r","s"],
                                                   "8":["t","u","v"],
                                                   "9":["w","x","y","z"]]
    func letterCombinations(_ digits: String) -> [String] {
        var result = [String](), digs = digits.map({Character($0.lowercased())})
        for num in digs {
            guard let chars = matrix[num] else { break }
            guard !(result.isEmpty) else {
                chars.forEach({ result.append("\($0)") })
                continue
            }
            
            let current = result
            result.removeAll()
            
            for ch in chars {
                result.append(contentsOf: current.map { $0 + "\(ch)" })
            }
        }
        return result
    }
}
```
    
<p>
<a href="https://gist.github.com/asahiocean/864cf2d1e245dfcb96e014b626254fe5">
<img src="https://git.io/JDNlC" alt="GitHub Gist" height="18" align="center">
</a>
<a href="https://leetcode.com/problems/letter-combinations-of-a-phone-number/discuss/1382543/">
<img src="https://git.io/JDSVA" alt="LeetCode Discuss" height="28" align="right">
</a>
</p>
    
</details>

<p align="center">• • •</p>

## Description

Given a string containing digits from ```2-9``` inclusive, return all possible letter combinations that the number could represent. Return the answer in **any order**.

A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

![thumb][thumb]

#### Example 1

<pre>
<b>Input:</b> digits = "23"
<b>Output:</b> ["ad","ae","af","bd","be","bf","cd","ce","cf"]
</pre>

#### Example 2

<pre>
<b>Input:</b> digits = ""
<b>Output:</b> []
</pre>

#### Example 3

<pre>
<b>Input:</b> digits = "2"
<b>Output:</b> ["a","b","c"]
</pre>

### Constraints

* ```0 <= digits.length <= 4```
* ```digits[i]``` is a digit in the range ```['2', '9']```.

---

**Source:** https://leetcode.com/problems/letter-combinations-of-a-phone-number/

<!-- URLs -->

[thumb]: https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Telephone-keypad2.svg/200px-Telephone-keypad2.svg.png
