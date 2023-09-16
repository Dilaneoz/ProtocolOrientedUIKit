//
//  UserViewModel.swift
//  ProtocolOrientedUIKit
//
//  Created by Dilan Öztürk on 14.05.2023.
//

import Foundation
// UserViewModel dan diğer tarafa veriyi delegate yapısıyla aktarırız
class UserViewModel {
    
    private let userService : UserService // artık view model her istendiğinde bizden bir userservice istenicek
    weak var output : UserViewModelOutput? // weak var şu demek, bu değişken sadece kendisine erişildiğinde initialize edilecek demek. weak var yaptıktan sonra UserViewModelOutput u AnyObject tipine extent etmek gerekiyor
    
    init(userService: UserService){
        self.userService = userService
    }
    func fetchUsers(){
        
        userService.fetchuser { [weak self] result in // yukarda weak var dediğimiz için buraya [weak self] yazmak gerekiyor
            switch result {
            case .success(let user):
                self?.output?.updateView(name: user.name, email: user.email, userName: user.username) // outputu bu şekilde verdikten sonra viewcontrollerda bunu delegate olarak kullanabiliriz
            case .failure(_):
                self?.output?.updateView(name: "no user", email: "", userName: "")
            }
        }
    }
    
    
}
