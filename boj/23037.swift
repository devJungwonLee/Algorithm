import Foundation

print(readLine()!.map { Int(pow(Double(String($0))!, 5)) }.reduce(0, +))