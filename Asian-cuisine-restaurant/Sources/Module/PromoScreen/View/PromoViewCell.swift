import UIKit

final class PromoViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.tangerine
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.white
        label.numberOfLines = 2
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        let attributedString = NSMutableAttributedString(string: R.PromoViewCell.titleLabel)
        attributedString.addAttribute(
            NSAttributedString.Key.paragraphStyle,
            value: paragraphStyle, 
            range: NSMakeRange(0, attributedString.length)
        )
        label.attributedText = attributedString
        return label
    }()

    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = R.Colors.gray
        return separatorView
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
    
    // MARK: - Public methods
    func configure(model: PromoModel) {
        self.imageView.image = model.image
        self.dateLabel.text = model.date
        self.titleLabel.text = model.title
    }
}

// MARK: - Setup Constrains
private extension PromoViewCell {
    private func addSubviews() {
        contentView.addSubviews([imageView, dateLabel, separatorView, titleLabel])
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: Constants.imageViewHeight),
            
            dateLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Constants.topAnchor),
            dateLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.leadingTrailingAnchor
            ),
            
            separatorView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: Constants.topAnchor),
            separatorView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.leadingTrailingAnchor
            ),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            separatorView.heightAnchor.constraint(equalToConstant: Constants.separatorViewHeight),
            
            titleLabel.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: Constants.topAnchor),
            titleLabel.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Constants.leadingTrailingAnchor
            ),
            titleLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Constants.leadingTrailingAnchor
            )
        ])
    }
}

// MARK: - Constants
private struct Constants {
    static let imageViewHeight: CGFloat = 296
    static let leadingTrailingAnchor: CGFloat = 16
    static let separatorViewHeight: CGFloat = 1
    static let topAnchor: CGFloat = 16
}
