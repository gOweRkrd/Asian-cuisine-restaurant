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
    
    private var presenter: MainPresenter
    private var socialMediaPresenter: SocialMediaPresenter
    
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
        collectionView.register(MainViewCell.self, forCellWithReuseIdentifier: "RestaurantViewCell")
        return collectionView
    }()
    
    // MARK: - Initializer
    init(presenter: MainPresenter, socialMediaPresenter: SocialMediaPresenter) {
        self.presenter = presenter
        self.socialMediaPresenter = socialMediaPresenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError(R.FatalError.fatalError)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        presenter = MainPresenter()
        presenter.attachView(self)
        presenter.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "RestaurantViewCell",
            for: indexPath
        ) as? MainViewCell else {
            fatalError("Unable to dequeue RestaurantViewCell")
        }
        let item = presenter.item(at: indexPath.row)
        cell.textLabel.text = item.text
        cell.imageView.image = item.image
        cell.nameRestaurants.text = item.nameRestaurants
        cell.backgroundColor = R.Colors.lightGray
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = presenter.item(at: indexPath.row)
        let imageAspectRatio = item.image.size.height / item.image.size.width
        let cellWidth = collectionView.bounds.width
        let cellHeight = cellWidth * imageAspectRatio
        return CGSize(width: cellWidth, height: cellHeight)
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = presenter.item(at: indexPath.row)
        guard let menuItem = MainItem(rawValue: item.text) else { return }
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
            navigationController?.pushViewController(restaurantsViewController, animated: true)
        case .delivery:
            let deliveryViewController = DeliveryViewController()
            deliveryViewController.title = MainItem.delivery.rawValue.capitalized
            navigationController?.pushViewController(deliveryViewController, animated: true)
        case .feedback:
            let feedbackViewController = FeedbackViewController()
            feedbackViewController.title = MainItem.feedback.rawValue.capitalizedFirstLetter()
            navigationController?.pushViewController(feedbackViewController, animated: true)
        case .aboutApp:
            let aboutViewController = AboutViewController()
            aboutViewController.title = MainItem.aboutApp.rawValue.capitalizedFirstLetter()
            navigationController?.pushViewController(aboutViewController, animated: true)
        case .socialMedia:
            let aboutAppViewController = SocialMediaViewController(presenter: socialMediaPresenter)
            navigationController?.pushViewController(aboutAppViewController, animated: true)
        }
    }
}

// MARK: - RestaurantViewProtocol
extension MainViewController: MainViewProtocol {
    func reloadCollectionView() {
        collectionView.reloadData()
    }
}
