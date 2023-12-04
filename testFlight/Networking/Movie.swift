import Foundation

struct Movie: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case name = "original_title"
        case image = "poster_path"
    }
    
    let id: Int
    let name: String?
    let posterUrl: String?
  
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try? container.decodeIfPresent(String.self, forKey: .name)
        if let image = try? container.decodeIfPresent(String.self, forKey: .image) {
            posterUrl  =  "https://image.tmdb.org/t/p/w200\(image)"
        } else {
            posterUrl = nil
        }
    }
}

struct MoviesEntity: Decodable {
    let results: [Movie]
}
