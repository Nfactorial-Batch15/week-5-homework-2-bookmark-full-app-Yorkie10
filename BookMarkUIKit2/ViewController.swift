//
//  ViewController.swift
//  BookMarkUIKit2
//
//  Created by Yerkebulan Sharipov on 23.01.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = .black
       firstScreen()
    }
    
    private func firstScreen(){
        let imageView = UIImageView(frame: view.bounds )
        imageView.image = UIImage(named: "Wall")
        imageView.contentMode = .scaleToFill
        view.addSubview(imageView)
        
        imageView.snp.makeConstraints{make in

            make.width.equalTo(390)
            make.height.equalTo(614)
          make.bottom.equalToSuperview().inset(230)
        }
        let label = UILabel()
        label.text = "Save all interesting links in one app"
        label.font = .systemFont(ofSize: 36, weight: .heavy)
        label.textColor = .white
        label.numberOfLines = 2
        label.textAlignment = .left
        view.addSubview(label)
        label.snp.makeConstraints { make in
                   make.left.right.equalToSuperview().inset(16)
                   make.top.equalToSuperview().inset(620)
               }
        
        let Button = UIButton(type: .system)
        Button.backgroundColor = .white
        Button.layer.cornerRadius = 16
        Button.setTitle("Let’s start collecting", for: .normal)
        Button.setTitleColor(.black, for: .normal)
        view.addSubview(Button)
        Button.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.width.equalTo(358)
            make.height.equalTo(58)
            make.left.right.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(50)
            
        }
        Button.addTarget(self, action: #selector(TappedButton), for: .touchUpInside)
    }
    @objc func TappedButton() {
        let vc = Second_Screen()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.present(vc, animated: true, completion: nil)
     
    }
}



