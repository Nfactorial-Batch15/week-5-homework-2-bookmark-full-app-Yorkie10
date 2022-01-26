//
//  LinkTableViewCell.swift
//  BookMarkUIKit2
//
//  Created by Yerkebulan Sharipov on 25.01.2022.
//

import UIKit
import SnapKit

class LinkTableViewCell: UITableViewCell {
    private let lineView: UIView = {
         let view = UIView()
        return view
    }()
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        return label
    } ()
    
    private let linkLabel: UILabel = {
           let label = UILabel()
           return label
       }()
    
    private let linkimageView : UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "Group")
        iv.isUserInteractionEnabled = true
        return iv
    } ()
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    func configure(model: LinkModel) {
        self.titleLabel.text = model.title
        self.linkLabel.text = model.link
    }
    func setUI() {

        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints{make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
        }
        self.contentView.addSubview(linkimageView)
        linkimageView.snp.makeConstraints{make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            
        }
        linkimageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleImageView)))
    }
    @objc func handleImageView() {
        guard let url = URL(string: "https://\(linkLabel.text!)") else { return }
        UIApplication.shared.open(url)
        print("DEBUG: \(self.linkLabel.text!)")
    }
}

