import Foundation

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var left = 0
    var right = 0
    var sum = sequence[0]
    var answer = [-1, -1]
    while right < sequence.count {
        if sum < k {
            right += 1
            if right == sequence.count { break }
            sum += sequence[right]
        } else if sum > k {
            sum -= sequence[left]
            left += 1
            if left > right { right = left }
        } else {
            if right - left < answer[1] - answer[0] || answer == [-1, -1] {
                answer = [left, right]
            }
            right += 1
            if right == sequence.count { break }
            sum += sequence[right]
        }
    }
    return answer
}