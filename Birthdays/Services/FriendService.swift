//
//  FriendService.swift
//  Birthdays
//
//  Created by Seraphim Kovalchuk on 06.07.2022.
//

import Foundation
import Combine
import Alamofire

protocol ServiceProtocol {
    func fetchFriends() -> AnyPublisher<DataResponse<FriendListModel, NetworkError>, Never>
}

final class Service {
    static let shared: ServiceProtocol = Service()
    private init() { }
}

extension Service: ServiceProtocol {
    func fetchFriends() -> AnyPublisher<DataResponse<FriendListModel, NetworkError>, Never> {
        let url = URL(string: "https://randomuser.me/api/?results=1000&seed=chalkboard&inc=name,dob")!
        
        return AF.request(url, method: .get)
        .validate()
        .publishDecodable(type: FriendListModel.self)
        .map { response in
            response.mapError { error in
                let backendError = response.data.flatMap { try? JSONDecoder().decode(BackendError.self, from: $0)}
                return NetworkError(initialError: error, backendError: backendError)
            }
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
