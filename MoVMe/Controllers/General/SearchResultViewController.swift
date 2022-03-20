//
//  SearchResultViewController.swift
//  MoVMe
//
//  Created by Panca Setiawan on 20/03/22.
//

import UIKit

protocol SearchResultViewControllerDelegate: AnyObject {
    func searchResultViewControllerDidTapItem(_ viewModel: TitlePreviewViewModel)
}

class SearchResultViewController: UIViewController {
    
    public var movies: [MovieDetails] = [MovieDetails]()
    
    public weak var delegate: SearchResultViewControllerDelegate?
    
    public let searchResultsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(DisplayCollectionViewCell.self, forCellWithReuseIdentifier: DisplayCollectionViewCell.identifier)
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        view.addSubview(searchResultsCollectionView)
        
        searchResultsCollectionView.delegate = self
        searchResultsCollectionView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultsCollectionView.frame = view.bounds
    }
}

extension SearchResultViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DisplayCollectionViewCell.identifier, for: indexPath) as? DisplayCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let movies = movies[indexPath.row]
        cell.configure(with: movies.poster_path ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let movie = movies[indexPath.row]
        let movieName = movie.original_title ?? movie.original_name ?? ""
        APICaller.shared.getMovie(with: movieName) { [weak self] result in
            switch result {
            case .success(let videoElement):
                self?.delegate?.searchResultViewControllerDidTapItem(TitlePreviewViewModel(title: movie.original_title ?? "", youtubeView: videoElement, titleOverview: movie.overview ?? "", rating: movie.vote_average))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
