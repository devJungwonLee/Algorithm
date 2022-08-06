import Foundation
let alphabets = Set<String>("abcdefghijklmnopqrstuvwxyz".map { String($0) })
let n = Int(readLine()!)!
for _ in 0..<n {
    let s = Set(readLine()!.lowercased().map { String($0) }.filter { alphabets.contains($0) })
    let missing = Array(alphabets.subtracting(s)).sorted().reduce("", +)
    if missing.isEmpty { print("pangram") }
    else { print("missing \(missing)") }
}