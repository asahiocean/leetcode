import Foundation

// 409. Longest Palindrome
// https://leetcode.com/problems/longest-palindrome/

class Solution {
    func longestPalindrome(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        var res = 0, set = Set<Character>()
        for ch in s {
            if set.contains(ch) {
                res += 2
                set.remove(ch)
            } else {
                set.insert(ch)
            }
        }
        return !set.isEmpty ? res + 1 : res
    }
}

// MARK: - Test cases -

// Result: Executed 3 tests, with 0 failures (0 unexpected) in 0.006 (0.008) seconds

class Tests {
    
    private typealias sol = Solution
    
    // One longest palindrome that can be built is "dccaccd", whose length is 7.
    static func testExample1() {
        let val = sol().longestPalindrome("abccccdd")
        print(val == 7)
    }
    
    static func testExample2() {
        let val = sol().longestPalindrome("a")
        print(val == 1)
    }
    
    static func testExample3() {
        let val = sol().longestPalindrome("bb")
        print(val == 2)
    }
}

Tests.testExample1()
Tests.testExample2()
Tests.testExample3()
