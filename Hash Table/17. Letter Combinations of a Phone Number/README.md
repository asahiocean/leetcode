## 17. Letter Combinations of a Phone Number

#### [Gist with solution](https://gist.github.com/asahiocean/864cf2d1e245dfcb96e014b626254fe5) • [Open problem](https://leetcode.com/problems/letter-combinations-of-a-phone-number)

-------

Given a string containing digits from ```2-9``` inclusive, return all possible letter combinations that the number could represent. Return the answer in **any order**.

A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

![thumb](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Telephone-keypad2.svg/200px-Telephone-keypad2.svg.png)

#### Example 1:
```swift
Input: digits = "23"
Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
```

#### Example 2:
```swift
Input: digits = ""
Output: []
```

#### Example 3:
```swift
Input: digits = "2"
Output: ["a","b","c"]
```

### Constraints:
```swift
0 <= digits.length <= 4
digits[i] is a digit in the range ['2', '9'].
```