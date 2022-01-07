import Foundation

// 382. Linked List Random Node
// https://leetcode.com/problems/linked-list-random-node/

class Solution {
    
    private var head: ListNode?
    
    init(_ head: ListNode?) {
        self.head = head
    }
    
    func getRandom() -> Int {
        var cnt = 0
        var node: ListNode?
        var current = head
        while nil != current {
            cnt += 1
            if cnt == 1 || Int.random(in: (0...cnt  - 1)) == 0 {
                node = current
            }
            current = current?.next
        }
        return node!.val
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(head)
 * let ret_1: Int = obj.getRandom()
 */
