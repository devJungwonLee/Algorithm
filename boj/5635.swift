import Foundation
var names = [String]()
var birthdays = [[Int]]()
let n = Int(readLine()!)!
for _ in 0..<n {
    let s = readLine()!.components(separatedBy: " ")
    let name = s[0]
    let day = Int(s[1])!
    let month = Int(s[2])!
    let year = Int(s[3])!
    names.append(name)
    birthdays.append([year, month, day])
}
let indices = (0..<n).sorted {
    if birthdays[$0][0] == birthdays[$1][0] {
        if birthdays[$0][1] == birthdays[$1][1] {
            return birthdays[$0][2] < birthdays[$1][2]
        }
        return birthdays[$0][1] < birthdays[$1][1]
    }
    return birthdays[$0][0] < birthdays[$1][0]
}
print(names[indices[n-1]])
print(names[indices[0]])
