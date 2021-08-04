import Foundation

// 496. Next Greater Element I
// https://leetcode.com/problems/next-greater-element-i/

class Solution {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var stack = [Int](), dict = [Int:Int]()
        nums2.forEach {
            while !stack.isEmpty && stack.last! < $0 {
                dict[stack.removeLast()] = $0
            }
            stack.append($0)
        }
        return nums1.map { dict[$0] ?? -1 }
    }
}
