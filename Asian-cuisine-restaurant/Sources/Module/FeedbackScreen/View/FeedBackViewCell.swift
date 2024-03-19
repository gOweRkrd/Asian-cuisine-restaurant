import UIKit

final class FeedBackViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
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
    
    // MARK: - Public methods
    func configure(model: FeedBackModel) {
        self.imageView.image = model.image
    }
}

// MARK: - Setup Constrains
private extension FeedBackViewCell {
    func addSubView() {
        contentView.addSubviews([imageView])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
