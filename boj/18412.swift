let input = readLine()!.split(separator: " ").map { Int($0)! }
let s = readLine()!.map { String($0) }
var a = [String]()
var result = ""
for i in 1...(s.count + 1) {
    if (input[1]...input[2]) ~= i { a.append(s[i-1]) }
    else {
        if i == input[2] + 1 {
            while let last = a.popLast() { result += last }
        }
        if i <= s.count { result += s[i-1] }
    }
}
print(result)