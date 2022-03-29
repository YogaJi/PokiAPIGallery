//
//  GalleryCollectionViewController.swift
//  PokiAPIGallery
//
//  Created by Yujia on 2022/3/26.
//

import UIKit

private let reuseIdentifier = "poke"

class GalleryCollectionViewController: UICollectionViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var imagePokeGallery = [UIImage]()

    //create the button to add images to the collection view
    @IBAction func addButton(_ sender: Any) {
        //create UIImage picker controller to get system photo library and set present animation
        let imagePicker = UIImagePickerController()

        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    //set function using UIImage picker controller to get image from system original image and set it as UIImage type
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        //add UIImage to the collection view's array
        imagePokeGallery.append(image)
        collectionView.reloadData()
        //dismiss the function
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //run the APIHelper when the view loads and receive the API poke images and add them to the imagePokeGallery array.
        PokeAPIHelper.fetchAllImages { images in
            
            for _ in 0...100000{
                continue
            }
            self.imagePokeGallery = images
            self.collectionView.reloadData()
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        //return the number of collection view cells as that of items in imagePokeGallery.
        return imagePokeGallery.count
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "poke", for: indexPath) as! GalleryCollectionViewCell
        //set spinner animation
        cell.spinner.startAnimating()
        for _ in 0...100000{
            continue
        }
        //set the array image to the cell's image
        DispatchQueue.main.async{
            cell.spinner.isHidden = true
            cell.image.image = self.imagePokeGallery[indexPath.row]
        }

        cell.backgroundColor = .white
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
