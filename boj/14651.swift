let n = Int(readLine()!)!
if n == 1 { print("0") }
else if n == 2 { print("2") }
else {
    var answer = 2
    for _ in 0..<(n-2) {
        answer = answer * 3 % 1000000009
    }
    print(answer)
}