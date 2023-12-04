import Foundation
import UIKit
import Combine

class HomeViewController: UIViewController {
    private var cancellables: Set<AnyCancellable> = []
    
    let searchBar = UISearchBar()
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    var viewModel: HomeViewModel
    var coordinator: HomeCoordinator
    
    init(viewModel: HomeViewModel, coordinator: HomeCoordinator) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        bindViewModel()
        viewModel.loadTrendingMovies()
    }
    
    func bindViewModel() {
        viewModel.$trendingMovies
            .sink { [weak self] movies in
                self?.collectionView.reloadData()
            }
            .store(in: &cancellables)
    }

    func setupUI() {
        view.addSubview(searchBar)
        searchBar.placeholder = "Search"
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func setupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.trendingMovies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        let movie = viewModel.trendingMovies[indexPath.item]
        
        cell.titleLabel.text = movie.name
        cell.imageView.kf.setImage(with: URL(string: movie.posterUrl ?? ""))
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 160)
    }
}

