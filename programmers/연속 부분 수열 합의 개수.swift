import Foundation

func solution(_ elements:[Int]) -> Int {
    var s = Set<Int>()
    let n = elements.count
    var startSum = 0
    for k in 1...n {
        startSum += elements[k-1]
        var sum = startSum
        var left = 0
        var right = left + k - 1
        while left < n {
            s.insert(sum)
            sum -= elements[left]
            left += 1
            right = (right + 1) % n
            sum += elements[right]
        }
    }
    return s.count
}