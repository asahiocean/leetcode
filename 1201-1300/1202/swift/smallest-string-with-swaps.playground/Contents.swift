import Foundation

// 1202. Smallest String With Swaps
// https://leetcode.com/problems/smallest-string-with-swaps/

class Solution {
    func smallestStringWithSwaps(_ s: String, _ pairs: [[Int]]) -> String {
        let unionFind = UnionFind(s.count)
        typealias Swaps = (nodes: [Int], chars: [Character])
        var res = Array(s), vis = Set<Int>(), sn = [Int:Swaps]()
        for p in pairs where !unionFind.match(p[0], p[1]) {
            unionFind.union(p[0], p[1])
            vis.insert(p[0])
            vis.insert(p[1])
        }
        for i in 0..<s.count where vis.contains(i) {
            let node = unionFind.find(i)
            if sn[node] == nil { sn[node] = ([],[]) }
            sn[node]?.nodes.append(i)
            sn[node]?.chars.append(res[i])
        }
        sn.forEach {
            let sort = $1.chars.sorted()
            var idx = 0
            for i in $1.nodes {
                res[i] = sort[idx]
                idx += 1
            }
        }
        return String(res)
    }
}

class UnionFind {
    
    private var arr: [Int]
    
    init(_ size: Int) {
        arr = [Int](0..<size)
    }
    func find(_ n: Int) -> Int {
        var val = n, num = n
        while arr[num] != num { num = arr[num] }
        while arr[val] != val {
            let old = arr[val]
            arr[val] = num
            val = old
        }
        return val
    }
    func union(_ x: Int, _ y: Int) { arr[find(x)] = find(y) }
    func match(_ x: Int, _ y: Int) -> Bool { find(x) == find(y) }
}
