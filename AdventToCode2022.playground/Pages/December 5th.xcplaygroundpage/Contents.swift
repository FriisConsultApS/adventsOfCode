//: [Previous](@previous)

import Foundation
guard let filePath = Bundle.main.path(forResource: "demo", ofType: "txt") else { fatalError("No file") }

do {
    let file = try String(contentsOfFile: filePath, encoding: .utf8)
    let lines = file.components(separatedBy: .newlines)
    var stackLines = [String]()



}

//: [Next](@next)
