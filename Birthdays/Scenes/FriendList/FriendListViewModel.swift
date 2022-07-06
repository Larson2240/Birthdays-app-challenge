//
//  FriendListViewModel.swift
//  Birthdays
//
//  Created by Seraphim Kovalchuk on 06.07.2022.
//

import Combine

final class FriendListViewModel: ObservableObject {
    @Published var loadingError = ""
    @Published var showAlert = false
    
    private var cancellables: Set<AnyCancellable> = []
    var dataManager: ServiceProtocol
    
    init(dataManager: ServiceProtocol = Service.shared) {
        self.dataManager = dataManager
    }
    
    func getFriendsList(completion: @escaping ([FriendModel]?) -> Void) {
        dataManager.fetchFriends()
            .sink { dataResponse in
                if let error = dataResponse.error {
                    self.createAlert(with: error)
                    completion(nil)
                } else if let results = dataResponse.value?.results {
                    completion(results)
                }
            }
            .store(in: &cancellables)
    }
    
    func createAlert( with error: NetworkError ) {
        loadingError = error.backendError == nil ? error.initialError.localizedDescription : error.backendError!.message
        self.showAlert = true
    }
}
