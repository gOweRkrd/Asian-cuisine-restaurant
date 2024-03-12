import UIKit

final class MainViewCell: UICollectionViewCell {

    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.white
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    lazy var nameRestaurants: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.white
        label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
        return label
    }()
    
    lazy var imageView: UIImageView = {
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
}

// MARK: - Setup Constrains
private extension MainViewCell {
    func addSubView() {
        stackView.addArrangedSubview(nameRestaurants)
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
