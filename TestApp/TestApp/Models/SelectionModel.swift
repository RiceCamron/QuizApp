//
//  SelectionModel.swift
//  TestApp
//
//  Created by Artur Avdeev on 10.02.2024.
//
import UIKit


struct StudyData {
    let id: Int
    let title: String
    let desc: String
}

struct TestData {
    let study_id: Int
    let question: String
    let answers: [Answer]
    let correctAnswer: String
    
    struct Answer: Codable {
        let answer: String
    }
}

struct SelectionModel {
    static var selectedSport: String = ""
    static var selectedCategory: String = ""
    static var selectedStudyTest: String = ""
    
    
    struct Data: Codable {
        let football: SportData
        let basketball: SportData
        let mixed: SportData
        
        struct SportData: Codable {
            let players: Players
            let clubs: Clubs
            let rules: Rules
            
            struct Players: Codable {
                let study: [PlayerStudy]
                let test: [PlayerTest]
                
                struct PlayerStudy: Codable {
                    let id: Int
                    let title: String
                    let desc: String
                }
                
                struct PlayerTest: Codable {
                    let study_id: Int
                    let question: String
                    let answers: [Answer]
                    let correctAnswer: String
                    
                    struct Answer: Codable {
                        let answer: String
                    }
                }
            }
            
            struct Clubs: Codable {
                let study: [ClubStudy]
                let test: [ClubTest]
                
                struct ClubStudy: Codable {
                    let id: Int
                    let title: String
                    let desc: String
                }
                
                struct ClubTest: Codable {
                    let study_id: Int
                    let question: String
                    let answers: [Answer]
                    let correctAnswer: String
                    
                    struct Answer: Codable {
                        let answer: String
                    }
                }
            }
            
            struct Rules: Codable {
                let study: [RulesStudy]
                let test: [RulesTest]
                
                struct RulesStudy: Codable {
                    let id: Int
                    let title: String
                    let desc: String
                }
                
                struct RulesTest: Codable {
                    let study_id: Int
                    let question: String
                    let answers: [Answer]
                    let correctAnswer: String
                    
                    struct Answer: Codable {
                        let answer: String
                    }
                }
            }
        }
    }
    
    static func convertToStudyData(from playerStudies: [SelectionModel.Data.SportData.Players.PlayerStudy]) -> [StudyData] {
        return playerStudies.map { playerStudy in
            return StudyData(id: playerStudy.id, title: playerStudy.title ?? "", desc: playerStudy.desc ?? "")
        }
    }
    static func convertToStudyData(from clubStudies: [SelectionModel.Data.SportData.Clubs.ClubStudy]) -> [StudyData] {
        return clubStudies.map { clubStudy in
            return StudyData(id: clubStudy.id, title: clubStudy.title, desc: clubStudy.desc)
        }
    }
    static func convertToStudyData(from rulesStudies: [SelectionModel.Data.SportData.Rules.RulesStudy]) -> [StudyData] {
        return rulesStudies.map { rulesStudy in
            return StudyData(id: rulesStudy.id, title: rulesStudy.title, desc: rulesStudy.desc)
        }
    }
    
    
    static func convertToTestAnswers(from playerTestAnswers: [SelectionModel.Data.SportData.Players.PlayerTest.Answer]) -> [TestData.Answer] {
        return playerTestAnswers.map { playerTestAnswer in
            return TestData.Answer(answer: playerTestAnswer.answer)
        }
    }
    static func convertToTestAnswers(from clubTestAnswers: [SelectionModel.Data.SportData.Clubs.ClubTest.Answer]) -> [TestData.Answer] {
        return clubTestAnswers.map { clubTestAnswer in
            return TestData.Answer(answer: clubTestAnswer.answer)
        }
    }
    static func convertToTestAnswers(from rulesTestAnswers: [SelectionModel.Data.SportData.Rules.RulesTest.Answer]) -> [TestData.Answer] {
        return rulesTestAnswers.map { rulesTestAnswer in
            return TestData.Answer(answer: rulesTestAnswer.answer)
        }
    }
    static func convertToTestData(from playerTests: [SelectionModel.Data.SportData.Players.PlayerTest]) -> [TestData] {
        return playerTests.map { playerTest in
            return TestData(study_id: playerTest.study_id, question: playerTest.question, answers: convertToTestAnswers(from: playerTest.answers), correctAnswer: playerTest.correctAnswer)
        }
    }
    
    static func convertToTestData(from clubTests: [SelectionModel.Data.SportData.Clubs.ClubTest]) -> [TestData] {
        return clubTests.map { clubTest in
            return TestData(study_id: clubTest.study_id, question: clubTest.question, answers: convertToTestAnswers(from: clubTest.answers), correctAnswer: clubTest.correctAnswer)
        }
    }
    
    static func convertToTestData(from rulesTests: [SelectionModel.Data.SportData.Rules.RulesTest]) -> [TestData] {
        return rulesTests.map { rulesTest in
            return TestData(study_id: rulesTest.study_id, question: rulesTest.question, answers: convertToTestAnswers(from: rulesTest.answers), correctAnswer: rulesTest.correctAnswer)
        }
    }
    
    static func getSelectStudy(selectedSport: String, selectedCategory: String, selectedStudyTest: String) -> [StudyData] {
        if selectedSport == "FOOTBALL" {
            if selectedCategory == "PLAYERS" {
                if selectedStudyTest == "STUDY" {
                    return convertToStudyData(from: SelectionModel.data.football.players.study)
                } else {}
            }
        } else if selectedCategory == "CLUBS" {
            if selectedStudyTest == "STUDY" {
                return convertToStudyData(from: SelectionModel.data.football.clubs.study)
            }  else {}
        } else if selectedCategory == "RULES" {
            if selectedStudyTest == "STUDY" {
                return convertToStudyData(from: SelectionModel.data.football.rules.study)
            }  else {}
            
        } else if selectedSport == "BASKETBALL" {
            if selectedCategory == "PLAYERS" {
                if selectedStudyTest == "STUDY" {
                    return convertToStudyData(from: SelectionModel.data.basketball.players.study)
                }  else {}
            } else if selectedCategory == "CLUBS" {
                if selectedStudyTest == "STUDY" {
                    return convertToStudyData(from: SelectionModel.data.basketball.clubs.study)
                }  else {}
            } else if selectedCategory == "RULES" {
                if selectedStudyTest == "STUDY" {
                    return convertToStudyData(from: SelectionModel.data.basketball.rules.study)
                }  else {}
            }
        } else if selectedSport == "MIXED" {
            if selectedCategory == "PLAYERS" {
                if selectedStudyTest == "STUDY" {
                    return convertToStudyData(from: SelectionModel.data.mixed.players.study)
                }  else {}
            } else if selectedCategory == "CLUBS" {
                if selectedStudyTest == "STUDY" {
                    return convertToStudyData(from: SelectionModel.data.mixed.clubs.study)
                }  else {}
            } else if selectedCategory == "RULES" {
                if selectedStudyTest == "STUDY" {
                    return convertToStudyData(from: SelectionModel.data.mixed.rules.study)
                }  else {}
            }
        }
        return []
    }
    
    
    static func getSelectTest(selectedSport: String, selectedCategory: String, selectedStudyTest: String) -> [TestData] {
        if selectedSport == "FOOTBALL" {
            if selectedCategory == "PLAYERS" {
                if selectedStudyTest == "TEST" {
                    return convertToTestData(from: SelectionModel.data.football.players.test)
                } else {}
            } else if selectedCategory == "CLUBS" {
                if selectedStudyTest == "TEST" {
                    return convertToTestData(from: SelectionModel.data.football.clubs.test)
                } else {}
            } else if selectedCategory == "RULES" {
                if selectedStudyTest == "TEST" {
                    return convertToTestData(from: SelectionModel.data.football.rules.test)
                } else {}
            }
        } else if selectedSport == "BASKETBALL" {
            if selectedCategory == "PLAYERS" {
                if selectedStudyTest == "TEST" {
                    return convertToTestData(from: SelectionModel.data.basketball.players.test)
                } else {}
            } else if selectedCategory == "CLUBS" {
                if selectedStudyTest == "TEST" {
                    return convertToTestData(from: SelectionModel.data.basketball.clubs.test)
                } else {}
            } else if selectedCategory == "RULES" {
                if selectedStudyTest == "TEST" {
                    return convertToTestData(from: SelectionModel.data.basketball.rules.test)
                } else {}
            }
        } else if selectedSport == "MIXED" {
            if selectedCategory == "PLAYERS" {
                if selectedStudyTest == "TEST" {
                    return convertToTestData(from: SelectionModel.data.mixed.players.test)
                } else {}
            } else if selectedCategory == "CLUBS" {
                if selectedStudyTest == "TEST" {
                    return convertToTestData(from: SelectionModel.data.mixed.clubs.test)
                } else {}
            } else if selectedCategory == "RULES" {
                if selectedStudyTest == "TEST" {
                    return convertToTestData(from: SelectionModel.data.mixed.rules.test)
                } else {}
            }
        }
        return []
    }
    
}

extension SelectionModel {
    //    static var data: Data = SelectionModel.Data(
    //        football: SelectionModel.Data.SportData(
    //            players: SelectionModel.Data.SportData.Players(
    //                study: [
    //                    SelectionModel.Data.SportData.Players.PlayerStudy(
    //                        id: 1,
    //                        title: "LIONEL MESSI",
    //                        desc: """
    //                        Lionel Messi is a renowned Argentine footballer who has won the hearts of millions of fans worldwide. He was born on June 24, 1987, in Rosario, Argentina, and began his professional career with the football club Barcelona, where he continues to play to this day. Messi holds the record for the most "Ballon d'Or" awards, a prestigious accolade presented to the world's best football player. He has won this award 6 times. In 2021, Lionel Messi led the Argentine national team to victory in the Copa America, serving as the captain and guiding his country to success in the tournament. Messi is known for his incredible football skills, flashy dribbles, and unique ball control. He has set numerous records, including the highest number of goals in a single La Liga season and the most goals in a calendar year. In 2021, Messi transferred to the Paris Saint-Germain football club after concluding his long-standing collaboration with Barcelona.
    //                        """
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerStudy(
    //                        id: 2,
    //                        title: "CRISTIANO RONALDO",
    //                        desc: "Cristiano Ronaldo is a legendary Portuguese footballer whose influence spans the globe. Born on February 5, 1985, on the island of Madeira, Ronaldo began his career with Sporting Lisbon. He then moved to Manchester United, where he won three Premier League 'Player of the Year' titles. In 2009, Ronaldo transferred to Real Madrid, becoming the club's all-time leading goal scorer. In 2018, he returned to Manchester United. Ronaldo has earned five Ballon d'Or awards, highlighting his incredible determination and professionalism. His physical prowess, accurate strikes, and outstanding on-field skills have made him one of the greatest footballers of all time."
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerStudy(
    //                        id: 3,
    //                        title: "NEYMAR JR.",
    //                        desc: "Neymar Jr. is a Brazilian professional footballer known for his flair, skill, and creativity on the field. Born on February 5, 1992, Neymar has played for clubs like Santos FC, FC Barcelona, and Paris Saint-Germain (PSG). He is recognized for his ability to take on defenders, score goals, and provide assists."
    //                    )
    //                ],
    //                test: [
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 1,
    //                        question: "In which city was Lionel Messi born?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Buenos Aires"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Rio de Janeiro"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Rosario"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Lima")
    //                        ],
    //                        correctAnswer: "Rosario"
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 1,
    //                        question: "In which football club did Lionel Messi begin his professional career?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Real Madrid"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Manchester United"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Barcelona"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "PSG")
    //                        ],
    //                        correctAnswer: "Barcelona"
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 1,
    //                        question: "How many times has Lionel Messi won the 'Ballon d'Or' award?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "3"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "6"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "8"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "10")
    //                        ],
    //                        correctAnswer: "6"
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 1,
    //                        question: "What title did Lionel Messi win with the Argentine national team in 2021?",
    //                        answers: [
    //
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "World Cup"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Copa America"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "European Cup"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "African Nations Cup")
    //                        ],
    //                        correctAnswer: "Copa America"
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 1,
    //                        question: "What football skills make Lionel Messi famous?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Powerful shots"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Flashy dribbles"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Excellent goalkeeping skills"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "High jumps")
    //                        ],
    //                        correctAnswer: "Flashy dribbles"
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 1,
    //                        question: "In which football club did Lionel Messi transfer to in 2021?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Barcelona"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Manchester City"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Juventus"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "PSG")
    //                        ],
    //                        correctAnswer: "PSG"
    //                    ),
    //
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 2,
    //                        question: "In which year was Cristiano Ronaldo born?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1980"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1985"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1990"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1995")
    //                        ],
    //                        correctAnswer: "1985"
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 2,
    //                        question: "In which football club did Ronaldo begin his career?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Real Madrid"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Sporting Lisbon"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Manchester United"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Barcelona")
    //                        ],
    //                        correctAnswer: "Sporting Lisbon"
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 2,
    //                        question: "How many Ballon d'Or awards has Cristiano Ronaldo won?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "3"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "5"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "7"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "9")
    //                        ],
    //                        correctAnswer: "5"
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 2,
    //                        question: "In which year did Ronaldo return to Manchester United?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2010"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2015"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2018"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2020")
    //                        ],
    //                        correctAnswer: "2021"
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 2,
    //                        question: "What record did Messi set in La Liga for the highest number of goals in a single season?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Most assists"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Fastest sprint"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Most goals"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Longest throw-in")
    //                        ],
    //                        correctAnswer: "Most goals"
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 2,
    //                        question: "In which year did Lionel Messi transfer to Paris Saint-Germain (PSG)?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2020"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2021"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2019"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2018")
    //                        ],
    //                        correctAnswer: "2021"
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 3,
    //                        question: "In which club did Messi spend his entire professional career?3",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Barcelona"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Real Madrid"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Manchester United"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "PSG")
    //                        ],
    //                        correctAnswer: "Barcelona"
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 3,
    //                        question: "How many times has Lionel Messi won the 'Ballon d'Or' award?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "3"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "6"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "4"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2")
    //                        ],
    //                        correctAnswer: "6"
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 3,
    //                        question: "In which year did Messi lead Argentina to victory in the Copa America?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2019"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2021"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2018"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2020")
    //                        ],
    //                        correctAnswer: "2021"
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 3,
    //                        question: "What is Messi known for besides his football skills?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Tennis expertise"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Exceptional singing talent"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Flashy dribbles"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Cooking prowess")
    //                        ],
    //                        correctAnswer: "Flashy dribbles"
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 3,
    //                        question: "What record did Messi set in La Liga for the highest number of goals in a single season?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Most assists"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Fastest sprint"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Most goals"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Longest throw-in")
    //                        ],
    //                        correctAnswer: "Most goals"
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 3,
    //                        question: "In which year did Lionel Messi transfer to Paris Saint-Germain (PSG)?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2020"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2021"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2019"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2018")
    //                        ],
    //                        correctAnswer: "2021"
    //                    ),
    //
    //                ]
    //            ),
    //            clubs: SelectionModel.Data.SportData.Clubs(
    //                study: [
    //                    SelectionModel.Data.SportData.Clubs.ClubStudy(
    //                        id: 1,
    //                        title: "LIONEL MESSI",
    //                        desc: "Lionel Messi has played for FC Barcelona and Paris Saint-Germain (PSG). During his time with Barcelona, Messi achieved numerous successes, including multiple UEFA Champions League and La Liga titles. In 2021, he joined PSG, continuing to showcase his exceptional talent at the highest level of the sport."
    //                    )
    //                ],
    //                test: [
    //                    SelectionModel.Data.SportData.Clubs.ClubTest(
    //                        study_id: 1,
    //                        question: "In which club did Lionel Messi play before joining Paris Saint-Germain (PSG)?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Real Madrid"),
    //                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "FC Barcelona"),
    //                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Manchester United"),
    //                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Juventus")
    //                        ],
    //                        correctAnswer: "FC Barcelona"
    //                    )
    //                ]
    //            ),
    //            rules: SelectionModel.Data.SportData.Rules(
    //                study: [
    //                    SelectionModel.Data.SportData.Rules.RulesStudy(
    //                        id: 1,
    //                        title: "LIONEL MESSI",
    //                        desc: "Lionel Messi has consistently demonstrated adherence to fair play and sportsmanship throughout his career. Despite facing tough opponents and intense competition, Messi is known for his humility on and off the field. He has set a positive example for aspiring footballers worldwide."
    //                    )
    //                ],
    //                test: [
    //                    SelectionModel.Data.SportData.Rules.RulesTest(
    //                        study_id: 1,
    //                        question: "What is Lionel Messi known for besides his football skills?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Scoring the most goals in a single season"),
    //                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Winning multiple FIFA World Player of the Year awards"),
    //                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Demonstrating fair play and sportsmanship"),
    //                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Being the tallest player in his team")
    //                        ],
    //                        correctAnswer: "Demonstrating fair play and sportsmanship"
    //                    )
    //                ]
    //            )
    //        ),
    //        basketball: SelectionModel.Data.SportData (
    //            players: SelectionModel.Data.SportData.Players(
    //                study: [
    //                    SelectionModel.Data.SportData.Players.PlayerStudy(
    //                        id: 1,
    //                        title: "LIONEL MESSI",
    //                        desc: """
    //Lionel Messi is a renowned Argentine footballer who has captured the hearts of millions of fans worldwide. Born on June 24, 1987, in Rosario, Argentina, Messi began his professional career with the football club Barcelona, where he continues to play to this day. Messi holds the record for the most 'Ballon d'Or' awards, a prestigious accolade given to the world's best football player, having won it six times. In 2021, Lionel Messi led the Argentine national team to victory in the Copa America, serving as the captain and guiding his country to triumph in the tournament. Messi is widely recognized for his incredible football skills, flashy dribbles, and unique ball control. He has set numerous records, including the highest number of goals in a single La Liga season and the most goals in a calendar year. In 2021, Messi transferred to the Paris Saint-Germain (PSG) football club after concluding his long-standing association with Barcelona.
    //"""
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerStudy(
    //                        id: 2,
    //                        title: "CRISTIANO RONALDO",
    //                        desc: "Cristiano Ronaldo is a Portuguese professional footballer regarded as one of the greatest goal scorers in the history of the sport. Born on February 5, 1985, Ronaldo has had successful stints with Sporting CP, Manchester United, Real Madrid, and Juventus. Known for his athleticism and goal-scoring prowess, he has won multiple FIFA Ballon d'Or awards."
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerStudy(
    //                        id: 3,
    //                        title: "NEYMAR JR.",
    //                        desc: "Neymar Jr. is a Brazilian professional footballer known for his flair, skill, and creativity on the field. Born on February 5, 1992, Neymar has played for clubs like Santos FC, FC Barcelona, and Paris Saint-Germain (PSG). He is recognized for his ability to take on defenders, score goals, and provide assists."
    //                    )
    //                ],
    //                test: [
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 1,
    //                        question: "Which of the following footballers is known for his incredible dribbling skills, precise finishing, and vision on the field?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Lionel Messi"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Cristiano Ronaldo"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Neymar Jr."),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Mohamed Salah")
    //                        ],
    //                        correctAnswer: "Lionel Messi"
    //                    )
    //                ]
    //            ),
    //            clubs: SelectionModel.Data.SportData.Clubs(
    //                study: [
    //                    SelectionModel.Data.SportData.Clubs.ClubStudy(
    //                        id: 1,
    //                        title: "LIONEL MESSI",
    //                        desc: "Lionel Messi has played for FC Barcelona and Paris Saint-Germain (PSG). During his time with Barcelona, Messi achieved numerous successes, including multiple UEFA Champions League and La Liga titles. In 2021, he joined PSG, continuing to showcase his exceptional talent at the highest level of the sport."
    //                    )
    //                ],
    //                test: [
    //                    SelectionModel.Data.SportData.Clubs.ClubTest(
    //                        study_id: 1,
    //                        question: "In which club did Lionel Messi play before joining Paris Saint-Germain (PSG)?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Real Madrid"),
    //                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "FC Barcelona"),
    //                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Manchester United"),
    //                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Juventus")
    //                        ],
    //                        correctAnswer: "FC Barcelona"
    //                    )
    //                ]
    //            ),
    //            rules: SelectionModel.Data.SportData.Rules(
    //                study: [
    //                    SelectionModel.Data.SportData.Rules.RulesStudy(
    //                        id: 2,
    //                        title: "LIONEL MESSI",
    //                        desc: "Lionel Messi has consistently demonstrated adherence to fair play and sportsmanship throughout his career. Despite facing tough opponents and intense competition, Messi is known for his humility on and off the field. He has set a positive example for aspiring footballers worldwide."
    //                    )
    //                ],
    //                test: [
    //                    SelectionModel.Data.SportData.Rules.RulesTest(
    //                        study_id: 1,
    //                        question: "What is Lionel Messi known for besides his football skills?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Scoring the most goals in a single season"),
    //                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Winning multiple FIFA World Player of the Year awards"),
    //                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Demonstrating fair play and sportsmanship"),
    //                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Being the tallest player in his team")
    //                        ],
    //                        correctAnswer: "Demonstrating fair play and sportsmanship"
    //                    )
    //                ]
    //            )
    //        ),
    //        mixed: SelectionModel.Data.SportData (
    //            players: SelectionModel.Data.SportData.Players(
    //                study: [
    //                    SelectionModel.Data.SportData.Players.PlayerStudy(
    //                        id: 2,
    //                        title: "LIONEL MESSI",
    //                        desc: "Lionel Messi is an Argentine professional footballer widely considered one of the greatest players of all time. Born on June 24, 1987, Messi spent the majority of his career playing for FC Barcelona before joining Paris Saint-Germain (PSG) in 2021. He is known for his incredible dribbling skills, precise finishing, and vision on the field."
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerStudy(
    //                        id: 2,
    //                        title: "CRISTIANO RONALDO",
    //                        desc: "Cristiano Ronaldo is a Portuguese professional footballer regarded as one of the greatest goal scorers in the history of the sport. Born on February 5, 1985, Ronaldo has had successful stints with Sporting CP, Manchester United, Real Madrid, and Juventus. Known for his athleticism and goal-scoring prowess, he has won multiple FIFA Ballon d'Or awards."
    //                    ),
    //                    SelectionModel.Data.SportData.Players.PlayerStudy(
    //                        id: 3,
    //                        title: "NEYMAR JR.",
    //                        desc: "Neymar Jr. is a Brazilian professional footballer known for his flair, skill, and creativity on the field. Born on February 5, 1992, Neymar has played for clubs like Santos FC, FC Barcelona, and Paris Saint-Germain (PSG). He is recognized for his ability to take on defenders, score goals, and provide assists."
    //                    )
    //                ],
    //                test: [
    //                    SelectionModel.Data.SportData.Players.PlayerTest(
    //                        study_id: 1,
    //                        question: "Which of the following footballers is known for his incredible dribbling skills, precise finishing, and vision on the field?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Lionel Messi"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Cristiano Ronaldo"),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Neymar Jr."),
    //                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Mohamed Salah")
    //                        ],
    //                        correctAnswer: "Lionel Messi"
    //                    )
    //                ]
    //            ),
    //            clubs: SelectionModel.Data.SportData.Clubs(
    //                study: [
    //                    SelectionModel.Data.SportData.Clubs.ClubStudy(
    //                        id: 1,
    //                        title: "LIONEL MESSI",
    //                        desc: "Lionel Messi has played for FC Barcelona and Paris Saint-Germain (PSG). During his time with Barcelona, Messi achieved numerous successes, including multiple UEFA Champions League and La Liga titles. In 2021, he joined PSG, continuing to showcase his exceptional talent at the highest level of the sport."
    //                    )
    //                ],
    //                test: [
    //                    SelectionModel.Data.SportData.Clubs.ClubTest(
    //                        study_id: 1,
    //                        question: "In which club did Lionel Messi play before joining Paris Saint-Germain (PSG)?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Real Madrid"),
    //                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "FC Barcelona"),
    //                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Manchester United"),
    //                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Juventus")
    //                        ],
    //                        correctAnswer: "FC Barcelona"
    //                    )
    //                ]
    //            ),
    //            rules: SelectionModel.Data.SportData.Rules(
    //                study: [
    //                    SelectionModel.Data.SportData.Rules.RulesStudy(
    //                        id: 1,
    //                        title: "LIONEL MESSI",
    //                        desc: "Lionel Messi has consistently demonstrated adherence to fair play and sportsmanship throughout his career. Despite facing tough opponents and intense competition, Messi is known for his humility on and off the field. He has set a positive example for aspiring footballers worldwide."
    //                    )
    //                ],
    //                test: [
    //                    SelectionModel.Data.SportData.Rules.RulesTest(
    //                        study_id: 1,
    //                        question: "What is Lionel Messi known for besides his football skills?",
    //                        answers: [
    //                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Scoring the most goals in a single season"),
    //                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Winning multiple FIFA World Player of the Year awards"),
    //                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Demonstrating fair play and sportsmanship"),
    //                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Being the tallest player in his team")
    //                        ],
    //                        correctAnswer: "Demonstrating fair play and sportsmanship"
    //                    )
    //                ]
    //            )
    //        )
    //    )
    
    
    
    static var data: Data = SelectionModel.Data(
        football: SelectionModel.Data.SportData(
            players: SelectionModel.Data.SportData.Players(
                study: [
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 1,
                        title: "LIONEL MESSI",
                        desc: """
                            Lionel Messi, often hailed as one of the greatest footballers of all time, was born on June 24, 1987, in Rosario, Argentina. He began his career at a young age with FC Barcelona's youth academy, La Masia, and quickly rose through the ranks to become a pivotal player for the first team. Messi's playing style is characterized by his exceptional dribbling ability, precise passing, and clinical finishing. Throughout his illustrious career, he has amassed numerous individual accolades, including multiple FIFA Ballon d'Or awards. Messi's loyalty to Barcelona was a hallmark of his career until his surprising move to Paris Saint-Germain in 2021. His influence extends beyond the pitch, as he's admired worldwide for his humility and philanthropic efforts.
                            """
                    ),
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 2,
                        title: "Cristiano Ronaldo",
                        desc: "Cristiano Ronaldo is a Portuguese professional footballer widely regarded as one of the greatest players of all time. Born on February 5, 1985, in Madeira, Portugal, Ronaldo began his senior career with Sporting Lisbon before moving to Manchester United in 2003. He enjoyed immense success with Manchester United, winning three English Premier League titles and the UEFA Champions League. In 2009, he transferred to Real Madrid for a then-world record fee. During his time at Real Madrid, Ronaldo became the club's all-time leading scorer and won four Champions League titles. In 2018, he joined Juventus, where he continued to showcase his exceptional goal-scoring ability. Ronaldo is known for his athleticism, aerial prowess, and incredible work ethic."
                    ),
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 3,
                        title: "Neymar Jr.",
                        desc: """
                                        Neymar Jr., born Neymar da Silva Santos Júnior, is a Brazilian professional footballer known for his exceptional dribbling skills, creativity, and flair on the field. He began his career at Santos FC in Brazil, where his remarkable talent quickly gained international attention. In 2013, Neymar made a high-profile move to FC Barcelona, forming a formidable attacking trio with Lionel Messi and Luis Suárez. During his time at Barcelona, he won numerous domestic and international titles, including the UEFA Champions League. In 2017, Neymar made a record-breaking transfer to Paris Saint-Germain, becoming the world's most expensive footballer at the time. With PSG, he has continued to showcase his extraordinary talent, contributing to multiple Ligue 1 titles and domestic cup victories. Neymar is also a key player for the Brazilian national team, representing his country in major tournaments like the FIFA World Cup and Copa América.
                                        """
                    ),
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 4,
                        title: "Kylian Mbappé",
                        desc: "Kylian Mbappé is a French professional footballer known for his extraordinary speed, dazzling dribbling skills, and clinical finishing. Born on December 20, 1998, in Paris, Mbappé began his senior career with AS Monaco in 2015, where he quickly gained recognition for his exceptional talent. His breakthrough season came in 2016-2017 when he played a pivotal role in Monaco's Ligue 1 triumph and their impressive run to the UEFA Champions League semi-finals. Mbappé's stellar performances earned him a move to Paris Saint-Germain, where he continued to shine, winning numerous domestic titles. He has also been a key player for the French national team, helping them clinch victory in the 2018 FIFA World Cup. Mbappé's combination of skill, speed, and intelligence makes him one of the most exciting talents in world football."
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 5,
                        title: "Erling Haaland",
                        desc: """
                                        Erling Haaland is a Norwegian professional footballer, renowned for his exceptional goal-scoring prowess and physical dominance on the field. Born on July 21, 2000, in Leeds, England, Haaland started his career at Molde FK before moving to Red Bull Salzburg, where he gained international attention with his prolific scoring record. His towering height, lightning speed, and precise finishing make him a nightmare for defenders. In 2020, he transferred to Borussia Dortmund, where he continued to impress, breaking numerous records in the Bundesliga. Haaland's performances have drawn comparisons to some of the greatest strikers in football history. His relentless work ethic and hunger for success mark him as one of the brightest talents in the sport.
                                        """
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 6,
                        title: "Robert Lewandowski",
                        desc: "Robert Lewandowski is a Polish professional footballer, renowned for his exceptional goal-scoring prowess and leadership on the field. Born on August 21, 1988, in Warsaw, Lewandowski began his professional career at Polish club Znicz Pruszków before moving to top-flight Polish side Lech Poznań. His impressive performances attracted attention from major European clubs, leading to his transfer to Borussia Dortmund in 2010. During his time at Dortmund, Lewandowski established himself as one of Europe's deadliest strikers, winning two Bundesliga titles and reaching the UEFA Champions League final. In 2014, he joined Bayern Munich, where he continued his prolific goal-scoring form, breaking numerous records and winning multiple Bundesliga titles and the UEFA Champions League. Lewandowski's combination of skill, determination, and leadership makes him a true icon of Polish and world football."
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 7,
                        title: "Mohamed Salah",
                        desc: "Mohamed Salah is an Egyptian professional footballer renowned for his explosive speed, agility, and clinical finishing. Born on June 15, 1992, Salah began his professional career in Egypt before moving to Europe. He gained prominence during his time with Basel in Switzerland and later became a household name at AS Roma in Serie A. However, it was his transfer to Liverpool in 2017 that truly propelled him to superstardom. Salah's exceptional goal-scoring record and crucial contributions have helped Liverpool secure multiple domestic and international trophies, including the Premier League and the UEFA Champions League. His impact extends beyond the pitch as he serves as an inspiration to millions of fans worldwide, particularly in Egypt, where he is considered a national hero."
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 8,
                        title: "Karim Benzema",
                        desc: """
                                        Karim Benzema is a French professional footballer renowned for his prowess as a striker. Born on December 19, 1987, in Lyon, France, he currently plays for Real Madrid and the French national team. Benzema began his career at Lyon, where he showcased his exceptional goal-scoring abilities, earning him a move to Real Madrid in 2009. With Real Madrid, he has won numerous La Liga titles and UEFA Champions League trophies. Known for his clinical finishing, intelligent movement off the ball, and ability to link play, Benzema is a key figure in Real Madrid's attacking lineup. Despite facing controversies off the pitch, he continues to be a respected figure in the football world.
                                        """
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 9,
                        title: "Harry Kane",
                        desc: """
                                        Harry Kane is an English professional footballer renowned for his prolific goal-scoring ability and intelligent gameplay. Born on July 28, 1993, in London, Kane rose through the youth ranks at Tottenham Hotspur and emerged as one of the Premier League's top strikers. With his exceptional technique, vision, and physical presence, Kane has consistently been among the league's leading goal-scorers, earning him widespread acclaim. He has represented the England national team, leading them to success in international competitions. Kane's leadership qualities and dedication on and off the pitch have made him a role model for aspiring footballers worldwide.
                                        """
                    ),
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 10,
                        title: "Joshua Kimmich",
                        desc: "Joshua Kimmich is a German professional footballer known for his versatility and exceptional midfield play. Born on February 8, 1995, he currently plays for Bayern Munich and the German national team. Kimmich's rise to prominence began at RB Leipzig before he joined Bayern Munich in 2015. His intelligence, precise passing, and defensive capabilities make him an invaluable asset on the field. Kimmich's leadership qualities have seen him captain both club and country, guiding his teams to numerous victories. He has won multiple Bundesliga titles, DFB-Pokal trophies, and the UEFA Champions League with Bayern Munich. Additionally, Kimmich played a pivotal role in Germany's success at the 2014 FIFA World Cup. Off the field, he is known for his philanthropy, actively supporting charitable causes."
                    ),
                ],
                test: [
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 1,
                        question: "Where was Lionel Messi born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Madrid"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Rio de Janeiro"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Rosario"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Barcelona")
                        ],
                        correctAnswer: "Rosario"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 1,
                        question: "What academy did Messi join at a young age?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Real Madrid Academy"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "La Masia"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Manchester United Academy"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Ajax Academy")
                        ],
                        correctAnswer: "La Masia"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 1,
                        question: "What are some characteristics of Messi's playing style?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Physical strength and aerial ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Exceptional dribbling, passing, and finishing"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Long-distance shooting only"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Defensive positioning and tackling")
                        ],
                        correctAnswer: "Exceptional dribbling, passing, and finishing"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 1,
                        question: "How many FIFA Ballon d'Or awards has Messi won?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "One"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Three"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Six"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Ten")
                        ],
                        correctAnswer: "Six"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 1,
                        question: "Which club did Messi join in 2021, ending his long-standing association with Barcelona?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Manchester City"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Paris Saint-Germain"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Bayern Munich"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Juventus")
                        ],
                        correctAnswer: "Paris Saint-Germain"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 1,
                        question: "Apart from his football skills, what else is Messi admired for?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Arrogance"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Philanthropic efforts and humility"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Political controversies"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Fashion sense")
                        ],
                        correctAnswer: "Philanthropic efforts and humility"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 2,
                        question: "Where was Cristiano Ronaldo born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Lisbon"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Porto"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Madeira"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Faro")
                        ],
                        correctAnswer: "Madeira"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 2,
                        question: "In which year did Cristiano Ronaldo join Manchester United?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2001"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2003"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2005"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2007")
                        ],
                        correctAnswer: "2003"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 2,
                        question: "How many UEFA Champions League titles did Cristiano Ronaldo win with Real Madrid?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Three"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Four"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Five")
                        ],
                        correctAnswer: "Four"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 2,
                        question: "Which club did Cristiano Ronaldo join in 2018?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Manchester United"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Real Madrid"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Juventus"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Barcelona")
                        ],
                        correctAnswer: "Juventus"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 2,
                        question: "What is one of Cristiano Ronaldo's notable attributes as a footballer?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Exceptional dribbling ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Aerial prowess"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Incredible work ethic"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Goalkeeping skills")
                        ],
                        correctAnswer: "Incredible work ethic"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 2,
                        question: "How many English Premier League titles did Cristiano Ronaldo win with Manchester United?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "One"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Three"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "None")
                        ],
                        correctAnswer: "Three"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 3,
                        question: "Where did Neymar begin his professional football career?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Santos FC"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Real Madrid"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Manchester United"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "AC Milan")
                        ],
                        correctAnswer: "Santos FC"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 3,
                        question: "Which club did Neymar join in 2013, forming a formidable attacking trio with Messi and Suárez?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Real Madrid"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "FC Barcelona"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Bayern Munich"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Liverpool")
                        ],
                        correctAnswer: "FC Barcelona"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 3,
                        question: "In which year did Neymar make a record-breaking transfer to Paris Saint-Germain?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2015"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2017"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2019"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2021")
                        ],
                        correctAnswer: "2017"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 3,
                        question: "What is one of Neymar's standout attributes on the football field?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Exceptional dribbling skills"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Goalkeeping prowess"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Leadership in defense"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Aerial dominance")
                        ],
                        correctAnswer: "Exceptional dribbling skills"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 3,
                        question: "Which international tournaments has Neymar represented Brazil in?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "UEFA European Championship"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Copa América"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "African Cup of Nations"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "AFC Asian Cup")
                        ],
                        correctAnswer: "Copa América"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 3,
                        question: "How many Ligue 1 titles has Neymar won with Paris Saint-Germain?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "One"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Three"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Four")
                        ],
                        correctAnswer: "Four"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 4,
                        question: "Where was Kylian Mbappé born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Paris"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Monaco"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Lyon"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Marseille")
                        ],
                        correctAnswer: "Paris"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 4,
                        question: "When did Kylian Mbappé make his breakthrough in professional football?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2010"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2016-2017"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2005"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2000")
                        ],
                        correctAnswer: "2016-2017"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 4,
                        question: "Which club did Kylian Mbappé join after his successful stint with AS Monaco?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Real Madrid"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Barcelona"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Paris Saint-Germain"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Manchester United")
                        ],
                        correctAnswer: "Paris Saint-Germain"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 4,
                        question: "In which year did Kylian Mbappé help France win the FIFA World Cup?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2014"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2018"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2010"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2006")
                        ],
                        correctAnswer: "2018"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 4,
                        question: "What position does Kylian Mbappé primarily play on the field?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Goalkeeper"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Defender"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Midfielder"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Forward")
                        ],
                        correctAnswer: "Forward"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 4,
                        question: "What makes Kylian Mbappé one of the most exciting talents in football?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "His cooking skills"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "His singing abilities"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "His combination of skill, speed, and intelligence"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "His expertise in chess")
                        ],
                        correctAnswer: "His combination of skill, speed, and intelligence"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 5,
                        question: "Where was Erling Haaland born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Leeds"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Oslo"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Manchester"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Borussia")
                        ],
                        correctAnswer: "Leeds"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 5,
                        question: "Which club did Erling Haaland join in 2020?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Manchester United"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Borussia Dortmund"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Real Madrid"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Bayern Munich")
                        ],
                        correctAnswer: "Borussia Dortmund"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 5,
                        question: "What attributes contribute to Erling Haaland's success on the field?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Lightning speed and precise finishing"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Defensive positioning and tackling"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Short stature and slow pace"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Exceptional dribbling skills")
                        ],
                        correctAnswer: "Lightning speed and precise finishing"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 5,
                        question: "Prior to Borussia Dortmund, which club did Erling Haaland play for?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Red Bull Salzburg"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Manchester City"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Paris Saint-Germain"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Juventus")
                        ],
                        correctAnswer: "Red Bull Salzburg"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 5,
                        question: "What year was Erling Haaland born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1998"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2000"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2002"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2004")
                        ],
                        correctAnswer: "2000"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 5,
                        question: "What is Erling Haaland's nationality?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Norwegian"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Swedish"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Danish"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Finnish")
                        ],
                        correctAnswer: "Norwegian"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 6,
                        question: "Which club does Robert Lewandowski currently play for?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Real Madrid"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Bayern Munich"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Liverpool"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Manchester City")
                        ],
                        correctAnswer: "Bayern Munich"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 6,
                        question: "What position does Robert Lewandowski play?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Goalkeeper"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Defender"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Midfielder"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Striker")
                        ],
                        correctAnswer: "Striker"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 6,
                        question: "What are Robert Lewandowski's main strengths as a footballer?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Exceptional goal-scoring ability, physical strength, and clinical finishing"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Goalkeeping skills and dribbling ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Passing accuracy and vision"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Defensive positioning and tackling")
                        ],
                        correctAnswer: "Exceptional goal-scoring ability, physical strength, and clinical finishing"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 6,
                        question: "Which national team does Robert Lewandowski represent?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Germany"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Spain"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Poland"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Italy")
                        ],
                        correctAnswer: "Poland"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 6,
                        question: "What role has Robert Lewandowski played in Bayern Munich's success?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "He has been instrumental with his leadership and goal-scoring ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "He has been the team's physiotherapist"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "He has managed the team's finances"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "He has been a cheerleader")
                        ],
                        correctAnswer: "He has been instrumental with his leadership and goal-scoring ability"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 6,
                        question: "How has Robert Lewandowski's goal-scoring record compared to other strikers?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "He has consistently been among the top strikers with remarkable goal-scoring statistics"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "He has struggled to score goals compared to other strikers"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "He rarely scores goals and focuses more on defensive duties"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "He only scores goals from penalties")
                        ],
                        correctAnswer: "He has consistently been among the top strikers with remarkable goal-scoring statistics"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 7,
                        question: "Where was Mohamed Salah born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Egypt"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Switzerland"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Italy"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "England")
                        ],
                        correctAnswer: "Egypt"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 7,
                        question: "Which European club did Mohamed Salah join after gaining prominence at Basel?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Liverpool"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "AS Roma"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Bayern Munich"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Paris Saint-Germain")
                        ],
                        correctAnswer: "AS Roma"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 7,
                        question: "What is one of Mohamed Salah's notable attributes as a footballer?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Physical strength and aerial ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Precise passing and vision"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Explosive speed and clinical finishing"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Goalkeeping skills")
                        ],
                        correctAnswer: "Explosive speed and clinical finishing"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 7,
                        question: "Which major trophies has Mohamed Salah helped Liverpool win?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "FA Cup"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Serie A"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Premier League"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "La Liga")
                        ],
                        correctAnswer: "Premier League"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 7,
                        question: "What impact does Mohamed Salah have off the pitch?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Leading the team's cheerleading squad"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Inspiring millions of fans worldwide"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Composing motivational songs for the team"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Managing the team's finances")
                        ],
                        correctAnswer: "Inspiring millions of fans worldwide"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 7,
                        question: "What is Mohamed Salah considered in Egypt?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "National hero"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "President"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Olympic gold medalist"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Famous actor")
                        ],
                        correctAnswer: "National hero"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 8,
                        question: "Where was Karim Benzema born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Paris, France"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Madrid, Spain"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Lyon, France"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "London, England")
                        ],
                        correctAnswer: "Lyon, France"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 8,
                        question: "What team does Karim Benzema currently play for?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Bayern Munich"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Real Madrid"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Manchester United"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Paris Saint-Germain")
                        ],
                        correctAnswer: "Real Madrid"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 8,
                        question: "What major European competition has Karim Benzema won with Real Madrid?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Europa League"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "UEFA Champions League"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "UEFA European Championship"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "FIFA World Cup")
                        ],
                        correctAnswer: "UEFA Champions League"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 8,
                        question: "What role does Karim Benzema play in the team?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Goalkeeper"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Defender"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Midfielder"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Striker")
                        ],
                        correctAnswer: "Striker"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 8,
                        question: "What distinguishes Karim Benzema as a footballer?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Clinical finishing and intelligent movement off the ball"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Exceptional goalkeeping skills"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Physical strength and tackling ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Midfield control and passing accuracy")
                        ],
                        correctAnswer: "Clinical finishing and intelligent movement off the ball"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 8,
                        question: "In which year did Karim Benzema join Real Madrid?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2005"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2010"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2009"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2015")
                        ],
                        correctAnswer: "2009"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 9,
                        question: "Where was Harry Kane born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "London"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Paris"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Madrid"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Berlin")
                        ],
                        correctAnswer: "London"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 9,
                        question: "What is Harry Kane known for in football?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Goal-scoring prowess"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Dribbling ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Goalkeeping skills"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Refereeing expertise")
                        ],
                        correctAnswer: "Goal-scoring prowess"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 9,
                        question: "Which club did Harry Kane emerge from the youth ranks of?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Manchester United"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Chelsea"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Tottenham Hotspur"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Arsenal")
                        ],
                        correctAnswer: "Tottenham Hotspur"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 9,
                        question: "What qualities contribute to Harry Kane's success as a striker?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Speed and agility"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Technique, vision, and physical presence"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Defensive skills"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Goalkeeping abilities")
                        ],
                        correctAnswer: "Technique, vision, and physical presence"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 9,
                        question: "Which national team has Harry Kane represented?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Spain"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "England"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Brazil"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Germany")
                        ],
                        correctAnswer: "England"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 9,
                        question: "What attributes make Harry Kane a role model for aspiring footballers?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Laziness and lack of commitment"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Leadership qualities and dedication"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Selfishness and arrogance"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Inability to score goals")
                        ],
                        correctAnswer: "Leadership qualities and dedication"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 10,
                        question: "Where was Joshua Kimmich born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Berlin"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Munich"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Leipzig"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Rottweil")
                        ],
                        correctAnswer: "Rottweil"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 10,
                        question: "Which club did Joshua Kimmich join in 2015?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Borussia Dortmund"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Bayern Munich"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "RB Leipzig"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Paris Saint-Germain")
                        ],
                        correctAnswer: "Bayern Munich"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 10,
                        question: "What qualities make Joshua Kimmich an invaluable asset on the field?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Speed and agility"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Precise passing and defensive capabilities"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Strength and aerial prowess"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Flamboyant style of play")
                        ],
                        correctAnswer: "Precise passing and defensive capabilities"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 10,
                        question: "Has Joshua Kimmich ever captained his teams?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "No, he has never captained any team."),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Yes, he has captained both club and country."),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Only his national team."),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Only his club team.")
                        ],
                        correctAnswer: "Yes, he has captained both club and country."
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 10,
                        question: "How many Bundesliga titles has Joshua Kimmich won with Bayern Munich?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "None"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "One"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Three")
                        ],
                        correctAnswer: "Three"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 10,
                        question: "What role did Joshua Kimmich play in Germany's success at the 2014 FIFA World Cup?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "He was the top scorer."),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "He was the goalkeeper."),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "He played a pivotal role."),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "He was the team manager.")
                        ],
                        correctAnswer: "He played a pivotal role."
                    )
                ]
            ),
            clubs: SelectionModel.Data.SportData.Clubs(
                study: [
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 1,
                        title: "Manchester City",
                        desc: """
                                        Manchester City Football Club, commonly referred to as Man City, is a professional football club based in Manchester, England. Established in 1880, the club has a rich history and has experienced significant success in recent years. Known for its attacking style of play and dominant performances in the English Premier League, Manchester City has won numerous domestic titles, including multiple league titles, FA Cups, and League Cups. The club's success is attributed to strong leadership, astute management, and significant financial investment from its ownership group. Manchester City's home matches are played at the Etihad Stadium, which boasts a capacity of over 55,000 spectators. Additionally, the club has a strong international fan base and is recognized as one of the top football clubs in the world.
                                        """
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 2,
                        title: "Paris Saint-Germain",
                        desc: "970, PSG has become one of the most successful and popular football clubs in the world. The team plays its home matches at the Parc des Princes stadium, which has a capacity of over 47,000 spectators. PSG has won numerous domestic titles, including Ligue 1 championships, Coupe de France, and Coupe de la Ligue titles. Internationally, PSG has had notable success in European competitions, reaching the UEFA Champions League final in 2020. The club boasts a star-studded roster with world-class players like Neymar, Kylian Mbappé, and Lionel Messi, making them a formidable force in both domestic and international competitions. PSG's colors are blue, red, and white, and their passionate fan base, known as Les Parisiens, supports them fervently."
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 3,
                        title: "Real Madrid",
                        desc: "Real Madrid is one of the most storied football clubs globally, based in Madrid, Spain. Established in 1902, it has a rich history of success, boasting a record number of UEFA Champions League trophies. The club's home ground is the Santiago Bernabéu Stadium. Real Madrid has been home to some of football's greatest players, including Alfredo Di Stefano, Cristiano Ronaldo, and Zinedine Zidane, who also managed the team. Known as Los Blancos for their iconic all-white kit, the club has a fierce rivalry with Barcelona, known as El Clásico. Real Madrid competes in La Liga, the top tier of Spanish football, and consistently contends for domestic and international titles."
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 4,
                        title: "Liverpool",
                        desc: "Liverpool Football Club is a renowned English football team based in Liverpool, Merseyside. Established in 1892, Liverpool has a rich history and is one of the most successful clubs in English football. The team's home ground is Anfield, which has a capacity of over 54,000 spectators. Liverpool has won numerous domestic and international titles, including 19 League titles, 6 UEFA Champions League titles, and 7 FA Cups. The club has a fierce rivalry with Manchester United, known as the North West Derby. Liverpool's iconic anthem is You'll Never Walk Alone, sung passionately by their supporters. Over the years, the club has boasted legendary players like Kenny Dalglish, Steven Gerrard, and Ian Rush. Currently, the team is managed by Jürgen Klopp, known for his charismatic leadership and attacking style of play."
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 5,
                        title: "Bayern Munich",
                        desc: """
                                        Bayern Munich, one of the most successful football clubs globally, is based in Munich, Germany. Founded in 1900, the club has a rich history of domestic and international triumphs. Bayern Munich competes in the Bundesliga, Germany's top-tier football league, and has dominated the competition with numerous league titles. Additionally, the club has achieved success on the European stage, winning the UEFA Champions League multiple times. Known for their attacking style of play and emphasis on youth development, Bayern Munich boasts a strong squad of talented players from around the world. The club's home matches are played at the Allianz Arena, a modern stadium known for its distinctive exterior design. Off the field, Bayern Munich maintains a large fanbase and is renowned for its community involvement and philanthropic initiatives.
                                        """
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubStudy(                        id: 6,
                                                                                          title: "Chelsea",
                                                                                          desc: "Chelsea Football Club is a professional football team based in London, England. Founded in 1905, Chelsea has a rich history and is one of the most successful clubs in English football. The team plays its home matches at Stamford Bridge stadium, which has a capacity of over 40,000 spectators. Chelsea has won multiple league titles, FA Cups, League Cups, and UEFA Champions League trophies. The club has a strong rivalry with other London clubs like Arsenal, Tottenham Hotspur, and West Ham United. Notable players who have represented Chelsea include Frank Lampard, Didier Drogba, John Terry, and Eden Hazard. The club's colors are royal blue and white, and its supporters are known as the Blues."
                                                                 ),
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 7,
                        title: "Manchester United",
                        desc: "Manchester United, based in Manchester, England, is one of the most storied football clubs globally, boasting a rich history dating back to 1878. Known as the Red Devils, they play their home matches at Old Trafford, one of the most iconic stadiums in the world. Manchester United has won numerous domestic and international titles, including 20 league titles in the English top-flight, making them one of the most successful clubs in English football history. The club has also tasted success in European competitions, winning the UEFA Champions League multiple times. Throughout its history, Manchester United has been home to legendary players and managers who have left an indelible mark on the sport. Despite facing challenges in recent years, the club remains a powerhouse in world football, with a massive global fanbase."
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 8,
                        title: "Barcelona",
                        desc: """
                                        FC Barcelona, commonly referred to as Barcelona or Barça, is a professional football club based in Barcelona, Catalonia, Spain. Founded in 1899, Barcelona is one of the most successful and prestigious football clubs globally. The team plays its home matches at the iconic Camp Nou stadium, with a seating capacity of over 99,000 spectators. Barcelona has won numerous domestic and international titles, including La Liga, Copa del Rey, and UEFA Champions League trophies. The club has a rich history of legendary players like Lionel Messi, Johan Cruyff, and Xavi Hernandez. Barcelona is renowned for its possession-based style of play known as "tiki-taka" and its youth academy, La Masia, which has produced many world-class talents. The club's colors are blue and claret, and its passionate fan base is known as culés.
                                        """
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 9,
                        title: "Juventus",
                        desc: "Juventus Football Club, commonly referred to as Juventus or Juve, is an Italian professional football club based in Turin, Piedmont. Founded in 1897, Juventus is one of the oldest and most successful football clubs in Italy and Europe. The team plays its home matches at the Allianz Stadium, which has a capacity of over 41,000 spectators. Juventus has won the Serie A title, the top tier of Italian football, a record 36 times. Additionally, they have claimed the Coppa Italia title 14 times and the UEFA Champions League title twice. Juventus is known for its iconic black and white striped home jersey and is nicknamed The Old Lady. The club has a rich history and boasts legendary players like Alessandro Del Piero, Gianluigi Buffon, and Michel Platini."
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 10,
                        title: "Borussia Dortmund",
                        desc: """
                                        Borussia Dortmund, founded in 1909, is a professional football club based in Dortmund, Germany. The club competes in the Bundesliga, the top tier of German football, and has a rich history of success. Known for their vibrant yellow and black kits, Dortmund plays their home matches at the iconic Signal Iduna Park, one of the largest stadiums in Europe. The club has won numerous domestic titles, including multiple Bundesliga championships and DFB-Pokal trophies. Dortmund has also enjoyed success on the international stage, winning the UEFA Champions League in 1997. Renowned for their attacking style of play and passionate fan base, Borussia Dortmund remains one of the most exciting and respected clubs in European football.
                                        """
                    ),
                ],
                test: [
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 1,
                        question: "When was Manchester City Football Club established?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1800"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1880"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1920"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "2000")
                        ],
                        correctAnswer: "1880"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 1,
                        question: "Where is Manchester City based?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "London"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Manchester"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Liverpool"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Birmingham")
                        ],
                        correctAnswer: "Manchester"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 1,
                        question: "What is Manchester City commonly referred to as?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Man United"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Man City"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Chelsea"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Arsenal")
                        ],
                        correctAnswer: "Man City"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 1,
                        question: "What is the capacity of Manchester City's home stadium, the Etihad Stadium?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "40,000"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "50,000"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "55,000"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "60,000")
                        ],
                        correctAnswer: "55,000"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 1,
                        question: "Which league does Manchester City compete in?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Serie A"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "La Liga"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "English Premier League"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Bundesliga")
                        ],
                        correctAnswer: "English Premier League"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 1,
                        question: "What is one of Manchester City's notable achievements in recent years?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Winning the FIFA World Cup"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Winning multiple league titles and domestic cups"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Relegation to lower divisions"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Bankruptcy")
                        ],
                        correctAnswer: "Winning multiple league titles and domestic cups"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 2,
                        question: "When was Paris Saint-Germain established?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1960"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1970"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1980"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1990")
                        ],
                        correctAnswer: "1970"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 2,
                        question: "What is the capacity of Parc des Princes stadium?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Over 40,000"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Over 50,000"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Over 60,000"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Over 70,000")
                        ],
                        correctAnswer: "Over 40,000"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 2,
                        question: "Which player is NOT mentioned as part of PSG's star-studded roster?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Neymar"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Kylian Mbappé"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Cristiano Ronaldo"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Lionel Messi")
                        ],
                        correctAnswer: "Cristiano Ronaldo"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 2,
                        question: "In which year did PSG reach the UEFA Champions League final?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "2018"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "2019"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "2020"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "2021")
                        ],
                        correctAnswer: "2020"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 2,
                        question: "What are the colors of Paris Saint-Germain?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and yellow"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Black and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Green and blue")
                        ],
                        correctAnswer: "Red and white"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 2,
                        question: "What is the nickname of PSG's passionate fan base?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Les Parisiens"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Les Bleus"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Les Rois"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Les Dragons")
                        ],
                        correctAnswer: "Les Parisiens"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 3,
                        question: "When was Real Madrid Football Club established?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1800"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1902"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1920"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "2000")
                        ],
                        correctAnswer: "1902"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 3,
                        question: "What is the name of Real Madrid's home stadium?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Santiago Bernabéu Stadium"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Camp Nou"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Anfield"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Old Trafford")
                        ],
                        correctAnswer: "Santiago Bernabéu Stadium"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 3,
                        question: "Which player is often associated with Real Madrid's success?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Lionel Messi"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Cristiano Ronaldo"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Neymar Jr."),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Kylian Mbappé")
                        ],
                        correctAnswer: "Cristiano Ronaldo"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 3,
                        question: "What is Real Madrid's nickname?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Blues"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Reds"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Whites"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Greens")
                        ],
                        correctAnswer: "The Whites"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 3,
                        question: "In which league does Real Madrid compete?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Premier League"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Serie A"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "La Liga"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Bundesliga")
                        ],
                        correctAnswer: "La Liga"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 3,
                        question: "What is Real Madrid's main rivalry known as?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "El Clásico"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Der Klassiker"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Manchester Derby"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Merseyside Derby")
                        ],
                        correctAnswer: "El Clásico"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 4,
                        question: "When was Liverpool Football Club established?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1800"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1888"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1892"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1900")
                        ],
                        correctAnswer: "1892"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 4,
                        question: "How many UEFA Champions League titles has Liverpool won?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "3"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "5"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "6"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "8")
                        ],
                        correctAnswer: "6"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 4,
                        question: "What is the capacity of Liverpool's home ground, Anfield?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Over 40,000"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Over 50,000"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Over 60,000"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Over 70,000")
                        ],
                        correctAnswer: "Over 50,000"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 4,
                        question: "Which anthem is associated with Liverpool FC?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "God Save the Queen"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Rule, Britannia!"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "You'll Never Walk Alone"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Land of Hope and Glory")
                        ],
                        correctAnswer: "You'll Never Walk Alone"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 4,
                        question: "Who is the current manager of Liverpool?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Arsène Wenger"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Pep Guardiola"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Jürgen Klopp"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "José Mourinho")
                        ],
                        correctAnswer: "Jürgen Klopp"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 4,
                        question: "Which club shares a fierce rivalry with Liverpool, known as the North West Derby?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Everton"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Manchester United"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Chelsea"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Arsenal")
                        ],
                        correctAnswer: "Manchester United"
                    ),
                    
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 5,
                        question: "When was Bayern Munich Football Club established?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1800"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1900"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1920"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "2000")
                        ],
                        correctAnswer: "1900"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 5,
                        question: "In which city is Bayern Munich based?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Berlin"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Munich"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Hamburg"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Frankfurt")
                        ],
                        correctAnswer: "Munich"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 5,
                        question: "How many UEFA Champions League titles has Bayern Munich won?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "None"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "One"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Three")
                        ],
                        correctAnswer: "Three"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 5,
                        question: "What stadium do Bayern Munich's home matches take place in?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Signal Iduna Park"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Allianz Arena"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Camp Nou"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Santiago Bernabéu Stadium")
                        ],
                        correctAnswer: "Allianz Arena"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 5,
                        question: "What is Bayern Munich known for in terms of playing style?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Defensive tactics"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Counter-attacking football"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Attacking style of play"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Possession-based game")
                        ],
                        correctAnswer: "Attacking style of play"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 5,
                        question: "What year was Bayern Munich founded?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1880"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1900"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1920"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1950")
                        ],
                        correctAnswer: "1900"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 6,
                        question: "When was Chelsea Football Club founded?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1805"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1885"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1905"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1925")
                        ],
                        correctAnswer: "1905"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 6,
                        question: "What is the capacity of Stamford Bridge stadium?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Over 30,000"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Over 40,000"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Over 50,000"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Over 60,000")
                        ],
                        correctAnswer: "Over 40,000"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 6,
                        question: "Which competition has Chelsea NOT won?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Premier League"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "FA Cup"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "UEFA Europa League"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Serie A")
                        ],
                        correctAnswer: "Serie A"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 6,
                        question: "Who is considered a Chelsea legend?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Thierry Henry"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Frank Lampard"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Steven Gerrard"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Wayne Rooney")
                        ],
                        correctAnswer: "Frank Lampard"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 6,
                        question: "What are the club colors of Chelsea?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Black and yellow"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Green and black")
                        ],
                        correctAnswer: "Blue and white"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 6,
                        question: "What are Chelsea supporters known as?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Reds"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Blues"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Whites"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Greens")
                        ],
                        correctAnswer: "The Blues"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 7,
                        question: "When was Manchester United Football Club established?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1878"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1900"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1925"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1950")
                        ],
                        correctAnswer: "1878"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 7,
                        question: "What is Manchester United's nickname?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Red Devils"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Blues"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Citizens"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Gunners")
                        ],
                        correctAnswer: "The Red Devils"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 7,
                        question: "How many league titles has Manchester United won in the English top-flight?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "20"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "15"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "10"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "25")
                        ],
                        correctAnswer: "20"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 7,
                        question: "Which stadium hosts Manchester United's home matches?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Old Trafford"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Anfield"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Emirates Stadium"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Stamford Bridge")
                        ],
                        correctAnswer: "Old Trafford"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 7,
                        question: "How many times has Manchester United won the UEFA Champions League?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Twice"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Once"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Three times"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Four times")
                        ],
                        correctAnswer: "Three times"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 7,
                        question: "What is Manchester United's nickname?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Red Devils"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Blues"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Gunners"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Citizens")
                        ],
                        correctAnswer: "The Red Devils"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 8,
                        question: "When was FC Barcelona founded?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1870"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1899"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1910"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1925")
                        ],
                        correctAnswer: "1899"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 8,
                        question: "What is the seating capacity of Camp Nou stadium?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Over 80,000"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Over 90,000"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Over 100,000"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Over 110,000")
                        ],
                        correctAnswer: "Over 90,000"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 8,
                        question: "Who is NOT mentioned as a legendary player of FC Barcelona?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Lionel Messi"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Johan Cruyff"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Cristiano Ronaldo"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Xavi Hernandez")
                        ],
                        correctAnswer: "Cristiano Ronaldo"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 8,
                        question: "How many UEFA Champions League trophies has Barcelona won?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "3"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "5"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "8"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "10")
                        ],
                        correctAnswer: "5"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 8,
                        question: "What style of play is Barcelona famous for?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Total Football"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Tiki-taka"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Counter-attack"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Long-ball")
                        ],
                        correctAnswer: "Tiki-taka"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 8,
                        question: "What is the nickname for Barcelona's passionate fan base?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Culés"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blaugranas"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Los Merengues"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Die Roten")
                        ],
                        correctAnswer: "Culés"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 9,
                        question: "When was Juventus Football Club founded?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1877"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1897"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1917"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1927")
                        ],
                        correctAnswer: "1897"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 9,
                        question: "What is the name of Juventus' home stadium?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "San Siro Stadium"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Allianz Stadium"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Stadio Olimpico"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Juventus Arena")
                        ],
                        correctAnswer: "Allianz Stadium"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 9,
                        question: "How many times has Juventus won the Serie A title?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "30 times"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "33 times"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "36 times"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "39 times")
                        ],
                        correctAnswer: "36 times"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 9,
                        question: "Which player is NOT mentioned as a legendary player of Juventus?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Alessandro Del Piero"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Gianluigi Buffon"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Lionel Messi"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Michel Platini")
                        ],
                        correctAnswer: "Lionel Messi"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 9,
                        question: "What are the colors of Juventus' home jersey?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and black"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Black and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Yellow and black")
                        ],
                        correctAnswer: "Black and white"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 9,
                        question: "What is Juventus' nickname?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Blues"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Reds"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Old Lady"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Gunners")
                        ],
                        correctAnswer: "The Old Lady"
                    ),
                    
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 10,
                        question: "When was Borussia Dortmund founded?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1899"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1909"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1920"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1945")
                        ],
                        correctAnswer: "1909"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 10,
                        question: "In which league does Borussia Dortmund compete?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Serie A"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "La Liga"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Bundesliga"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Premier League")
                        ],
                        correctAnswer: "Bundesliga"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 10,
                        question: "What are Borussia Dortmund's team colors?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and black"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Yellow and black"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Green and white")
                        ],
                        correctAnswer: "Yellow and black"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 10,
                        question: "Where does Borussia Dortmund play their home matches?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Allianz Arena"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Wembley Stadium"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Anfield"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Signal Iduna Park")
                        ],
                        correctAnswer: "Signal Iduna Park"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 10,
                        question: "How many UEFA Champions League titles has Borussia Dortmund won?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "None"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "One"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Three")
                        ],
                        correctAnswer: "One"
                    ),
                    
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 10,
                        question: "What is Borussia Dortmund known for in terms of their style of play?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Defensive style"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Counter-attacking style"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Attacking style"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Possession-based style")
                        ],
                        correctAnswer: "Attacking style"
                    )
                ]
            ),
            rules: SelectionModel.Data.SportData.Rules(
                study: [
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 1,
                        title: "Manchester City",
                        desc: "Manchester City Football Club, commonly referred to as Man City, follows a set of rules and regulations to ensure fair play and sportsmanship on and off the field. These rules govern various aspects of the club's operations, including player conduct, financial management, and adherence to league regulations. Man City emphasizes integrity, respect, and professionalism among its players, staff, and supporters. The club upholds the principles of fair play and strives for excellence in all competitions. Manchester City's rules aim to maintain a positive and inclusive environment for everyone involved with the club, fostering a sense of community and unity among fans worldwide."
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 2,
                        title: "Paris Saint-Germain",
                        desc: """
                                        Paris Saint-Germain (PSG) is a prestigious football club with a set of rules that govern its operations:
                                        Respect: Players are expected to show respect to teammates, coaches, opponents, and officials both on and off the field.
                                        Discipline: PSG emphasizes discipline, requiring players to adhere to training schedules, team meetings, and club policies.
                                        Integrity: Integrity is crucial, with players expected to uphold the values of fair play and sportsmanship.
                                        Professionalism: Players are representatives of PSG and are expected to maintain a professional demeanor in all interactions.
                                        Commitment: Dedication to the club's goals and objectives is essential, including giving maximum effort during training and matches.
                                        Teamwork: PSG values teamwork and cooperation among players to achieve success collectively.
                                        Loyalty: Players are expected to demonstrate loyalty to the club and its supporters.
                                        """
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 3,
                        title: "Real Madrid",
                        desc: """
                                        Real Madrid, one of the most successful football clubs globally, has a set of rules that guide its operations and conduct:
                                        
                                        Respect for Tradition: Real Madrid upholds its rich history and traditions, honoring past achievements and legends.
                                        
                                        Commitment to Excellence: The club strives for excellence in every aspect, whether it's on the field, in management, or in serving its fanbase.
                                        
                                        Sportsmanship: Real Madrid values fair play and sportsmanship, promoting integrity and respect for opponents.
                                        
                                        Unity and Teamwork: Team cohesion and collaboration are essential values, fostering a sense of unity among players and staff.
                                        
                                        Continuous Improvement: The club is dedicated to constant growth and development, seeking to improve both individually and collectively.
                                        
                                        Community Engagement: Real Madrid actively engages with its community, using its platform to make a positive impact beyond football.
                                        
                                        Financial Responsibility: The club manages its finances prudently, ensuring sustainability and long-term success.
                                        
                                        Global Representation: Real Madrid embraces its global fanbase, aiming to represent and connect with supporters worldwide.
                                        """
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 4,
                        title: "Liverpool",
                        desc: """
                                        Liverpool Football Club, founded in 1892, has a rich history and a set of rules that have evolved over time. These rules govern the conduct of players, staff, and fans associated with the club. Here's an overview of Liverpool's rules:
                                        
                                        Respect for the game: Players and staff must uphold the integrity of football and adhere to fair play principles.
                                        Loyalty: Members are expected to demonstrate unwavering loyalty to the club and its values.
                                        Sportsmanship: Displaying good sportsmanship on and off the field is paramount.
                                        Discipline: Any breaches of club rules or misconduct are subject to disciplinary action.
                                        Unity: Fostering a sense of unity and teamwork among players, staff, and supporters is crucial.
                                        Respect for opponents: While striving for victory, it's important to respect the opposition and their supporters.
                                        Representation: Players and staff are ambassadors for the club and must represent it with dignity and respect.
                                        """
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 5,
                        title: "Bayern Munich",
                        desc: """
                                        Bayern Munich, one of the most successful football clubs globally, follows specific rules governing its operations. These rules include financial regulations, ethical conduct, and adherence to football governing bodies' guidelines. Financial Fair Play regulations ensure the club's financial sustainability and prevent excessive spending beyond its means. Ethical conduct mandates fair treatment of players, staff, and stakeholders, promoting integrity and respect within the club and the broader football community. Bayern Munich also abides by FIFA and UEFA regulations regarding player transfers, youth development, and participation in competitions. Additionally, the club emphasizes environmental sustainability and community engagement, contributing positively to society. These rules uphold Bayern Munich's reputation as a prestigious and responsible football institution, fostering success on and off the pitch.
                                        """
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 6,
                        title: "Chelsea",
                        desc: "Chelsea Football Club adheres to a comprehensive set of rules and regulations to ensure fair play, integrity, and professionalism both on and off the pitch. These rules govern various aspects of the club's operations, including player conduct, financial management, and compliance with league regulations. Chelsea prioritizes inclusivity, respect, and community engagement, aiming to create a positive and supportive environment for players, staff, and supporters alike. The club emphasizes the development of young talent through its renowned academy system while also striving for success in domestic and international competitions. Chelsea's rules underscore the importance of accountability, discipline, and adherence to ethical standards, reflecting the club's commitment to excellence in all endeavors."
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 7,
                        title: "Manchester United",
                        desc: """
                                        Founded in 1878, Manchester United has established itself as a powerhouse in English and European football. The club adheres to strict guidelines, including promoting fair play, respect for opponents, and sportsmanship on and off the field. Players are expected to uphold the club's values, maintain professionalism, and show commitment to the team's success. Manchester United's rules also encompass disciplinary measures for misconduct, outlining penalties for violations such as violent conduct, dissent, and unsporting behavior. Additionally, the club emphasizes the importance of integrity, community engagement, and upholding its reputation as a global football institution. Through these principles, Manchester United aims to inspire fans, promote inclusivity, and uphold the spirit of the game.
                                        """
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 8,
                        title: "Barcelona",
                        desc: """
                                        
                                        Barcelona, a city renowned for its vibrant culture and rich history, had its own set of rules governing its inhabitants' conduct during the 17th century. These regulations aimed to maintain order and uphold societal norms within the bustling city.
                                        
                                        Curfew: Citizens were expected to abide by a strict curfew, ensuring that the streets were clear and quiet after a certain hour to prevent disturbances and maintain safety.
                                        
                                        Dress Code: There were regulations dictating appropriate attire, particularly for different social classes, to preserve decorum and status distinctions.
                                        
                                        Trade Restrictions: Barcelona had regulations regarding trade and commerce, often enforced to protect local businesses and maintain economic stability.
                                        
                                        Religious Observance: Attendance at religious services and adherence to religious festivals and customs were mandatory, reflecting the strong influence of Catholicism in Barcelona society.
                                        
                                        Public Behavior: Respectful behavior towards authorities, fellow citizens, and public property was expected, with penalties for those who engaged in disorderly conduct or vandalism.
                                        
                                        Civic Duty: Citizens were obligated to participate in civic duties such as community projects, upkeep of public spaces, and defense efforts during times of crisis.
                                        """
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 9,
                        title: "Juventus",
                        desc: """
                                        Respect for Tradition: Juventus players are expected to uphold the rich history and traditions of the club both on and off the field.
                                        Commitment to Excellence: Every member of Juventus is dedicated to achieving excellence in their performance, continuously striving to improve and succeed.
                                        Team Spirit: Collaboration and unity are key values at Juventus, with players encouraged to support and uplift their teammates at all times.
                                        Discipline and Professionalism: Players adhere to strict discipline and maintain a high level of professionalism in all aspects of their conduct.
                                        Adherence to Tactics: Juventus follows a specific style of play and tactical approach, with players expected to understand and execute these strategies effectively.
                                        Respect for Fans: Juventus players recognize the importance of their supporters and always show appreciation for their loyalty and passion.
                                        """
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 10,
                        title: "Borussia Dortmund",
                        desc: """
                                        Borussia Dortmund, a professional football club based in Dortmund, Germany, follows a set of rules and principles both on and off the field. The club places a strong emphasis on youth development, striving to nurture young talents through its renowned academy system. Dortmund is known for its passionate fan base, who adhere to the principles of respect and fair play. The club promotes an attacking style of football, characterized by quick transitions and high pressing. Dortmund's iconic yellow and black colors adorn the Signal Iduna Park, their home stadium, which boasts one of the most electrifying atmospheres in European football. Additionally, Borussia Dortmund is committed to sustainability initiatives and community engagement, aiming to make a positive impact beyond the realm of football.
                                        """
                    )
                ],
                test: [
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "What are the values emphasized by Manchester City besides their performance on the field?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Integrity and respect for the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Winning at any cost"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Encouraging aggression and foul play"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ignoring rules and regulations")
                        ],
                        correctAnswer: "Integrity and respect for the game"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "Apart from their success in competitions, what does Paris Saint-Germain prioritize?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Developing young talent and community engagement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Spending lavishly on transfers"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Avoiding fan engagement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Focusing solely on individual achievements")
                        ],
                        correctAnswer: "Developing young talent and community engagement"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "What does Real Madrid prioritize alongside their pursuit of trophies?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Promoting their youth academy and global brand"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ignoring youth development in favor of expensive signings"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Manipulating match results"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Discouraging fan engagement")
                        ],
                        correctAnswer: "Promoting their youth academy and global brand"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "Besides their achievements on the pitch, what does Liverpool prioritize?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Fan engagement and community involvement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ignoring fan opinions"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Winning awards at any cost"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Discouraging community activities")
                        ],
                        correctAnswer: "Fan engagement and community involvement"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "What values does Bayern Munich prioritize besides their performance on the field?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Promoting youth development and sustainability"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Encouraging unethical behavior"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Disregarding sustainability practices"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ignoring youth development")
                        ],
                        correctAnswer: "Promoting youth development and sustainability"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "Apart from their results on the pitch, what does Chelsea prioritize?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Investing in their youth academy and local community"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Disregarding their youth academy"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Encouraging reckless spending"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ignoring community initiatives")
                        ],
                        correctAnswer: "Investing in their youth academy and local community"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "Besides their performance on the field, what values does Manchester United prioritize?",
                        answers: [
                            
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ignoring traditions and community involvement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Maintaining traditions and supporting local communities"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Promoting unethical behavior"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Discouraging fan engagement")
                        ],
                        correctAnswer: "Maintaining traditions and supporting local communities"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "Apart from their achievements in football, what values does Barcelona prioritize?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Promoting youth development and playing attractive football"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Disregarding youth development and playing defensively"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Manipulating match results"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Discouraging fan engagement")
                        ],
                        correctAnswer: "Promoting youth development and playing attractive football"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "Besides their success in competitions, what does Juventus prioritize?",
                        answers: [
                            
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Disregarding their youth academy"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Investing in their youth academy and sustainability"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Encouraging unethical behavior"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ignoring sustainability practices")
                        ],
                        correctAnswer: "Investing in their youth academy and sustainability"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "What principles guide Borussia Dortmund's operations besides their performance on the field?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Promoting youth development and financial stability"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ignoring youth development and reckless spending"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Manipulating match results"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Discouraging fan engagement")
                        ],
                        correctAnswer: "Promoting youth development and financial stability"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "Besides their success in competitions, what values does Atlético Madrid prioritize?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Hard work and team spirit"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Cheating and dishonesty"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Disregarding teamwork and fair play"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Hard work and team spirit"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Encouraging individualism and selfishness")
                        ],
                        correctAnswer: "Hard work and team spirit"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "Apart from their achievements on the pitch, what principles guide Inter Milan's operations?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Promoting youth development and community engagement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ignoring youth development and community involvement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Manipulating match results"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Discouraging fan engagement")
                        ],
                        correctAnswer: "Promoting youth development and community engagement"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "What values does Arsenal prioritize apart from their results in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Youth development and community involvement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ignoring youth development and community engagement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Manipulating match results"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Discouraging fan engagement")
                        ],
                        correctAnswer: "Youth development and community involvement"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "Besides their performance on the field, what values does Tottenham Hotspur prioritize?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Integrity and inclusivity"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Cheating and exclusivity"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Disregarding integrity and promoting exclusivity"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Encouraging unethical behavior")
                        ],
                        correctAnswer: "Integrity and inclusivity"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "What are the core values emphasized by Paris Saint-Germain?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Arrogance"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Discipline"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Laziness"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Dishonesty")
                        ],
                        correctAnswer: "Discipline"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "Which aspect is crucial for PSG players to uphold during matches?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Cheating"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Fair play"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Aggression"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Diving")
                        ],
                        correctAnswer: "Fair play"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "What behavior is expected of PSG players towards their opponents?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Insulting"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Aggressive"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Respectful"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Disrespectful")
                        ],
                        correctAnswer: "Respectful"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "What is a key requirement for PSG players regarding training?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Skipping sessions"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Arriving late"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Adhering to schedules"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ignoring instructions")
                        ],
                        correctAnswer: "Adhering to schedules"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "What is the importance of teamwork at PSG?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Irrelevant"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Unnecessary"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Valued"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Disliked")
                        ],
                        correctAnswer: "Valued"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "What attitude should PSG players demonstrate towards the club and its supporters?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Disloyalty"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Indifference"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Loyalty"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Hostility")
                        ],
                        correctAnswer: "Loyalty"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "What are some key rules guiding Real Madrid?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Respect for Tradition"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Commitment to Excellence"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Sportsmanship"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Unity and Teamwork")
                        ],
                        correctAnswer: "Respect for Tradition"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "What principle does Real Madrid prioritize in its approach to opponents?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Deception"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Sportsmanship"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ruthlessness"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Arrogance")
                        ],
                        correctAnswer: "Sportsmanship"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "What quality fosters a sense of togetherness within Real Madrid?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Individualism"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Unity"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Indifference"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Discord")
                        ],
                        correctAnswer: "Unity"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "How does Real Madrid engage with its community?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By ignoring them"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Through isolation"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By actively participating"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By criticizing them")
                        ],
                        correctAnswer: "By actively participating"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "What does Real Madrid aim to achieve with its global outreach?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Insularity"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Representation"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Apathy"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Neglect")
                        ],
                        correctAnswer: "Representation"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "What are the rules governing conduct at Liverpool Football Club?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Respect for the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Unity among players, staff, and supporters"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Discipline for breaches of club rules"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Freedom to disrespect opponents")
                        ],
                        correctAnswer: "Respect for the game"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "When was Liverpool Football Club founded?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "1875"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "1892"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "1905"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "1920")
                        ],
                        correctAnswer: "1892"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "Which of the following is NOT a rule at Liverpool FC?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Respect for opponents"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Sportsmanship"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Aggression towards referees"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Loyalty")
                        ],
                        correctAnswer: "Aggression towards referees"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "What is the importance of unity at Liverpool FC?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It's optional"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It's crucial"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It's irrelevant"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It's discouraged")
                        ],
                        correctAnswer: "It's crucial"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "What happens if a member breaches club rules?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Nothing"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They are praised"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They face disciplinary action"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They are rewarded")
                        ],
                        correctAnswer: "They face disciplinary action"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "What is the primary principle regarding conduct on and off the field?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Aggression"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Loyalty"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Sportsmanship"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Deception")
                        ],
                        correctAnswer: "Sportsmanship"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "How should players and staff represent the club?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "With dishonesty"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "With arrogance"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "With dignity and respect"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "With hostility")
                        ],
                        correctAnswer: "With dignity and respect"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "What are the rules governing Bayern Munich's operations?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "UEFA Champions League rules"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Financial Fair Play regulations"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "FIFA World Cup guidelines"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "National league regulations")
                        ],
                        correctAnswer: "Financial Fair Play regulations"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "What does ethical conduct entail for Bayern Munich?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Excessive spending on player transfers"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Fair treatment of players and stakeholders"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ignoring FIFA regulations"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Avoiding community engagement")
                        ],
                        correctAnswer: "Fair treatment of players and stakeholders"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "What governing bodies' guidelines do Bayern Munich follow?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only FIFA regulations"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only UEFA regulations"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Both FIFA and UEFA regulations"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "None of the above")
                        ],
                        correctAnswer: "Both FIFA and UEFA regulations"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "In addition to football, what does Bayern Munich emphasize?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Financial speculation"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Environmental sustainability and community engagement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Political activism"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Cultural events")
                        ],
                        correctAnswer: "Environmental sustainability and community engagement"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "Which of the following contributes to Bayern Munich's positive reputation?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Excessive spending beyond means"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Lack of adherence to regulations"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Environmental sustainability efforts"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Disrespect towards stakeholders")
                        ],
                        correctAnswer: "Environmental sustainability efforts"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "What is essential for Bayern Munich's success on and off the pitch?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Violating financial regulations"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Following ethical conduct"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ignoring community engagement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Disregarding player development")
                        ],
                        correctAnswer: "Following ethical conduct"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "What values does Chelsea prioritize in its operations?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Arrogance and hostility"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Inclusivity, respect, and community engagement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Isolation and exclusivity"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Indifference and apathy")
                        ],
                        correctAnswer: "Inclusivity, respect, and community engagement"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "What aspect of player development does Chelsea emphasize through its academy system?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ignoring young talent"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Promoting inclusivity"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Developing young talent"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Disregarding community engagement")
                        ],
                        correctAnswer: "Developing young talent"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "Why are rules and regulations important for Chelsea Football Club?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To promote chaos and disorder"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To ensure fair play, integrity, and professionalism"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To encourage unethical behavior"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To create confusion and uncertainty")
                        ],
                        correctAnswer: "To ensure fair play, integrity, and professionalism"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "What principles guide Chelsea's operations besides their performance on the pitch?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Promoting inclusivity and respect"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Encouraging arrogance and hostility"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ignoring ethical standards"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Disregarding community engagement")
                        ],
                        correctAnswer: "Promoting inclusivity and respect"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "How does Chelsea aim to create a positive environment for everyone involved with the club?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By fostering conflict and division"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By promoting inclusivity, respect, and support"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By discouraging cooperation and teamwork"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By ignoring the needs of its supporters")
                        ],
                        correctAnswer: "By promoting inclusivity, respect, and support"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "What is the ultimate goal of Chelsea's rules and regulations?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To create chaos and confusion"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To ensure fair play, integrity, and professionalism"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To promote dishonesty and deception"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To alienate fans and supporters")
                        ],
                        correctAnswer: "To ensure fair play, integrity, and professionalism"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "What values does Manchester United emphasize?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Fair play and respect"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Aggression and arrogance"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Deception and dishonesty"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Cheating and foul play")
                        ],
                        correctAnswer: "Fair play and respect"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "When was Manchester United founded?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "1878"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "1905"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "1920"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "1945")
                        ],
                        correctAnswer: "1878"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "What behavior does the club penalize?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Violent conduct"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Showing respect"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Fair play"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Community engagement")
                        ],
                        correctAnswer: "Violent conduct"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "What is the club's stance on professionalism?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It's not important"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It's optional"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It's essential"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It's irrelevant")
                        ],
                        correctAnswer: "It's essential"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "What is one aspect of Manchester United's disciplinary measures?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Encouraging unsporting behavior"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ignoring violations"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Penalties for misconduct"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Rewarding dissent")
                        ],
                        correctAnswer: "Penalties for misconduct"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "What is one of Manchester United's aims through its principles?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To discourage inclusivity"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To lower fan engagement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To uphold its reputation"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To promote dishonesty")
                        ],
                        correctAnswer: "To uphold its reputation"
                    ),
                    
                    
                    
                    
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "What were some rules enforced in 17th century Barcelona?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Strict curfew to maintain safety and order"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Regulations on dress code to preserve decorum"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Trade restrictions to protect local businesses"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Mandatory attendance at religious services")
                        ],
                        correctAnswer: "Strict curfew to maintain safety and order"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "Why did Barcelona have regulations on dress code?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To encourage fashion experimentation"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To maintain social status distinctions"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To promote uniformity among citizens"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To reduce clothing expenses")
                        ],
                        correctAnswer: "To maintain social status distinctions"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "What was the purpose of trade restrictions in Barcelona?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To promote international trade relations"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To protect local businesses"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To encourage free market competition"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To restrict access to foreign goods")
                        ],
                        correctAnswer: "To protect local businesses"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "Which religion heavily influenced Barcelona society during the 17th century?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Islam"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Buddhism"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Judaism"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Catholicism")
                        ],
                        correctAnswer: "Catholicism"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "What behavior was expected from citizens in public spaces?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Disrespect towards authorities"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Vandalism of public property"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Respectful conduct towards others"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Promotion of disorderly conduct")
                        ],
                        correctAnswer: "Respectful conduct towards others"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "What civic duty were citizens obligated to perform?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Participation in community projects"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ignoring public spaces"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Avoiding involvement in defense efforts"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Disregarding authority's orders")
                        ],
                        correctAnswer: "Participation in community projects"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "What is a fundamental value at Juventus?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Innovation"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Tradition"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Individualism"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Isolation")
                        ],
                        correctAnswer: "Tradition"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "What quality is essential for Juventus players?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Mediocrity"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Consistency"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Indifference"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Apathy")
                        ],
                        correctAnswer: "Consistency"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "What is encouraged among Juventus players?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Selfishness"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Team spirit"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Arrogance"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Hostility")
                        ],
                        correctAnswer: "Team spirit"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "What behavior is expected from Juventus members?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Irresponsibility"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Indiscipline"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Professionalism"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Insubordination")
                        ],
                        correctAnswer: "Professionalism"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "What aspect of the game do Juventus players need to understand?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Luck"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Tactics"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Coincidence"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Superstition")
                        ],
                        correctAnswer: "Tactics"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "Who do Juventus players show respect towards?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Opponents only"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Themselves"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Fans"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Referees")
                        ],
                        correctAnswer: "Fans"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "Where is Borussia Dortmund based?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Berlin"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Dortmund"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Munich"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Hamburg")
                        ],
                        correctAnswer: "Dortmund"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "What principle does Borussia Dortmund emphasize in its youth development?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Winning at all costs"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Respect and fair play"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Individual accolades"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Defensive tactics")
                        ],
                        correctAnswer: "Respect and fair play"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "What style of football is Borussia Dortmund known for?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Possession-based"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Counter-attacking"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Defensive"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Conservative")
                        ],
                        correctAnswer: "Counter-attacking"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "What are the colors of Borussia Dortmund?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Blue and white"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Yellow and black"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Red and white"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Green and black")
                        ],
                        correctAnswer: "Yellow and black"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "What is the name of Borussia Dortmund's home stadium?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Allianz Arena"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Mercedes-Benz Arena"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Signal Iduna Park"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Volksparkstadion")
                        ],
                        correctAnswer: "Signal Iduna Park"
                    ),
                    
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "Besides football, what else is Borussia Dortmund committed to?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Political activism"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Environmental sustainability"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Stock market investments"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Cultural events")
                        ],
                        correctAnswer: "Environmental sustainability"
                    )
                ]
            )
        ),
        basketball: SelectionModel.Data.SportData (
            players: SelectionModel.Data.SportData.Players(
                study: [
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 1,
                        title: "Kawhi Leonard",
                        desc: """
                Kawhi Leonard, born on June 29, 1991, in Los Angeles, USA, is a renowned professional basketball player known for his exceptional skills and versatility. A two-time NBA Finals MVP, Leonard has played for notable teams, including the San Antonio Spurs and the Toronto Raptors, where he secured an NBA championship in 2019. His defensive prowess, combined with an offensive finesse, makes him a dynamic force on the court. Leonard's stoic demeanor earned him the nickname "The Klaw." In 2019, he joined the Los Angeles Clippers, adding another dimension to his impressive career.
                """
                    ),
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 2,
                        title: "Tyrese Haliburton",
                        desc: "Anthony Davis, born on March 11, 1993, in Chicago, Illinois, is a dominant force in professional basketball. As a versatile forward and center, Davis has showcased his exceptional skills with teams like the New Orleans Pelicans and the Los Angeles Lakers in the NBA. Known for his shot-blocking, rebounding, and scoring ability, Davis has earned multiple NBA All-Star selections. His impact was particularly evident during the Lakers' 2020 NBA championship run. Davis has consistently proven himself as one of the league's premier players, combining athleticism with a high basketball IQ."
                    ),
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 3,
                        title: "Anthony Davis",
                        desc: "Anthony Davis, born on March 11, 1993, in Chicago, Illinois, is a dominant force in professional basketball. As a versatile forward and center, Davis has showcased his exceptional skills with teams like the New Orleans Pelicans and the Los Angeles Lakers in the NBA. Known for his shot-blocking, rebounding, and scoring ability, Davis has earned multiple NBA All-Star selections. His impact was particularly evident during the Lakers' 2020 NBA championship run. Davis has consistently proven himself as one of the league's premier players, combining athleticism with a high basketball IQ."
                    ),
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 4,
                        title: "Domantas Sabonis",
                        desc: "Domantas Sabonis, born on May 3, 1996, in Portland, Oregon, is a skilled basketball player making his mark in the NBA. As a power forward and center, Sabonis has showcased his versatile skills with teams like the Indiana Pacers. Known for his rebounding prowess, passing ability, and scoring in the post, Sabonis has become a key player for the Pacers. His basketball lineage includes being the son of Hall of Famer Arvydas Sabonis. Sabonis has earned NBA All-Star selections, solidifying his status as one of the league's rising stars."
                    ),
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 5,
                        title: "Jayson Tatum",
                        desc: "Jayson Tatum, born on March 3, 1998, in St. Louis, Missouri, is a rising star in the NBA known for his scoring prowess and versatility. Playing as a forward for the Boston Celtics, Tatum has rapidly become a cornerstone for his team. His skill set includes exceptional scoring, three-point shooting, and defensive capabilities. Tatum played a vital role in the Celtics' deep playoff runs, showcasing his ability to perform under pressure. Recognized for his offensive skills, Tatum has earned multiple NBA All-Star selections, solidifying himself as one of the league's premier young talents."
                    ),
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 6,
                        title: "Giannis Antetokounmpo",
                        desc: "Giannis Antetokounmpo, born on December 6, 1994, in Athens, Greece, is a basketball phenomenon and a key player for the Milwaukee Bucks in the NBA. Recognized for his extraordinary athleticism and versatility, Antetokounmpo has earned the nickname The Greek Freak. His exceptional skills include dominant scoring, rebounding, and defensive prowess. Giannis played a crucial role in leading the Milwaukee Bucks to an NBA championship in 2021, securing the NBA Finals MVP honors. His impact goes beyond statistics, with a relentless work ethic and dedication to improving every aspect of his game."
                    ),
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 7,
                        title: "Luka Dončić",
                        desc: "Luka Dončić, born on February 28, 1999, in Ljubljana, Slovenia, is a rising star in the NBA, dazzling fans with his exceptional skills and court vision. Playing as a guard/forward for the Dallas Mavericks, Dončić has quickly become one of the league's most exciting players. Renowned for his playmaking, scoring ability, and clutch performances, he earned the title of the youngest player to achieve a triple-double in NBA playoff history. Dončić's impact extends beyond individual achievements, as he aims to lead the Mavericks to new heights and solidify his place among basketball's elite."
                    ),
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 8,
                        title: "Shai Gilgeous-Alexander",
                        desc: "Shai Gilgeous-Alexander, born on July 12, 1998, in Toronto, Canada, is a dynamic guard making waves in the NBA. Currently playing for the Oklahoma City Thunder, Gilgeous-Alexander has showcased his versatile skills, blending scoring, playmaking, and defensive prowess. Known for his smooth style and ability to impact various facets of the game, he quickly became a key player for his team. Gilgeous-Alexander's journey includes standout performances at the University of Kentucky, and he continues to evolve as a promising young talent in the league."
                    ),
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 9,
                        title: "Nikola Jokić",
                        desc: "Nikola Jokić, born on February 19, 1995, in Sombor, Serbia, is a standout center in the NBA, known for his exceptional skills and unique playing style. As the cornerstone of the Denver Nuggets, Jokić has redefined the center position with his playmaking ability, scoring versatility, and basketball IQ. Crowned the NBA MVP in 2021, Jokić is celebrated for his passing skills, making him one of the most well-rounded big men in the league. His impact on both ends of the court has propelled the Nuggets to success, making Jokić a key figure in the NBA."
                    ),
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 10,
                        title: "Joel Embiid",
                        desc: "Joel Embiid, born on March 16, 1994, in Yaoundé, Cameroon, is a dominant force in the NBA, recognized for his exceptional skills as a center. Playing for the Philadelphia 76ers, Embiid's combination of size, agility, and scoring ability sets him apart. Known for his defensive prowess and versatile offensive game, he has become a cornerstone for the 76ers. Embiid's impact extends beyond the court, earning multiple NBA All-Star selections. As one of the league's premier big men, he continues to lead the 76ers with aspirations of bringing a championship to Philadelphia."
                    ),
                ],
                test: [
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 1,
                        question: "Where was Kawhi Leonard born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Toronto"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "San Antonio"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "New York")
                        ],
                        correctAnswer: "Los Angeles"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 1,
                        question: "How many NBA Finals MVP awards has Kawhi Leonard won?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "One"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "None"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Three")
                        ],
                        correctAnswer: "Two"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 1,
                        question: "Which team did Kawhi Leonard help lead to an NBA championship in 2019?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "San Antonio Spurs"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Miami Heat"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles Clippers"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Toronto Raptors")
                        ],
                        correctAnswer: "Toronto Raptors"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 1,
                        question: "What is Kawhi Leonard's nickname?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "The Flash"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "The King"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "The Klaw"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "The Wizard")
                        ],
                        correctAnswer: "The Klaw"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 1,
                        question: "In which year did Kawhi Leonard join the Los Angeles Clippers?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2018"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2020"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2017"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2019")
                        ],
                        correctAnswer: "The Klaw"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 1,
                        question: "Which NBA team did Kawhi Leonard not play for?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Miami Heat"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "San Antonio Spurs"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Toronto Raptors"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles Clippers")
                        ],
                        correctAnswer: "Miami Heat"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 2,
                        question: "Where was Tyrese Haliburton born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Oshkosh, Wisconsin"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Sacramento"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "New York")
                        ],
                        correctAnswer: "Oshkosh, Wisconsin"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 2,
                        question: "In which NBA team does Tyrese Haliburton currently play?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Golden State Warriors"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles Lakers"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Sacramento Kings"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Miami Heat")
                        ],
                        correctAnswer: "Sacramento Kings"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 2,
                        question: "What is one of Tyrese Haliburton's notable skills on the basketball court?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Dunking ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Playmaking, basketball IQ"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Three-point shooting"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Post moves")
                        ],
                        correctAnswer: "Playmaking, basketball IQ"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 2,
                        question: "Where did Tyrese Haliburton have a standout college career?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Duke University"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "University of Kentucky"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "UCLA"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Iowa State")
                        ],
                        correctAnswer: "Iowa State"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 2,
                        question: "What makes Tyrese Haliburton a key player for the Sacramento Kings?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Rebounding ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Defensive prowess"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Scoring  and defending"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Shot-blocking skills")
                        ],
                        correctAnswer: "Scoring  and defending"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 2,
                        question: "What is Tyrese Haliburton's jersey number with the Sacramento Kings?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "10"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "5"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "0"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "23")
                        ],
                        correctAnswer: "0"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 3,
                        question: "Where was Anthony Davis born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Chicago, Illinois"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "New York"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Miami")
                        ],
                        correctAnswer: "Chicago, Illinois"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 3,
                        question: "In which NBA team did Anthony Davis win an NBA championship in 2020?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "New Orleans Pelicans"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Golden State Warriors"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles Lakers"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Houston Rockets")
                        ],
                        correctAnswer: "Los Angeles Lakers"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 3,
                        question: "What position does Anthony Davis primarily play in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Point guard"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Shooting guard"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Small forward"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Forward/Center")
                        ],
                        correctAnswer: "Forward/Center"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 3,
                        question: "What are some of Anthony Davis' notable skills on the basketball court?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Three-point shooting"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Shot-blocking and scoring"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Dunking ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Ball-handling skills")
                        ],
                        correctAnswer: "Shot-blocking and scoring"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 3,
                        question: "Which team did Anthony Davis play for before joining the Los Angeles Lakers?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Miami Heat"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Golden State Warriors"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "New Orleans Pelicans"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Toronto Raptors")
                        ],
                        correctAnswer: "New Orleans Pelicans"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 3,
                        question: "How many NBA All-Star selections has Anthony Davis earned?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Three"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Four"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Five")
                        ],
                        correctAnswer: "Three"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 4,
                        question: "Where was Domantas Sabonis born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Portland, Oregon"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Vilnius, Lithuania"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Madrid, Spain"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Toronto, Canada")
                        ],
                        correctAnswer: "Portland, Oregon"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 4,
                        question: "In which NBA team did Domantas Sabonis make a significant impact?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles Lakers"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Miami Heat"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Boston Celtics"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Indiana Pacers")
                        ],
                        correctAnswer: "Indiana Pacers"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 4,
                        question: "What position does Domantas Sabonis primarily play in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Shooting guard"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Small forward"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Power forward/Center"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Point guard")
                        ],
                        correctAnswer: "Power forward/Center"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 4,
                        question: "Who is Domantas Sabonis' father?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Dirk Nowitzki"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Pau Gasol"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Arvydas Sabonis"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Hakeem Olajuwon")
                        ],
                        correctAnswer: "Arvydas Sabonis"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 4,
                        question: "What are some of Domantas Sabonis' notable skills on the basketball court?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Three-point shooting"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Rebounding, passing"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Shot-blocking"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Fast-break scoring")
                        ],
                        correctAnswer: "Rebounding, passing"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 4,
                        question: "How many NBA All-Star selections has Domantas Sabonis earned?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "One"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "None"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Three"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Two")
                        ],
                        correctAnswer: "Two"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 5,
                        question: "Where was Jayson Tatum born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Boston, Massachusetts"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Chicago, Illinois"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "St. Louis, Missouri"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles, California")
                        ],
                        correctAnswer: "St. Louis, Missouri"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 5,
                        question: "In which NBA team does Jayson Tatum play?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles Lakers"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Boston Celtics"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Miami Heat"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Golden State Warriors")
                        ],
                        correctAnswer: "Boston Celtics"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 5,
                        question: "What position does Jayson Tatum primarily play in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Shooting guard"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Center"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Point guard"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Forward")
                        ],
                        correctAnswer: "Forward"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 5,
                        question: "What are some of Jayson Tatum's notable skills on the basketball court?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Shot-blocking"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Scoring and defensive capabilities"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Rebounding"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Dunking ability")
                        ],
                        correctAnswer: "Scoring and defensive capabilities"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 5,
                        question: "Which NBA team did Jayson Tatum help lead to deep playoff runs?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles Clippers"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Toronto Raptors"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Boston Celtics"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Houston Rockets")
                        ],
                        correctAnswer: "Boston Celtics"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 5,
                        question: "How many NBA All-Star selections has Jayson Tatum earned?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "One"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "None"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Three")
                        ],
                        correctAnswer: "Two"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 6,
                        question: "Where was Giannis Antetokounmpo born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Rome, Italy"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Athens, Greece"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Madrid, Spain"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Istanbul, Turkey")
                        ],
                        correctAnswer: "Athens, Greece"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 6,
                        question: "In which NBA team does Giannis Antetokounmpo play?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles Lakers"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Miami Heat"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Milwaukee Bucks"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Golden State Warriors")
                        ],
                        correctAnswer: "Milwaukee Bucks"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 6,
                        question: "What is Giannis Antetokounmpo's nickname?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "The Flash"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "The Greek Freak"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "The Admiral"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "The Mailman")
                        ],
                        correctAnswer: "The Greek Freak"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 6,
                        question: "Which accolade did Giannis Antetokounmpo earn for his outstanding performance in the NBA Finals in 2021?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "NBA Defensive Player of the Year"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "NBA All-Star MVP"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "NBA Finals MVP"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "NBA Most Improved Player")
                        ],
                        correctAnswer: "NBA Finals MVP"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 6,
                        question: "What makes Giannis Antetokounmpo unique on the basketball court?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Exceptional three-point shooting"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Dunking ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Free throw accuracy"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Elite-level scoring, and defense")
                        ],
                        correctAnswer: "Elite-level scoring, and defense"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 6,
                        question: "How many NBA MVP awards has Giannis Antetokounmpo won?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "One"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "None"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Three")
                        ],
                        correctAnswer: "Two"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 7,
                        question: "Where was Luka Dončić born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Belgrade, Serbia"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Ljubljana, Slovenia"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Athens, Greece"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Budapest, Hungary")
                        ],
                        correctAnswer: "Ljubljana, Slovenia"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 7,
                        question: "In which NBA team does Luka Dončić play?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles Lakers"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Dallas Mavericks"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Miami Heat"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Boston Celtics")
                        ],
                        correctAnswer: "Dallas Mavericks"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 7,
                        question: "What is one of Luka Dončić's standout skills on the basketball court?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Shot-blocking"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Playmaking and scoring ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Dunking ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Three-point shooting")
                        ],
                        correctAnswer: "Playmaking and scoring ability"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 7,
                        question: "At what age did Luka Dončić achieve a triple-double in NBA playoff history, becoming the youngest player to do so?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "21"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "20"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "19"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "22")
                        ],
                        correctAnswer: "19"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 7,
                        question: "Which position does Luka Dončić primarily play in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Center"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Power forward"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Point guard"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Guard/Forward")
                        ],
                        correctAnswer: "Guard/Forward"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 7,
                        question: "What is one of Luka Dončić's notable achievements with the Dallas Mavericks?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "NBA Defensive Player of the Year"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "NBA All-Star MVP"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Youngest NBA playoff triple-double achiever."),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "NBA Finals MVP")
                        ],
                        correctAnswer: "Youngest NBA playoff triple-double achiever."
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 8,
                        question: "Where was Shai Gilgeous-Alexander born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles, USA"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Toronto, Canada"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "London, England"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Sydney, Australia")
                        ],
                        correctAnswer: "Toronto, Canada"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 8,
                        question: "In which NBA team does Shai Gilgeous-Alexander currently play?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles Lakers"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Miami Heat"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Oklahoma City Thunder"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Boston Celtics")
                        ],
                        correctAnswer: "Oklahoma City Thunder"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 8,
                        question: "What is one of Shai Gilgeous-Alexander's standout skills on the basketball court?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Dunking ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Three-point shooting"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Scoring, playmaking, and defensive prowess"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Shot-blocking")
                        ],
                        correctAnswer: "Scoring, playmaking, and defensive prowess"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 8,
                        question: "Where did Shai Gilgeous-Alexander play college basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Duke University"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "University of Kansas"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "North Carolina"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Kentucky")
                        ],
                        correctAnswer: "Kentucky"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 8,
                        question: "What makes Shai Gilgeous-Alexander a key player for the Oklahoma City Thunder?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Rebounding ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Shot-blocking skills"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Versatile skills, including scoring, playmaking"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Aerial prowess")
                        ],
                        correctAnswer: "Versatile skills, including scoring, playmaking"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 8,
                        question: "What is Shai Gilgeous-Alexander's jersey number with the Oklahoma City Thunder?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "5"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "13"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "23"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "7")
                        ],
                        correctAnswer: "13"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 9,
                        question: "Where was Nikola Jokić born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Belgrade, Serbia"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Zagreb, Croatia"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Sombor, Serbia"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Sofia, Bulgaria")
                        ],
                        correctAnswer: "Sombor, Serbia"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 9,
                        question: "In which NBA team does Nikola Jokić currently play?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles Lakers"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Golden State Warriors"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Toronto Raptors"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Denver Nuggets")
                        ],
                        correctAnswer: "Denver Nuggets"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 9,
                        question: "What is one of Nikola Jokić's standout skills on the basketball court?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Aerial prowess"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Three-point shooting"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Playmaking ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Shot-blocking")
                        ],
                        correctAnswer: "Playmaking ability"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 9,
                        question: "What prestigious award did Nikola Jokić win in 2021?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "NBA Defensive Player of the Year"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "NBA Finals MVP"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "NBA MVP"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "NBA Rookie of the Year")
                        ],
                        correctAnswer: "NBA MVP"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 9,
                        question: "What makes Nikola Jokić unique for a player in his position?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Dunking ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Playmaking ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Three-point shooting"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Speed and agility")
                        ],
                        correctAnswer: "Playmaking ability"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 9,
                        question: "Which city in Serbia is Nikola Jokić's hometown?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Sombor"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Novi Sad"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Belgrade"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Niš")
                        ],
                        correctAnswer: "Sombor"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 10,
                        question: "Where was Joel Embiid born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Yaoundé, Cameroon"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Lagos, Nigeria"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Nairobi, Kenya"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Accra, Ghana")
                        ],
                        correctAnswer: "Yaoundé, Cameroon"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 10,
                        question: "In which NBA team does Joel Embiid currently play?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles Lakers"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Boston Celtics"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Philadelphia 76ers"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Miami Heat")
                        ],
                        correctAnswer: "Philadelphia 76ers"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 10,
                        question: "What are some of Joel Embiid's standout skills on the basketball court?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Exceptional three-point shooting"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Dunking ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Elite defensive and offensive skills"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Fast-break scoring")
                        ],
                        correctAnswer: "Elite defensive and offensive skills"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 10,
                        question: "What position does Joel Embiid play in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Small forward"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Power forward"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Shooting guard"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Center")
                        ],
                        correctAnswer: "Center"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 10,
                        question: "Key achievement highlighting Joel Embiid's NBA elite status",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "NBA Sixth Man of the Year"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Multiple NBA All-Star selections"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "NBA Finals MVP"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "NBA Rookie of the Year")
                        ],
                        correctAnswer: "Multiple NBA All-Star selections"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 10,
                        question: "Which country is Joel Embiid's birthplace?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Nigeria"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Cameroon"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Kenya"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Ghana")
                        ],
                        correctAnswer: "Cameroon"
                    ),
                ]
            ),
            clubs: SelectionModel.Data.SportData.Clubs(
                study: [
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 1,
                        title: "Philadelphia 76ers",
                        desc: "The Philadelphia 76ers, founded in 1946, are a storied basketball franchise based in Philadelphia, Pennsylvania. As a member of the Eastern Conference's Atlantic Division, the team boasts a rich history and passionate fanbase. The 76ers have been home to legendary players like Wilt Chamberlain, Julius Erving, and Allen Iverson. Known for their iconic red, white, and blue colors, the team plays its home games at the Wells Fargo Center. Over the years, the 76ers have clinched multiple NBA championships, solidifying their status as a powerhouse in the league. The organization continues to strive for success, embracing a legacy built on excellence and a commitment to bringing championships to the city of Philadelphia."
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 2,
                        title: "Cleveland Cavaliers",
                        desc: "Founded in 1970, the Cleveland Cavaliers are a prominent basketball franchise located in Cleveland, Ohio. Competing in the Central Division of the Eastern Conference, the team has a vibrant history marked by both challenges and triumphs. Recognizable by their wine and gold colors, the Cavaliers play home games at the Rocket Mortgage FieldHouse. The franchise reached new heights with the arrival of LeBron James, who played a pivotal role in bringing the Cavaliers their first NBA championship in 2016. With a passionate fanbase and a commitment to success, the Cavaliers continue to strive for excellence in the ever-competitive NBA."
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 3,
                        title: "New York Knicks",
                        desc: "The New York Knicks, based in Manhattan, are a historic NBA team with a distinctive orange and blue color scheme. They play their home games at the iconic Madison Square Garden. One of the Knicks' legendary players is Patrick Ewing, known for his remarkable scoring abilities. Knicks fans, often referred to as Knicks Nation, are known for their passionate support. Despite a championship drought, the Knicks remain a symbol of basketball pride in New York."
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 4,
                        title: "Minnesota Timberwolves",
                        desc: "The Minnesota Timberwolves, based in Minneapolis, showcase team colors of blue, green, and silver. Their home games take place at the Target Center. Kevin Garnett, an iconic player, holds the record as the Timberwolves' all-time leading scorer. The team entered the NBA as an expansion franchise in 1989. Despite not securing an NBA championship to date, the Timberwolves remain a vital part of Minnesota's sports culture, with a dedicated fanbase supporting them through highs and lows."
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 5,
                        title: "Oklahoma City Thunder",
                        desc: "The Oklahoma City Thunder, based in Oklahoma City, proudly sport team colors of orange and blue. Their home games take place at the Chesapeake Energy Arena. Kevin Durant holds the record as the Thunder's all-time leading scorer. The team moved to Oklahoma City from Seattle in 2008. Despite not clinching an NBA championship, the Thunder has become a significant part of Oklahoma's sports scene, garnering support from a passionate fanbase."
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 6,
                        title: "Phoenix Suns",
                        desc: "The Phoenix Suns, based in the heart of Arizona in Phoenix, don the vibrant colors of purple and orange. Their home court is the Footprint Center, where fans passionately support the team. Walter Davis holds the distinction of being the Suns' all-time leading scorer, leaving an indelible mark on the franchise's history. The Suns joined the NBA in 1970 as an expansion team, quickly becoming a prominent force in the league. Despite not securing an NBA championship, the Suns' legacy is characterized by memorable moments and the contributions of iconic players like Steve Nash and Amar'e Stoudemire. The team continues to captivate fans with their exciting style of play and aspirations for future success."
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 7,
                        title: "Los Angeles Clippers",
                        desc: "The Los Angeles Clippers, based in the vibrant city of Los Angeles, proudly wear the colors of red, white, and blue. Their home games light up the Staples Center, creating an electric atmosphere for fans. Randy Smith holds the distinction of being the Clippers' all-time leading scorer, contributing to the team's history. The Clippers made the move from San Diego to Los Angeles in 1984, solidifying their presence in the City of Angels. While they haven't secured an NBA championship to date, the Clippers remain a competitive force in the league, showcasing talents like Chris Paul and Blake Griffin. The team's journey continues, with fans eagerly anticipating future triumphs."
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 8,
                        title: "Milwaukee Bucks",
                        desc: "Nestled along the shores of Lake Michigan, the Milwaukee Bucks radiate energy in their distinctive green and cream uniforms. The Fiserv Forum comes alive with cheers as Bucks fans passionately support their team. The dynamic Giannis Antetokounmpo stands as the Bucks' all-time leading scorer, showcasing unparalleled athleticism. The Bucks' journey to NBA prominence includes their founding in 1968, bringing excitement to Milwaukee's sports scene."
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 9,
                        title: "Denver Nuggets",
                        desc: "Situated in the vibrant city of Denver, the Denver Nuggets radiate energy in their striking team colors of sky blue and yellow. The Ball Arena is where the Nuggets showcase their skills, attracting cheers from passionate fans. The legendary Alex English stands as the all-time leading scorer, leaving an indelible mark on the franchise's history. The Nuggets entered the NBA as an expansion team in 1976, quickly becoming a force to be reckoned with. Despite not securing an NBA championship, the Nuggets continue to captivate fans with their dynamic style of play and a roster featuring stars like Nikola Jokic. The future holds promise as the Nuggets aim to carve their place in NBA history."
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 10,
                        title: "Boston Celtics",
                        desc: "The iconic Boston Celtics call the historic city of Boston home, representing their legacy in green, white, and gold. TD Garden serves as the battleground for their intense matchups. John Havlicek holds the distinction of being the Celtics' all-time leading scorer, contributing to the team's rich history. The Celtics secured their first NBA championship in 1957, marking the beginning of a storied franchise. With a total of 17 NBA championships, the Celtics boast an unparalleled record, fueled by legends like Larry Bird and Bill Russell. The pursuit of excellence continues as the Celtics aim to add more titles to their illustrious collection."
                    ),
                ],
                test: [
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 1,
                        question: "When were the Philadelphia 76ers founded?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1956"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1967"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1975"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1982")
                        ],
                        correctAnswer: "1967"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 1,
                        question: "In which conference and division do the Philadelphia 76ers compete?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Western Conference - Southwest Division"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Eastern Conference - Atlantic Division"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Western Conference - Pacific Division"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Eastern Conference - Central Division")
                        ],
                        correctAnswer: "Eastern Conference - Atlantic Division"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 1,
                        question: "Iconic Philadelphia 76ers player",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Kobe Bryant"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Larry Bird"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Allen Iverson"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Tim Duncan")
                        ],
                        correctAnswer: "Allen Iverson"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 1,
                        question: "What are the team colors of the Philadelphia 76ers?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and gold"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red, white, and blue"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Green and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Black and silver")
                        ],
                        correctAnswer: "Red, white, and blue"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 1,
                        question: "Where do the Philadelphia 76ers play their home games?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Madison Square Garden"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Staples Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "TD Garden"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Wells Fargo Center")
                        ],
                        correctAnswer: "Wells Fargo Center"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 1,
                        question: "How many NBA championships have the Philadelphia 76ers won?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Three"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Four"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Five")
                        ],
                        correctAnswer: "Two"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 2,
                        question: "When were the Cleveland Cavaliers founded?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1967"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1970"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1985"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1992")
                        ],
                        correctAnswer: "1970"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 2,
                        question: "In which conference and division do the Cleveland Cavaliers compete?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Western Conference - Northwest Division"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Eastern Conference - Atlantic Division"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Eastern Conference - Central Division"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Western Conference - Pacific Division")
                        ],
                        correctAnswer: "Eastern Conference - Central Division"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 2,
                        question: "What are the team colors of the Cleveland Cavaliers?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red and black"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Green and yellow"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Wine and gold")
                        ],
                        correctAnswer: "Wine and gold"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 2,
                        question: "Where do the Cleveland Cavaliers play their home games?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Madison Square Garden"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Rocket Mortgage FieldHouse"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Staples Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "TD Garden")
                        ],
                        correctAnswer: "Rocket Mortgage FieldHouse"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 2,
                        question: "Key player in Cavs' 2016 championship",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Kyrie Irving"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "LeBron James"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Kevin Love"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "J.R. Smith")
                        ],
                        correctAnswer: "LeBron James"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 2,
                        question: "How many NBA championships have the Cleveland Cavaliers won?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "One"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "None"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Three")
                        ],
                        correctAnswer: "One"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 3,
                        question: "In which city are the New York Knicks based?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Brooklyn"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Manhattan"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Queens"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Bronx")
                        ],
                        correctAnswer: "Manhattan"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 3,
                        question: "What are the team colors of the New York Knicks?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Orange and blue"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red and black"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Green and gold")
                        ],
                        correctAnswer: "Orange and blue"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 3,
                        question: "Where do the New York Knicks play their home games?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Barclays Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Madison Square Garden"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Staples Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "TD Garden")
                        ],
                        correctAnswer: "Madison Square Garden"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 3,
                        question: "Who is considered an iconic Knicks player known for his scoring prowess?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Charles Oakley"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Amar'e Stoudemire"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Walt Frazier"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Patrick Ewing")
                        ],
                        correctAnswer: "Patrick Ewing"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 3,
                        question: "What is the nickname for passionate New York Knicks fans?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Orange Crew"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue Brigade"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Knicks Nation"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Gotham Guard")
                        ],
                        correctAnswer: "Knicks Nation"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 3,
                        question: "How many NBA championships have the New York Knicks won?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "One"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "None"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Three")
                        ],
                        correctAnswer: "Two"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 4,
                        question: "Where are the Minnesota Timberwolves based?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Minneapolis"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "St. Paul"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Duluth"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Rochester")
                        ],
                        correctAnswer: "Minneapolis"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 4,
                        question: "What are the team colors of the Minnesota Timberwolves?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Green and gold"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and green"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue, green, and silver")
                        ],
                        correctAnswer: "Blue, green, and silver"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 4,
                        question: "Where do the Minnesota Timberwolves play their home games?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Target Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "U.S. Bank Stadium"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Xcel Energy Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Metrodome")
                        ],
                        correctAnswer: "Target Center"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 4,
                        question: "Who is the all-time leading scorer for the Minnesota Timberwolves?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Karl-Anthony Towns"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Kevin Garnett"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Andrew Wiggins"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Ricky Rubio")
                        ],
                        correctAnswer: "Kevin Garnett"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 4,
                        question: "Which year did the Minnesota Timberwolves join the NBA as an expansion team?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1985"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1989"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1991"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1989")
                        ],
                        correctAnswer: "1989"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 4,
                        question: "How many NBA championships have the Minnesota Timberwolves won?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "One"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "None"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Three")
                        ],
                        correctAnswer: "None"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 5,
                        question: "Where are the Oklahoma City Thunder based?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Tulsa"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Norman"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Oklahoma City"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Edmond")
                        ],
                        correctAnswer: "Oklahoma City"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 5,
                        question: "What are the team colors of the Oklahoma City Thunder?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and gold"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Orange and blue"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Green and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red and black")
                        ],
                        correctAnswer: "Orange and blue"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 5,
                        question: "Where do the Oklahoma City Thunder play their home games?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Chesapeake Energy Arena"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "BOK Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Paycom Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Ford Center")
                        ],
                        correctAnswer: "Chesapeake Energy Arena"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 5,
                        question: "Who is the all-time leading scorer for the Oklahoma City Thunder?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "James Harden"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Serge Ibaka"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Russell Westbrook"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Kevin Durant")
                        ],
                        correctAnswer: "Kevin Durant"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 5,
                        question: "Which year did the Oklahoma City Thunder relocate to Oklahoma City from Seattle?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "2005"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "2007"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "2008"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "2010")
                        ],
                        correctAnswer: "2008"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 5,
                        question: "How many NBA championships have the Oklahoma City Thunder won?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "One"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "None"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Three")
                        ],
                        correctAnswer: "None"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 6,
                        question: "Where are the Phoenix Suns based?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Scottsdale"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Mesa"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Phoenix"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Tempe")
                        ],
                        correctAnswer: "Phoenix"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 6,
                        question: "What are the team colors of the Phoenix Suns?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Purple and orange"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and silver"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Green and black")
                        ],
                        correctAnswer: "Purple and orange"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 6,
                        question: "Where do the Phoenix Suns play their home games?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Talking Stick Resort Arena"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Footprint Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "US Airways Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Chase Field")
                        ],
                        correctAnswer: "Footprint Center"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 6,
                        question: "Who is the all-time leading scorer for the Phoenix Suns?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Charles Barkley"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Steve Nash"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Amar'e Stoudemire"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Walter Davis")
                        ],
                        correctAnswer: "Walter Davis"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 6,
                        question: "Which year did the Phoenix Suns join the NBA as an expansion team?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1968"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1970"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1975"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1980")
                        ],
                        correctAnswer: "1970"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 6,
                        question: "How many NBA championships have the Phoenix Suns won?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "One"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "None"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Three")
                        ],
                        correctAnswer: "None"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 7,
                        question: "Where are the Los Angeles Clippers based?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Anaheim"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Inglewood"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Los Angeles"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Burbank")
                        ],
                        correctAnswer: "Los Angeles"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 7,
                        question: "What are the team colors of the Los Angeles Clippers?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and gold"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Black and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red, white, and blue")
                        ],
                        correctAnswer: "Red, white, and blue"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 7,
                        question: "Where do the Los Angeles Clippers play their home games?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Staples Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The Forum"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Crypto m Arena"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Honda Center")
                        ],
                        correctAnswer: "Staples Center"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 7,
                        question: "Who is the all-time leading scorer for the Los Angeles Clippers?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Chris Paul"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blake Griffin"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Bob McAdoo"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Randy Smith")
                        ],
                        correctAnswer: "Randy Smith"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 7,
                        question: "Which year did the Los Angeles Clippers move to Los Angeles from San Diego?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1978"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1982"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1984"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1990")
                        ],
                        correctAnswer: "1984"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 7,
                        question: "How many NBA championships have the Los Angeles Clippers won?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "One"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "None"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Three")
                        ],
                        correctAnswer: "None"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 8,
                        question: "What body of water is located near Milwaukee, where the Bucks play?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Lake Superior"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Lake Erie"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Lake Michigan"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Lake Ontario")
                        ],
                        correctAnswer: "Lake Michigan"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 8,
                        question: "What are the team colors of the Milwaukee Bucks?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Green and cream"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and gold"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Black and white")
                        ],
                        correctAnswer: "Green and cream"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 8,
                        question: "Where do the Milwaukee Bucks play their home games?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Bradley Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Miller Park"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Lambeau Field"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Fiserv Forum")
                        ],
                        correctAnswer: "Fiserv Forum"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 8,
                        question: "Nickname for the dynamic Milwaukee Bucks player",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Khris Middleton"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Jrue Holiday"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Giannis Antetokounmpo"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Brook Lopez")
                        ],
                        correctAnswer: "Giannis Antetokounmpo"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 8,
                        question: "When were the Milwaukee Bucks founded?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1955"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1968"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1973"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1980")
                        ],
                        correctAnswer: "1968"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 8,
                        question: "How many NBA championships have the Milwaukee Bucks won?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Three"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "None"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "One")
                        ],
                        correctAnswer: "One"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 9,
                        question: "Where are the Denver Nuggets based?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Boulder"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Aurora"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Denver"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Colorado Springs")
                        ],
                        correctAnswer: "Denver"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 9,
                        question: "What are the team colors of the Denver Nuggets?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and gold"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Navy and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Sky blue and yellow"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Purple and silver")
                        ],
                        correctAnswer: "Sky blue and yellow"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 9,
                        question: "Where do the Denver Nuggets play their home games?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Pepsi Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Coors Field"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Coors Field"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Ball Arena")
                        ],
                        correctAnswer: "Ball Arena"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 9,
                        question: "Who is the all-time leading scorer for the Denver Nuggets?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Alex English"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Carmelo Anthony"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Dan Issel"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Nikola Jokic")
                        ],
                        correctAnswer: "Alex English"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 9,
                        question: "In which year did the Denver Nuggets join the NBA as an expansion team?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1967"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1972"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1976"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1980")
                        ],
                        correctAnswer: "1976"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 9,
                        question: "How many NBA championships have the Denver Nuggets won?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "None"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "One"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Two"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Three")
                        ],
                        correctAnswer: "None"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 10,
                        question: "Where are the Boston Celtics based?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Cambridge"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Quincy"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Boston"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Worcester")
                        ],
                        correctAnswer: "Boston"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 10,
                        question: "What are the team colors of the Boston Celtics?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue, white, and silver"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Green, white, and gold"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red, black, and gold"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Yellow and blue")
                        ],
                        correctAnswer: "Green, white, and gold"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 10,
                        question: "Where do the Boston Celtics play their home games?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Fenway Park"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "TD Garden"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Gillette Stadium"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Agganis Arena")
                        ],
                        correctAnswer: "TD Garden"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 10,
                        question: "Who is the all-time leading scorer for the Boston Celtics?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Larry Bird"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Paul Pierce"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "John Havlicek"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Bill Russell")
                        ],
                        correctAnswer: "John Havlicek"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 10,
                        question: "In which year did the Boston Celtics win their first NBA championship?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1957"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1947"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1962"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1970")
                        ],
                        correctAnswer: "1957"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 10,
                        question: "How many NBA championships have the Boston Celtics won?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "16"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "18"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "20"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "17")
                        ],
                        correctAnswer: "17"
                    ),
                ]
                
                
            ),
            rules: SelectionModel.Data.SportData.Rules(
                study: [
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 1,
                        title: "Rules",
                        desc: "In basketball, the shot clock is a vital component that adds pace and excitement to the game. The shot clock is a countdown timer, typically set to 24 seconds in professional basketball. It starts when a team gains possession of the ball. The team must attempt a field goal that hits the rim before the shot clock expires. If they fail to do so, it results in a shot clock violation, and the opposing team gains possession. The shot clock prevents teams from stalling and encourages fast-paced, dynamic gameplay. Understanding and managing the shot clock is crucial for teams to execute effective offensive strategies and avoid turnovers."
                    ),
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 2,
                        title: "Rules",
                        desc: "In basketball, the jump ball serves as the initial and recurring method to begin play or resolve possession disputes. This crucial aspect of the game occurs at the center circle, involving two opposing players leaping to gain control of the ball after a referee's toss. The jump ball establishes a fair start to each game, emphasizing athleticism and timing. Upon the referee's signal, players strategically position themselves, aiming to outmaneuver their opponent and secure possession for their team. Height, agility, and anticipation play pivotal roles in determining the victor of the jump ball. The team gaining possession gains a valuable offensive opportunity. Understanding the nuances of the jump ball is essential for players and spectators alike. It not only initiates the game but also occurs during jump-ball situations throughout the match, adding a dynamic element to the contest. The jump ball's significance lies in its ability to influence the flow of the game and set the tone for competitive play."
                    ),
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 3,
                        title: "Rules",
                        desc: "In basketball, the possession arrow is a vital rule that dictates which team is awarded possession of the ball during jump-ball situations. Unlike the jump ball, the possession arrow is a system used to alternate possessions between teams. When a jump-ball scenario arises, the team not awarded possession through the jump ball gains the next possession based on the possession arrow's direction. This rule promotes fairness by ensuring both teams have an equal opportunity to possess the ball throughout the game. The possession arrow is particularly relevant in situations such as held balls and alternating possessions after jump balls. Players, coaches, and referees must be keenly aware of the possession arrow's status to navigate game scenarios effectively. This rule adds an intriguing layer to basketball strategy, as teams strategically vie for possession through various in-game situations governed by the possession arrow. Understanding and utilizing this rule contribute to a team's overall game management."
                    ),
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 4,
                        title: "Rules",
                        desc: """
                        In basketball, the three-second violation is a crucial rule designed to regulate players' time spent in the key area, also known as the paint or the keyhole. The key area extends from the baseline to the free-throw line, with its width defined by the width of the free-throw lane. The violation occurs when an offensive player remains in the key for more than three seconds continuously.
            The primary purpose of this rule is to prevent offensive players from camping in the key, creating an unfair advantage. To avoid a violation, offensive players must either shoot the ball or exit the key within the three-second timeframe. The three-second violation results in a turnover, awarding the opposing team possession of the ball. Understanding and adhering to the three-second rule is essential for offensive players to maintain fair and dynamic gameplay. This rule adds an element of strategy and quick decision-making to offensive plays near the basket.
"""
                    ),
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 5,
                        title: "Rules",
                        desc: "In basketball, the backcourt violation is a fundamental rule governing the movement of the ball across the court. This violation occurs when an offensive team fails to bring the ball from the backcourt to the frontcourt within the allotted time. Once a team establishes possession in the frontcourt, they must avoid passing or dribbling the ball back into the backcourt. The backcourt violation emphasizes strategic ball movement, ensuring fair play and dynamic gameplay. Teams must employ effective passing and coordination to navigate the court while adhering to the rule. A violation results in the loss of possession, with the opposing team gaining the ball. Understanding the backcourt violation is crucial for both offensive and defensive strategies. Offensive players aim to maintain possession, while defensive players strategically press to force violations. This rule adds an intriguing layer to the game, requiring teams to balance aggression with precision in their court movements."
                    ),
                ],
                test: [
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "What is the purpose of the shot clock in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To determine the winner of the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To keep track of fouls"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To add excitement to the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To prevent teams from stalling and encourage fast-paced gameplay (Correct)"
                                                                                )
                        ],
                        correctAnswer: "To prevent teams from stalling and encourage fast-paced gameplay"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "How long is the shot clock typically set in professional basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "12 seconds"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "30 seconds"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "24 seconds (Correct)"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "15 seconds")
                        ],
                        correctAnswer: "24 seconds"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "When does the shot clock start in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "At the beginning of the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "After a team scores"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When a team gains possession of the ball (Correct)"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "During a timeout")
                        ],
                        correctAnswer: "When a team gains possession of the ball"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "What happens if a team fails to attempt a field goal before the shot clock expires?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They get extra time"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They lose a point"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They face a shot clock violation, and the opposing team gains possession (Correct)"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They get a free throw"
                                                                                )
                        ],
                        correctAnswer: "They face a shot clock violation, and the opposing team gains possession"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "How does the shot clock impact offensive strategies?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It encourages teams to stall"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It discourages fast-paced gameplay"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It has no impact on strategies"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It requires teams to execute effective offensive strategies within a limited time"),
                        ],
                        correctAnswer: "It requires teams to execute effective offensive strategies within a limited time"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "Can the shot clock be reset during a possession?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "No, it always continues counting down"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Yes, if the team calls a timeout"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only if the opposing team commits a foul"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Yes, if the team secures an offensive rebound"),
                        ],
                        correctAnswer: "Yes, if the team secures an offensive rebound"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "What is the primary purpose of the jump ball in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To award free throws"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To determine the winner of the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To begin play"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To signal the end of a quarter"),
                        ],
                        correctAnswer: "To begin play"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "Where does the jump ball typically take place on the basketball court?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Near the three-point line"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Along the baseline"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "At the center circle"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "In the key area"),
                        ],
                        correctAnswer: "At the center circle"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "How do players gain possession during a jump ball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By making a three-point shot"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By outmaneuvering their opponent"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By calling a timeout"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By receiving a pass from the referee"),
                        ],
                        correctAnswer: "By outmaneuvering their opponent"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "What factors are crucial in determining the victor of a jump ball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Team colors and uniforms"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Height, agility, and anticipation"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The referee's preferences"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Previous game performance"),
                        ],
                        correctAnswer: "Height, agility, and anticipation"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "When does the jump ball occur throughout the game?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only at the beginning"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only after a team scores"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only during timeouts"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Throughout the match, including jump-ball situations"),
                        ],
                        correctAnswer: "Throughout the match, including jump-ball situations"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "Why is understanding the nuances of the jump ball essential for players and spectators?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It determines the MVP of the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It has no impact on the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Аdds dynamism to the game's jump-ball situations"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It signals the end of the match"),
                        ],
                        correctAnswer: "Аdds dynamism to the game's jump-ball situations"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "What is the purpose of the possession arrow in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To determine the game's winner"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To award free throws"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To alternate possessions between teams"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To signal the end of a quarter"),
                        ],
                        correctAnswer: "To alternate possessions between teams"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "When does the possession arrow come into play during a basketball game?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only during timeouts"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "During jump-ball situations and held balls"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only after a team scores"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only at the beginning of the game"),
                        ],
                        correctAnswer: "During jump-ball situations and held balls"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "How is possession determined when a jump ball occurs?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Through a coin toss"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By the possession arrow"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By the team with the tallest player"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Through a referee's decision"),
                        ],
                        correctAnswer: "By the possession arrow"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "Why is the possession arrow rule important for promoting fairness in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It prevents teams from scoring easily"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ensures equal possession opportunity"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It limits the number of timeouts a team can take"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It determines the shot clock duration"),
                        ],
                        correctAnswer: "Ensures equal possession opportunity"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "In what situations does the possession arrow rule come into play?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only during free throws"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only in the last two minutes of the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "During held balls and alternating possessions"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only during overtime periods"),
                        ],
                        correctAnswer: "During held balls and alternating possessions"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "How does the possession arrow contribute to basketball strategy?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It doesn't impact strategy"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Teams use it to decide who shoots free throws"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It determines the number of players on the court"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Teams vie for possession strategically"),
                        ],
                        correctAnswer: "Teams vie for possession strategically"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "What does the three-second violation rule regulate in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Player substitutions"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Time in the key area"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Dunk attempts"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Free-throw accuracy"),
                        ],
                        correctAnswer: "Time in the key area"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "Where does the three-second violation occur on the court?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Three-point line"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Half-court area"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Key area or paint"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Sideline"),
                        ],
                        correctAnswer: "Key area or paint"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "How is the width of the key area determined?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Free-throw lane width"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Three-point line width"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Half-court width"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Baseline width"),
                        ],
                        correctAnswer: "Free-throw lane width"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "When does a three-second violation happen?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Holding the ball too long"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Remaining in the key for over three seconds continuously"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Committing a foul"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Calling a timeout"),
                        ],
                        correctAnswer: "Remaining in the key for over three seconds continuously"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "What is the consequence of a three-second violation?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Awarding free throws to the offense"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Stopping play for a jump ball"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Allowing the offensive player to stay in the key"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Resulting in a turnover, with the opposing team gaining possession"),
                        ],
                        correctAnswer: "Resulting in a turnover, with the opposing team gaining possession"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "Why is understanding the three-second rule crucial for offensive players?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Determines the MVP of the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Adds strategy and quick decision-making to offensive plays"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "No impact on offensive gameplay"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Regulates player height on the court"),
                        ],
                        correctAnswer: "Adds strategy and quick decision-making to offensive plays"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "What is a backcourt violation in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Failing to score"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Not bringing the ball to the frontcourt in time"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A defensive foul"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Dunking from the backcourt"),
                        ],
                        correctAnswer: "Not bringing the ball to the frontcourt in time"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "When does a backcourt violation occur?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When the shot clock expires"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Failing to bring the ball from backcourt to frontcourt"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "After a successful free throw"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "During a timeout"),
                        ],
                        correctAnswer: "Failing to bring the ball from backcourt to frontcourt"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "What must a team avoid once possession is established in the frontcourt?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Playing defense"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Scoring too quickly"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Taking a timeout"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Passing or dribbling the ball back into the backcourt"),
                        ],
                        correctAnswer: "Passing or dribbling the ball back into the backcourt"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "What is the consequence of a backcourt violation?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Awarding free throws to the offense"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Stopping play for a jump ball"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Resulting in a turnover"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Allowing the offensive team to reset"),
                        ],
                        correctAnswer: "Resulting in a turnover"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "Why is understanding the backcourt violation crucial for teams?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Determines the game's MVP"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Adds an intriguing layer to the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "No impact on team strategy"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Regulates player substitutions"),
                        ],
                        correctAnswer: "Adds an intriguing layer to the game"
                    ),
                ]
            )
        ),
        
        
        mixed: SelectionModel.Data.SportData (
            players: SelectionModel.Data.SportData.Players(
                study: [
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 1,
                        title: "KEVIN DURANT",
                        desc: "Kevin Durant, born on September 29, 1988, is a highly skilled professional basketball player from the United States. Standing at 6 feet 10 inches tall, Durant is known for his remarkable scoring ability, versatility, and shooting prowess. He began his NBA career after being selected as the second overall pick by the Seattle SuperSonics (now known as the Oklahoma City Thunder) in the 2007 NBA Draft. Durant quickly established himself as one of the premier talents in the league, earning numerous accolades, including NBA Most Valuable Player (MVP) awards and NBA scoring titles. Throughout his career, Durant has played for several teams, including the Oklahoma City Thunder, the Golden State Warriors, and currently, the Brooklyn Nets. He is widely regarded as one of the greatest basketball players of his generation, with his unique combination of size, skill, and basketball IQ setting him apart on the court."
                    ),
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 2,
                        title: "ROBERT LEWANDOWSKI",
                        desc: "Robert Lewandowski is a prolific Polish footballer renowned for his exceptional goal-scoring prowess and versatility on the field. Born on August 21, 1988, in Warsaw, Lewandowski began his professional career with Znicz Pruszków before moving to top-flight Polish club Lech Poznań in 2008. His remarkable performances attracted the attention of Borussia Dortmund, where he enjoyed tremendous success, winning multiple Bundesliga titles and emerging as one of Europe's most feared strikers. In 2014, he joined Bayern Munich, further solidifying his status as one of the world's best players. Known for his clinical finishing, aerial ability, and intelligent positioning, Lewandowski has broken numerous records throughout his career, including the most goals scored in a Bundesliga season. He is also a key figure for the Polish national team, leading them with distinction in major international tournaments."
                    ),
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 3,
                        title: "MOHAMED SALAH",
                        desc: "Mohamed Salah, born on June 15, 1992, in Nagrig, Egypt, is a highly talented and widely recognized footballer known for his electrifying pace, agility, and goal-scoring prowess. He began his professional career in Egypt with El Mokawloon before moving to Europe to join Basel in 2012. His performances there earned him a move to the Premier League with Chelsea in 2014, though he found consistent playing time difficult to come by. However, he truly rose to prominence during his time with AS Roma, where his exceptional performances caught the attention of Liverpool. Since joining Liverpool in 2017, Salah has become a superstar, winning numerous individual awards and helping the club secure multiple trophies, including the Premier League and the UEFA Champions League. He is celebrated for his ability to dribble past defenders, his clinical finishing, and his contribution to Liverpool's attacking play. Additionally, Salah is a key figure for the Egyptian national team, leading them with distinction in international competitions."
                    ),
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 4,
                        title: "ATLETICO MADRID",
                        desc: "Club Atlético de Madrid, commonly referred to as Atlético Madrid, is a prestigious football club based in Madrid, Spain. Founded in 1903, Atlético has a rich history and is one of the most successful clubs in Spanish football. The team plays its home matches at the Wanda Metropolitano stadium, known for its vibrant atmosphere and passionate fanbase. Atlético Madrid has a fierce rivalry with Real Madrid, known as the Madrid Derby, which adds to the excitement of their matches. Throughout its history, Atlético Madrid has won numerous domestic and international titles, including La Liga, the Copa del Rey, the UEFA Europa League, and the UEFA Super Cup. The club has a tradition of producing talented players and has been home to some of the footballing world's biggest stars. Known for their defensive solidity, tactical discipline, and never-say-die attitude, Atlético Madrid is a force to be reckoned with in Spanish and European football."
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 5,
                        title: "LEBRON JAMES",
                        desc: "LeBron James is widely regarded as one of the greatest basketball players of all time. Born on December 30, 1984, in Akron, Ohio, James rose to fame during his high school basketball career at St. Vincent-St. Mary High School. He was selected first overall by the Cleveland Cavaliers in the 2003 NBA Draft and quickly became the face of the franchise. James has since played for the Miami Heat, winning two NBA championships, and the Cleveland Cavaliers, winning another championship in 2016. He currently plays for the Los Angeles Lakers. Known for his incredible athleticism, basketball IQ, and versatility, James has earned numerous MVP awards, All-Star selections, and All-NBA honors throughout his career. Off the court, he is also known for his philanthropy and activism."
                    ),
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 6,
                        title: "MICHAEL JORDAN",
                        desc: "Michael Jordan, often referred to by his initials MJ, is a retired professional basketball player and is widely regarded as the greatest basketball player of all time. Born on February 17, 1963, in Brooklyn, New York, Jordan played 15 seasons in the NBA, primarily for the Chicago Bulls. His illustrious career includes six NBA championships, five MVP awards, and numerous scoring titles. Jordan's impact on the game extends beyond his on-court accomplishments; he helped popularize basketball globally and became a cultural icon. His competitive drive, athleticism, and clutch performances in critical moments earned him the nickname 'His Airness.' Even after retirement, Jordan remains heavily involved in basketball as the owner of the Charlotte Hornets and continues to inspire generations of athletes around the world."
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 7,
                        title: "TORONTO RAPTORS",
                        desc: "The Toronto Raptors are a professional basketball team based in Toronto, Ontario, Canada. They are a member of the Atlantic Division of the Eastern Conference in the National Basketball Association (NBA). Established in 1995 as part of the NBA's expansion into Canada, the Raptors have become a prominent team in the league. They play their home games at the Scotiabank Arena, located in downtown Toronto. Known for their distinctive red, black, and white team colors, the Raptors have cultivated a passionate fan base known as 'Raptor fans' or 'Raptor Nation.' Over the years, the team has seen both highs and lows, but they reached the peak of success by winning their first NBA championship in 2019, defeating the Golden State Warriors in the NBA Finals. Their mascot, 'The Raptor,' is a beloved part of their game experience, entertaining fans with acrobatic stunts and engaging performances."
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 8,
                        title: "ANTHONY DAVIS",
                        desc: "Anthony Davis is a professional basketball player known for his versatility and dominant presence on both ends of the court. Born on March 11, 1993, in Chicago, Illinois, Davis played college basketball for the University of Kentucky before being selected as the first overall pick in the 2012 NBA Draft by the New Orleans Hornets (now the New Orleans Pelicans). Standing at 6 feet 10 inches tall with exceptional athleticism and skills, Davis quickly made an impact in the NBA. He is known for his shot-blocking ability, rebounding prowess, and scoring versatility, capable of scoring from inside the paint and knocking down mid-range jumpers. Davis has earned multiple NBA All-Star selections and has been named to the All-NBA First Team several times throughout his career. In 2019, Davis was traded to the Los Angeles Lakers, where he formed a formidable duo with LeBron James. He played a pivotal role in helping the Lakers win the NBA championship in 2020, showcasing his defensive prowess and offensive versatility."
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 9,
                        title: "Harry Kane",
                        desc: "Harry Kane, born on July 28, 1993, is an English professional footballer widely regarded as one of the top strikers globally. He currently plays for Tottenham Hotspur in the English Premier League and the England national team. Known for his clinical finishing, intelligent movement, and exceptional aerial ability, Kane has consistently been among the league's top scorers season after season. He joined Tottenham's youth academy at a young age and rose through the ranks to become the club's star striker. Kane has won several individual awards, including the Premier League Golden Boot multiple times, highlighting his prowess in front of goal. Additionally, he played a crucial role in leading the England national team to the final of the UEFA European Championship in 2021, showcasing his talent on the international stage."
                    ),
                    SelectionModel.Data.SportData.Players.PlayerStudy(
                        id: 10,
                        title: "Chelsea",
                        desc: "Chelsea Football Club, founded in 1905, is a professional football team based in London, England. They compete in the Premier League, one of the top football leagues globally. Known as 'The Blues,' Chelsea has a rich history of success, winning multiple domestic and international trophies, including six league titles and the UEFA Champions League. The club's home ground is Stamford Bridge, a stadium with a capacity of over 40,000 spectators. Chelsea has a passionate fan base and a reputation for signing top-tier players from around the world. With a strong emphasis on youth development and a tradition of attacking football, Chelsea is a prominent force in English and European football."
                    )
                    
                ],
                test: [
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 1,
                        question: "Which of the following basketball players is known for his remarkable scoring ability, versatility, and shooting prowess?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "LeBron James"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Stephen Curry"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Giannis Antetokounmpo"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Kevin Durant")
                        ],
                        correctAnswer: "Kevin Durant"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 1,
                        question: "When was Kevin Durant born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "September 29, 1988"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "October 30, 1985"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "July 7, 1990"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "August 8, 1992")
                        ],
                        correctAnswer: "September 29, 1988"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 1,
                        question: "Which NBA team drafted Kevin Durant in the 2007 NBA Draft?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles Lakers"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Golden State Warriors"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Oklahoma City Thunder"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Miami Heat")
                        ],
                        correctAnswer: "Oklahoma City Thunder"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 1,
                        question: "Which of the following footballers is known for his incredible dribbling skills, precise finishing, and vision on the field?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Cristiano Ronaldo"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Mohamed Salah"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Lionel Messi"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Neymar Jr.")
                        ],
                        correctAnswer: "Lionel Messi"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 1,
                        question: "When was Lionel Messi born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "June 24, 1987"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "July 7, 1990"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "May 5, 1988"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "August 8, 1992")
                        ],
                        correctAnswer: "June 24, 1987"
                    ),
                    
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 1,
                        question: "Which football club is Lionel Messi currently playing for?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Real Madrid"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Manchester City"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Paris Saint-Germain"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "FC Barcelona")
                        ],
                        correctAnswer: "Paris Saint-Germain"
                    ),
                    
                    
                    
                    
                ]
            ),
            clubs: SelectionModel.Data.SportData.Clubs(
                study: [
                    SelectionModel.Data.SportData.Clubs.ClubStudy(
                        id: 1,
                        title: "LIONEL MESSI",
                        desc: "Lionel Messi has played for FC Barcelona and Paris Saint-Germain (PSG). During his time with Barcelona, Messi achieved numerous successes, including multiple UEFA Champions League and La Liga titles. In 2021, he joined PSG, continuing to showcase his exceptional talent at the highest level of the sport."
                    )
                ],
                test: [
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 1,
                        question: "In which club did Lionel Messi play before joining Paris Saint-Germain (PSG)?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Real Madrid"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "FC Barcelona"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Manchester United"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Juventus")
                        ],
                        correctAnswer: "FC Barcelona"
                    )
                ]
            ),
            rules: SelectionModel.Data.SportData.Rules(
                study: [
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 1,
                        title: "LIONEL MESSI",
                        desc: "Lionel Messi has consistently demonstrated adherence to fair play and sportsmanship throughout his career. Despite facing tough opponents and intense competition, Messi is known for his humility on and off the field. He has set a positive example for aspiring footballers worldwide."
                    )
                ],
                test: [
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "What is Lionel Messi known for besides his football skills?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Scoring the most goals in a single season"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Winning multiple FIFA World Player of the Year awards"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Demonstrating fair play and sportsmanship"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Being the tallest player in his team")
                        ],
                        correctAnswer: "Demonstrating fair play and sportsmanship"
                    )
                ]
            )
        )
    )
    
}
