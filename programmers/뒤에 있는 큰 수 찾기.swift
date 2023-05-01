import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var stack = [Int]()
    var answer = [Int](repeating: -1, count: numbers.count)
    
    for i in 0..<numbers.count {
        while let top = stack.last, numbers[top] < numbers[i] {
            answer[top] = numbers[i]
            stack.removeLast()
        }
        stack.append(i)
    }
    return answer
}