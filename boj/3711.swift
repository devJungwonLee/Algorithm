let n = Int(readLine()!)!
for _ in 0..<n {
    let g = Int(readLine()!)!
    var numbers = [Int]()
    for _ in 0..<g {
        numbers.append(Int(readLine()!)!)
    }
    var m = 1
    while true {
        var remains = Set<Int>()
        var flag = true
        for number in numbers {
            if remains.contains(number % m) {
                flag = false
                break
            }
            remains.insert(number % m)
        }
        if !flag { 
            m += 1
            continue
        } else {
            break
        }
    }
    print(m)
}
