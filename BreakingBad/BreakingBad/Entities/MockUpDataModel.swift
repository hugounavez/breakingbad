//
//  MockUpDataModel.swift
//  BreakingBad
//
//  Created by Hugo Reyes on 12/25/21.
//

import Foundation

struct MockUpDataModel {
    
    static let data = [
        BreakingBadCharacter(name: "Walter White", id: 1, birthday: "09-07-1958", img: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg", status: "Presumed dead", nickname: "Heisenberg", portrayed: "Bryan Cranston", category: "Breaking Bad", occupation: [
            "High School Chemistry Teacher",
            "Meth King Pin"
        ], appearance: [
            1,
            2,
            3,
            4,
            5
        ]), BreakingBadCharacter(name: "Jesse Pinkman", id: 2, birthday: "09-24-1984", img: "https://vignette.wikia.nocookie.net/breakingbad/images/9/95/JesseS5.jpg/revision/latest?cb=20120620012441", status: "Alive", nickname: "Cap n' Cook", portrayed: "Aaron Paul", category: "Breaking Bad", occupation: [
            "Meth Dealer"
        ], appearance: [
            1,
            2,
            3,
            4,
            5
        ]),
        BreakingBadCharacter(name: "Mike Ehrmantraut", id: 7, birthday: "Unknown", img: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_mike-ehrmantraut-lg.jpg", status: "Deceased", nickname: "Mike", portrayed: "Jonathan Banks", category: "Breaking Bad, Better Call Saul", occupation: [
            "Hitman",
            "Private Investigator",
            "Ex-Cop"
        ], appearance: [
            2,
            3,
            4,
            5
        ])
    ]
    
    
}
