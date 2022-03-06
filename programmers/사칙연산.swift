import Foundation

var maxValue = Int.max
var minValue = Int.min
var dMin = [[Int]]()
var dMax = [[Int]]()
var nums = [Int]()
var ops = [String]()

func isOperator(_ s: String) -> Bool {
    return s == "+" || s == "-"
}

func solution(_ input_array: [String]) -> Int {
    nums = input_array.filter { !isOperator($0) }.map { Int($0)! }
    ops = input_array.filter { isOperator($0) }
    dMin = [[Int]](repeating: [Int](repeating: maxValue, count: nums.count), count: nums.count)
    dMax = [[Int]](repeating: [Int](repeating: minValue, count: nums.count), count: nums.count)
    for diff in 0..<nums.count {
        for start in 0..<(nums.count - diff) {
            let end = start + diff
            if diff == 0 {
                dMax[start][end] = nums[start]
                dMin[start][end] = nums[start]
            } else {
                for mid in (start+1)...end {
                    if ops[mid-1] == "+" {
                        dMax[start][end] = max(dMax[start][end], dMax[start][mid-1] + dMax[mid][end])
                        dMin[start][end] = min(dMin[start][end], dMin[start][mid-1] + dMin[mid][end])
                    } else {
                        dMax[start][end] = max(dMax[start][end], dMax[start][mid-1] - dMin[mid][end])
                        dMin[start][end] = min(dMin[start][end], dMin[start][mid-1] - dMax[mid][end])
                    }
                }
            }
        }
    }
    return dMax[0][nums.count-1]
}