import UIKit

enum MainItem: String {
    case menu = "МЕНЮ"
    case promo = "АКЦИИ"
    case restaurants = "РЕСТОРАНЫ"
    case delivery = "ДОСТАВКА"
    case feedback = "ОСТАВИТЬ ОТЗЫВ"
    case aboutApp = "О ПРИЛОЖЕНИИ"
    case socialMedia = "CОЦИАЛЬНЫЕ СЕТИ"
}

final class MainViewController: UIViewController {
    
    var presenter: MainViewProtocolInput?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0.5
        layout.minimumInteritemSpacing = 0.5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = R.Colors.darkGray
        collectionView.contentInsetAdjustmentBehavior = .never
        collectionView.register(MainViewCell.self, forCellWithReuseIdentifier: R.MainViewController.identifier)
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupNavigationBar()
        presenter?.viewDidLoad()
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
    
    private func setupNavigationBar() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: R.MainViewController.identifier,
            for: indexPath
        ) as? MainViewCell else {
            fatalError(R.MainViewController.fatalError)
        }
        let item = presenter?.item(at: indexPath.row)
        cell.textLabel.text = item?.text
        cell.imageView.image = item?.image
        cell.nameRestaurantsLabel.text = item?.nameRestaurants
        cell.backgroundColor = R.Colors.darkGray
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = presenter?.item(at: indexPath.row)
        let imageAspectRatio = (item?.image.size.height ?? 0) / (item?.image.size.width ?? 0)
        let cellWidth = collectionView.bounds.width
        let cellHeight = cellWidth * imageAspectRatio
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = presenter?.item(at: indexPath.row)
        guard let menuItem = MainItem(rawValue: item?.text ?? "") else { return }
        switch menuItem {
        case .menu:
            let menuViewController = MenuViewController()
            menuViewController.title = MainItem.menu.rawValue.capitalized
            navigationController?.pushViewController(menuViewController, animated: true)
        case .promo:
            let promoViewController = PromoViewController()
            promoViewController.title = MainItem.promo.rawValue.capitalized
            navigationController?.pushViewController(promoViewController, animated: true)
        case .restaurants:
            let restaurantsViewController = RestaurantsViewController()
            restaurantsViewController.title = MainItem.restaurants.rawValue.capitalized
            navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: R.Colors.white
            ]
            navigationController?.pushViewController(restaurantsViewController, animated: true)
        case .delivery:
            let deliveryViewController = DeliveryViewController()
            navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: R.Colors.white
            ]
            navigationController?.pushViewController(deliveryViewController, animated: true)
        case .feedback:
            let feedbackViewController = FeedbackViewController()
            feedbackViewController.title = MainItem.feedback.rawValue.capitalizedFirstLetter()
            navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: R.Colors.white
            ]
            navigationController?.pushViewController(feedbackViewController, animated: true)
        case .aboutApp:
            let aboutViewController = AboutViewAppController()
            aboutViewController.title = MainItem.aboutApp.rawValue.capitalizedFirstLetter()
            navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor: R.Colors.white
            ]
            navigationController?.pushViewController(aboutViewController, animated: true)
        case .socialMedia:
            let aboutAppViewController = SocialMediaViewController()
            navigationController?.pushViewController(aboutAppViewController, animated: true)
        }
    }
}

// MARK: - MainViewProtocolOutput
extension MainViewController: MainViewProtocolOutput {
    func reloadCollectionView() {
        collectionView.reloadData()
    }
}
