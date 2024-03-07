import UIKit

final class RestaurantViewCell: UICollectionViewCell {

    let textLabel: UILabel = {
        let label = UILabel()
        label.textColor = R.Colors.white
        label.font = UIFont(name: "PingFang Medium", size: 20)
        return label
    }()
    
    let imageView: UIImageView = {
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
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Constrains
private extension RestaurantViewCell {
    func addSubView() {
        contentView.addSubviews([imageView, textLabel])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            textLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
        ])
    }
}
