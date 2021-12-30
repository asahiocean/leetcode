import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
        let prevgag = ListNode(0), postgag = ListNode(0)
        var prev = prevgag, post = postgag
        
        var node: ListNode? = head
        
        while node != nil {
            let next = node!.next
            node!.next = nil
            
            if node!.val < x {
                prev.next = node
                prev = prev.next!
            } else {
                post.next = node
                post = post.next!
            }
            node = next
        }
        prev.next = postgag.next
        return prevgag.next
    }
}

func tests() {
    let s = Solution()
    for item in [1,4,3,2,5,2] {
        assert((s.partition(.init(item), 3) != nil))
    }
    
}
tests()
