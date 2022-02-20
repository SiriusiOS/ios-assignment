//
//  Spinner.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 2022/02/19.
//

import Foundation
import UIKit

class Spinner: UIView {

    static let shared = Spinner()
    private var vSpinner : UIView?

    func showLoading(inView: UIView) {
        let spinnerView = UIView.init(frame: inView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let indicatorView = UIActivityIndicatorView.init(style: UIActivityIndicatorView.Style.large)
        indicatorView.startAnimating()
        indicatorView.center = spinnerView.center

        DispatchQueue.main.async {
            spinnerView.addSubview(indicatorView)
            inView.addSubview(spinnerView)
        }

        vSpinner = spinnerView
    }

    func dismissLoading() {
        DispatchQueue.main.async { [weak self] in
            self?.vSpinner?.removeFromSuperview()
            self?.vSpinner = nil
        }
    }
}
