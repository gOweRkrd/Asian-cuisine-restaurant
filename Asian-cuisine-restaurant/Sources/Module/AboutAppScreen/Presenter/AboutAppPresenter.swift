import UIKit

protocol AboutAppViewProtocolInput: AnyObject {
    func viewDidLoad()
    func detachView()
    func item(at index: Int) -> AboutAppModel
    func numberOfItems() -> Int
    func rateButtonTapped()
}

protocol AboutAppProtocolOutput: AnyObject {
    func reloadCollectionView()
}

final class AboutAppPresenter: AboutAppViewProtocolInput {
    
    weak var output: AboutAppProtocolOutput?
    private var items: [AboutAppModel] = []
    
    func detachView() {
        self.output = nil
    }
    
    func viewDidLoad() {
        items = [
            AboutAppModel(
                title: R.AboutAppPresenter.сommunication,
                desciption: R.AboutAppPresenter.сommunicationDescription
            ),
            AboutAppModel(
                title: R.AboutAppPresenter.qualityDepartment,
                desciption: R.AboutAppPresenter.qualityDepartmentDescription
            ),
            AboutAppModel(
                title: R.AboutAppPresenter.deliveryService,
                desciption: R.AboutAppPresenter.deliveryServiceDescription
            )
        ]
        output?.reloadCollectionView()
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func item(at index: Int) -> AboutAppModel {
        items[index]
    }
    
    func rateButtonTapped() {
        if let url = URL(string: "https://www.apple.com/app-store/") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
