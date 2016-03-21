//
//  DetailViewController.swift
//  Storm Viewer
//
//  Created by Alex on 12/19/15.
//  Copyright © 2015 Alex Barcenas. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var facebook: UIBarButtonItem!
    
    // The image shown in the detail view controller.
    var detailItem: String? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    /*
     * Function Name: configureView
     * Parameters: None
     * Purpose: This method updates the image shown in the Image View.
     * Return Value: None
     */
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let imageView = self.detailImageView {
                imageView.image = UIImage(named: detail)
            }
        }
    }

    /*
     * Function Name: viewDidLoad
     * Parameters: None
     * Purpose: This method creates two bar button items that will be displayed in the navigation bar.
     * Return Value: None
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        // Creates bar buttons used for sharing to Facebook and to other mediums.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "shareTapped")
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "shareFacebook")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     * Function Name: viewWillAppear
     * Parameters: animated - whether or not there is animation
     * Purpose: This method hides the bars on top when the view controller is going to disappear.
     * Return Value: None
     */
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    /*
     * Function Name: viewWillDisappear
     * Parameters: animated - whether or not there is animation.
     * Purpose: This method shows the bars on top when the view controller is going to disappear.
     * Return Value: None
     */
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    /*
     * Function Name: shareTapped
     * Parameters: None
     * Purpose: This method creates and displays a view controller that allows the user
     *   to share the image displayed in the detail view controller to any available sharing medium.
     * Return Value: None
     */
    
    func shareTapped() {
        let vc = UIActivityViewController(activityItems: [detailImageView.image!], applicationActivities: [])
        presentViewController(vc, animated: true, completion: nil)
    }
    
    /*
     * Function Name: shareFacebook
     * Parameters: None
     * Purpose: This method creates and displays a view controller that allows the
     *   user to share the image displayed in the detail view controller to Facebook.
     * Return Value: None
     */
    
    func shareFacebook()  {
        let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        vc.setInitialText("Look at this great picture!")
        vc.addImage(detailImageView.image!)
        vc.addURL(NSURL(string: "http://www.photolib.noaa.gov/nssl"))
        presentViewController(vc, animated: true, completion: nil)
    }

}

