import UIKit

final class MenuViewCell: UICollectionViewCell {
    
    lazy var menuLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.white
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
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
private extension MenuViewCell {
    func addSubView() {
        contentView.addSubviews([imageView, menuLabel])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            menuLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.sizeAnchor),
            menuLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Constants.sizeAnchor)
        ])
    }
}

// MARK: - Constants
private struct Constants {
    static let sizeAnchor: CGFloat = 16
}
