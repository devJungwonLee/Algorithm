let input = readLine()!.split(separator: " ").map { Int($0)! }
var multiples = input
var answer = 0
while true {
    let minValue = multiples.min()!
    let index = multiples.firstIndex { $0 == minValue }!
    let count = input.filter { minValue % $0 == 0 }.count
    if count >= 3 {
        answer = minValue
        break
    }
    multiples[index] += input[index]
}
print(answer)