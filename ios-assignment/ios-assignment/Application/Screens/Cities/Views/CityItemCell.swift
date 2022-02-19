//
//  CityItemCell.swift
//  ios-assignment
//
//  Created by Nguyen Ngoc Diep on 19/02/2022.
//

import UIKit

class CityItemCell: UITableViewCell {

    @IBOutlet weak var subCountryLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setUI(data: CityEntity) {
        countryLabel.text = "\(data.name), \(data.country)"
        subCountryLabel.text = "\(data.coord.lat),\(data.coord.lon)"
    }
}
