//: [Previous](@previous)

import Foundation
import RegexBuilder
guard let filePath = Bundle.main.path(forResource: "data", ofType: "txt") else { fatalError("No File")}

do {
    let file = try String(contentsOfFile: filePath, encoding: .utf8)
    let lines = file.components(separatedBy: .newlines)

    for line in lines {
        guard !line.isEmpty, line.count > 4 else { continue }
        var candidate = false

        for index in 0..<(line.count-14) {
            let checkIndex = line.index(line.startIndex, offsetBy: index)
            let startIndex = line.index(line.startIndex, offsetBy: index + 1)
            let endIndex = line.index(startIndex, offsetBy: 14 )
            let segment = line[startIndex..<endIndex]
            let checkChar = line[checkIndex]

            for char in segment {
                candidate = true

                let regex = Regex { Capture { One( char ) }}
                let matches = segment.matches(of: regex)
                if matches.count > 1 {
                    candidate = false
                    print("not a candidate \(char) occurs \(matches.count) times in  \(segment)")
                    break
                }
            }


            if candidate {
                print("Candidate \(checkChar) not in \(segment) = \(index)")
                print("This should be it \(index + 15) plus offset")
                break
            }

        }


    }


} catch {
    print(error.localizedDescription)
}

//: [Next](@next)
