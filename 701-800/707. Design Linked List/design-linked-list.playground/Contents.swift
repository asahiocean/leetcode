import Foundation

// 707. Design Linked List
// https://leetcode.com/problems/design-linked-list/

class MyLinkedList {
    
    private var items: [Int] = []
    private var count: Int = 0
    
    init() {
        
    }
    
    func get(_ index: Int) -> Int {
        return index < 0 || index > (count - 1) ? -1 : items[index]
    }
    
    func addAtHead(_ val: Int) {
        count += 1
        items.insert(val, at: 0)
    }
    
    func addAtTail(_ val: Int) {
        count += 1
        items.append(val)
    }
    
    func addAtIndex(_ index: Int, _ val: Int) {
        if index < 0 || index > count { return }
        count += 1
        index == count ? items.append(val) : items.insert(val, at: index)
    }
    
    func deleteAtIndex(_ index: Int) {
        if index < 0 || index >= count { return }
        count -= 1
        items.remove(at: index)
    }
}

/**
 * Your MyLinkedList object will be instantiated and called as such:
 * let obj = MyLinkedList()
 * let ret_1: Int = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index, val)
 * obj.deleteAtIndex(index)
 */
