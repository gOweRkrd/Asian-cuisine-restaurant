import UIKit

final class FeedbackViewController: UIViewController {
    
    private var presenter: FeedBackPresenter?
    
    // MARK: - Ui
    private lazy var restaurantButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(R.FeedbackViewController.restaurantButton, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.setTitleColor(R.Colors.gray, for: .normal)
        button.addTarget(
            self,
            action: #selector(restaurantButtonTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    private lazy var deliviryButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(R.FeedbackViewController.deliviryButton, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        button.setTitleColor(R.Colors.white, for: .normal)
        button.backgroundColor = R.Colors.brownishOrange
        button.layer.cornerRadius = 17
        button.layer.borderWidth = 1.0
        button.layer.borderColor = R.Colors.tangerine.cgColor
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 49, bottom: 10, right: 49)
        button.addTarget(
            self,
            action: #selector(deliviryButtonTapped),
            for: .touchUpInside
        )
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = R.FeedbackViewController.nameLabel
        label.textColor = R.Colors.coolGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = R.FeedbackViewController.nameTextField
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: R.Colors.white,
            .font: UIFont.systemFont(ofSize: 16, weight: .medium)
        ]
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textField.textColor = R.Colors.white
        textField.tintColor = R.Colors.tangerine
        return textField
    }()
    
    private lazy var nameSeparatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = R.Colors.darkGray
        return separatorView
    }()
    
    private lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = R.FeedbackViewController.phoneNumberLabel
        label.textColor = R.Colors.coolGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private lazy var phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = R.FeedbackViewController.phoneNumberTextField
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: R.Colors.white,
            .font: UIFont.systemFont(ofSize: 16, weight: .medium)
        ]
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textField.textColor = R.Colors.white
        textField.tintColor = R.Colors.tangerine
        return textField
    }()
    
    private lazy var phoneNumberSeparatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = R.Colors.darkGray
        return separatorView
    }()
    
    private lazy var numberOrderLabel: UILabel = {
        let label = UILabel()
        label.text = R.FeedbackViewController.numberOrderLabel
        label.textColor = R.Colors.coolGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private lazy var numberOrderTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = R.FeedbackViewController.numberOrderTextField
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: R.Colors.white,
            .font: UIFont.systemFont(ofSize: 16, weight: .medium)
        ]
        textField.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        textField.textColor = R.Colors.white
        textField.tintColor = R.Colors.tangerine
        return textField
    }()
    
    private lazy var numberOrderSeparatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = R.Colors.darkGray
        return separatorView
    }()
    
    private func setupNavigationBar() {
        let basketButton = UIBarButtonItem(
            image: UIImage(resource: .basket),
            style: .plain,
            target: self,
            action: #selector(cartButtonTapped)
        )
        navigationItem.rightBarButtonItem = basketButton
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = R.Colors.white
        view.backgroundColor = R.Colors.black
        presenter?.viewDidLoad()
        setupNavigationBar()
        addSubviews()
        setupConstraints()
        setupTextField()
    }
    
    // MARK: - Private methods
    private func setupTextField() {
        nameTextField.delegate = self
        phoneNumberTextField.delegate = self
        numberOrderTextField.delegate = self
    }
}

// MARK: - UITextFieldDelegate
extension FeedbackViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let fieldsMapping: [(textField: UITextField, label: UILabel, separatorView: UIView)] = [
            (nameTextField, nameLabel, nameSeparatorView),
            (phoneNumberTextField, phoneNumberLabel, phoneNumberSeparatorView),
            (numberOrderTextField, numberOrderLabel, numberOrderSeparatorView)
        ]
        
        for (field, label, separatorView) in fieldsMapping where textField == field {
            label.textColor = textField.text?.isEmpty == true ? R.Colors.coolGray : R.Colors.tangerine
            separatorView.backgroundColor = textField.text?.isEmpty == true ? R.Colors.darkGray : R.Colors.tangerine
            break
        }
    }
}

// MARK: - Setup Constrains
private extension FeedbackViewController {
    func addSubviews() {
        view.addSubviews([
            restaurantButton, deliviryButton, nameLabel, nameTextField, nameSeparatorView,
            phoneNumberLabel, phoneNumberTextField, phoneNumberSeparatorView,
            numberOrderLabel, numberOrderTextField, numberOrderSeparatorView
        ])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            restaurantButton.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.buttonTopAnchor
            ),
            restaurantButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.restaurantButtonLeadingButton
            ),
            
            deliviryButton.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: Constants.buttonTopAnchor
            ),
            deliviryButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.deliviryButtonTrailingButton
            ),
            
            nameLabel.topAnchor.constraint(
                equalTo: restaurantButton.bottomAnchor,
                constant: Constants.nameLabelTopAcnhor
            ),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.textFeildTopAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            
            nameSeparatorView.topAnchor.constraint(
                equalTo: nameTextField.bottomAnchor,
                constant: Constants.separatorViewLTopAnchor
            ),
            nameSeparatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            nameSeparatorView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.separatorViewLTrailingAnchor
            ),
            nameSeparatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeight),
            
            phoneNumberLabel.topAnchor.constraint(
                equalTo: nameSeparatorView.bottomAnchor,
                constant: Constants.labelTopAnchor
            ),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            
            phoneNumberTextField.topAnchor.constraint(
                equalTo: phoneNumberLabel.bottomAnchor,
                constant: Constants.textFeildTopAnchor
            ),
            phoneNumberTextField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: Constants.leadingAnchor
            ),
            
            phoneNumberSeparatorView.topAnchor.constraint(
                equalTo: phoneNumberTextField.bottomAnchor,
                constant: Constants.separatorViewLTopAnchor
            ),
            phoneNumberSeparatorView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: Constants.leadingAnchor
            ),
            phoneNumberSeparatorView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.separatorViewLTrailingAnchor
            ),
            phoneNumberSeparatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeight),
            
            numberOrderLabel.topAnchor.constraint(
                equalTo: phoneNumberSeparatorView.bottomAnchor,
                constant: Constants.labelTopAnchor
            ),
            numberOrderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            
            numberOrderTextField.topAnchor.constraint(
                equalTo: numberOrderLabel.bottomAnchor,
                constant: Constants.textFeildTopAnchor
            )
            ,
            numberOrderTextField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.leadingAnchor
            ),
            
            numberOrderSeparatorView.topAnchor.constraint(
                equalTo: numberOrderTextField.bottomAnchor,
                constant: Constants.separatorViewLTopAnchor
            ),
            numberOrderSeparatorView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, 
                constant: Constants.leadingAnchor
            ),
            numberOrderSeparatorView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.separatorViewLTrailingAnchor
            ),
            numberOrderSeparatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeight)
        ])
    }
}

// MARK: - FeedBackProtocolOutput
extension FeedbackViewController: FeedBackProtocolOutput {
    @objc
    func cartButtonTapped() {
        presenter?.cartButtonTapped()
    }
    
    @objc
    func restaurantButtonTapped() {
        presenter?.restaurantButtonTapped()
    }
    
    @objc
    func deliviryButtonTapped() {
        presenter?.deliviryButtonTapped()
    }
}

// MARK: - Constants
private struct Constants {
    static let separatorHeight: CGFloat = 1
    static let leadingAnchor: CGFloat = 26
    static let separatorViewLTopAnchor: CGFloat = 12
    static let separatorViewLTrailingAnchor: CGFloat = 24
    static let textFeildTopAnchor: CGFloat = 10
    static let buttonTopAnchor: CGFloat = 8
    static let restaurantButtonLeadingButton: CGFloat = 65
    static let deliviryButtonTrailingButton: CGFloat = 31
    static let labelTopAnchor: CGFloat = 25
    static let nameLabelTopAcnhor: CGFloat = 32
}
