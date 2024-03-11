import Foundation

protocol FeedBackViewProtocol: AnyObject {}

protocol FeedBackActionProtocol: AnyObject {
    func cartButtonTapped()
    func restaurantButtonTapped()
    func deliviryButtonTapped()
}

final class FeedBackPresenter {
    
    weak var view: FeedBackViewProtocol?
    weak var action: FeedBackActionProtocol?
    
    func attachView(_ view: FeedBackViewProtocol) {
        self.view = view
    }
    
    func detachView() {
        self.view = nil
    }
    
    func cartButtonTapped() {
        print(#function)
    }
    
    func restaurantButtonTapped() {
        print(#function)
    }
    
    func deliviryButtonTapped() {
        print(#function)
    }
}
