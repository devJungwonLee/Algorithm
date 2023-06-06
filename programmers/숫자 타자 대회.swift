import Foundation

let costs = [
    [1, 7, 6, 7, 5, 4, 5, 3, 2, 3],
    [7, 1, 2, 4, 2, 3, 5, 4, 5, 6],
    [6, 2, 1, 2, 3, 2, 3, 5, 4, 5],
    [7, 4, 2, 1, 5, 3, 2, 6, 5, 4],
    [5, 2, 3, 5, 1, 2, 4, 2, 3, 5],
    [4, 3, 2, 3, 2, 1, 2, 3, 2, 3],
    [5, 5, 3, 2, 4, 2, 1, 5, 3, 2],
    [3, 4, 5, 6, 2, 3, 5, 1, 2, 4],
    [2, 5, 4, 5, 3, 2, 3, 2, 1, 2],
    [3, 6, 5, 4, 5, 3, 2, 4, 2, 1],
]

var d = [[[Int]]]()
var integers = [Int]()

func findMin(_ index: Int, _ left: Int, _ right: Int) -> Int {
    if index == integers.count { return 0 }
    if d[index][left][right] > 0 { return d[index][left][right] }
    let number = integers[index]
    let leftCost = costs[left][number]
    let rightCost = costs[right][number]
    if leftCost == 1 {
        d[index][left][right] = findMin(index + 1, number, right) + 1
    } else if rightCost == 1 {
        d[index][left][right] = findMin(index + 1, left, number) + 1
    } else {
        let leftResult = findMin(index + 1, number, right) + leftCost
        let rightResult = findMin(index + 1, left, number) + rightCost
        d[index][left][right] = min(leftResult, rightResult)
    }
    return d[index][left][right]
}

func solution(_ numbers:String) -> Int {
    integers = numbers.map { Int(String($0))! }
    d = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: 10), count: 10), count: integers.count)
    return findMin(0, 4, 6)
}