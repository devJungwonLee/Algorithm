import Foundation

let works = ["Re", "Pt", "Cc", "Ea", "Tb", "Cm", "Ex"]
var cnt = [String: Int]()
var total = 0

while let s = readLine() {
    s.trimmingCharacters(in: .whitespaces).components(separatedBy: " ").forEach {
        if let c = cnt[$0] {
            cnt[$0] = c + 1
        } else {
            cnt[$0] = 1
        }
        total += 1
    }
}
works.forEach {
    let c = cnt[$0] ?? 0
    let rate = String(format: "%.2f", Double(c)/Double(total))
    print("\($0) \(c) \(rate)")
}
print("Total \(total) 1.00")