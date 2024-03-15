import UIKit

final class RestaurantsViewCell: UICollectionViewCell {
    
    lazy var nameRestaurantsLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.white
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    lazy var addressRestaurantsLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.lightGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        let gradientViewFrame = CGRect(x: 0, y: 0, width: Constants.gradientWidth, height: Constants.gradientHeight)
        imageView.addGradient(frame: gradientViewFrame)
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError(R.FatalError.fatalError)
    }
    
    // MARK: - Private Methods
    private func addSubviews() {
        stackView.addArrangedSubview(nameRestaurantsLabel)
        stackView.addArrangedSubview(addressRestaurantsLabel)
        contentView.addSubviews([imageView, stackView])
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            stackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.stackViewLeadingTralingAnchor
            ),
            stackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.stackViewLeadingTralingAnchor
            ),
            stackView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -Constants.stackViewBottomAnchor
            )
        ])
    }
}

// MARK: - Constants
private struct Constants {
    static let stackViewLeadingTralingAnchor: CGFloat = 16
    static let stackViewBottomAnchor: CGFloat = 15
    static let gradientWidth: CGFloat = 400
    static let gradientHeight: CGFloat = 216
}
