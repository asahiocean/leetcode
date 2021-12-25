import Foundation

// 82. Remove Duplicates from Sorted List II
// https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        if head == nil || head!.next == nil { return head }
        
        let dummy = ListNode(0)
        dummy.next = head
        var node = dummy
        
        while node.next != nil && node.next!.next != nil {
            switch node.next!.val == node.next!.next!.val {
            case true:
                let val = node.next!.val
                while node.next != nil && node.next!.val == val {
                    node.next = node.next!.next
                }
            default:
                node = node.next!
            }
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
