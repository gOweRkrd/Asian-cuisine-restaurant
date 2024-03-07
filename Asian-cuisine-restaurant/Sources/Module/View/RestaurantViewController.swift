import UIKit

final class RestaurantViewController: UIViewController {
    
    private var presenter: RestaurantPresenter
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0.5
        layout.minimumInteritemSpacing = 0.5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = R.Colors.white
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(RestaurantViewCell.self, forCellWithReuseIdentifier: "RestaurantViewCell")
        return collectionView
    }()
    
    // MARK: - Initializer
    init(presenter: RestaurantPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        presenter = RestaurantPresenter()
        presenter.attachView(self)
        presenter.viewDidLoad()
    }
    
    // MARK: - Private methods
    private func setupViews() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension RestaurantViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "RestaurantViewCell",
            for: indexPath
        ) as? RestaurantViewCell else {
            fatalError("Unable to dequeue RestaurantViewCell")
        }
        let item = presenter.item(at: indexPath.row)
        cell.textLabel.text = item.text
        cell.imageView.image = item.image
        cell.backgroundColor = R.Colors.lightGray
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RestaurantViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = presenter.item(at: indexPath.row)
        let imageAspectRatio = item.image.size.height / item.image.size.width
        let cellWidth = collectionView.bounds.width
        let cellHeight = cellWidth * imageAspectRatio
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

// MARK: - RestaurantViewProtocol
extension RestaurantViewController: RestaurantViewProtocol {
    func reloadCollectionView() {
        collectionView.reloadData()
    }
}
