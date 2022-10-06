func isSamSam(_ num: Int) -> Bool {
    if num == 0 { return false }
    return String(num, radix: 3).map { Int(String($0))! }.filter { $0 != 0 && $0 != 1 }.isEmpty
}
let num = Int(readLine()!)!
isSamSam(num) ? print("YES") : print("NO")

