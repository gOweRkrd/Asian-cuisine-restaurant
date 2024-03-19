import UIKit

private enum SocialMedia: String {
    case facebook
    // swiftlint: disable identifier_name
    case vk
    // swiftlint: enable dentifier_name
    case twitter
    case instagram
    case odnoklassniki
    
    var url: URL? {
        switch self {
        case .facebook:
            return URL(string: "https://www.facebook.com")
        case .vk:
            return URL(string: "https://vk.com")
        case .twitter:
            return URL(string: "https://twitter.com")
        case .instagram:
            return URL(string: "https://www.instagram.com")
        case .odnoklassniki:
            return URL(string: "https://ok.ru")
        }
    }
}

final class SocialMediaCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError(R.FatalError.fatalError)
    }
    
    // MARK: - Public methods
    func configure(model: SocialMediaModel) {
        if let image = UIImage(named: model.socialBrend) {
            self.imageView.image = image
        }
    }
    
    // MARK: - Private methods
    private func setupViews() {
        addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openSocialMedia))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
    }
    
    @objc
    private func openSocialMedia() {
        guard let socialMediaString = imageView.accessibilityIdentifier,
              let socialMedia = SocialMedia(rawValue: socialMediaString) else {
            return
        }
        
        if let url = socialMedia.url {
            UIApplication.shared.open(url)
        }
    }
}
