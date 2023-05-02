let t = Int(readLine()!)!
for _ in 0..<t {
    let _ = Int(readLine()!)!
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    var sum = [Int](repeating: 0, count: numbers.count)
    var answer = -1000000
    for i in 0..<numbers.count {
        let number = numbers[i]
        if i == 0 {
            sum[i] = number
            let temp = sum[i]
            answer = max(answer, temp)
        } else {
            sum[i] = sum[i-1] + number
            var temp = sum[i]
            answer = max(answer, temp)
            for j in 0..<i {
                temp -= numbers[j]
                answer = max(answer, temp)
            }
        }
    }
    print(answer)
}