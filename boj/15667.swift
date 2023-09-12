let n = Int(readLine()!)!
for i in 1...n {
    if 1 + i + i * i == n {
        print(i)
        break
    }
}