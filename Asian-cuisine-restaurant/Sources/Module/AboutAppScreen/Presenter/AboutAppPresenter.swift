import UIKit

protocol AboutAppViewProtocol: AnyObject {
    func reloadCollectionView()
    func rateButtonTapped()
}

final class AboutAppPresenter {
    
    weak var view: AboutAppViewProtocol?
    private var items: [AboutAppModel] = []
    
    func attachView(_ view: AboutAppViewProtocol) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }
    
    func viewDidLoad() {
        items = [
            AboutAppModel(title: "Для связи", desciption: "office@niyama.ru"),
            AboutAppModel(title: "Отдел качества", desciption: "quality@niyama.ru"),
            AboutAppModel(title: "Служба доставки", desciption: "+7 (495) 781-781-9")
        ]
        view?.reloadCollectionView()
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
