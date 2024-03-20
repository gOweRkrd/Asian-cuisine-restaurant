import UIKit

final class PromoViewController: UIViewController {
    
    private var presenter: PromoPresenter?
    
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
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0.5
        layout.minimumInteritemSpacing = 0.5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = R.Colors.black
        collectionView.register(
            PromoViewCell.self,
            forCellWithReuseIdentifier: R.PromoViewController.identifier
        )
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var pageControl: UIPageControl = {
        pageControl = UIPageControl()
        pageControl.numberOfPages = presenter?.numberOfItems() ?? 0
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = R.Colors.coolGray
        pageControl.currentPageIndicatorTintColor = R.Colors.tangerine
        return pageControl
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = R.Colors.white
        view.backgroundColor = R.Colors.black
        presenter = PromoPresenter()
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
}

// MARK: - UICollectionViewDataSource
extension PromoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: R.PromoViewController.identifier,
            for: indexPath
        ) as? PromoViewCell else {
            fatalError(R.PromoViewController.fatalError)
        }
        if let item = presenter?.item(at: indexPath.row) {
            cell.configure(model: item)
        }
        cell.backgroundColor = R.Colors.darkGray
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PromoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(
            width: Constants.collcetionViewWidtch,
            height: Constants.collectionViewCellHeight
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        6
    }
}

// MARK: - UICollectionViewDelegate
extension PromoViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard collectionView.bounds.width != 0 else {
            return
        }
        
        let pageIndex = round(scrollView.contentOffset.x / collectionView.bounds.width)
        pageControl.currentPage = Int(pageIndex)
    }
}

// MARK: - PromoProtocolOutput
extension PromoViewController: PromoProtocolOutput {
    func reloadCollectionView() {
        collectionView.reloadData()
    }
}
// MARK: - Setup Constrains
private extension PromoViewController {
    func addSubviews() {
        view.addSubviews([collectionView, pageControl])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.collectionViewTopAnchor
            ),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: Constants.collectionViewCellHeight),
            
            pageControl.topAnchor.constraint(
                equalTo: collectionView.bottomAnchor,
                constant: Constants.collectionViewTopAnchor
            ),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

// MARK: - Constants
private struct Constants {
    static let collectionViewTopAnchor: CGFloat = 16
    static let collectionViewCellHeight: CGFloat = 504
    static let collcetionViewWidtch: CGFloat = 312
    static let pageControlTopAnchor: CGFloat = 17
}
