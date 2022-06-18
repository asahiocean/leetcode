import Foundation

// 745. Prefix and Suffix Search
// https://leetcode.com/problems/prefix-and-suffix-search/

class WordFilter {

    private class Node {
        var chr: Character, ids = [Int](), nds = [Node]()
        init(_ char: Character) {
            self.chr = char
        }
    }
    
    private var pref: Node
    private var suff: Node
    private var dict: [String: [String: Int]]

    init(_ words: [String]) {
        self.pref = Node("?")
        self.suff = Node("?")
        self.dict = [:]
        for i in words.indices {
            let word = Array(words[i]), lnw = word.count
            var prf = pref, suf = suff
            for j in 0..<lnw {
                var pfn: Node?, sfn = pfn
                for n in prf.nds where n.chr == word[j] { pfn = n }
                for n in suf.nds where n.chr == word[lnw - 1 - j] { sfn = n }
                if pfn == nil {
                    let npf = Node(word[j])
                    prf.nds.append(npf)
                    prf = npf
                } else {
                    prf = pfn!
                }
                prf.ids.append(i)
                if sfn == nil {
                    let nsf = Node(word[lnw - 1 - j])
                    suf.nds.append(nsf)
                    suf = nsf
                } else {
                    suf = sfn!
                }
                suf.ids.append(i)
            }
        }
    }
    
    func f(_ p: String, _ s: String) -> Int {
        if let val = dict[p]?[s] { return val }
        var pfi = [Int](), sfi = pfi, node: Node? = pref
        ppf: for i in p.indices {
            for n in node!.nds where n.chr == p[i] {
                node = n
                continue ppf
            }
            node = nil
            break
        }
        if node != nil { pfi = node!.ids }
        node = suff
        let asf = Array(s), lsf = s.count
        psf: for i in 0..<lsf {
            for n in node!.nds where n.chr == asf[lsf - 1 - i] {
                node = n
                continue psf
            }
            node = nil
            break
        }
        if node != nil { sfi = node!.ids }
        let arr = Array(Set(pfi).intersection(Set(sfi))).sorted(by: >)
        let res = arr.isEmpty ? -1 : arr[0]
        dict[p, default: [:]][s] = res
        return res
    }
}
