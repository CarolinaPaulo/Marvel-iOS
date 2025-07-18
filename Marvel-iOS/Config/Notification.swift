//
//  LoadingAlert.swift
//  Marvel-iOS
//
//  Created by Carolina de Faria Paulo on 23/12/21.
//

import UIKit

internal class Notification {
    
    internal func startLoader() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Carregando...", preferredStyle: .alert)
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.large
            loadingIndicator.startAnimating()
            loadingIndicator.color = UIColor(named: "main")
            alert.view.addSubview(loadingIndicator)
            alert.view.tintColor = UIColor(named: "main")
            return alert
        }
    
    internal func stopLoader(_ loader : UIAlertController) {
        DispatchQueue.main.async {
            loader.dismiss(animated: true, completion: nil)
        }
    }

    internal func startError() -> UIAlertController {
        let alert = UIAlertController(title: nil, message: "Error na requisição", preferredStyle: .alert)
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = UIActivityIndicatorView.Style.large
            loadingIndicator.startAnimating()
            loadingIndicator.color = UIColor(named: "main")
            alert.view.addSubview(loadingIndicator)
            alert.view.tintColor = UIColor(named: "main")
            return alert
        }

}
