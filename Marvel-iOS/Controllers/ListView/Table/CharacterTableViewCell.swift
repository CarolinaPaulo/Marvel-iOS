//
//  CharacterTableViewCell.swift
//  Marvel-iOS
//
//  Created by Carolina de Faria Paulo on 14/12/21.
//

import UIKit

internal class CharacterTableViewCell: UITableViewCell {

    internal var labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.cornerRadius = 20
        return label
    }()
    
    internal var imageFoto: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //        // add shadow on cell
        tintColor = .white
        backgroundColor = UIColor(named: "main")
        layer.masksToBounds = false
        
        // add corner radius on `contentView`
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        contentView.layer.shadowRadius = 7
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
        contentView.layer.shadowColor = UIColor.darkGray.cgColor
        contentView.layer.masksToBounds = false
        
        let screenSize = UIScreen.main.bounds
        let deviceWidth = screenSize.width
        let deviceHeight = screenSize.height*0.2
        
        self.imageFoto = UIImageView(frame: CGRect(x: deviceWidth*0.45, y: deviceHeight*0.05, width: deviceWidth*0.4, height: deviceHeight*0.8))
        self.labelName = UILabel(frame: CGRect(x: deviceWidth*0.05, y: 0, width: deviceWidth*0.35, height: deviceHeight/2))
        
        applyViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    internal override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }

}

extension CharacterTableViewCell: ViewCoding {

   internal func buildHierarchy() {
        addSubview(labelName)
        addSubview(imageFoto)
    }

    internal func setupConstraints() {
        imageFoto.center.y = (UIScreen.main.bounds.height*0.2)/2
        labelName.center.y = (UIScreen.main.bounds.height*0.2)/2
    }

    internal func configureViews() {
        labelName.textColor = UIColor(named: "main")
        labelName.adjustsFontSizeToFitWidth = true
        labelName.numberOfLines = 0
        labelName.font = UIFont(name: "KohinoorDevanagari-Semibold", size: 25.0)
        
        imageFoto.layer.cornerRadius = 4
        imageFoto.clipsToBounds = true
    }

}
