import UIKit

final class MenuViewController: UIViewController {
    
    private var presenter: MenuPresenter?
    
    // MARK: - Ui
    private var basketButtonNavigationBar: UIBarButtonItem {
        let basketButton = UIBarButtonItem(
            image: UIImage(resource: .basket),
            style: .plain,
            target: self,
            action: #selector(cartButtonTapped)
        )
        return basketButton
    }
    
    private var searchButtonNavigationBar: UIBarButtonItem {
        let searchButton = UIBarButtonItem(
            image: UIImage(resource: .search),
            style: .plain,
            target: self,
            action: #selector(searchButtonTapped)
        )
        return searchButton
    }
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = R.Colors.tangerine
        textField.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: R.Colors.tangerine,
            .font: UIFont.systemFont(ofSize: 17, weight: .medium)
        ]
        let attributedPlaceholder = NSAttributedString(
            string: R.MenuViewController.searchTextField,
            attributes: attributes
        )
        textField.attributedPlaceholder = attributedPlaceholder
        textField.frame.size.width = Constants.textFieldWidth
        textField.widthAnchor.constraint(equalToConstant: Constants.textFieldWidth).isActive = true
        return textField
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0.5
        layout.minimumInteritemSpacing = 0.5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = R.Colors.coolGray
        collectionView.register(MenuViewCell.self, forCellWithReuseIdentifier: R.MenuViewController.identifier)
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = R.Colors.black
        setupNavigationBar()
        presenter = MenuPresenter()
        presenter?.viewDidLoad()
        addSubviews()
        setupConstraints()
    }
    
    // MARK: - Private methods
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = R.Colors.white
        navigationItem.rightBarButtonItems = [basketButtonNavigationBar, searchButtonNavigationBar]
        navigationItem.titleView = searchTextField
        searchTextField.isHidden = true
    }
    
    @objc
    private func cartButtonTapped() {
        presenter?.cartButtonTapped()
    }
    
    @objc
    private func searchButtonTapped() {
        presenter?.searchButtonTapped(textField: searchTextField)
    }
}

// MARK: - UICollectionViewDataSource
extension MenuViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: R.MenuViewController.identifier,
            for: indexPath
        ) as? MenuViewCell else {
            fatalError(R.MenuViewController.fatalError)
        }
        if let item = presenter?.item(at: indexPath.row) {
            cell.configure(model: item)
        }
        cell.backgroundColor = R.Colors.black
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = presenter?.item(at: indexPath.row)
        let imageAspectRatio = (item?.image.size.height ?? 0) / (item?.image.size.width ?? 0)
        let cellWidth = collectionView.bounds.width
        let cellHeight = cellWidth * imageAspectRatio
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

// MARK: - MainViewProtocolOutput
extension MenuViewController: MenuViewProtocolOutput {
    func reloadCollectionView() {
        collectionView.reloadData()
    }
}

// MARK: - Setup Constrains
private extension MenuViewController {
    func addSubviews() {
        view.addSubviews([collectionView])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.сollectionViewTopAnchor
            ),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - Constants
private struct Constants {
    static let сollectionViewTopAnchor: CGFloat = 8
    static let textFieldWidth: CGFloat = 200
}
