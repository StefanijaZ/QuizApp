
import Foundation

struct User: Codable {
    
    let id: String
    let name: String
    let image: Data
    var points: Int
    
    public init(name: String, image: Data)
    {
        self.id = UUID().uuidString
        self.name = name
        self.image = image
        self.points = 0
    }
    
    public mutating func updatePoints(points: Int)
    {
        self.points += points
    }
}
