import Foundation

// 23. Merge k Sorted Lists
// https://leetcode.com/problems/merge-k-sorted-lists/

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var sorted = [Int]()
        for list in lists.compactMap ({ $0 }) {
            var head: ListNode? = list
            while head != nil {
                sorted.append(head!.val)
                head = head?.next
            }
        }
        sorted.sort()
        if sorted.isEmpty { return nil }
        
        let node = ListNode(0)
        var curr = ListNode(sorted[0])
        node.next = curr

        for n in sorted.dropFirst() {
            let tmp: ListNode? = ListNode(n)
            curr.next = tmp
            if let next = curr.next { curr = next }
        }
        return node.next
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
