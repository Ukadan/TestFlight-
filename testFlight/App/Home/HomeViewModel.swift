import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private var networkManager = NetworkManagerAF.shared
    
    @Published var trendingMovies: [Movie] = []
    
    func loadTrendingMovies() {
        networkManager.loadSoonMovies { [weak self] movies in
            DispatchQueue.main.async {
                self?.trendingMovies = movies
            }
        }
    }
}
