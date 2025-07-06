//
//  CharactersTableViewController.swift
//  Marvel-iOS
//
//  Created by Carolina de Faria Paulo on 14/12/21.
//

import UIKit

class ListViewController: UIViewController {

    var networkRequest: NetworkRequest
    var listView: ListView?

    internal init(networkRequest: NetworkRequest) {
        self.networkRequest = networkRequest
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    fileprivate func showView(model: ListViewModelProtocol) {
        let customView = ListView()
        customView.viewModel = model
        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    fileprivate func loadData(_ loading: UIAlertController) {
        networkRequest.fetchGenericData { (marvelInfo: MarvelRequest) in
            self.showView(model: ListViewModel(characters: marvelInfo.data.results))
            DispatchQueue.main.async {
                Notification().stopLoader(loading)
            }
        } onError: { (genericError: GenericError) in
            print(genericError)
            DispatchQueue.main.async {
                self.dismiss(animated: true)
                let error = Notification().startError()
                self.present(error, animated: true, completion: nil)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let loading = Notification().startLoader()
        present(loading, animated: true, completion: nil)
        loadData(loading)
    }

}
