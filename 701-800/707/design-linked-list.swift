import Foundation

// 707. Design Linked List
// https://leetcode.com/problems/design-linked-list/

class MyLinkedList {
    
    private var items: [Int]
    private var count: Int
    
    init() {
        self.items = []
        self.count = 0
    }
    
    func get(_ idx: Int) -> Int {
        return idx < 0 || idx > (count - 1) ? -1 : items[idx]
    }
    
    func addAtHead(_ val: Int) {
        count += 1
        items.insert(val, at: 0)
    }
    
    func addAtTail(_ val: Int) {
        count += 1
        items.append(val)
    }
    
    func addAtIndex(_ idx: Int, _ val: Int) {
        if idx < 0 || idx > count { return }
        count += 1
        idx == count ? items.append(val) : items.insert(val, at: idx)
    }
    
    func deleteAtIndex(_ idx: Int) {
        if idx < 0 || idx >= count { return }
        count -= 1
        items.remove(at: idx)
    }
}
