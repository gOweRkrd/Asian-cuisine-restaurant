import UIKit

final class MainViewCell: UICollectionViewCell {

    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.white
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private lazy var mainImageTittle: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError(R.FatalError.fatalError)
    }
    
    // MARK: - Public methods
    func configure(model: MainModel) {
        self.textLabel.text = model.text
        self.mainImageTittle.image = model.mainImage
        self.imageView.image = model.image
    }
}

// MARK: - Setup Constrains
private extension MainViewCell {
    func addSubView() {
        stackView.addArrangedSubview(mainImageTittle)
        stackView.addArrangedSubview(textLabel)
        contentView.addSubviews([imageView, stackView])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
        ])
    }
}
