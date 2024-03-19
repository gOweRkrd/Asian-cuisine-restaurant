import UIKit

final class SocialMediaViewController: UIViewController {
    
    private var presenter: SocialMediaPresenter?
    
    // MARK: - Ui
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .backgraundApp
        return imageView
    }()
    
    private lazy var socialMediaLabel: UILabel = {
        let label = UILabel()
        label.text = MainItem.socialMedia.rawValue
        label.textColor = R.Colors.white
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = R.Colors.lightGray
        return separatorView
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = R.SocialMediaViewController.subTitle
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = R.Colors.gray
        label.numberOfLines = 0
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        label.attributedText = NSAttributedString(
            string: label.text ?? "",
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        )
        label.textAlignment = .center
        let maxSize = CGSize(width: UIScreen.main.bounds.width - 60, height: .greatestFiniteMagnitude)
        let expectedSize = label.sizeThatFits(maxSize)
        label.frame = CGRect(origin: .zero, size: expectedSize)
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(
            SocialMediaCell.self,
            forCellWithReuseIdentifier: R.SocialMediaViewController.identifier
        )
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = R.Colors.black
        navigationController?.navigationBar.tintColor = R.Colors.white
        presenter = SocialMediaPresenter()
        presenter?.viewDidLoad()
        addSubviews()
        setupConstraints()
    }
}

// MARK: - SocialMediaProtocolOutput
extension SocialMediaViewController: SocialMediaProtocolOutput {
    func reloadCollectionView() {
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension SocialMediaViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: R.SocialMediaViewController.identifier,
            for: indexPath
        ) as? SocialMediaCell else {
            fatalError(R.SocialMediaViewController.fatalError)
        }        
        if let item = presenter?.item(at: indexPath.row) {
            cell.configure(model: item)
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SocialMediaViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
}

// MARK: - Setup Constrains
private extension SocialMediaViewController {
    func addSubviews() {
        view.addSubviews([imageView, socialMediaLabel, separatorView, subTitleLabel, collectionView])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: Constants.imageViewHeight),
            
            socialMediaLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            socialMediaLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            
            separatorView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeight),
            
            subTitleLabel.topAnchor.constraint(
                equalTo: separatorView.bottomAnchor,
                constant: Constants.subTitleTopAnchor
            ),
            subTitleLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.subTitleLabelLeadingTrailingSize
            ),
            subTitleLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.subTitleLabelLeadingTrailingSize
            ),
            
            collectionView.topAnchor.constraint(
                equalTo: subTitleLabel.bottomAnchor,
                constant: Constants.colletionViewTopAnchor
            ),
            collectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.colletionViewLeadingTrailingSize
            ),
            collectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.colletionViewLeadingTrailingSize
            ),
            collectionView.heightAnchor.constraint(equalToConstant: Constants.colletionViewHeight)
        ])
    }
}

// MARK: - Constants
private struct Constants {
    static let subTitleLabelLeadingTrailingSize: CGFloat = 30
    static let subTitleTopAnchor: CGFloat = 104
    static let colletionViewLeadingTrailingSize: CGFloat = 40
    static let colletionViewTopAnchor: CGFloat = 45
    static let colletionViewHeight: CGFloat = 50
    static let separatorHeight: CGFloat = 1
    static let imageViewHeight: CGFloat = 0.35
}
