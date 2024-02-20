//
//  QuizModel.swift
//  TestApp
//
//  Created by Artur Avdeev on 13.02.2024.
//

import Foundation

struct QuizModel {
    
    private enum StudyKeys: String {
        case studyForKey
        case isReadStudy
    }
    
    private enum TestKeys: String {
        case study_id
        case correctAnswers
        case wrongAnswers
        case awardValue
    }
    
    var studyModels: [StudyModel]
    var testModels: [TestModel]
    
    struct StudyModel: Codable, Hashable {
        var id: Int
        var studyForKey: String
        var isReadStudy: Bool
    }
    
    struct TestModel: Codable, Hashable {
        var study_id: Int
        var testForKey: String
        var correctAnswers: Int
        var wrongAnswers: Int
    }
    
    static var awards: [String] {
        get {
            if let savedAwards = UserDefaults.standard.array(forKey: "savedAwardsKey") as? [String] {
                return savedAwards
            }
            return []
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "savedAwardsKey")
            print("Awards saved successfully.")
        }
    }
    
    init(studyModels: [StudyModel], testModels: [TestModel]) {
        self.studyModels = studyModels
        self.testModels = testModels
    }
    
    static func addAward(_ award: String) {
        awards.append(award)
        UserDefaults.standard.set(awards, forKey: "savedAwardsKey")
        print("Award added successfully.")
    }
    
    static var savedStudyModels: [StudyModel] {
        get {
            if let savedData = UserDefaults.standard.data(forKey: "savedStudyModelsKey") {
                let decoder = JSONDecoder()
                do {
                    let studyModels = try decoder.decode([StudyModel].self, from: savedData)
                    return studyModels
                } catch {
                    print("Error decoding StudyModels: \(error.localizedDescription)")
                }
            }
            return []
        }
        set {
            let encoder = JSONEncoder()
            do {
                let encodedData = try encoder.encode(newValue)
                UserDefaults.standard.set(encodedData, forKey: "savedStudyModelsKey")
                print("StudyModels saved successfully.")
            } catch {
                print("Error encoding StudyModels: \(error.localizedDescription)")
            }
        }
    }
    
    static var savedTestModels: [TestModel] {
        get {
            if let savedData = UserDefaults.standard.data(forKey: "savedTestModels") {
                let decoder = JSONDecoder()
                do {
                    let testModels = try decoder.decode([TestModel].self, from: savedData)
                    return testModels
                } catch {
                    print("Error decoding TestModels: \(error.localizedDescription)")
                }
            }
            return []
        }
        set {
            let encoder = JSONEncoder()
            do {
                let encodedData = try encoder.encode(newValue)
                UserDefaults.standard.set(encodedData, forKey: "savedTestModels")
                print("TestModels saved successfully.")
            } catch {
                print("Error encoding TestModels: \(error.localizedDescription)")
            }
        }
    }
    
    static func getNumberOfCompletedQuestions() -> Int {
        return getNumberOfRightAnswers()+getNumberOfWrongAnswers()
    }

    static func getNumberOfRightAnswers() -> Int {
        let numberOfRightAnswers = savedTestModels.reduce(0) { $0 + $1.correctAnswers }
        return numberOfRightAnswers
    }

    static func getNumberOfWrongAnswers() -> Int {
        let numberOfWrongAnswers = savedTestModels.reduce(0) { $0 + $1.wrongAnswers }
        return numberOfWrongAnswers
    }
}
