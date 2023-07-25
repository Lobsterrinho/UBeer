//
//  RealtimeDatabaseService.swift
//  UBeer
//
//  Created by Lobster on 10.04.23.
//

import Foundation
import UIKit
import FirebaseDatabase
import FirebaseAuth

typealias UsersCheckIns = [[String : [[String : [String : Any]]]]]

final class RealtimeDatabaseService: RealtimeDatabaseServiceProtocol {
    
    private enum Const {
        static let path: String = "checkIns"
    }
    
    private let firebaseReference = Database.database(
        url: "https://ubeer-df05b-default-rtdb.europe-west1.firebasedatabase.app/"
    ).reference()
#warning("change to protocol")
    private var firebaseAuthService = AuthorizationService()
    private var firebaseStorage = FirebaseStorage()
    
    //MARK: - The method to create check in
    func createCheckIn(model: CheckInModel) {
        
        var currentUser: FirebaseAuth.User?
        firebaseAuthService.getCurrentUser { user in
            currentUser = user
        }
        let user = currentUser!.uid
        
        // Method calls to upload image data to firebase storage and right receive URL for this image. If the image wasn't selected, then method return nil and check in will be added without the image.
        firebaseStorage.uploadImage(path: FirebaseStorageEndpoints.checkInImages,
                                    imageData: model.imageData,
                                    userID: currentUser!.uid) { result in
            switch result {
            case.success(let url):
                self.firebaseReference
                    .child(Const.path)
                    .observeSingleEvent(of: .value) { snapshot in
                        
                    let imageURL = url?.absoluteString ?? ""
                        
                    if snapshot.exists() {
                        
                        guard let checkInsArray = snapshot.value
                                as? UsersCheckIns else { return }
                        
                        let keys = checkInsArray.compactMap { $0.keys.first }
                        if keys.contains(user) {
                            // If user already made at least 1 check in and was found, then new check in will be added in his array
                            self.uploadNewCheckIn(userID: user,
                                                  model: model,
                                                  imageURL: imageURL,
                                                  checkInsArray: checkInsArray)
                        } else {
                            // If user wasn't made at least 1 check in, the he also won't found, then user will be added in users array and his check in will be added in his own check ins array
                            self.uploadNewUserWithCheckIn(userID: user,
                                                          model: model,
                                                          imageURL: imageURL,
                                                          checkInsArray: checkInsArray)
                        }
                    } else {
                        // Method just for absolute user which will create array of users with this user check in
                        self.uploadNewCheckInsArray(userID: user,
                                                    model: model,
                                                    imageURL: imageURL)
                    }
                }
            case.failure(let error):
                print(error)
            }
        }
    }
    
    //MARK: - Upload new check in for exact user
    private func uploadNewCheckIn(userID: String,
                                  model: CheckInModel,
                                  imageURL: String,
                                  checkInsArray: UsersCheckIns) {
        var checkInArray = checkInsArray
        if var userCheckIns = checkInArray[0][userID] {
            let newCheckInEntry = [
                "\(UUID())":
                    [
                        "imageURL": imageURL,
                        "longitude": model.longitude,
                        "latitude": model.latitude,
                        "numberOfPeople": model.numberOfPeople,
                        "wishes": model.wishes
                    ]
            ]
            userCheckIns.append(newCheckInEntry)
            checkInArray[0][userID] = userCheckIns
        }
        self.firebaseReference
            .child(Const.path)
            .setValue(checkInArray) { error, _ in
                if let error = error {
                    print("***ERROR \(error.localizedDescription)***")
                } else {
                    print("***DATA SAVED***")
                }
            }
    }
    
    //MARK: - Upload new user with his check in
    private func uploadNewUserWithCheckIn(userID: String,
                                          model: CheckInModel,
                                          imageURL: String,
                                          checkInsArray: UsersCheckIns) {
        var checkInArray = checkInsArray
        let newUserAndCheckIn = [
            userID:
                [
                    [
                        "\(UUID())": [
                            "imageURL": imageURL,
                            "longitude": model.longitude,
                            "latitude": model.latitude,
                            "numberOfPeople": model.numberOfPeople,
                            "wishes": model.wishes
                        ]
                    ]
                ]
        ]
        checkInArray.append(newUserAndCheckIn)
        self.firebaseReference
            .child(Const.path)
            .setValue(checkInArray) { error, _ in
                if let error = error {
                    print("***ERROR \(error.localizedDescription)***")
                } else {
                    print("***DATA SAVED***")
                }
            }
    }
    
    //MARK: - Upload absolutely new array with first user ant his check in
    private func uploadNewCheckInsArray(userID: String,
                                        model: CheckInModel,
                                        imageURL: String) {
        let newCheckInsArray: UsersCheckIns = [
            [
                userID:
                    [
                        [
                            "\(UUID())": [
                                "imageURL": imageURL,
                                "longitude": model.longitude,
                                "latitude": model.latitude,
                                "numberOfPeople": model.numberOfPeople,
                                "wishes": model.wishes
                            ]
                        ]
                    ]
            ]
        ]
        self.firebaseReference
            .child(Const.path)
            .setValue(newCheckInsArray) { error, _  in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("NEW ARRAY WAS ADDED")
                }
            }
    }
    
    //MARK: - Load users check ins array
    func loadCheckIns(completion: @escaping (UsersCheckIns) -> Void) {
        firebaseReference
            .child(Const.path)
            .observe(.value) { snapshot, _ in
                guard let checkInsArray = snapshot.value
                        as? UsersCheckIns else { return }
                completion(checkInsArray)
         }
    }
}

