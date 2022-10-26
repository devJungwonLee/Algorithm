let s = readLine()!.map { Int(String($0))! }
var i = 0
var answer = 0
for num in 1... {
    let tmp = String(num).map { Int(String($0))! }
    for digit in tmp {
        if s[i] == digit {
            i += 1
            if i == s.count {
                answer = num
                break
            }
        }
    }
    if answer == num { break }
}
print(answer)
