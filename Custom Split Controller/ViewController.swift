//
//  ViewController.swift
//  Custom Split Controller
//
//  Created by mrminayy on 7/27/17.
//  Copyright © 2017 mrminayy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource , UITableViewDelegate {


    enum TabIndex : Int {
        case oneChildTab = 0
        case twoChildTab = 1
        case threeChildTab = 2
        case fourChildTab = 3

    }

    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var contentView: UIView!

    var oneViewController: UIViewController?
    lazy var oneChildTabVC: UIViewController? = {
        let oneChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "one")
        return oneChildTabVC
    }()
    var twoViewController: UIViewController?
    lazy var twoChildTabVC: UIViewController? = {
        let twoChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "two")
        return twoChildTabVC
    }()
    var threeViewController: UIViewController?
    lazy var threeChildTabVC: UIViewController? = {
        let threeChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "three")
        return threeChildTabVC
    }()
    var fourController: UIViewController?
    lazy var fourChildTabVC: UIViewController? = {
        let fourChildTabVC = self.storyboard?.instantiateViewController(withIdentifier: "four")
        return fourChildTabVC
    }()


    var tableData = ["one", "two", "three","four", "five", "six","seven", "eight", "nine","ten", "eleven"]

    override func viewDidLoad() {
        super.viewDidLoad()
        displayCurrentTab(0)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! TableViewCell
        cell.lblName.text = tableData[indexPath.row]

        return cell

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 53

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {



        displayCurrentTab(indexPath.row)


        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let currentViewController = oneViewController {
            currentViewController.viewWillDisappear(animated)
        }
    }

    func displayCurrentTab(_ tabIndex: Int){
        if let vc = viewControllerForSelectedSegmentIndex(tabIndex) {

            self.addChildViewController(vc)
            vc.didMove(toParentViewController: self)

            vc.view.frame = self.contentView.bounds
            self.contentView.addSubview(vc.view)
            self.oneViewController = vc
        }
    }


    func viewControllerForSelectedSegmentIndex(_ index: Int) -> UIViewController? {
        var vc: UIViewController?
        switch index {
        case TabIndex.oneChildTab.rawValue :
            vc = oneChildTabVC
        case TabIndex.twoChildTab.rawValue :
            vc = twoChildTabVC
        case TabIndex.threeChildTab.rawValue :
            vc = threeChildTabVC
        case TabIndex.fourChildTab.rawValue :
            vc = fourChildTabVC
        default:
            return nil
        }
        
        return vc
    }

}

