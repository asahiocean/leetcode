import Foundation

// 4. Median of Two Sorted Arrays
// https://leetcode.com/problems/median-of-two-sorted-arrays/

class Solution {
    func findMedianSortedArrays(_ n1: [Int], _ n2: [Int]) -> Double {
        let ln1 = n1.count, ln2 = n2.count
        var arr = [Int](repeating: 0, count: ln1 + ln2)
        var val = (a: ln1 - 1, b: ln2 - 1, c: ln1 + ln2 - 1)
        
        while val.c >= 0 {
            if val.b < 0 || val.a >= 0 && n1[val.a] > n2[val.b] {
                arr[val.c] = n1[val.a]
                val.a = (val.a - 1)
            } else {
                arr[val.c] = n2[val.b]
                val.b = (val.b - 1)
            }
            val.c = val.c - 1
        }
        let half = arr.count / 2, mid = arr[half]
        return half % 2 == 0 ? .init(arr[half-1] + mid) / 2 : .init(mid)
    }
}

// Playground and test cases: https://leetcode.com/playground/Hyb8uvA5
