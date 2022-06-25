import Foundation

// 665. Non-decreasing Array
// https://leetcode.com/problems/non-decreasing-array/

class Solution {
    func checkPossibility(_ n: [Int]) -> Bool {
        var val = 0, len = n.count
        for i in 0..<len-1 where n[i] > n[i+1] {
            val += 1
            if val > 1 || i > 0 && i < len-2 && (n[i-1] > n[i+1] && n[i] > n[i+2]) {
                return false
            }
        }
        return val <= 1
    }
}

// MARK: - Test cases -

class Tests {
    
    private typealias s = Solution
    
    static func testExample1() {
        let val = s().checkPossibility([4,2,3])
        print(val == true)
    }
    
    static func testExample2() {
        let val = s().checkPossibility([4,2,1])
        print(val == false)
    }
}

Tests.testExample1()
Tests.testExample2()
