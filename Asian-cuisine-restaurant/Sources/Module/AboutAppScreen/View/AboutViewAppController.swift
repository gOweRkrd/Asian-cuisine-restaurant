import UIKit

private extension CGFloat {
    static let imageViewHeight: CGFloat = 0.25
    static let separatorHeight: CGFloat = 1
    static let topAnchor: CGFloat = 16
    static let leadingAnchor: CGFloat = 42
    static let numberVersionAppLabelTopAnchor: CGFloat = 5
    static let descriptionLabelTrailingAcnhor: CGFloat = 33
    static let collectionViewHeightAnchor: CGFloat = 180
    static let developerImageViewTopAnchor: CGFloat = 20
}

final class AboutViewAppController: UIViewController {
    
    private var presenter: AboutAppPresenter
    
    // MARK: - Ui
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .оПриложении
        return imageView
    }()
    
    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = R.Colors.darkGray
        return separatorView
    }()
    
    private var versionAppLabel: UILabel = {
        let label = UILabel()
        label.text = R.AboutViewAppController.versionAppLabel
        label.textColor = R.Colors.gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private var numberVersionAppLabel: UILabel = {
        let label = UILabel()
        label.text = R.AboutViewAppController.numberVersionAppLabel
        label.textColor = R.Colors.white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var subSeparatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = R.Colors.darkGray
        return separatorView
    }()
    
    private lazy var subSeparatorView2: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = R.Colors.darkGray
        return separatorView
    }()
    
    private var descriptionLabel: UILabel = {
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
        collectionView.register(AboutAppViewCell.self, forCellWithReuseIdentifier: "AboutAppViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private lazy var subSeparatorView3: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = R.Colors.darkGray
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
        separatorView.backgroundColor = R.Colors.darkGray
        return separatorView
    }()
    
    private var developerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.text = R.AboutViewAppController.developerLabel
        label.textColor = R.Colors.coolGray
        return label
    }()
    
    private let developerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .developer
        return imageView
    }()
    
    // MARK: - Initializer
    init(presenter: AboutAppPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(R.FatalError.fatalError)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = R.Colors.white
        view.backgroundColor = R.Colors.black
        addSubviews()
        setupConstraints()
        presenter = AboutAppPresenter()
        presenter.attachView(self)
        presenter.viewDidLoad()
    }
}

// MARK: - Setup Constrains
private extension AboutViewAppController {
    private func addSubviews() {
        view.addSubviews([
            imageView, separatorView, versionAppLabel, numberVersionAppLabel,
            subSeparatorView, descriptionLabel, subSeparatorView2, collectionView,
            subSeparatorView3, rateButton, subSeparatorView4, developerLabel, developerImageView
        ])
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: .imageViewHeight),
            
            separatorView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: .separatorHeight),
            
            versionAppLabel.topAnchor.constraint(equalTo: separatorView.topAnchor, constant: .topAnchor),
            versionAppLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .leadingAnchor),
            
            numberVersionAppLabel.topAnchor.constraint(equalTo: separatorView.topAnchor, constant: .topAnchor),
            numberVersionAppLabel.leadingAnchor.constraint(
                equalTo: versionAppLabel.trailingAnchor,
                constant: .numberVersionAppLabelTopAnchor
            ),
            
            subSeparatorView.topAnchor.constraint(equalTo: versionAppLabel.bottomAnchor, constant: .topAnchor),
            subSeparatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .leadingAnchor),
            subSeparatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subSeparatorView.heightAnchor.constraint(equalToConstant: .separatorHeight),
            
            descriptionLabel.topAnchor.constraint(equalTo: subSeparatorView.bottomAnchor, constant: .topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -.descriptionLabelTrailingAcnhor
            ),
            
            subSeparatorView2.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: .topAnchor),
            subSeparatorView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .leadingAnchor),
            subSeparatorView2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subSeparatorView2.heightAnchor.constraint(equalToConstant: .separatorHeight),
            
            collectionView.topAnchor.constraint(equalTo: subSeparatorView2.bottomAnchor, constant: .topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: .collectionViewHeightAnchor),
            
            subSeparatorView3.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: .topAnchor),
            subSeparatorView3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .leadingAnchor),
            subSeparatorView3.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subSeparatorView3.heightAnchor.constraint(equalToConstant: .separatorHeight),
            
            rateButton.topAnchor.constraint(equalTo: subSeparatorView3.bottomAnchor, constant: .topAnchor),
            rateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .leadingAnchor),
            
            subSeparatorView4.topAnchor.constraint(equalTo: rateButton.bottomAnchor, constant: .topAnchor),
            subSeparatorView4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .leadingAnchor),
            subSeparatorView4.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            subSeparatorView4.heightAnchor.constraint(equalToConstant: .separatorHeight),
            
            developerLabel.topAnchor.constraint(equalTo: subSeparatorView4.topAnchor, constant: .topAnchor),
            developerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .leadingAnchor),
            
            developerImageView.topAnchor.constraint(
                equalTo: developerLabel.topAnchor,
                constant: .developerImageViewTopAnchor
            ),
            developerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .leadingAnchor)
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension AboutViewAppController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "AboutAppViewCell",
            for: indexPath
        ) as? AboutAppViewCell else {
            fatalError("Unable to dequeue AboutAppViewCell")
        }
        
        let item = presenter.item(at: indexPath.row)
        cell.titleLabel.text = item.title
        cell.descriptionLabel.text = item.desciption
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension AboutViewAppController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: 55)
    }
}

// MARK: - RestaurantViewProtocol
extension AboutViewAppController: AboutAppViewProtocol {
    func reloadCollectionView() {
        collectionView.reloadData()
    }
    
    @objc
    func rateButtonTapped() {
        presenter.rateButtonTapped()
    }
}
