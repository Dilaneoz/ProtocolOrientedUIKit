//
//  ViewController.swift
//  ProtocolOrientedUIKit
//
//  Created by Atil Samancioglu on 15.09.2022.
//

import UIKit
// storyboard name i info dan ve projede diğer nerde varsa aratıp silmek gerekiyor
class UserViewController: UIViewController, UserViewModelOutput {
    
    func updateView(name: String, email: String, userName: String) { // bunun değerlerini UserViewModel da atamıştık
        self.nameLabel.text = name
        self.usernameLabel.text = userName
        self.emailLabel.text = email
    }

    
    private let nameLabel: UILabel = {
      let label = UILabel()
      label.translatesAutoresizingMaskIntoConstraints = false // constraitleri de kod olarak yazıcaz
        label.textAlignment = .center
      return label
    }()
    
    private let usernameLabel: UILabel = {
      let label = UILabel()
        label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
    }()
  
  private let emailLabel: UILabel = {
    let label = UILabel()
      label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
    fetchUsers()
  }
  
  private func setupViews() {
    view.backgroundColor = .white
    // label ları ekliyoruz
    view.addSubview(emailLabel)
      view.addSubview(nameLabel)
      view.addSubview(usernameLabel)
    
    NSLayoutConstraint.activate([ // bunu diyerek constraitleri verebiliyoruz. dizi içerisinde vermek gerekiyor
      nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), // anchor çapa demek. centerXAnchor merkezi x çapası demek. onu içerisinde bulunduğu görünümle eşitle diyoruz. yani görünümün ortasına koy x ekseninde
      nameLabel.heightAnchor.constraint(equalToConstant: 60), // yükseklik çapası 60 olsun
      nameLabel.widthAnchor.constraint(equalToConstant: 200), // genişlik
      nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100), // y ekseni için topAnchor ı kullanıyoruz. view.topAnchor ile ekranın en üstüne çapala bunu diyoruz, constant ile de arada 100 pixel bırak diyoruz
      
      emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      emailLabel.heightAnchor.constraint(equalToConstant: 60),
      emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
      
      usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      usernameLabel.heightAnchor.constraint(equalToConstant: 60),
      usernameLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10) // burada nameLabel ın altından 10 pixel sayıp koyucak

      
    ])
  }
  
  private func fetchUsers() {
    APIManager.shared.fetchUser { result in
      switch result {
      case .success(let user):
          DispatchQueue.main.async {
              self.usernameLabel.text = user.username
              self.emailLabel.text = user.email
              self.nameLabel.text = user.name
          }
      case .failure:
          DispatchQueue.main.async {
              self.emailLabel.text = "No user found"
          }
      }
    }
  }
}





