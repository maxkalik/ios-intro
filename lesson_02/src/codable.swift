// Codable

import Foundation

struct Word: Codable {
    var word: String
    var translation: String
    var id: String
}

func read(file name: String) {
    let fileManager = FileManager.default
    let decoder = JSONDecoder()
    let dir = fileManager.currentDirectoryPath
    let url = URL(fileURLWithPath: "\(dir)/\(name)")
    
    do {
        let data = try Data(contentsOf: url)
        let result = try decoder.decode([Word].self, from: data)
        print(result) // Mouse
    } catch {
        print("cant read…")
    }
}

read(file: "data.json")
