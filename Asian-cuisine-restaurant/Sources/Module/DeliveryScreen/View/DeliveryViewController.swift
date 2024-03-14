import UIKit

final class DeliveryViewController: UIViewController {
    
    private var presenter: DeliveryViewPresenter?
    private var activeTextField: UITextField?
    
    // MARK: - Ui
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .mainBackgraund
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var blurEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let effectView = UIVisualEffectView(effect: blurEffect)
        effectView.alpha = 0.9
        return effectView
    }()
    
    private lazy var menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .menuDish
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = R.DeliveryViewController.descriptionLabel
        label.textColor = R.Colors.white
        label.numberOfLines = 2
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        label.attributedText = NSAttributedString(
            string: label.text ?? "",
            attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle]
        )
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    private lazy var cityLabel: UILabel = {
        let label = UILabel()
        label.text = R.DeliveryViewController.city
        label.textColor = R.Colors.coolGray
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private lazy var cityTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = R.DeliveryViewController.cityTextField
        textField.text = R.DeliveryViewController.city.uppercased()
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: R.Colors.white,
            .font: UIFont.systemFont(ofSize: 16, weight: .medium)
        ]
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textField.textColor = R.Colors.white
        textField.tintColor = R.Colors.tangerine
        return textField
    }()
    
    private lazy var citySeparatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = R.Colors.coolGray
        return separatorView
    }()
    
    private lazy var stationLabel: UILabel = {
        let label = UILabel()
        label.text = R.DeliveryViewController.station
        label.textColor = R.Colors.coolGray
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private lazy var stationTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = R.DeliveryViewController.stationTextField
        textField.text = R.DeliveryViewController.station.uppercased()
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: R.Colors.white,
            .font: UIFont.systemFont(ofSize: 16, weight: .medium)
        ]
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textField.textColor = R.Colors.white
        textField.tintColor = R.Colors.tangerine
        return textField
    }()
    
    private lazy var stationSeparatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = R.Colors.coolGray
        return separatorView
    }()
    
    private lazy var streetLabel: UILabel = {
        let label = UILabel()
        label.text = R.DeliveryViewController.street
        label.textColor = R.Colors.coolGray
        label.isHidden = true
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private lazy var streetTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = R.DeliveryViewController.stationTextField
        textField.text = R.DeliveryViewController.street.uppercased()
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: R.Colors.white,
            .font: UIFont.systemFont(ofSize: 16, weight: .medium)
        ]
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textField.textColor = R.Colors.white
        textField.tintColor = R.Colors.tangerine
        return textField
    }()
    
    private lazy var streetSeparatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = R.Colors.coolGray
        return separatorView
    }()
    
    private lazy var addressButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "map")
        button.setImage(image, for: .normal)
        button.tintColor = R.Colors.coolGray
        return button
    }()
    
    private lazy var desciptionButton: UILabel = {
        let label = UILabel()
        label.text = R.DeliveryViewController.desciptionButton
        label.textColor = R.Colors.coolGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private lazy var addressStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [addressButton, desciptionButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var locationButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "location")
        button.setImage(image, for: .normal)
        button.tintColor = R.Colors.coolGray
        return button
    }()
    
    private lazy var locationDesciptionButton: UILabel = {
        let label = UILabel()
        label.text = R.DeliveryViewController.locationDesciptionButton
        label.textColor = R.Colors.coolGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private lazy var locationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [locationButton, locationDesciptionButton])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = R.Colors.white
        presenter = DeliveryViewPresenter()
        presenter?.viewDidLoad()
        addSubviews()
        setupConstraints()
        delegateTextField()
        addKeyboardObservers()
        addTapGestureToDismissKeyboard()
    }

    // MARK: - Private methods
    private func delegateTextField() {
        cityTextField.delegate = self
        stationTextField.delegate = self
        streetTextField.delegate = self
    }
    
    // MARK: - Notification center
    private func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func addTapGestureToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc 
    private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc
    private func keyboardWillShow(_ notification: Notification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
        let distanceToBottom = view.frame.height - ((activeTextField?.frame.maxY ?? 00) + 25)
        
        if distanceToBottom < keyboardHeight {
            view.frame.origin.y = -(keyboardHeight - distanceToBottom)
        }
    }
    
    @objc
    private func keyboardWillHide(_ notification: Notification) {
        view.frame.origin.y = 0
    }
}

// MARK: - UITextFieldDelegate
extension DeliveryViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
        if textField.text == R.DeliveryViewController.city.uppercased() ||
            textField.text == R.DeliveryViewController.station.uppercased() ||
            textField.text == R.DeliveryViewController.street.uppercased() {
            textField.text = ""
        }
        
        if textField == cityTextField {
            cityLabel.isHidden = false
            stationLabel.isHidden = true
            streetLabel.isHidden = true
        } else if textField == stationTextField {
            cityLabel.isHidden = true
            stationLabel.isHidden = false
            streetLabel.isHidden = true
        } else if textField == streetTextField {
            cityLabel.isHidden = true
            stationLabel.isHidden = true
            streetLabel.isHidden = false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeTextField = nil
        if textField.text?.isEmpty == true {
            switch textField {
            case cityTextField:
                textField.text = R.DeliveryViewController.city.uppercased()
            case stationTextField:
                textField.text = R.DeliveryViewController.station.uppercased()
            case streetTextField:
                textField.text = R.DeliveryViewController.street.uppercased()
            default:
                break
            }
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let fieldsMapping: [(textField: UITextField, label: UILabel, separatorView: UIView)] = [
            (cityTextField, cityLabel, citySeparatorView),
            (stationTextField, stationLabel, stationSeparatorView),
            (streetTextField, streetLabel, streetSeparatorView)
        ]
        
        for (field, label, separatorView) in fieldsMapping {
            if textField == field {
                label.textColor = textField.text?.isEmpty == true ? R.Colors.coolGray : R.Colors.tangerine
                separatorView.backgroundColor = textField.text?.isEmpty == true ? R.Colors.darkGray : R.Colors.tangerine
            } else {
                label.textColor = R.Colors.coolGray
                separatorView.backgroundColor = R.Colors.coolGray
            }
        }
    }
}

// MARK: - Setup Constrains
private extension DeliveryViewController {
    func addSubviews() {
        view.addSubviews([
            imageView, blurEffectView, menuImageView, descriptionLabel,
            cityLabel, cityTextField, citySeparatorView,
            stationLabel, stationTextField, stationSeparatorView,
            streetLabel, streetTextField, streetSeparatorView, addressStackView, locationStackView
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            blurEffectView.topAnchor.constraint(equalTo: view.topAnchor),
            blurEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blurEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            menuImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.menuImageViewTopAnchor),
            menuImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(
                equalTo: menuImageView.bottomAnchor,
                constant: Constants.descriptionLabelTopAnchor
            ),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cityLabel.topAnchor.constraint(
                equalTo: descriptionLabel.bottomAnchor,
                constant: Constants.cityLabelTopAnchor
            ),
            cityLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            
            cityTextField.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: Constants.topAnchorTextField),
            cityTextField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.leadingAnchorTextField
            ),
            
            citySeparatorView.topAnchor.constraint(
                equalTo: cityTextField.bottomAnchor,
                constant: Constants.separatorTopAnchor
            ),
            citySeparatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            citySeparatorView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.trailingAcnhor
            ),
            citySeparatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeightAnchor),
            
            stationLabel.topAnchor.constraint(
                equalTo: citySeparatorView.bottomAnchor,
                constant: Constants.labelTopAnchor
            ),
            stationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            
            stationTextField.topAnchor.constraint(
                equalTo: stationLabel.bottomAnchor,
                constant: Constants.topAnchorTextField
            ),
            stationTextField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.leadingAnchorTextField
            ),
            
            stationSeparatorView.topAnchor.constraint(
                equalTo: stationTextField.bottomAnchor,
                constant: Constants.separatorTopAnchor
            ),
            stationSeparatorView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.leadingAnchor
            ),
            stationSeparatorView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.trailingAcnhor
            ),
            stationSeparatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeightAnchor),
            
            streetLabel.topAnchor.constraint(
                equalTo: stationSeparatorView.bottomAnchor,
                constant: Constants.labelTopAnchor
            ),
            streetLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            
            streetTextField.topAnchor.constraint(
                equalTo: streetLabel.bottomAnchor,
                constant: Constants.topAnchorTextField
            ),
            streetTextField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.leadingAnchorTextField
            ),
            
            streetSeparatorView.topAnchor.constraint(
                equalTo: streetTextField.bottomAnchor,
                constant: Constants.separatorTopAnchor
            ),
            streetSeparatorView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.leadingAnchor
            ),
            streetSeparatorView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.trailingAcnhor
            ),
            streetSeparatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeightAnchor),
            
            addressStackView.topAnchor.constraint(
                equalTo: streetSeparatorView.bottomAnchor,
                constant: Constants.stackViewTopAnchor
            ),
            addressStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            
            locationStackView.topAnchor.constraint(
                equalTo: streetSeparatorView.bottomAnchor,
                constant: Constants.stackViewTopAnchor
            ),
            locationStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.locationStackViewTopAnchor
            )
            
        ])
    }
}

// MARK: - Constants
private struct Constants {
    static let menuImageViewTopAnchor: CGFloat = 74
    static let descriptionLabelTopAnchor: CGFloat = 20
    static let leadingAnchor: CGFloat = 33
    static let trailingAcnhor: CGFloat = 35
    static let topAnchorTextField: CGFloat = 10
    static let leadingAnchorTextField: CGFloat = 32
    static let cityLabelTopAnchor: CGFloat = 32
    static let separatorHeightAnchor: CGFloat = 1
    static let separatorTopAnchor: CGFloat = 12
    static let stackViewTopAnchor: CGFloat = 55
    static let labelTopAnchor: CGFloat = 30
    static let locationStackViewTopAnchor: CGFloat = 47
}
