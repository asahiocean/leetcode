import Foundation

// 1845. Seat Reservation Manager
// https://leetcode.com/problems/seat-reservation-manager/

class SeatManager {
    
    private var val: Int
    private var heap: Heap<Int>
    
    init(_ n: Int) {
        self.val = 0
        self.heap = Heap<Int>(sort: <)
    }
    
    func reserve() -> Int {
        if !heap.isEmpty { return heap.remove()! }
        val += 1
        return val
    }
    
    func unreserve(_ seatNumber: Int) {
        heap.insert(seatNumber)
    }
}

struct Heap<T> {
    
    internal typealias Id = Int
    
    private var nodes: [T] = []
    private var isOrder: (T, T) -> Bool
    
    public init(sort: @escaping (T, T) -> Bool) { isOrder = sort }
    
    public var isEmpty: Bool { return nodes.isEmpty }
    public var lastId: Id { return nodes.count }
    
    private func idPar(_ i: Id) -> Id { return (i - 1) / 2 }
    private func idLhs(_ i: Id) -> Id { return 2 * i + 1 }
    private func idRhs(_ i: Id) -> Id { return 2 * i + 2 }
    
    public mutating func insert(_ value: T) {
        nodes.append(value)
        heapifyUp(nodes.count - 1)
    }
    
    public mutating func remove(at id: Id = 0) -> T? {
        if id < 0 && lastId - 1 <= id { return nil }
        let temp = nodes[id]
        nodes[id] = nodes[lastId - 1]
        nodes.removeLast()
        shiftDown(id)
        return temp
    }
    
    private mutating func heapifyUp(_ id: Id) {
        var idch = id, idp = idPar(id)
        let child = nodes[idch]
        while idch > 0 && isOrder(child, nodes[idp]) {
            nodes[idch] = nodes[idp]
            idch = idp
            idp = idPar(idch)
        }
        nodes[idch] = child
    }
    
    /// S – heap size
    private mutating func heapifyDown(_ id: Id, _ S: Int) {
        var idP = id
        while true {
            let idL = idLhs(idP), idR = idRhs(idP)
            var first = idP
            if idL < S && isOrder(nodes[idL], nodes[first]) { first = idL }
            if idR < S && isOrder(nodes[idR], nodes[first]) { first = idR }
            if first == idP { return }
            nodes.swapAt(idP, first)
            idP = first
        }
    }
    
    internal mutating func shiftDown(_ idx: Id) { heapifyDown(idx, nodes.count) }
}
