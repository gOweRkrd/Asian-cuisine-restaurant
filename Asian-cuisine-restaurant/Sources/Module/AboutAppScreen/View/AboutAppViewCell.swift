import UIKit

private extension CGFloat {
    static let descriptionLabelTopAnchor: CGFloat = 25
}

final class AboutAppViewCell: UICollectionViewCell {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.coolGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.white
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
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
private extension AboutAppViewCell {
    func addSubView() {
        contentView.addSubviews([titleLabel, descriptionLabel])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: .descriptionLabelTopAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
    }
}
