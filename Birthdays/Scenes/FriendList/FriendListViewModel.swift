//
//  FriendListViewModel.swift
//  Birthdays
//
//  Created by Seraphim Kovalchuk on 06.07.2022.
//

import Foundation
import Combine

final class FriendListViewModel: ObservableObject {
    @Published var chatListLoadingError: String = ""
    @Published var showAlert = false
    @Published var isLoading = false
    
    private var cancellables: Set<AnyCancellable> = []
    var dataManager: ServiceProtocol
    
    init(dataManager: ServiceProtocol = Service.shared) {
        self.dataManager = dataManager
    }
    
    func getFriendsList(completion: @escaping ([FriendModel]?) -> Void) {
        isLoading = true
        
        dataManager.fetchFriends()
            .sink { dataResponse in
                if let error = dataResponse.error {
                    self.createAlert(with: error)
                    completion(nil)
                } else if let results = dataResponse.value?.results {
                    completion(results)
                }
                
                self.isLoading = false
            }
            .store(in: &cancellables)
    }
    
    func createAlert( with error: NetworkError ) {
        chatListLoadingError = error.backendError == nil ? error.initialError.localizedDescription : error.backendError!.message
        self.showAlert = true
    }
}
