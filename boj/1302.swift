import Foundation

var record = [String: Int]()
var names = [String]()
let n = Int(readLine()!)!
for _ in 0..<n {
    let name = readLine()!
    names.append(name)
    if let cnt = record[name] { record[name] = cnt + 1 }
    else { record[name] = 1 }
}
names.sort {
    if record[$0]! == record[$1]! { return $0 < $1 }
    else { return record[$0]! > record[$1]! }
}
print(names[0])
