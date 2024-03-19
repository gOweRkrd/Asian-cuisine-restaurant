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
        button.contentEdgeInsets = UIEdgeInsets(
            top: Constants.deliviryButtonTopBottomInternalAnchor,
            left: Constants.deliviryButtonLeftRightInternalAnchor,
            bottom: Constants.deliviryButtonTopBottomInternalAnchor,
            right: Constants.deliviryButtonLeftRightInternalAnchor
        )
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
        separatorView.backgroundColor = R.Colors.coolGray
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
        separatorView.backgroundColor = R.Colors.coolGray
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
        separatorView.backgroundColor = R.Colors.coolGray
        return separatorView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 3
        collectionView.backgroundColor = .clear
        collectionView.register(FeedBackViewCell.self, forCellWithReuseIdentifier: R.FeedbackViewController.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton(type: .system)
        let plusImage = UIImage(systemName: "plus.circle")
        button.setImage(plusImage, for: .normal)
        let scaledImage = plusImage?.withRenderingMode(.alwaysTemplate)
            .scaled(to: CGSize(
            width: Constants.plusButtonImageSize,
            height: Constants.plusButtonImageSize
        ))
        button.setImage(scaledImage, for: .normal)
        button.tintColor = R.Colors.tangerine
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.setTitleColor(R.Colors.yellow, for: .normal)
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var addPhotoLabel: UILabel = {
        let label = UILabel()
        label.text = R.FeedbackViewController.addPhotoLabel
        label.textColor = R.Colors.tangerine
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var feedBackLabel: UILabel = {
        let label = UILabel()
        label.text = R.FeedbackViewController.feedBackLabel
        label.textColor = R.Colors.coolGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private lazy var subDescription: UILabel = {
        let label = UILabel()
        label.text = R.FeedbackViewController.subDescription
        label.textColor = R.Colors.white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let separatorView = UIView()
        separatorView.backgroundColor = R.Colors.coolGray
        return separatorView
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(R.FeedbackViewController.sendButton, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.setTitleColor(R.Colors.white, for: .normal)
        button.backgroundColor = R.Colors.darkOrange
        button.layer.cornerRadius = 22
        button.layer.borderWidth = 1.0
        button.layer.borderColor = R.Colors.tangerine.cgColor
        button.contentEdgeInsets = UIEdgeInsets(
            top: Constants.sendButtonTopBottomInternalAnchor,
            left: Constants.sendButtonLeftRightInternalAnchor,
            bottom: Constants.sendButtonTopBottomInternalAnchor,
            right: Constants.sendButtonLeftRightInternalAnchor
        )
        button.addTarget(
            self,
            action: #selector(sendButtonTapped),
            for: .touchUpInside
        )
        return button
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
        presenter = FeedBackPresenter()
        presenter?.viewDidLoad()
        setupNavigationBar()
        addSubviews()
        setupConstraints()
        setupTextField()
        addTapGestureToDismissKeyboard()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter?.updateCellVisibility(in: collectionView)
    }
    
    // MARK: - Private methods
    private func setupTextField() {
        nameTextField.delegate = self
        phoneNumberTextField.delegate = self
        numberOrderTextField.delegate = self
    }
    
    @objc
    private func cartButtonTapped() {
        presenter?.cartButtonTapped()
    }
    
    @objc
    private func restaurantButtonTapped() {
        presenter?.restaurantButtonTapped()
    }
    
    @objc
    private func deliviryButtonTapped() {
        presenter?.deliviryButtonTapped()
    }
    
    @objc
    private func plusButtonTapped() {
        presenter?.plusButtonTapped()
    }
    
    @objc
    private func sendButtonTapped() {
        presenter?.sendButtonTapped()
    }
    
    private func addTapGestureToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func dismissKeyboard() {
        view.endEditing(true)
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
        for (field, label, separatorView) in fieldsMapping {
            if textField == field {
                label.textColor = textField.text?.isEmpty == true ? R.Colors.coolGray : R.Colors.tangerine
                separatorView.backgroundColor = textField.text?.isEmpty == true ? R.Colors.gray : R.Colors.tangerine
            } else {
                label.textColor = R.Colors.coolGray
                separatorView.backgroundColor = R.Colors.coolGray
            }
        }
    }
}

// MARK: - UICollectionViewDataSource
extension FeedbackViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.numberOfItems() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: R.FeedbackViewController.identifier,
            for: indexPath
        ) as? FeedBackViewCell else {
            fatalError(R.FeedbackViewController.fatalError)
        }
        
        if let item = presenter?.item(at: indexPath.row) {
            cell.configure(model: item)
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension FeedbackViewController: UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        presenter?.updateCellVisibility(in: collectionView)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FeedbackViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 132, height: 120)
    }
}

// MARK: - FeedBackProtocolOutput
extension FeedbackViewController: FeedBackProtocolOutput {
    func updateCellVisibility(in collectionView: UICollectionView) {
        presenter?.updateCellVisibility(in: collectionView)
    }

    func reloadCollectionView() {
        collectionView.reloadData()
    }
}

// MARK: - Setup Constrains
private extension FeedbackViewController {
    func addSubviews() {
        view.addSubviews([
            restaurantButton, deliviryButton, nameLabel, nameTextField, nameSeparatorView,
            phoneNumberLabel, phoneNumberTextField, phoneNumberSeparatorView,
            numberOrderLabel, numberOrderTextField, numberOrderSeparatorView, collectionView,
            plusButton, addPhotoLabel, feedBackLabel, subDescription, separatorView, sendButton
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
            numberOrderSeparatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeight),
            
            collectionView.topAnchor.constraint(
                equalTo: numberOrderSeparatorView.bottomAnchor,
                constant: Constants.collectionViewTopAcnhor
            ),
            collectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.leadingAnchorTwentyFive
            ),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: Constants.collectionViewHeight),
            
            plusButton.topAnchor.constraint(
                equalTo: collectionView.bottomAnchor,
                constant: Constants.plusButtonTopAcnhor
            ),
            plusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            
            addPhotoLabel.topAnchor.constraint(
                equalTo: collectionView.bottomAnchor,
                constant: Constants.addPhotoLabelTopAnchor
            ),
            addPhotoLabel.leadingAnchor.constraint(
                equalTo: plusButton.trailingAnchor,
                constant: Constants.addPhotoLabelLeadingAnchor
            ),
            
            feedBackLabel.topAnchor.constraint(
                equalTo: plusButton.bottomAnchor,
                constant: Constants.feedBackLabelTopAnchor
            ),
            feedBackLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leadingAnchor),
            
            subDescription.topAnchor.constraint(
                equalTo: feedBackLabel.bottomAnchor,
                constant: Constants.subDescriptionLabelTopAnchor
            ),
            subDescription.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.subDescriptionLabelLeadingAnchor
            ),
            
            separatorView.topAnchor.constraint(
                equalTo: subDescription.bottomAnchor,
                constant: Constants.separatorViewLabelTopAnchor
            ),
            separatorView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.leadingAnchorTwentyFive
            ),
            separatorView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.separatorViewLabelTrailingAnchor
            ),
            separatorView.heightAnchor.constraint(equalToConstant: Constants.separatorHeight),
            
            sendButton.topAnchor.constraint(
                equalTo: separatorView.bottomAnchor,
                constant: Constants.sendButtonLabelTrailingAnchor
            ),
            sendButton.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.sendButtonLabelLeadingTrailingAnchor
            ),
            sendButton.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -Constants.sendButtonLabelLeadingTrailingAnchor
            )
        ])
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
    static let deliviryButtonTopBottomInternalAnchor: CGFloat = 10
    static let deliviryButtonLeftRightInternalAnchor: CGFloat = 49
    static let labelTopAnchor: CGFloat = 25
    static let nameLabelTopAcnhor: CGFloat = 32
    static let collectionViewTopAcnhor: CGFloat = 23
    static let collectionViewHeight: CGFloat = 130
    static let leadingAnchorTwentyFive: CGFloat = 25
    static let plusButtonTopAcnhor: CGFloat = 24
    static let plusButtonImageSize: CGFloat = 28
    static let addPhotoLabelTopAnchor: CGFloat = 30
    static let addPhotoLabelLeadingAnchor: CGFloat = 10
    static let feedBackLabelTopAnchor: CGFloat = 32
    static let subDescriptionLabelTopAnchor: CGFloat = 10
    static let subDescriptionLabelLeadingAnchor: CGFloat = 26
    static let separatorViewLabelTopAnchor: CGFloat = 47
    static let separatorViewLabelTrailingAnchor: CGFloat = 25
    static let sendButtonLabelTrailingAnchor: CGFloat = 32
    static let sendButtonLabelLeadingTrailingAnchor: CGFloat = 60
    static let sendButtonTopBottomInternalAnchor: CGFloat = 12
    static let sendButtonLeftRightInternalAnchor: CGFloat = 60
}
