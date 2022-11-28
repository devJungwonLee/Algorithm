let s = readLine()!.split(separator: " ").map { Int($0)! }

func isLeapYear(_ year: Int) -> Bool {
    return year % 4 == 0 && year % 100 != 0 || year % 400 == 0
}

func check(_ year: Int, _ month: Int, _ day: Int) -> Int {
    if year < 0 || year > 99 { return -1 }
    if month < 1 || month > 12 { return -1 }
    if day < 1 || day > 31 { return -1 }
    if day == 31 && ([2, 4, 6, 9, 11].contains(month)) { return -1 }
    if day == 30 && month == 2 { return -1 }
    if day == 29 && month == 2 && !isLeapYear(year) { return -1 }
    if year < s[0] { return 0 }
    else if year > s[0] { return 1 }
    else if month < s[1] { return 0 }
    else if month > s[1] { return 1 }
    else if day < s[2] { return 0 }
    else { return 1 }
}

func checkAll(_ input: [Int]) -> Int {
    let result1 = check(input[0], input[1], input[2])
    let result2 = check(input[2], input[1], input[0])
    let result3 = check(input[2], input[0], input[1])

    let result = [result1, result2, result3].filter{ $0 != -1 }
    if result.isEmpty { return -1 }
    if result.contains(0) { return 0 }
    return 1
}

let n = Int(readLine()!)!
for _ in 0..<n {
    let t = readLine()!.split(separator: " ").map { Int($0)! }
    let result = checkAll(t)
    if result == -1 { print("invalid") }
    else if result == 0 { print("unsafe") }
    else { print("safe") }
}
