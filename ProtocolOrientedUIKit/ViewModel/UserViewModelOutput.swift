//
//  UserViewModelOutput.swift
//  ProtocolOrientedUIKit
//
//  Created by Dilan Öztürk on 14.05.2023.
//

import Foundation
//bu protocol, yeni bir kullanıcı geldiğinde görünümleri güncelleyecek
protocol UserViewModelOutput: AnyObject {
    
    func updateView(name: String, email:String, userName: String) // neyi iletmek istiyorsak yazıyoruz
    
    
}
