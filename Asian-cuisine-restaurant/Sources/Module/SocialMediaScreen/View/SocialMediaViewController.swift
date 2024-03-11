import UIKit

private extension CGFloat {
    static let subTitleLabelLeadingTrailingSize: CGFloat = 30
    static let subTitleTopAnchor: CGFloat = 104
    static let colletionViewLeadingTrailingSize: CGFloat = 42
    static let colletionViewTopAnchor: CGFloat = 45
    static let colletionViewHeight: CGFloat = 50
    static let separatorHeight: CGFloat = 1
    static let imageViewHeight: CGFloat = 0.35
}

final class SocialMediaViewController: UIViewController {
    
    private var presenter: SocialMediaPresenter
    
    // MARK: - Ui
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .фонОПриложении
        return imageView
    }()
    
    private var socialMediaLabel: UILabel = {
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
    
    private var subTitleLabel: UILabel = {
        let label = UILabel()
        label.text = R.AboutAppViewController.subTitle
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
        collectionView.register(SocialMediaCell.self, forCellWithReuseIdentifier: "SocialMediaCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    // MARK: - Initializer
    init(presenter: SocialMediaPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(R.FatalError.fatalError)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = R.Colors.black
        navigationController?.navigationBar.tintColor = R.Colors.white
        presenter = SocialMediaPresenter()
        presenter.attachView(self)
        presenter.viewDidLoad()
        addSubviews()
        setupConstraints()
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
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: .imageViewHeight),
            
            socialMediaLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            socialMediaLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            
            separatorView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: .separatorHeight),
            
            subTitleLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: .subTitleTopAnchor),
            subTitleLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: .subTitleLabelLeadingTrailingSize
            ),
            subTitleLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -.subTitleLabelLeadingTrailingSize
            ),
            
            collectionView.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: .colletionViewTopAnchor),
            collectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: .colletionViewLeadingTrailingSize
            ),
            collectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -.colletionViewLeadingTrailingSize
            ),
            collectionView.heightAnchor.constraint(equalToConstant: .colletionViewHeight)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension SocialMediaViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "SocialMediaCell",
            for: indexPath
        ) as? SocialMediaCell else {
            fatalError("Unable to dequeue SocialMediaCell")
        }
        
        let socialBrend = presenter.item(at: indexPath.row).socialBrend
        if let image = UIImage(named: socialBrend) {
            cell.imageView.image = image
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

// MARK: - RestaurantViewProtocol
extension SocialMediaViewController: SocialMediaViewProtocol {
    func reloadCollectionView() {
        collectionView.reloadData()
    }
}
