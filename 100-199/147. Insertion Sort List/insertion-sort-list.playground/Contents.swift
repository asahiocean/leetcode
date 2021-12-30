import Foundation

// 147. Insertion Sort List
// https://leetcode.com/problems/insertion-sort-list/

class Solution {
    func insertionSortList(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode()
        var current: ListNode? = head
        while current != nil {
            var prev: ListNode? = dummy
            var next: ListNode? = dummy.next
            while next != nil, current!.val > next!.val {
                prev = prev?.next
                next = next?.next
            }
            let temp = current?.next
            current?.next = next
            prev?.next = current
            current = temp
        }
        return dummy.next
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
