let n = Int(readLine()!)!
var sum = 0
var i = 1
while i * i <= n {
    if n % i != 0 { 
        i += 1
        continue
    }
    sum += i
    if i * i < n { sum += n / i }
    i += 1
}
print(sum * 5 - 24)