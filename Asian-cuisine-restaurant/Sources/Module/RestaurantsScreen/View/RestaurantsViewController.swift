import UIKit

final class RestaurantsViewController: UIViewController {
    
    private var presenter: RestaurantsPresenter?
    
    // MARK: - Ui
    private func setupNavigationBar() {
        let basketButton = UIBarButtonItem(
            image: UIImage(resource: .basket),
            style: .plain,
            target: self,
            action: #selector(cartButtonTapped)
        )
        navigationItem.rightBarButtonItem = basketButton
    }
    
    private lazy var forMapsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(R.RestaurantsViewController.forMapsButton, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.setTitleColor(R.Colors.gray, for: .normal)
        button.addTarget(
            self,
            action: #selector(forMapsButtonTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    private lazy var allButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(R.RestaurantsViewController.allButton, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.setTitleColor(R.Colors.white, for: .normal)
        button.backgroundColor = R.Colors.brownishOrange
        button.layer.cornerRadius = 17
        button.layer.borderWidth = 1.0
        button.layer.borderColor = R.Colors.tangerine.cgColor
        button.contentEdgeInsets = UIEdgeInsets(
            top: Constants.allButtonInternalTopBottonAnchor,
            left: Constants.allButtonInternalLeftRightAnchor,
            bottom: Constants.allButtonInternalTopBottonAnchor,
            right: Constants.allButtonInternalLeftRightAnchor
        )
        button.addTarget(
            self,
            action: #selector(allButtonTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0.5
        layout.minimumInteritemSpacing = 0.5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = R.Colors.black
        collectionView.register(
            RestaurantsViewCell.self,
            forCellWithReuseIdentifier: R.RestaurantsViewController.identifier
        )
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = R.Colors.white
        view.backgroundColor = R.Colors.black
        presenter = RestaurantsPresenter()
        presenter?.viewDidLoad()
        setupNavigationBar()
        addSubviews()
        setupConstraints()
    }
    
    // MARK: - Private methods
    @objc
    private func cartButtonTapped() {
        presenter?.cartButtonTapped()
    }
    
    @objc
    private func forMapsButtonTapped() {
        presenter?.forMapsButtonTapped()
    }
    
    @objc
    private func allButtonTapped() {
        presenter?.allButtonTapped()
    }
}

// MARK: - UICollectionViewDataSource
extension RestaurantsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: R.RestaurantsViewController.identifier,
            for: indexPath
        ) as? RestaurantsViewCell else {
            fatalError(R.RestaurantsViewController.fatalError)
        }
        let item = presenter?.item(at: indexPath.row)
        cell.addressRestaurantsLabel.text = item?.address
        cell.imageView.image = item?.photoRestaurants
        cell.nameRestaurantsLabel.text = item?.nameRestaurants
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension RestaurantsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: Constants.collectionHeight)
    }
}

// MARK: - RestaurantsProtocolOutput
extension RestaurantsViewController: RestaurantsProtocolOutput {
    func reloadCollectionView() {
        collectionView.reloadData()
    }
}

// MARK: - Setup Constrains
private extension RestaurantsViewController {
    func addSubviews() {
        view.addSubviews([
            forMapsButton, allButton, collectionView
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            forMapsButton.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.forMapsButtonTopAnchor
            ),
            forMapsButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.forMapsButtonTrailingAnchor
            ),
            
            allButton.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.allButtonTopAnchor
            ),
            allButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.allButtonLeadingAnchor
            ),
            
            collectionView.topAnchor.constraint(
                equalTo: allButton.bottomAnchor,
                constant: Constants.collectionViewTopAnchor
            ),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
}

// MARK: - Constants
private struct Constants {
    static let forMapsButtonTopAnchor: CGFloat = 12
    static let forMapsButtonTrailingAnchor: CGFloat = 32
    static let allButtonTopAnchor: CGFloat = 8
    static let allButtonLeadingAnchor: CGFloat = 16
    static let allButtonInternalTopBottonAnchor: CGFloat = 10
    static let allButtonInternalLeftRightAnchor: CGFloat = 64.5
    static let collectionViewTopAnchor: CGFloat = 16
    static let collectionHeight: CGFloat = 216
}
