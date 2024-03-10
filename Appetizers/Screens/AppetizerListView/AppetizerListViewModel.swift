//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Dhruval Desai on 26/02/24.
//

import Foundation
import SwiftUI

class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isShowingAlert = false
    @Published var isShowingDetail = false
    @Published var selectedCell: Appetizer?
    
    //    func fetchAppetizer() {
    //        NewtworkManager.shared.getAppetizer { result in
    //            DispatchQueue.main.async {
    //                switch result {
    //                case .success(let appetizers):
    //                    self.appetizers = appetizers
    //
    //                case.failure(let error):
    //                    self.isShowingAlert = true
    //
    //                    switch error {
    //
    //                    case .invalidURL:
    //                        self.alertItem = AlertItemContext.invalidURL
    //
    //                    case .invalidData:
    //                        self.alertItem = AlertItemContext.invalidData
    //
    //                    case .invalidResponse:
    //                        self.alertItem = AlertItemContext.invalidResponse
    //
    //                    case .unableToComplete:
    //                        self.alertItem = AlertItemContext.unableToComplete
    //
    //                    }
    //                }
    //            }
    //
    //
    //        }
    //    }
    func fetchAppetizer() {
        Task {
            do{
                appetizers = try await NetworkManager.shared.getAppetizer()
            }
            catch{
                alertItem = AlertItemContext.invalidResponse
                isShowingAlert = true
            }
        }
    }
}
