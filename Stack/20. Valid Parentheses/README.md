# [20. Valid Parentheses](https://leetcode.com/problems/valid-parentheses/)

Given a string ```s``` containing just the characters ```'('```, ```')'```, ```'{'```, ```'}'```, ```'['``` and ```']'```, determine if the input string is valid.

An input string is valid if:
1. Open brackets must be closed by the same type of brackets.
2. Open brackets must be closed in the correct order.

#### Example 1:
```swift
Input: s = "()"
Output: true
```

#### Example 2:
```swift
Input: s = "()[]{}"
Output: true
```

#### Example 3:
```swift
Input: s = "(]"
Output: false
```

#### Example 4:
```swift
Input: s = "([)]"
Output: false
```

#### Example 5:
```swift
Input: s = "{[]}"
Output: true
```

#### Constraints:
```swift
1 <= s.length <= 104
s consists of parentheses only '()[]{}'.
```