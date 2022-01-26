//
//  Second_Screen.swift
//  BookMarkUIKit2
//
//  Created by Yerkebulan Sharipov on 25.01.2022.
//

import UIKit
import SnapKit

class Second_Screen : UIViewController{
    private var links : [LinkModel] = Storage.linkModels {
    didSet {
        if links.count > 0 {
            checkLinks()
        }
        if links.count == 0 {
            checkLinks()
        }
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkLinks()
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .init(red: 0.95, green: 0.95, blue: 0.93, alpha: 1)
        
        Button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        
        tableView.register(LinkTableViewCell.self, forCellReuseIdentifier: "LinkTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints{ make in
            make.edges.equalToSuperview()
            
        }
        
        view.addSubview(Title)
        Title.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalToSuperview().offset(42)
        }
        
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints{ make in
            make.left.right.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
        
        view.addSubview(Button)
        Button.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.width.equalTo(358)
            make.height.equalTo(58)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(50)
        }
       
    }
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        return tableView
        
    }()
    
    private let Title : UILabel = {
        let label = UILabel()
        label.text = "Bookmark app"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    } ()
    
    
    private let mainLabel : UILabel = {
        let label = UILabel()
        label.text = "Save your first \nbookmark"
        label.textColor = .black
        label.font = .systemFont(ofSize: 36, weight: .heavy)
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    } ()
    
    private let Button : UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("Add bookmark", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 16
        return button
    } ()
    private func checkLinks(){
        if links.isEmpty {
            tableView.isHidden = true
            mainLabel.isHidden = false
            
        } else {
            tableView.isHidden = false
            mainLabel.isHidden = true
        }
    }
   @objc private func tappedButton() {
        
       let alert = UIAlertController(title: "some title", message: .none, preferredStyle: .alert)
       
       alert.addTextField { (textField) in
           textField.placeholder = "Bookmark title"
       }
       
       alert.addTextField{ (textField) in
           textField.placeholder = "Bookmark Link"
       }
       
       alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {[weak alert] (_) in
        
           guard let title = alert?.textFields![0].text, title != "" else {return}
           guard let link = alert?.textFields![1].text, link != "" else {return}
           self.addToArray(title: title , link: link)
       }))
       
       alert.addAction(UIAlertAction(title: "Cancel ", style: .cancel, handler: { _ in
           
       }))
       self.present(alert, animated: true, completion: nil)
   }
    private func addToArray(title: String, link: String){
        
        self.links.append(LinkModel(title: title, link: link))
        Storage.linkModels.append(LinkModel(title: title, link: link))
        self.tableView.reloadData()
      //  checkLinks()
        }
       
    }

extension Second_Screen : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.links.count
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "LinkTableViewCell" , for: indexPath) as? LinkTableViewCell else {return UITableViewCell()}
         cell.configure(model: links[indexPath.row])
    
    return cell
     }
}



