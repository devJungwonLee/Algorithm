import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var point = [String: Int]()
    for i in 0..<name.count {
        point[name[i]] = yearning[i]
    }
    return photo.map { p in
        return p.map { point[$0] ?? 0 }.reduce(0, +)
    }
}