import Foundation

// 82. Remove Duplicates from Sorted List II
// https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/

class Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        if let headNode = head, headNode.next == nil { return headNode }
        
        let dummy = ListNode(0)
        dummy.next = head
        var node = dummy
        
        while let nn = node.next, nn.next != nil {
            if nn.val == nn.next!.val {
                while node.next != nil && nn.val == node.next!.val {
                    node.next = node.next!.next
                }
            } else {
                node = nn
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
