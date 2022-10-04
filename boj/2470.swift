let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var left = 0
var right = a.count - 1
var answerLeft = 0
var answerRight = a.count - 1
while left < right {
    let sum = a[left] + a[right]
    if abs(sum) < abs(a[answerLeft] + a[answerRight]) {
        answerLeft = left
        answerRight = right
    }
    if sum == 0 { break }
    if sum < 0 { left += 1 }
    else { right -= 1 }
}
print(a[answerLeft], a[answerRight])
