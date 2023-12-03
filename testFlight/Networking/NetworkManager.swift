import Foundation
import Alamofire

protocol NetworkManager: AnyObject {
    func loadTodayMovies(completion: @escaping ([Movie]) -> Void)
    func loadSoonMovies(completion: @escaping ([Movie]) -> Void)
    func loadTrendingMovies(completion: @escaping ([Movie]) -> Void)
    func loadMovies(path: String, completion: @escaping ([Movie]) -> Void)
}

class NetworkManagerAF: NetworkManager {
    private let API_KEY = "e516e695b99f3043f08979ed2241b3db"
    
    static var shared = NetworkManagerAF()
    
    private lazy var urlComponents: URLComponents = {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.themoviedb.org"
        components.queryItems = [
            URLQueryItem(name: "api_key", value: API_KEY)
        ]
        return components
    }()
    
    
    func loadTodayMovies(completion: @escaping ([Movie]) -> Void) {
        loadMovies(path: "/3/movie/now_playing") { movies in
            completion(movies)
        }
    }

    func loadSoonMovies(completion: @escaping ([Movie]) -> Void) {
        loadMovies(path: "/3/movie/upcoming") { movies in
            completion(movies)
        }
    }

    func loadTrendingMovies(completion: @escaping ([Movie]) -> Void) {
        loadMovies(path: "/3/trending/movie/week") { movies in
            completion(movies)
        }
    }


    func loadMovies(path: String, completion: @escaping ([Movie]) -> Void) {
        urlComponents.path = path

       guard let requestUrl = urlComponents.url else {
           return
       }

        AF.request(requestUrl).responseJSON { response in
            guard let data = response.data else {
                    print("Error: Did not receive data")
                    return
            }
            do {
                let moviesEntity = try JSONDecoder().decode(MoviesEntity.self, from: data)
                DispatchQueue.main.async {
                    completion(moviesEntity.results)
                }
            } catch {
                DispatchQueue.main.async {
                    completion([])
                }
            }
        }
    }
}
