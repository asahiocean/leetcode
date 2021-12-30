import Foundation

class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0, zero = 0
        while i < nums.count - zero {
            if nums[i] == 0 {
                zero += 1
                nums.append(0)
                nums.remove(at: i)
            } else {
                i += 1
            }
        }
    }
}

func tests() {
    let s = Solution()
    var example1 = [0,1,0,3,12]
    s.moveZeroes(&example1)
    assert(example1 == [1,3,12,0,0]) // good
    
    var example2 = [0]
    s.moveZeroes(&example2)
    assert(example2 == [0]) // good
}

tests()
