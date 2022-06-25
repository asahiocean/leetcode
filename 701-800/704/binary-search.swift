import Foundation

// 704. Binary Search
// https://leetcode.com/problems/binary-search/

class Solution {
    func search(_ n: [Int], _ t: Int) -> Int {
        var lhs = 0, rhs = n.count - 1
        while lhs <= rhs {
            let mid = lhs + (rhs - lhs) / 2, nmid = n[mid]
            guard nmid != t else { return mid }
            nmid > t ? (rhs = mid - 1) : (lhs = mid + 1)
        }
        return -1
    }
}

// MARK: - Test cases -

class Tests {
    
    private typealias s = Solution
    
    // 9 exists in nums and its index is 4
    static func testExample1() {
        let val = s().search([-1,0,3,5,9,12], 9)
        print(val == 4)
    }
    
    // 2 does not exist in nums so return -1
    static func testExample2() {
        let val = s().search([-1,0,3,5,9,12], 2)
        print(val == -1)
    }
}

Tests.testExample1()
Tests.testExample2()