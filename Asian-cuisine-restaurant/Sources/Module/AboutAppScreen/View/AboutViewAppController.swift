import UIKit

final class AboutViewAppController: UIViewController {
    
    private var presenter: AboutAppPresenter?
    
    // MARK: - Ui
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .aboutApp
        return imageView
    }()
    
    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = R.Colors.gray
        return separatorView
    }()
    
    private lazy var versionAppLabel: UILabel = {
        let label = UILabel()
        label.text = R.AboutViewAppController.versionAppLabel
        label.textColor = R.Colors.gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var numberVersionAppLabel: UILabel = {
        let label = UILabel()
        label.text = R.AboutViewAppController.numberVersionAppLabel
        label.textColor = R.Colors.white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var subSeparatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = R.Colors.gray
        return separatorView
    }()
    
    private lazy var subSeparatorView2: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = R.Colors.gray
        return separatorView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        label.text = R.AboutViewAppController.descriptionLabel
        label.textColor = R.Colors.white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(AboutAppViewCell.self, forCellWithReuseIdentifier: R.AboutViewAppController.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    private lazy var subSeparatorView3: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = R.Colors.gray
        return separatorView
    }()
    
    private lazy var rateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(R.AboutViewAppController.rateButton, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.setTitleColor(R.Colors.yellow, for: .normal)
        button.addTarget(self, action: #selector(rateButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var subSeparatorView4: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = R.Colors.gray
        return separatorView
    }()
    
    private lazy var developerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.text = R.AboutViewAppController.developerLabel
        label.textColor = R.Colors.coolGray
        return label
    }()
    
    private lazy var developerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .developer
        return imageView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = R.Colors.white
        view.backgroundColor = R.Colors.black
        addSubviews()
        setupConstraints()
        presenter = AboutAppPresenter()
        presenter?.viewDidLoad()
    }
    // MARK: - Private methods
    @objc
    private func rateButtonTapped() {
        presenter?.rateButtonTapped()
    }
}

// MARK: - AboutAppProtocolOutput
extension AboutViewAppController: AboutAppProtocolOutput {
    func reloadCollectionView() {
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension AboutViewAppController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: R.AboutViewAppController.identifier,
            for: indexPath
        ) as? AboutAppViewCell else {
            fatalError(R.AboutViewAppController.fatalError)
        }
        
        if let item = presenter?.item(at: indexPath.row) {
            cell.configure(model: item)
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension AboutViewAppController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: 55)
    }
}

// MARK: - Setup Constrains
private extension AboutViewAppController {
    func addSubviews() {
        view.addSubviews([
            imageView, separatorView, versionAppLabel, numberVersionAppLabel,
            subSeparatorView, descriptionLabel, subSeparatorView2, collectionView,
            subSeparatorView3, rateButton, subSeparatorView4, developerLabel, developerImageView
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: Constants.imageViewHeight),
            
            separatorView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeight),
            
            versionAppLabel.topAnchor.constraint(equalTo: separatorView.topAnchor, constant: Constants.topAnchor),
            versionAppLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            
            numberVersionAppLabel.topAnchor.constraint(equalTo: separatorView.topAnchor, constant: Constants.topAnchor),
            numberVersionAppLabel.leadingAnchor.constraint(
                equalTo: versionAppLabel.trailingAnchor,
                constant: Constants.numberVersionAppLabelTopAnchor
            ),
            
            subSeparatorView.topAnchor.constraint(equalTo: versionAppLabel.bottomAnchor, constant: Constants.topAnchor),
            subSeparatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            subSeparatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subSeparatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeight),
            
            descriptionLabel.topAnchor.constraint(
                equalTo: subSeparatorView.bottomAnchor,
                constant: Constants.topAnchor
            ),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.descriptionLabelTrailingAcnhor
            ),
            
            subSeparatorView2.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: Constants.topAnchor
            ),
            subSeparatorView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            subSeparatorView2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subSeparatorView2.heightAnchor.constraint(equalToConstant: Constants.separatorHeight),
            
            collectionView.topAnchor.constraint(equalTo: subSeparatorView2.bottomAnchor, constant: Constants.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: Constants.collectionViewHeightAnchor),
            
            subSeparatorView3.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: Constants.topAnchor),
            subSeparatorView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            subSeparatorView3.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subSeparatorView3.heightAnchor.constraint(equalToConstant: Constants.separatorHeight),
            
            rateButton.topAnchor.constraint(equalTo: subSeparatorView3.bottomAnchor, constant: Constants.topAnchor),
            rateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            
            subSeparatorView4.topAnchor.constraint(equalTo: rateButton.bottomAnchor, constant: Constants.topAnchor),
            subSeparatorView4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            subSeparatorView4.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subSeparatorView4.heightAnchor.constraint(equalToConstant: Constants.separatorHeight),
            
            developerLabel.topAnchor.constraint(equalTo: subSeparatorView4.topAnchor, constant: Constants.topAnchor),
            developerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            
            developerImageView.topAnchor.constraint(
                equalTo: developerLabel.topAnchor,
                constant: Constants.developerImageViewTopAnchor
            ),
            developerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor)
        ])
    }
}

// MARK: - Constants
private struct Constants {
    static let imageViewHeight: CGFloat = 0.25
    static let separatorHeight: CGFloat = 1
    static let topAnchor: CGFloat = 16
    static let leadingAnchor: CGFloat = 42
    static let numberVersionAppLabelTopAnchor: CGFloat = 5
    static let descriptionLabelTrailingAcnhor: CGFloat = 33
    static let collectionViewHeightAnchor: CGFloat = 180
    static let developerImageViewTopAnchor: CGFloat = 20
}
