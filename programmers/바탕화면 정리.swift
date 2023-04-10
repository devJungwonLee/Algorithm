import Foundation

func solution(_ wallpaper:[String]) -> [Int] {
    var files: [[Int]] = []
    var wallpaper = wallpaper.map { $0.map { String($0) } }
    for i in 0..<wallpaper.count {
        for j in 0..<wallpaper[i].count {
            if wallpaper[i][j] == "#" {
                files.append([i, j])
            }
        }
    }
    var result: [Int] = []
    result.append(files.map { $0[0] }.min()!)
    result.append(files.map { $0[1] }.min()!)
    result.append(files.map { $0[0] }.max()! + 1)
    result.append(files.map { $0[1] }.max()! + 1)
    return result
}