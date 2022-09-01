var num = UInt64(readLine()!)!
var answer = 64
while num % 2 == 0 {
    answer -= 1
    num /= 2
}
print(answer)