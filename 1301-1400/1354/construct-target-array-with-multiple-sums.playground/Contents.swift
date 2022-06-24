import Foundation

// 1354. Construct Target Array With Multiple Sums
// https://leetcode.com/problems/construct-target-array-with-multiple-sums/

class Solution {
    func isPossible(_ t: [Int]) -> Bool {
        guard !t.isEmpty else { return false }
        let heap = Heap<Int>(with: >)
        var sum = 0
        for i in t.indices {
            let val = t[i]
            heap.enqueue(val)
            sum += val
        }
        while true {
            let val = heap.dequeue()!
            sum -= val
            if val == 1 || sum == 1 { return true }
            if sum == 0 || sum >= val { return false }
            let res = val % sum
            guard res != 0 else { return false }
            heap.enqueue(res)
            sum += res
        }
    }
}

class Heap<T> {
    
    private var arr = [T]()
    private let pri: (T, T) -> Bool
    
    init(with priority: @escaping (T, T) -> Bool) {
        self.pri = priority
    }
    
    private func peek() -> T? {
        return arr.first
    }
    
    func enqueue(_ el: T) {
        arr.append(el)
        heapifyUp(arr.count - 1)
    }
    
    func dequeue() -> T? {
        guard !arr.isEmpty else { return nil }
        arr.swapAt(0, arr.count - 1)
        let elem = arr.removeLast()
        if !arr.isEmpty { heapifyDown(0) }
        return elem
    }
    
    /// Higher priority
    private func hrp(_ l: Int, _ r: Int) -> Bool {
        return pri(arr[l], arr[r])
    }
    
    /// Higher priority index
    private func hrpi(_ ic: Int, _ ip: Int) -> Int {
        return ic < arr.count && hrp(ic, ip) ? ic : ip
    }
    
    /// Highest priority index
    private func hspi(_ p: Int, _ l: Int, _ r: Int) -> Int {
        return hrpi(l, hrpi(r, p))
    }
    
    private func heapifyUp(_ i: Int) {
        let par = (i - 1) / 2
        guard i != 0, hrp(i, par) else { return }
        arr.swapAt(i, par)
        heapifyUp(par)
    }
    
    private func heapifyDown(_ i: Int) {
        let ich = hspi(i, i*2+1, i*2+2)
        guard ich != i else { return }
        arr.swapAt(ich, i)
        heapifyDown(ich)
    }
}
