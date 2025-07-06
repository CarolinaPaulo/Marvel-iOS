//
//  ListView.swift
//  Marvel-iOS
//
//  Created by user on 06/07/25.
//

import UIKit

internal class ListView: UIView {
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    internal var viewModel: ListViewModelProtocol? {
        didSet{
            update()
        }
    }
        
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    internal func update() {
        
    }

}

extension ListView: ViewCodeConfiguration {
    
    func buildHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                tableView.topAnchor.constraint(equalTo: topAnchor),
                tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo:
                                                    bottomAnchor)
            ]
        )
    }
    
    func configureViews() {

        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: "cell")
       
    }

}

extension ListView: UITableViewDelegate, UITableViewDataSource {
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CharacterTableViewCell
        guard let character = viewModel?.characters[indexPath.row] else {
            return UITableViewCell()
        }

        cell.imageFoto.image = UIImage()//character.image
        cell.labelName.text = character.name
        
        let indicator = UIImage(named: "chevron.png")!.withTintColor(.white)
        cell.accessoryType = .disclosureIndicator
        cell.accessoryView = UIImageView(image: indicator)
 
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.characters.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return self.frame.height*0.2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let viewController = CharacterViewController()
//        let character = characters[indexPath.row]
//        viewController.character = character
//        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
