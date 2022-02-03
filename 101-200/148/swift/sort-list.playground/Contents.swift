import Foundation

// 148. Sort List
// https://leetcode.com/problems/sort-list/

class Solution {
    func sortList(_ head: ListNode?) -> ListNode? {
        guard  let head = head else { return nil }
        guard head.next != nil else { return head }
        
        var slow: ListNode? = head
        var fast: ListNode? = head
        var prev: ListNode?
        
        while fast?.next != nil {
            prev = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        prev?.next = nil
        
        return merge(sortList(head), sortList(slow))
    }
    
    private func merge(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var list1 = l1
        var list2 = l2
        let prevh = ListNode(-1)
        var curr = prevh
        
        while list1 != nil && list2 != nil {
            if list1!.val < list2!.val {
                curr.next = list1
                list1 = list1?.next
            } else {
                curr.next = list2
                list2 = list2?.next
            }
            curr = curr.next!
        }
        
        curr.next = (list1 != nil) ? list1 : list2
        return prevh.next
    }
}

// MARK: - ListNode -

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
