import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let queue = queue1 + queue2
    let total = queue.reduce(0, +)
    var sum = queue1.reduce(0, +)
    var left = 0
    var right = queue1.count
    var cnt = 0
    print(total)
    while right < queue.count {
        if 2 * sum == total { break }
        if 2 * sum < total { 
            sum += queue[right]
            right += 1
        } else {
            sum -= queue[left]
            left += 1
        }
        cnt += 1
    }
    if right == queue.count { return -1 }
    return cnt
}
