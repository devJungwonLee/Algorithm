import Foundation
let indices = ["A": 0, "A#": 1, "Ab": 11, "B": 2, "B#": 3, "Bb": 1, "C": 3, "C#": 4, "Cb": 2, "D": 5, "D#": 6, "Db": 4, "E": 7, "E#": 8, "Eb": 6, "F": 8, "F#": 9, "Fb": 7, "G": 10, "G#": 11, "Gb": 9]
let pitches = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#"]
while let s = readLine() {
    if s == "***" { break }
    let temp = s.components(separatedBy: " ").map { indices[$0]! }
    let num = Int(readLine()!)!
    let result = temp.map { pitches[($0 + num + 12) % 12] }.joined(separator: " ")
    print(result)
}
