import Foundation

let n = Int(readLine()!)!
let s = readLine()!.map { String($0) }
let numbers = s.indices.filter { $0%2 == 0 }.map { Int(s[$0])! }
let operators = s.indices.filter { $0%2 == 1}.map { s[$0] }
var answer = Int.min

func dfs(_ numbers: [Int], _ operators: [String]) {
    if operators.isEmpty {
        answer = max(answer, numbers[0])
        return
    }
    for i in operators.indices {
        let left = numbers[i]
        let right = numbers[i+1]
        let op = operators[i]
        var result = 0
        switch op {
        case "+": result = left + right
        case "-": result = left - right
        case "*": result = left * right
        default: break
        }
        var nextNumbers = numbers
        nextNumbers.remove(at: i)
        nextNumbers.remove(at: i)
        nextNumbers.insert(result, at: i)
        var nextOperators = operators
        nextOperators.remove(at: i)
        dfs(nextNumbers, nextOperators)
    }
}

dfs(numbers, operators)
print(answer)