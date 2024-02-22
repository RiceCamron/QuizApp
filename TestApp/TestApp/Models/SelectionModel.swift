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
    
//    static func getSelectStudy(selectedSport: String, selectedCategory: String, selectedStudyTest: String) -> [StudyData] {
//        if selectedSport == "FOOTBALL" {
//            if selectedCategory == "PLAYERS" {
//                if selectedStudyTest == "STUDY" {
//                    return convertToStudyData(from: SelectionModel.data.football.players.study)
//                } else {}
//            }
//        } else if selectedCategory == "CLUBS" {
//            if selectedStudyTest == "STUDY" {
//                return convertToStudyData(from: SelectionModel.data.football.clubs.study)
//            }  else {}
//        } else if selectedCategory == "RULES" {
//            if selectedStudyTest == "STUDY" {
//                return convertToStudyData(from: SelectionModel.data.football.rules.study)
//            }  else {}
//            
//        } else if selectedSport == "BASKETBALL" {
//            if selectedCategory == "PLAYERS" {
//                if selectedStudyTest == "STUDY" {
//                    return convertToStudyData(from: SelectionModel.data.basketball.players.study)
//                }  else {}
//            } else if selectedCategory == "CLUBS" {
//                if selectedStudyTest == "STUDY" {
//                    return convertToStudyData(from: SelectionModel.data.basketball.clubs.study)
//                }  else {}
//            } else if selectedCategory == "RULES" {
//                if selectedStudyTest == "STUDY" {
//                    return convertToStudyData(from: SelectionModel.data.basketball.rules.study)
//                }  else {}
//            }
//        } else if selectedSport == "MIXED" {
//            if selectedCategory == "PLAYERS" {
//                if selectedStudyTest == "STUDY" {
//                    return convertToStudyData(from: SelectionModel.data.mixed.players.study)
//                }  else {}
//            } else if selectedCategory == "CLUBS" {
//                if selectedStudyTest == "STUDY" {
//                    return convertToStudyData(from: SelectionModel.data.mixed.clubs.study)
//                }  else {}
//            } else if selectedCategory == "RULES" {
//                if selectedStudyTest == "STUDY" {
//                    return convertToStudyData(from: SelectionModel.data.mixed.rules.study)
//                }  else {}
//            }
//        }
//        return []
//    }
    static func getSelectStudy(selectedSport: String, selectedCategory: String, selectedStudyTest: String) -> [StudyData] {
        var selectedData: [StudyData] = []

        switch selectedSport {
        case "FOOTBALL":
            switch selectedCategory {
            case "PLAYERS":
                selectedData = (selectedStudyTest == "STUDY") ? convertToStudyData(from: SelectionModel.data.football.players.study) : []
            case "CLUBS":
                selectedData = (selectedStudyTest == "STUDY") ? convertToStudyData(from: SelectionModel.data.football.clubs.study) : []
            case "RULES":
                selectedData = (selectedStudyTest == "STUDY") ? convertToStudyData(from: SelectionModel.data.football.rules.study) : []
            default:
                break
            }
        case "BASKETBALL":
            switch selectedCategory {
            case "PLAYERS":
                selectedData = (selectedStudyTest == "STUDY") ? convertToStudyData(from: SelectionModel.data.basketball.players.study) : []
            case "CLUBS":
                selectedData = (selectedStudyTest == "STUDY") ? convertToStudyData(from: SelectionModel.data.basketball.clubs.study) : []
            case "RULES":
                selectedData = (selectedStudyTest == "STUDY") ? convertToStudyData(from: SelectionModel.data.basketball.rules.study) : []
            default:
                break
            }
        case "MIXED":
            switch selectedCategory {
            case "PLAYERS":
                selectedData = (selectedStudyTest == "STUDY") ? convertToStudyData(from: SelectionModel.data.mixed.players.study) : []
            case "CLUBS":
                selectedData = (selectedStudyTest == "STUDY") ? convertToStudyData(from: SelectionModel.data.mixed.clubs.study) : []
            case "RULES":
                selectedData = (selectedStudyTest == "STUDY") ? convertToStudyData(from: SelectionModel.data.mixed.rules.study) : []
            default:
                break
            }
        default:
            break
        }

        return selectedData
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
                            title: "Offside Rule in Football",
                            desc: "The offside rule is a fundamental aspect of football, designed to ensure fair play and maintain the integrity of the game. A player is considered offside if they are nearer to the opponent's goal line than both the ball and the second-to-last defender when the ball is played to them. Exceptions include being in their own half, level with the second-to-last defender, or level with the last two defenders. Understanding and applying the offside rule is crucial for players, coaches, and fans, shaping the dynamics of goal-scoring opportunities and strategic gameplay."
                        ),
                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 2,
                            title: "Fouls and Free Kicks in Football",
                            desc: "Fouls and free kicks are integral parts of football, ensuring a fair and safe playing environment. Players commit fouls through actions like tripping, pushing, or handling the ball with hands. When a foul occurs, the opposing team is awarded a free kick. This rule governs player conduct, promoting sportsmanship and strategic gameplay. Understanding the nuances of fouls and free kicks is essential for players to navigate the game effectively and for referees to enforce fair competition."
                        ),
                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 3,
                            title: "Handball Violation in Football",
                            desc: "Handball violations occur in football when a player intentionally handles the ball with their hand or arm. The rules define various situations, including gaining an unfair advantage or scoring a goal with the hand. Referees use video assistance to make accurate decisions in contentious handball situations. Understanding the handball rule is crucial for players, officials, and fans, as it influences match outcomes and contributes to the overall fairness of the game."
                        ),
                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 4,
                            title: "Penalty Kick Rule in Football",
                            desc: "The penalty kick is a significant rule in football, awarded when a defensive player commits a foul inside their penalty area. The fouled team is given a direct free shot from the penalty spot, 12 yards away from the goal. It's a one-on-one duel between the kicker and the goalkeeper. The penalty kick is a crucial moment that can change the course of a match, making it essential for players, coaches, and fans to understand the rules governing penalty kicks."
                        ),
                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 5,
                            title: "Yellow and Red Card System in Football",
                            desc: "The yellow and red card system is a disciplinary measure in football to control player behavior. A yellow card is a caution for a minor offense, while a red card signifies a serious offense, resulting in the player's ejection from the game. Accumulating yellow cards can lead to a red card. Understanding the card system is crucial for players to avoid suspensions and for referees to maintain order on the field, ensuring fair play and sportsmanship."
                        ),
                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 6,
                            title: "Goal Kick and Corner Kick Rules in Football",
                            desc: "Goal kicks and corner kicks are essential elements of football, influencing game dynamics. A goal kick is awarded to the defending team when the attacking team kicks the ball out over the goal line. It allows the defending team to restart play from their own goal area. Corner kicks occur when the defending team plays the ball out over their own goal line, giving the attacking team an opportunity to score. Understanding these kick rules is vital for players, coaches, and fans, contributing to strategic gameplay."
                        ),
                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 7,
                            title: "Throw-In Rule in Football",
                            desc: "The throw-in is a method of restarting play in football when the ball goes out of bounds over the touchline. The team that did not touch the ball last is awarded the throw-in. The player performing the throw-in must keep both feet on or behind the touchline and use both hands to deliver the ball back into play. Understanding the throw-in rule is essential for players to maintain possession and for referees to ensure fair play, adding an interesting aspect to the game."
                        ),
                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 8,
                            title: "Offensive and Defensive Strategies in Football",
                            desc: "Football teams employ various offensive and defensive strategies to gain a competitive edge. Offensive tactics include possession-based play, quick counter-attacks, and strategic positioning to create scoring opportunities. Defensively, teams focus on maintaining shape, pressing opponents, and preventing goal-scoring chances. Coaches develop and adjust these strategies based on the team's strengths and weaknesses. Understanding the intricacies of offensive and defensive tactics is crucial for players, coaches, and fans to appreciate the strategic depth of the game."
                        ),
                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 9,
                            title: "Extra Time and Penalty Shootouts in Football",
                            desc: "Extra time and penalty shootouts are mechanisms used to determine a winner in knockout football competitions. If a match ends in a draw, extra time is played, consisting of two 15-minute halves. If no winner emerges, the match proceeds to a penalty shootout, providing each team an equal chance to score from the penalty spot. Understanding the rules for extra time and penalty shootouts is crucial for players, coaches, and fans, as these moments often decide the outcome of important matches."
                        ),
                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 10,
                            title: "Advantage Rule in Football",
                            desc: "The advantage rule in football allows referees to let play continue when a team that has been fouled would benefit from maintaining possession. If the fouled team can capitalize on the advantage, the referee refrains from stopping play to award a free kick. Understanding the advantage rule is crucial for players and referees to ensure a fair and flowing game. Players must be aware of the referee's signals, and referees need to assess each situation to apply the advantage rule appropriately."
                        )
                    ],
                test: [
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "What is the purpose of the offside rule in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To slow down the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To ensure fair play and maintain the integrity of the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To favor attacking teams"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To confuse players")
                        ],
                        correctAnswer: "To ensure fair play and maintain the integrity of the game"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "When is a player considered offside in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When they are in their own half"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When they are level with the second-to-last defender"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When they are level with the last two defenders"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When they are nearer to the opponent's goal line than the ball and the second-to-last defender")
                        ],
                        correctAnswer: "When they are nearer to the opponent's goal line than the ball and the second-to-last defender"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "What are the exceptions to the offside rule?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Being level with the last two defenders"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Being level with the second-to-last defender"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Being in their own half"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Being level with the goalkeeper")
                        ],
                        correctAnswer: "Being in their own half"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "Who benefits from understanding and applying the offside rule?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only referees"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only attacking teams"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only coaches"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Players, coaches, and fans")
                        ],
                        correctAnswer: "Players, coaches, and fans"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "How does the offside rule impact goal-scoring opportunities?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It has no impact on goal-scoring opportunities"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It makes scoring easier"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It makes scoring more challenging"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It only affects goalkeepers")
                        ],
                        correctAnswer: "It makes scoring more challenging"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "Why is the offside rule crucial for the integrity of the game?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To favor defensive teams"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To make the game confusing"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To discourage goal-scoring"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To prevent unfair advantages and maintain fairness")
                        ],
                        correctAnswer: "To prevent unfair advantages and maintain fairness"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "What is the purpose of fouls and free kicks in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To slow down the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To discourage sportsmanship"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To ensure a fair and safe playing environment"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To favor one team over another")
                        ],
                        correctAnswer: "To ensure a fair and safe playing environment"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "How can a player commit a foul in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By scoring a goal"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By engaging in unfair or reckless play"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By running too fast"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By celebrating excessively")
                        ],
                        correctAnswer: "By engaging in unfair or reckless play"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "What happens when a foul occurs in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The fouling team is awarded a goal"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The fouled player is sent off the field"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The opposing team is awarded a free kick"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The game continues without any consequences")
                        ],
                        correctAnswer: "The opposing team is awarded a free kick"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "What governs player conduct in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Personal preferences"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The coach's instructions"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The weather conditions"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Rules related to fouls and free kicks")
                        ],
                        correctAnswer: "Rules related to fouls and free kicks"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "Why is understanding fouls and free kicks essential for players?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To discourage fair play"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To navigate the game effectively"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To provoke opponents"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To confuse the referees")
                        ],
                        correctAnswer: "To navigate the game effectively"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "What does the rule about fouls and free kicks promote in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Encouraging unsportsmanlike conduct"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Strategic gameplay and sportsmanship"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Discouraging any physical contact"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Favoring one team over another")
                        ],
                        correctAnswer: "Strategic gameplay and sportsmanship"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "When does a handball violation occur in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When a player intentionally handles the ball with their hand or arm"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When a player accidentally touches the ball"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When a player kicks the ball out of play"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When a player scores a goal")
                        ],
                        correctAnswer: "When a player intentionally handles the ball with their hand or arm"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "What situations does the handball rule in football define?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Situations involving offside"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Various situations involving fouls"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Situations involving gaining an unfair advantage or scoring a goal with the hand"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Situations involving player substitutions")
                        ],
                        correctAnswer: "Situations involving gaining an unfair advantage or scoring a goal with the hand"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "How do referees make decisions in contentious handball situations?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Randomly"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Based on players' opinions"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Without any assistance"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Using video assistance")
                        ],
                        correctAnswer: "Using video assistance"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "Why is understanding the handball rule essential for players, officials, and fans?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To encourage intentional handballs"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To confuse match outcomes"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To discourage fair play"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To influence match outcomes and contribute to the overall fairness of the game")
                        ],
                        correctAnswer: "To influence match outcomes and contribute to the overall fairness of the game"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "What role does the handball rule play in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Encouraging unfair advantages"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Creating confusion"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Influencing match outcomes and contributing to overall fairness"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Promoting intentional handballs")
                        ],
                        correctAnswer: "Influencing match outcomes and contributing to overall fairness"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "What assistance do referees use to make accurate decisions in handball situations?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Telepathy"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Magic spells"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Video assistance"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Coin toss")
                        ],
                        correctAnswer: "Video assistance"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "When is a penalty kick awarded in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When a defensive player commits a foul outside the penalty area"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When a defensive player commits a foul inside their penalty area"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When an offensive player commits a foul inside the penalty area"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Randomly")
                        ],
                        correctAnswer: "When a defensive player commits a foul inside their penalty area"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "From where is a penalty kick taken in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "From the center circle"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "From the goal line"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "From the corner flag"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "From the penalty spot, 12 yards away from the goal")
                        ],
                        correctAnswer: "From the penalty spot, 12 yards away from the goal"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "What type of shot does a team get from a penalty kick in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Indirect free shot"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Curling shot"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Volley shot"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Direct free shot")
                        ],
                        correctAnswer: "Direct free shot"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "How far is the penalty spot from the goal in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "6 yards"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "10 yards"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "15 yards"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "12 yards")
                        ],
                        correctAnswer: "12 yards"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "What is the significance of a penalty kick in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "No significance"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A ceremonial moment"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A moment to showcase skills"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A crucial moment that can change the course of a match")
                        ],
                        correctAnswer: "A crucial moment that can change the course of a match"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "Who participates in a penalty kick in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The entire team"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The goalkeeper only"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A one-on-one duel between the kicker and the goalkeeper"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "No one")
                        ],
                        correctAnswer: "A one-on-one duel between the kicker and the goalkeeper"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "What does a yellow card signify in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A serious offense"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A minor offense"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "No offense at all"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A goal scored")
                        ],
                        correctAnswer: "A minor offense"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "What happens when a player receives a red card in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They continue playing"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They receive a warning"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They are ejected from the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They get a penalty kick")
                        ],
                        correctAnswer: "They are ejected from the game"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "What can accumulating yellow cards lead to in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A trophy"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A suspension"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A substitution"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A penalty kick")
                        ],
                        correctAnswer: "A suspension"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "Why is understanding the yellow and red card system crucial for football players?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To accumulate more cards"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To intimidate opponents"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To avoid suspensions"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To receive more cards")
                        ],
                        correctAnswer: "To avoid suspensions"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "What does a red card signify in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A minor offense"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A warning"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A serious offense, resulting in the player's ejection"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A substitution")
                        ],
                        correctAnswer: "A serious offense, resulting in the player's ejection"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "What is the purpose of the yellow and red card system in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To award points"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To promote violence"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To control player behavior and maintain order"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To determine the winner")
                        ],
                        correctAnswer: "To control player behavior and maintain order"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "When is a goal kick awarded in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When a player scores a goal"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When the attacking team kicks the ball out over the goal line"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When the ball goes out over the sideline"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When a player commits a foul")
                        ],
                        correctAnswer: "When the attacking team kicks the ball out over the goal line"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "What does a goal kick allow the defending team to do?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Score a goal"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Substitute players"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Restart play from their own goal area"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Take a penalty kick")
                        ],
                        correctAnswer: "Restart play from their own goal area"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "When do corner kicks occur in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When the ball goes out over the sideline"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When a player scores a goal"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When the attacking team kicks the ball out over the goal line"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When the defending team plays the ball out over their own goal line")
                        ],
                        correctAnswer: "When the defending team plays the ball out over their own goal line"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "What opportunity does a corner kick provide to the attacking team?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To take a penalty kick"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To restart play from their own goal area"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To score a goal"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To make a substitution")
                        ],
                        correctAnswer: "To score a goal"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "Where is a goal kick taken in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "From the center of the field"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "From the sideline"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "From the attacking team's goal area"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "From the penalty spot")
                        ],
                        correctAnswer: "From the attacking team's goal area"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "What happens if the attacking team kicks the ball out over the goal line?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A penalty kick is awarded"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A goal kick is awarded to the attacking team"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A corner kick is awarded to the attacking team"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A free kick is awarded to the defending team")
                        ],
                        correctAnswer: "A goal kick is awarded to the attacking team"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "When is a throw-in awarded in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When a player scores a goal"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When the ball goes out of bounds over the goal line"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When the ball goes out of bounds over the touchline"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When a player commits a foul")
                        ],
                        correctAnswer: "When the ball goes out of bounds over the touchline"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "Which team is awarded a throw-in?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The team that touched the ball last"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The attacking team"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The defending team"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The team in possession of the ball")
                        ],
                        correctAnswer: "The team that touched the ball last"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "What must the player performing a throw-in do?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Dribble the ball"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Use only one hand to throw the ball"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Keep one foot on the field"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Keep both feet on or behind the touchline")
                        ],
                        correctAnswer: "Keep both feet on or behind the touchline"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "What action restarts play after a throw-in?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A free kick"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A corner kick"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A goal kick"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Throwing the ball back into play")
                        ],
                        correctAnswer: "Throwing the ball back into play"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "What part of the field does a throw-in take place?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "In the penalty area"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "On the sideline"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "In the center circle"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "In the goal area")
                        ],
                        correctAnswer: "On the sideline"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "What happens if a player fails to keep both feet on or behind the touchline during a throw-in?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A penalty kick is awarded"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The opposing team gets a throw-in"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The player is cautioned with a yellow card"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The throw-in is retaken by the same player")
                        ],
                        correctAnswer: "The throw-in is retaken by the same player"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "What are some offensive tactics in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Avoiding possession"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Slowing down the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Quick counter-attacks"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Staying static on the field")
                        ],
                        correctAnswer: "Quick counter-attacks"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "What is a defensive strategy in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Allowing opponents to score easily"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Avoiding pressing opponents"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Maintaining shape and pressing opponents"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Always focusing on attacking")
                        ],
                        correctAnswer: "Maintaining shape and pressing opponents"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "How do coaches develop strategies in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By ignoring the team's strengths and weaknesses"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By not adjusting strategies"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By maintaining the same tactics every game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Based on the team's strengths and weaknesses")
                        ],
                        correctAnswer: "Based on the team's strengths and weaknesses"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "Why is understanding offensive and defensive tactics crucial?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It has no impact on the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To appreciate the strategic depth of the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To slow down the pace of the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To focus solely on individual skills")
                        ],
                        correctAnswer: "To appreciate the strategic depth of the game"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "What role do offensive tactics play in creating scoring opportunities?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They don't contribute to scoring opportunities"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They slow down the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They focus on preventing goals"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They strategically position to create chances")
                        ],
                        correctAnswer: "They strategically position to create chances"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "What is the defensive focus in preventing goal-scoring chances?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Allowing opponents to score freely"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Avoiding maintaining shape"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Avoiding pressing opponents"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Maintaining shape and pressing opponents")
                        ],
                        correctAnswer: "Maintaining shape and pressing opponents"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "When is extra time played in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "At the beginning of every match"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "In every knockout competition"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "After a match ends in a draw"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Never")
                        ],
                        correctAnswer: "After a match ends in a draw"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "How long does each half of extra time last?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "10 minutes"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "15 minutes"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "20 minutes"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "30 minutes")
                        ],
                        correctAnswer: "15 minutes"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "What happens if a winner is not determined in extra time?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The match is abandoned"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Both teams lose"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The match proceeds to a penalty shootout"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The teams share the victory")
                        ],
                        correctAnswer: "The match proceeds to a penalty shootout"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "How is a winner determined in a penalty shootout?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Based on the number of fouls committed"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Through a coin toss"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By the team with the most possession"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The team with the most successful penalty kicks")
                        ],
                        correctAnswer: "The team with the most successful penalty kicks"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "Why are extra time and penalty shootouts crucial in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They never impact the match outcome"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They determine the winner in knockout competitions"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They prolong the match unnecessarily"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They are rarely used in football")
                        ],
                        correctAnswer: "They determine the winner in knockout competitions"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "How do penalty shootouts contribute to deciding the outcome of a match?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They are irrelevant in determining the winner"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By testing players' endurance"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Through determining the team with the most possession"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The team with the most successful penalty kicks wins")
                        ],
                        correctAnswer: "The team with the most successful penalty kicks wins"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "What is the advantage rule in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Always stop play for every foul"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Referees never apply the advantage rule"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Referees let play continue when a fouled team would benefit"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Teams can request the application of the advantage rule")
                        ],
                        correctAnswer: "Referees let play continue when a fouled team would benefit"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "When does the advantage rule come into play?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only in the last 10 minutes of a match"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "During injury time"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "At the referee's discretion during any phase of the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only during penalty situations")
                        ],
                        correctAnswer: "At the referee's discretion during any phase of the game"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "Why is understanding the advantage rule crucial for players?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To argue with referees"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To avoid playing under any circumstances"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To intentionally foul opponents"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To capitalize on opportunities and maintain possession")
                        ],
                        correctAnswer: "To capitalize on opportunities and maintain possession"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "How do referees signal the application of the advantage rule?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By stopping play immediately"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By showing a yellow card to the fouling player"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Through a hand gesture or verbal communication"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By awarding a penalty kick to the fouled team")
                        ],
                        correctAnswer: "Through a hand gesture or verbal communication"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "What happens if the fouled team cannot capitalize on the advantage?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The match is replayed"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The fouling team receives a reward"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The advantage is lost, and play is stopped for a free kick"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Referees award a penalty kick to the fouled team")
                        ],
                        correctAnswer: "The advantage is lost, and play is stopped for a free kick"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "Can players request the application of the advantage rule?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Yes, only captains can request"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "No, players cannot influence the application"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Yes, through a majority team vote"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "No, players can only request penalty kicks")
                        ],
                        correctAnswer: "No, players cannot influence the application"
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
                        title: "Shot Clock in Basketball: 24 Seconds of Pace and Precision",
                        desc: "In basketball, the shot clock is a vital component that adds pace and excitement to the game. The shot clock is a countdown timer, typically set to 24 seconds in professional basketball. It starts when a team gains possession of the ball. The team must attempt a field goal that hits the rim before the shot clock expires. If they fail to do so, it results in a shot clock violation, and the opposing team gains possession. The shot clock prevents teams from stalling and encourages fast-paced, dynamic gameplay. Understanding and managing the shot clock is crucial for teams to execute effective offensive strategies and avoid turnovers."
                    ),
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 2,
                        title: "Basketball's Jump Ball: Athleticism, Strategy, and Game-Defining Moments",
                        desc: "In basketball, the jump ball serves as the initial and recurring method to begin play or resolve possession disputes. This crucial aspect of the game occurs at the center circle, involving two opposing players leaping to gain control of the ball after a referee's toss. The jump ball establishes a fair start to each game, emphasizing athleticism and timing. Upon the referee's signal, players strategically position themselves, aiming to outmaneuver their opponent and secure possession for their team. Height, agility, and anticipation play pivotal roles in determining the victor of the jump ball. The team gaining possession gains a valuable offensive opportunity. Understanding the nuances of the jump ball is essential for players and spectators alike. It not only initiates the game but also occurs during jump-ball situations throughout the match, adding a dynamic element to the contest. The jump ball's significance lies in its ability to influence the flow of the game and set the tone for competitive play."
                    ),
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 3,
                        title: "Crucial Role of Possession Arrow in Basketball: Fair Play and Strategic Management",
                        desc: "In basketball, the possession arrow is a vital rule that dictates which team is awarded possession of the ball during jump-ball situations. Unlike the jump ball, the possession arrow is a system used to alternate possessions between teams. When a jump-ball scenario arises, the team not awarded possession through the jump ball gains the next possession based on the possession arrow's direction. This rule promotes fairness by ensuring both teams have an equal opportunity to possess the ball throughout the game. The possession arrow is particularly relevant in situations such as held balls and alternating possessions after jump balls. Players, coaches, and referees must be keenly aware of the possession arrow's status to navigate game scenarios effectively. This rule adds an intriguing layer to basketball strategy, as teams strategically vie for possession through various in-game situations governed by the possession arrow. Understanding and utilizing this rule contribute to a team's overall game management."
                    ),
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 4,
                        title: "Decoding the Three-Second Violation in Basketball: Balancing Offensive Strategy and Fair Play in the Key Area",
                        desc: """
                        In basketball, the three-second violation is a crucial rule designed to regulate players' time spent in the key area, also known as the paint or the keyhole. The key area extends from the baseline to the free-throw line, with its width defined by the width of the free-throw lane. The violation occurs when an offensive player remains in the key for more than three seconds continuously.
            The primary purpose of this rule is to prevent offensive players from camping in the key, creating an unfair advantage. To avoid a violation, offensive players must either shoot the ball or exit the key within the three-second timeframe. The three-second violation results in a turnover, awarding the opposing team possession of the ball. Understanding and adhering to the three-second rule is essential for offensive players to maintain fair and dynamic gameplay. This rule adds an element of strategy and quick decision-making to offensive plays near the basket.
"""
                    ),
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 5,
                        title: "Mastering Backcourt Violation: Key to Strategic Basketball Play",
                        desc: "In basketball, the backcourt violation is a fundamental rule governing the movement of the ball across the court. This violation occurs when an offensive team fails to bring the ball from the backcourt to the frontcourt within the allotted time. Once a team establishes possession in the frontcourt, they must avoid passing or dribbling the ball back into the backcourt. The backcourt violation emphasizes strategic ball movement, ensuring fair play and dynamic gameplay. Teams must employ effective passing and coordination to navigate the court while adhering to the rule. A violation results in the loss of possession, with the opposing team gaining the ball. Understanding the backcourt violation is crucial for both offensive and defensive strategies. Offensive players aim to maintain possession, while defensive players strategically press to force violations. This rule adds an intriguing layer to the game, requiring teams to balance aggression with precision in their court movements."
                    ),
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 6,
                        title: "24-Second Shot Clock in Basketball",
                        desc: "The 24-second shot clock is a fundamental rule in basketball, designed to add pace and excitement to the game. It begins when a team gains possession, and they must attempt a field goal that hits the rim before the shot clock expires. A shot clock violation results in the opposing team gaining possession. This rule prevents stalling and promotes fast-paced, dynamic gameplay. Teams strategically manage the shot clock to execute effective offensive strategies and avoid turnovers."
                    ),
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 7,
                        title: "Jump Ball Rule in Basketball",
                        desc: "The jump ball serves as the initial and recurring method to start play or resolve possession disputes in basketball. Taking place at the center circle, two opposing players leap to gain control after a referee's toss. The jump ball establishes a fair start, emphasizing athleticism and timing. Understanding the nuances of the jump ball is crucial for players and spectators, influencing the flow of the game and setting the tone for competitive play."
                    ),
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 8,
                        title: "Possession Arrow Rule in Basketball",
                        desc: "The possession arrow is a vital rule in basketball, dictating which team is awarded possession during jump-ball situations. Unlike the jump ball, the possession arrow alternates possessions between teams. Teams not awarded possession through the jump ball gain the next possession based on the possession arrow's direction. This rule ensures fairness, with both teams having an equal opportunity to possess the ball throughout the game. Understanding and utilizing the possession arrow contribute to effective game management."
                    ),
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 9,
                        title: "Three-Second Violation in Basketball",
                        desc: "The three-second violation is a crucial rule in basketball, regulating players' time in the key area. Offensive players are not allowed to remain in the key for more than three seconds continuously. This rule prevents camping in the key, ensuring fair and dynamic gameplay. Violation results in a turnover, awarding the opposing team possession. Offensive players must adhere to this rule, adding strategy and quick decision-making to plays near the basket."
                    ),
                    SelectionModel.Data.SportData.Rules.RulesStudy(
                        id: 10,
                        title: "Backcourt Violation in Basketball",
                        desc: "The backcourt violation is a fundamental rule in basketball governing ball movement across the court. Offensive teams must bring the ball from the backcourt to the frontcourt within the allotted time. Once possession is established in the frontcourt, passing or dribbling the ball back into the backcourt is prohibited. This rule emphasizes strategic ball movement, with violations resulting in the loss of possession. Teams balance aggression with precision to navigate the court effectively."
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
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "What emphasizes strategic ball movement in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Scoring quickly"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Dribbling the ball continuously"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Avoiding ball movement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Backcourt violation")
                        ],
                        correctAnswer: "Backcourt violation"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "What is the purpose of the 24-second shot clock in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To measure game duration"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To determine team possession"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To add pace and excitement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To regulate player substitutions")
                        ],
                        correctAnswer: "To add pace and excitement"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "When does the 24-second shot clock start in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "At the beginning of the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "After halftime"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When a team gains possession"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "After scoring a basket")
                        ],
                        correctAnswer: "When a team gains possession"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "What happens if a team fails to attempt a field goal before the 24-second shot clock expires?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They receive a warning"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "No consequences"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The opposing team gains possession"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They get extra time on the shot clock")
                        ],
                        correctAnswer: "The opposing team gains possession"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "How does the 24-second shot clock impact gameplay in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It encourages stalling"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It regulates player substitutions"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It adds pace and excitement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It determines game duration")
                        ],
                        correctAnswer: "It adds pace and excitement"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "Why do teams strategically manage the shot clock in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To minimize player rotations"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To encourage stalling"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To execute effective offensive strategies"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To determine team possession")
                        ],
                        correctAnswer: "To execute effective offensive strategies"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "What is the consequence of a shot clock violation in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Extra time is added"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The game ends"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The opposing team gains possession"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A warning is issued")
                        ],
                        correctAnswer: "The opposing team gains possession"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "What is the purpose of the jump ball in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To determine game duration"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To add pace and excitement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To establish a fair start and resolve possession disputes"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To regulate player substitutions")
                        ],
                        correctAnswer: "To establish a fair start and resolve possession disputes"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "Where does the jump ball take place in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "At the sideline"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "At the three-point line"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "At the center circle"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "At the free-throw line")
                        ],
                        correctAnswer: "At the center circle"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "How is possession determined during a jump ball in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By the height of the players involved"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By a coin toss"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By the team with the loudest fans"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By the team that wins the jump ball")
                        ],
                        correctAnswer: "By the team that wins the jump ball"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "What does the jump ball emphasize in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Aesthetic plays"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Aggressive defense"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Athleticism and timing"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Team huddles")
                        ],
                        correctAnswer: "Athleticism and timing"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "How does the understanding of the jump ball influence the game in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It has no impact on the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It determines the final score"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It influences the flow of the game and sets the tone for competitive play"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It regulates player substitutions")
                        ],
                        correctAnswer: "It influences the flow of the game and sets the tone for competitive play"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "What happens after the referee's toss in a jump ball situation?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The game ends"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Players perform a dance routine"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Players leap to gain control"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Players take a break")
                        ],
                        correctAnswer: "Players leap to gain control"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "What is the purpose of the possession arrow in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To add pace and excitement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To establish a fair start and resolve possession disputes"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To regulate player substitutions"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To dictate which team is awarded possession during jump-ball situations")
                        ],
                        correctAnswer: "To dictate which team is awarded possession during jump-ball situations"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "How does the possession arrow differ from the jump ball in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It has no impact on possession"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It determines the final score"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It alternates possessions between teams"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It eliminates jump balls")
                        ],
                        correctAnswer: "It alternates possessions between teams"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "What happens when a team is not awarded possession through the jump ball in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They lose a point"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They automatically gain possession"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They gain the next possession based on the possession arrow's direction"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They must perform a forfeit")
                        ],
                        correctAnswer: "They gain the next possession based on the possession arrow's direction"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "What does the possession arrow rule contribute to in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Team celebrations"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Effective game management"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Individual player statistics"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Referee decisions")
                        ],
                        correctAnswer: "Effective game management"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "Why is understanding the possession arrow crucial in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It determines the final score"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It influences the flow of the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It adds pace and excitement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It contributes to effective game management")
                        ],
                        correctAnswer: "It contributes to effective game management"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "When does the possession arrow come into play in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "During player substitutions"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "After every basket"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "During jump-ball situations"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "During timeouts")
                        ],
                        correctAnswer: "During jump-ball situations"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "What is the primary purpose of the three-second violation in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To prevent stalling"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To regulate player substitutions"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To encourage camping in the key"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To ensure fair and dynamic gameplay")
                        ],
                        correctAnswer: "To ensure fair and dynamic gameplay"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "What happens when a player violates the three-second rule in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They receive a warning"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They gain possession"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They score additional points"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It results in a turnover")
                        ],
                        correctAnswer: "It results in a turnover"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "Why is the three-second rule important for fair gameplay in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It encourages stalling"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It prevents offensive strategies"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It promotes camping in the key"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It prevents unfair advantages and ensures dynamic gameplay")
                        ],
                        correctAnswer: "It prevents unfair advantages and ensures dynamic gameplay"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "What area of the basketball court does the three-second violation regulate?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Three-point line"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Half-court line"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Free-throw line"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Key area")
                        ],
                        correctAnswer: "Key area"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "What does a three-second violation result in?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Extra points for the opposing team"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A warning for the violating player"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A turnover"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Additional time on the shot clock")
                        ],
                        correctAnswer: "A turnover"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "How does the three-second rule impact offensive plays near the basket?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It encourages camping in the key"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It has no impact on offensive plays"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It adds strategy and quick decision-making"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It limits offensive strategies")
                        ],
                        correctAnswer: "It adds strategy and quick decision-making"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "What is the primary purpose of the backcourt violation rule in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To encourage backward ball movement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To limit offensive strategies"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To prevent stalling"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To emphasize strategic ball movement")
                        ],
                        correctAnswer: "To emphasize strategic ball movement"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "What happens when a team commits a backcourt violation in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They gain possession"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They receive a warning"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They score additional points"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They lose possession")
                        ],
                        correctAnswer: "They lose possession"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "What area of the basketball court does the backcourt violation rule govern?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Three-point line"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Half-court line"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Free-throw line"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Backcourt")
                        ],
                        correctAnswer: "Backcourt"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "Why is understanding the backcourt violation rule crucial for both offensive and defensive strategies?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It limits strategic options for offensive teams"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It has no impact on defensive strategies"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It encourages backward ball movement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It helps teams balance aggression with precision")
                        ],
                        correctAnswer: "It helps teams balance aggression with precision"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "What does a backcourt violation result in?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A warning for the violating team"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Extra points for the opposing team"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A turnover"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Additional time on the shot clock")
                        ],
                        correctAnswer: "A turnover"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "How do defensive players strategically use the backcourt violation rule?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To encourage backward ball movement"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To limit offensive strategies"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To force turnovers"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It has no impact on defensive strategies")
                        ],
                        correctAnswer: "To force turnovers"
                    )

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
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 2,
                        question: "What is Robert Lewandowski's nationality?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "German"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Polish"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Spanish"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Italian")
                        ],
                        correctAnswer: "Polish"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 2,
                        question: "Which club did Robert Lewandowski join for his first professional contract?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Znicz Pruszków"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Lech Poznań"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Borussia Dortmund"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Bayern Munich")
                        ],
                        correctAnswer: "Znicz Pruszków"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 2,
                        question: "Which position does Robert Lewandowski play on the field?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Goalkeeper"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Defender"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Midfielder"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Striker")
                        ],
                        correctAnswer: "Striker"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 2,
                        question: "In which year did Robert Lewandowski join Bayern Munich?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2010"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2012"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2014"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2016")
                        ],
                        correctAnswer: "2014"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 2,
                        question: "How many goals did Robert Lewandowski score in a single Bundesliga match in 2015?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "3"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "4"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "5"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "6")
                        ],
                        correctAnswer: "5"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 2,
                        question: "Has Robert Lewandowski served as the captain of the Polish national team?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Yes"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "No")
                        ],
                        correctAnswer: "Yes"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 3,
                        question: "Where was Mohamed Salah born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Cairo, Egypt"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Nagrig, Egypt"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Alexandria, Egypt"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Luxor, Egypt")
                        ],
                        correctAnswer: "Nagrig, Egypt"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 3,
                        question: "In which year did Mohamed Salah join Chelsea?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2012"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2014"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2016"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2018")
                        ],
                        correctAnswer: "2014"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 3,
                        question: "Before joining Liverpool, Mohamed Salah played for which club?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "AS Roma"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "El Mokawloon"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Basel"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Chelsea")
                        ],
                        correctAnswer: "AS Roma"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 3,
                        question: "Mohamed Salah has won multiple individual awards, including which prestigious accolade?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Golden Boot"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Ballon d'Or"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "FIFA World Player of the Year"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "PFA Player of the Year")
                        ],
                        correctAnswer: "Ballon d'Or"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 3,
                        question: "Mohamed Salah is a key figure for which national football team?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Morocco"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Algeria"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Tunisia"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Egypt")
                        ],
                        correctAnswer: "Egypt"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 3,
                        question: "Which trophies has Mohamed Salah helped Liverpool secure since joining in 2017?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "FA Cup and EFL Cup"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Premier League and UEFA Champions League"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Copa del Rey and Supercopa de España"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "DFB-Pokal and DFL-Supercup")
                        ],
                        correctAnswer: "Premier League and UEFA Champions League"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 4,
                        question: "In which year was Atlético Madrid founded?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1899"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1903"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1910"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1925")
                        ],
                        correctAnswer: "1903"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 4,
                        question: "What is the name of Atlético Madrid's home stadium?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Camp Nou"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Santiago Bernabéu"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Wanda Metropolitano"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Estadio Vicente Calderón")
                        ],
                        correctAnswer: "Wanda Metropolitano"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 4,
                        question: "Which club shares a fierce rivalry with Atlético Madrid?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "FC Barcelona"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Real Madrid"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Sevilla FC"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Valencia CF")
                        ],
                        correctAnswer: "Real Madrid"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 4,
                        question: "What are some of the titles Atlético Madrid has won?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Serie A and Coppa Italia"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Premier League and FA Cup"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "La Liga and Copa del Rey"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Bundesliga and DFB-Pokal")
                        ],
                        correctAnswer: "La Liga, Copa del Rey, UEFA Europa League, UEFA Super Cup"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 4,
                        question: "What are Atlético Madrid known for in terms of playing style?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Free-flowing attacking football"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Possession-based play"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Defensive solidity and tactical discipline"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "High-scoring games with flair")
                        ],
                        correctAnswer: "Defensive solidity, tactical discipline, and never-say-die attitude"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 4,
                        question: "Where does Atlético Madrid play its home matches?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "San Siro"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Anfield"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Wanda Metropolitano"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Old Trafford")
                        ],
                        correctAnswer: "Wanda Metropolitano"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 5,
                        question: "Where was LeBron James born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Chicago, Illinois"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "New York City, New York"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Akron, Ohio"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles, California")
                        ],
                        correctAnswer: "Akron, Ohio"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 5,
                        question: "In which year was LeBron James born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1980"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1982"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1984"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1986")
                        ],
                        correctAnswer: "1984"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 5,
                        question: "Where did LeBron James play college basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "University of North Carolina"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Duke University"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Kentucky University"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "None (direct to NBA)")
                        ],
                        correctAnswer: "None (direct to NBA)"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 5,
                        question: "Which NBA team does LeBron James currently play for?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Cleveland Cavaliers"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Miami Heat"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Golden State Warriors"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles Lakers")
                        ],
                        correctAnswer: "Los Angeles Lakers"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 5,
                        question: "How many NBA championships has LeBron James won?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "3"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "4")
                        ],
                        correctAnswer: "4"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 5,
                        question: "What is considered one of the most significant moments in LeBron James' career?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Winning an Olympic gold medal"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Scoring 81 points in a single game"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Achieving a quadruple-double"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Leading the Cleveland Cavaliers to win the 2016 NBA Finals")
                        ],
                        correctAnswer: "Leading the Cleveland Cavaliers to win the 2016 NBA Finals"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 6,
                        question: "Where was Michael Jordan born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Chicago, Illinois"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "New York City, New York"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Brooklyn, New York"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles, California")
                        ],
                        correctAnswer: "Brooklyn, New York"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 6,
                        question: "In which year was Michael Jordan born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1958"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1963"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1970"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1975")
                        ],
                        correctAnswer: "1963"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 6,
                        question: "Where did Michael Jordan play college basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "University of North Carolina"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Duke University"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Kentucky University"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "None (direct to NBA)")
                        ],
                        correctAnswer: "University of North Carolina"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 6,
                        question: "What is Michael Jordan's current role in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "NBA Commissioner"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Head Coach of the Chicago Bulls"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Owner of the Charlotte Hornets"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Lead Analyst on ESPN")
                        ],
                        correctAnswer: "Owner of the Charlotte Hornets"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 6,
                        question: "How many MVP awards has Michael Jordan won?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "3"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "4"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "5")
                        ],
                        correctAnswer: "5"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 6,
                        question: "How many NBA championships did Michael Jordan win?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "4"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "5"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "6"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "7")
                        ],
                        correctAnswer: "6"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 7,
                        question: "Where do the Toronto Raptors play their home games?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Madison Square Garden"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Scotiabank Arena"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Staples Center"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Air Canada Centre")
                        ],
                        correctAnswer: "Scotiabank Arena"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 7,
                        question: "In which year were the Toronto Raptors established?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1993"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1995"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2000"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2005")
                        ],
                        correctAnswer: "1995"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 7,
                        question: "What are the primary colors of the Toronto Raptors?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Blue and White"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Red and Black"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Green and Gold"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Purple and Yellow")
                        ],
                        correctAnswer: "Red and Black"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 7,
                        question: "What is the name of the Toronto Raptors' mascot?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "The Raptor"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Rex the Dinosaur"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Roary the Lion"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Thunderbug")
                        ],
                        correctAnswer: "The Raptor"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 7,
                        question: "In which year did the Toronto Raptors win their first NBA championship?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2016"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2018"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2019"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2020")
                        ],
                        correctAnswer: "2019"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 7,
                        question: "What are Toronto Raptors fans often called?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Raptor Fans"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Scotiabank Supporters"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Maple Leafs"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Raptor Nation")
                        ],
                        correctAnswer: "Raptor Nation"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 8,
                        question: "What is Anthony Davis's height?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "6 feet 8 inches"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "6 feet 10 inches"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "7 feet 1 inch"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "6 feet 6 inches")
                        ],
                        correctAnswer: "6 feet 10 inches"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 8,
                        question: "On which date was Anthony Davis born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "March 11, 1991"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "March 11, 1992"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "March 11, 1993"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "March 11, 1994")
                        ],
                        correctAnswer: "March 11, 1993"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 8,
                        question: "Which university did Anthony Davis play college basketball for?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "University of North Carolina"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Duke University"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "University of Kentucky"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "University of Kansas")
                        ],
                        correctAnswer: "University of Kentucky"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 8,
                        question: "Which NBA team drafted Anthony Davis as the first overall pick in the 2012 NBA Draft?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "New Orleans Hornets"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Los Angeles Lakers"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Chicago Bulls"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Golden State Warriors")
                        ],
                        correctAnswer: "New Orleans Hornets"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 8,
                        question: "Who did Anthony Davis form a formidable duo with on the Los Angeles Lakers?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Stephen Curry"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "James Harden"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "LeBron James"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Kevin Durant")
                        ],
                        correctAnswer: "LeBron James"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 8,
                        question: "In which year did Anthony Davis help the Los Angeles Lakers win the NBA championship?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2019"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2020"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2021"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2022")
                        ],
                        correctAnswer: "2020"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 9,
                        question: "On which date was Harry Kane born?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "July 28, 1991"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "July 28, 1992"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "July 28, 1993"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "July 28, 1994")
                        ],
                        correctAnswer: "July 28, 1993"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 9,
                        question: "Which club does Harry Kane currently play for in the English Premier League?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Manchester United"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Chelsea"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Liverpool"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Tottenham Hotspur")
                        ],
                        correctAnswer: "Tottenham Hotspur"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 9,
                        question: "What individual award has Harry Kane won multiple times?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "FIFA Ballon d'Or"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "UEFA Champions League Player of the Season"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Premier League Player of the Season"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Golden Boot")
                        ],
                        correctAnswer: "Golden Boot"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 9,
                        question: "At what age did Harry Kane join Tottenham's youth academy?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "8"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "10"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "12"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "14")
                        ],
                        correctAnswer: "8"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 9,
                        question: "In which year did Harry Kane lead the England national team to the final of the UEFA European Championship?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2018"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2019"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2020"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "2021")
                        ],
                        correctAnswer: "2021"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 9,
                        question: "What is one of Harry Kane's known strengths in his style of play?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Speed and agility"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Long-range shooting"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Physical strength and aerial ability"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Dribbling and ball control")
                        ],
                        correctAnswer: "Physical strength and aerial ability"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 10,
                        question: "In which year was Chelsea Football Club founded?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1885"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1895"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1905"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "1915")
                        ],
                        correctAnswer: "1905"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 10,
                        question: "What is the nickname of Chelsea Football Club?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "The Reds"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "The Blues"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "The Whites"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "The Greens")
                        ],
                        correctAnswer: "The Blues"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 10,
                        question: "How many league titles has Chelsea Football Club won?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "3"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "5"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "6"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "8")
                        ],
                        correctAnswer: "6"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 10,
                        question: "What is the name of Chelsea Football Club's home ground?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Old Trafford"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Anfield"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Stamford Bridge"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Emirates Stadium")
                        ],
                        correctAnswer: "Stamford Bridge"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 10,
                        question: "In which city is Chelsea Football Club based?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Manchester"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Liverpool"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "London"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Birmingham")
                        ],
                        correctAnswer: "London"
                    ),
                    SelectionModel.Data.SportData.Players.PlayerTest(
                        study_id: 10,
                        question: "What is one of the characteristics of Chelsea Football Club's approach, emphasizing the development of young players?",
                        answers: [
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Signing only experienced players"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Focusing on defensive football"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Avoiding international signings"),
                            SelectionModel.Data.SportData.Players.PlayerTest.Answer(answer: "Strong emphasis on youth development")
                        ],
                        correctAnswer: "Strong emphasis on youth development"
                    )
                ]
            ),
            clubs: SelectionModel.Data.SportData.Clubs(
                study: [
                        // Football Club Study
                        SelectionModel.Data.SportData.Clubs.ClubStudy(
                            id: 1,
                            title: "Real Madrid",
                            desc: "Real Madrid Club de Fútbol, commonly known as Real Madrid, is a legendary football club based in Madrid, Spain. Founded in 1902, Real Madrid has a rich history and is considered one of the most successful clubs globally. The team plays its home matches at the Santiago Bernabéu Stadium. Real Madrid has won numerous domestic and international titles, including a record number of UEFA Champions League trophies. Known for their 'Galácticos' era, the club has featured some of the greatest footballers in history. Real Madrid's style is characterized by attacking flair, possession-based play, and a commitment to entertaining football."
                        ),
                        
                        // Basketball Club Study
                        SelectionModel.Data.SportData.Clubs.ClubStudy(
                            id: 2,
                            title: "Los Angeles Lakers",
                            desc: "The Los Angeles Lakers are a storied basketball franchise based in Los Angeles, California. Founded in 1947, the Lakers are one of the most successful and popular teams in the NBA. The team plays its home games at the Staples Center. The Lakers have a rich history, boasting numerous NBA championships. The franchise has been home to legendary players such as Magic Johnson, Kobe Bryant, and Shaquille O'Neal. Known for their 'Showtime' era and dominance in the 2000s, the Lakers have a tradition of excellence, emphasizing a fast-paced and exciting style of play. The purple and gold colors of the Lakers are iconic in the world of basketball."
                        ),
                        
                        // Additional Football Club Study
                        SelectionModel.Data.SportData.Clubs.ClubStudy(
                            id: 3,
                            title: "FC Barcelona",
                            desc: "Futbol Club Barcelona, commonly known as Barcelona or Barça, is a prestigious football club based in Barcelona, Catalonia, Spain. Founded in 1899, Barcelona has a rich history and is renowned for its commitment to 'mes que un club' (more than a club). The team plays its home matches at the Camp Nou stadium. Barcelona has won numerous domestic and international titles, including multiple UEFA Champions League trophies. The club is famous for its philosophy of tiki-taka football, emphasizing possession, quick passing, and attacking creativity. Barcelona's colors, blue and red, symbolize the pride and passion of the Catalan region."
                        ),
                        
                        // Additional Basketball Club Study
                        SelectionModel.Data.SportData.Clubs.ClubStudy(
                            id: 4,
                            title: "Golden State Warriors",
                            desc: "The Golden State Warriors are a professional basketball team based in San Francisco, California. Established in 1946, the Warriors are known for their success in the NBA. The team plays its home games at the Chase Center. The Warriors have achieved significant success in recent years, winning multiple NBA championships. They are recognized for their 'Splash Brothers' era, featuring sharpshooting guards Stephen Curry and Klay Thompson. The team's style is characterized by three-point shooting, fast-paced gameplay, and strong team chemistry. The blue and gold colors of the Warriors reflect the vibrant spirit and history of the franchise."
                        ),
                        
                        // Another Football Club Study
                        SelectionModel.Data.SportData.Clubs.ClubStudy(
                            id: 5,
                            title: "Liverpool FC",
                            desc: "Liverpool Football Club, commonly known as Liverpool FC or simply Liverpool, is a highly successful football club based in Liverpool, England. Founded in 1892, Liverpool has a storied history and plays its home matches at Anfield. The club has won numerous domestic and international honors, including multiple UEFA Champions League titles. Liverpool is famous for its passionate fanbase, known as the 'Kop,' and its anthem 'You'll Never Walk Alone.' The team's playing style is characterized by high-intensity pressing, fast counter-attacks, and entertaining attacking football. The iconic all-red kit symbolizes the club's rich tradition and commitment to excellence."
                        ),
                        
                        // Another Basketball Club Study
                        SelectionModel.Data.SportData.Clubs.ClubStudy(
                            id: 6,
                            title: "Chicago Bulls",
                            desc: "The Chicago Bulls are a historic basketball franchise based in Chicago, Illinois. Established in 1966, the Bulls are known for their success in the NBA. The team plays its home games at the United Center. The Bulls achieved global recognition in the 1990s under the leadership of Michael Jordan, winning six NBA championships. The team's playing style is characterized by tenacious defense, fast breaks, and iconic moments. The red, black, and white colors of the Bulls are synonymous with the team's fierce competitiveness and enduring legacy in the world of basketball."
                        ),
                        
                        // Another Football Club Study
                        SelectionModel.Data.SportData.Clubs.ClubStudy(
                            id: 7,
                            title: "AC Milan",
                            desc: "Associazione Calcio Milan, commonly known as AC Milan, is a prestigious football club based in Milan, Italy. Founded in 1899, AC Milan has a rich history and plays its home matches at the San Siro stadium. The club has won numerous domestic and international titles, including multiple UEFA Champions League trophies. AC Milan is renowned for its stylish and attacking brand of football, with a focus on teamwork and technical prowess. The iconic red and black stripes of AC Milan's kit represent the club's passion, tradition, and commitment to success in Italian and European football."
                        ),
                        
                        // Another Basketball Club Study
                        SelectionModel.Data.SportData.Clubs.ClubStudy(
                            id: 8,
                            title: "Miami Heat",
                            desc: "The Miami Heat are a professional basketball team based in Miami, Florida. Established in 1988, the Heat have become a prominent force in the NBA. The team plays its home games at the American Airlines Arena. The Heat gained international recognition in the 2000s and 2010s, winning multiple NBA championships. Known for their 'Heat culture,' the team emphasizes hard work, discipline, and a commitment to success. The red, black, and white colors of the Heat symbolize the intensity and energy that the team brings to the court, making them a formidable presence in the world of basketball."
                        ),
                        
                        // Another Football Club Study
                        SelectionModel.Data.SportData.Clubs.ClubStudy(
                            id: 9,
                            title: "Borussia Dortmund",
                            desc: "Ballspielverein Borussia 09 e.V. Dortmund, commonly known as Borussia Dortmund or BVB, is a renowned football club based in Dortmund, Germany. Founded in 1909, Borussia Dortmund has a passionate fanbase and plays its home matches at Signal Iduna Park. The club has won domestic and international honors, including the UEFA Champions League. Borussia Dortmund is known for its electrifying attacking style, characterized by fast-paced transitions and loyal support from the 'Yellow Wall' – the team's vibrant and vocal fan section. The iconic yellow and black colors of BVB represent the energy, determination, and unity of the club."
                        ),
                        
                        // Another Basketball Club Study
                        SelectionModel.Data.SportData.Clubs.ClubStudy(
                            id: 10,
                            title: "Toronto Raptors",
                            desc: "The Toronto Raptors are a professional basketball team based in Toronto, Ontario, Canada. Established in 1995, the Raptors have become a prominent force in the NBA. The team plays its home games at the Scotiabank Arena. The Raptors gained international recognition by winning their first NBA championship in 2019. Known for their passionate fanbase, innovative branding, and diverse roster, the Raptors bring a unique Canadian flavor to the league. The red, black, and white colors of the Raptors reflect the team's identity and resilience, making them a captivating presence in the world of basketball."
                        )
                    ],
                test: [
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                            study_id: 1,
                            question: "When was Real Madrid Club de Fútbol founded?",
                            answers: [
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1898"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1902"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1910"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1925")
                            ],
                            correctAnswer: "1902"
                        ),
                        SelectionModel.Data.SportData.Clubs.ClubTest(
                            study_id: 1,
                            question: "Where does Real Madrid play its home matches?",
                            answers: [
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Santiago Bernabéu Stadium"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Camp Nou"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Old Trafford"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "San Siro Stadium")
                            ],
                            correctAnswer: "Santiago Bernabéu Stadium"
                        ),
                        SelectionModel.Data.SportData.Clubs.ClubTest(
                            study_id: 1,
                            question: "What is Real Madrid known for during the 'Galácticos' era?",
                            answers: [
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Defensive solidity"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Youth development"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Possession-based play"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Featuring great footballers")
                            ],
                            correctAnswer: "Featuring great footballers"
                        ),
                        SelectionModel.Data.SportData.Clubs.ClubTest(
                            study_id: 1,
                            question: "How many UEFA Champions League trophies has Real Madrid won?",
                            answers: [
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "3"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "7"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "11"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Record number")
                            ],
                            correctAnswer: "Record number"
                        ),
                        SelectionModel.Data.SportData.Clubs.ClubTest(
                            study_id: 1,
                            question: "What style characterizes Real Madrid's play?",
                            answers: [
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Defensive counter-attacks"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Direct long balls"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Possession-based play"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Slow-paced buildup")
                            ],
                            correctAnswer: "Possession-based play"
                        ),
                        SelectionModel.Data.SportData.Clubs.ClubTest(
                            study_id: 1,
                            question: "Who plays their home games at the Santiago Bernabéu Stadium?",
                            answers: [
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Barcelona"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Real Madrid"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Manchester United"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "AC Milan")
                            ],
                            correctAnswer: "Real Madrid"
                        ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                            study_id: 2,
                            question: "When were the Los Angeles Lakers founded?",
                            answers: [
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1950"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1965"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1947"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1972")
                            ],
                            correctAnswer: "1947"
                        ),
                        SelectionModel.Data.SportData.Clubs.ClubTest(
                            study_id: 2,
                            question: "Where do the Los Angeles Lakers play their home games?",
                            answers: [
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Madison Square Garden"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Staples Center"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Oracle Arena"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Fiserv Forum")
                            ],
                            correctAnswer: "Staples Center"
                        ),
                        SelectionModel.Data.SportData.Clubs.ClubTest(
                            study_id: 2,
                            question: "Who are some legendary players associated with the Los Angeles Lakers?",
                            answers: [
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Michael Jordan, Larry Bird, Hakeem Olajuwon"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Magic Johnson, Kobe Bryant, Shaquille O'Neal"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "LeBron James, Kevin Durant, Stephen Curry"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Tim Duncan, Dirk Nowitzki, Dwyane Wade")
                            ],
                            correctAnswer: "Magic Johnson, Kobe Bryant, Shaquille O'Neal"
                        ),
                        SelectionModel.Data.SportData.Clubs.ClubTest(
                            study_id: 2,
                            question: "What era is known for the Lakers' dominance?",
                            answers: [
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1970s"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1990s"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1980s"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "2000s")
                            ],
                            correctAnswer: "2000s"
                        ),
                        SelectionModel.Data.SportData.Clubs.ClubTest(
                            study_id: 2,
                            question: "What colors are iconic for the Los Angeles Lakers?",
                            answers: [
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red and white"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and yellow"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Green and gold"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Purple and gold")
                            ],
                            correctAnswer: "Purple and gold"
                        ),
                        SelectionModel.Data.SportData.Clubs.ClubTest(
                            study_id: 2,
                            question: "Which stadium hosts the home games of the Los Angeles Lakers?",
                            answers: [
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Staples Center"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Madison Square Garden"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Oracle Arena"),
                                SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Fiserv Forum")
                            ],
                            correctAnswer: "Staples Center"
                        ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 3,
                        question: "When was Futbol Club Barcelona founded?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1905"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1910"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1899"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1925")
                        ],
                        correctAnswer: "1899"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 3,
                        question: "Where does FC Barcelona play its home matches?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Santiago Bernabéu Stadium"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "San Siro Stadium"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Camp Nou stadium"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Old Trafford")
                        ],
                        correctAnswer: "Camp Nou stadium"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 3,
                        question: "What does the phrase 'mes que un club' signify?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "More than a club"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Only a club"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Just a club"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Less than a club")
                        ],
                        correctAnswer: "More than a club"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 3,
                        question: "Which stadium hosts the home matches of FC Barcelona?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Anfield"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Wanda Metropolitano"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Camp Nou stadium"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Allianz Arena")
                        ],
                        correctAnswer: "Camp Nou stadium"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 3,
                        question: "What colors symbolize Barcelona's pride and passion?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and red"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red and black"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Green and yellow")
                        ],
                        correctAnswer: "Blue and red"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 3,
                        question: "What is Barcelona's football philosophy known as?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Total football"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Catennaccio"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Tiki-taka"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Gegenpressing")
                        ],
                        correctAnswer: "Tiki-taka"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 4,
                        question: "When were the Golden State Warriors established?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1955"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1967"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1946"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1972")
                        ],
                        correctAnswer: "1946"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 4,
                        question: "Where do the Golden State Warriors play their home games?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Madison Square Garden"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Staples Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Chase Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Barclays Center")
                        ],
                        correctAnswer: "Chase Center"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 4,
                        question: "What era of the Golden State Warriors is known as the 'Splash Brothers' era?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Magic Johnson era"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Michael Jordan era"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Kobe Bryant era"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Splash Brothers era")
                        ],
                        correctAnswer: "Splash Brothers era"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 4,
                        question: "Which colors reflect the vibrant spirit and history of the Golden State Warriors?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and gold"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Black and silver"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Green and yellow")
                        ],
                        correctAnswer: "Blue and gold"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 4,
                        question: "What is the distinctive style of the Golden State Warriors?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Slow-paced gameplay"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Three-point shooting"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Strong defense"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Post-up offense")
                        ],
                        correctAnswer: "Three-point shooting"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 4,
                        question: "Who are the notable players associated with the 'Splash Brothers' era?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "LeBron James and Anthony Davis"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Stephen Curry and Klay Thompson"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Kevin Durant and James Harden"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Chris Paul and Blake Griffin")
                        ],
                        correctAnswer: "Stephen Curry and Klay Thompson"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 5,
                        question: "When was Liverpool Football Club founded?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1874"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1892"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1905"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1920")
                        ],
                        correctAnswer: "1892"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 5,
                        question: "Where does Liverpool FC play its home matches?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Old Trafford"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Anfield"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Etihad Stadium"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Stamford Bridge")
                        ],
                        correctAnswer: "Anfield"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 5,
                        question: "What is the anthem of Liverpool FC?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "'You're the Best Around'"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "'Don't Stop Believin'"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "'We Will Rock You'"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "'You'll Never Walk Alone'")
                        ],
                        correctAnswer: "'You'll Never Walk Alone'"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 5,
                        question: "What does the term 'Kop' refer to in relation to Liverpool FC?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "A famous player"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "A trophy"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The team's stadium"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The passionate fanbase")
                        ],
                        correctAnswer: "The passionate fanbase"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 5,
                        question: "What colors symbolize Liverpool FC's rich tradition and commitment to excellence?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Green and yellow"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red and black"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "All-red")
                        ],
                        correctAnswer: "All-red"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 5,
                        question: "What style characterizes Liverpool FC's playing style?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Slow build-up play"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Defensive approach"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "High-intensity pressing"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Long ball tactics")
                        ],
                        correctAnswer: "High-intensity pressing"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 6,
                        question: "In which decade did the Chicago Bulls achieve global recognition by winning six NBA championships?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1980s"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1990s"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "2000s"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "2010s")
                        ],
                        correctAnswer: "1990s"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 6,
                        question: "Where do the Chicago Bulls play their home games?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Madison Square Garden"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Staples Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "United Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Oracle Arena")
                        ],
                        correctAnswer: "United Center"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 6,
                        question: "Who was a key figure in the Chicago Bulls' success during the 1990s?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Kobe Bryant"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "LeBron James"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Michael Jordan"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Tim Duncan")
                        ],
                        correctAnswer: "Michael Jordan"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 6,
                        question: "What colors are synonymous with the Chicago Bulls' fierce competitiveness and enduring legacy?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and yellow"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red and black"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Green and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Purple and gold")
                        ],
                        correctAnswer: "Red and black"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 6,
                        question: "What is the iconic home arena of the Chicago Bulls?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Madison Square Garden"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "United Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Staples Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Oracle Arena")
                        ],
                        correctAnswer: "United Center"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 6,
                        question: "What style characterizes the Chicago Bulls' playing style?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Slow-paced offense"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Tenacious defense"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Long-range shooting"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Isolation plays")
                        ],
                        correctAnswer: "Tenacious defense"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 7,
                        question: "Where does AC Milan play its home matches?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Allianz Stadium"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "San Siro"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Camp Nou"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Old Trafford")
                        ],
                        correctAnswer: "San Siro"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 7,
                        question: "In which country is AC Milan based?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Germany"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Spain"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Italy"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "France")
                        ],
                        correctAnswer: "Italy"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 7,
                        question: "What do the red and black stripes on AC Milan's kit represent?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Loyalty and honesty"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Power and aggression"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Passion, tradition, and commitment"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Innovation and modernity")
                        ],
                        correctAnswer: "Passion, tradition, and commitment"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 7,
                        question: "Which stadium is known as the home of AC Milan?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Allianz Stadium"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "San Siro"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Camp Nou"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Old Trafford")
                        ],
                        correctAnswer: "San Siro"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 7,
                        question: "What is AC Milan renowned for in terms of playing style?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Defensive football"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Counter-attacking"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Stylish and attacking brand of football"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Long-ball tactics")
                        ],
                        correctAnswer: "Stylish and attacking brand of football"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 7,
                        question: "When was AC Milan founded?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1899"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1905"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1920"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1947")
                        ],
                        correctAnswer: "1899"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 8,
                        question: "In which city are the Miami Heat based?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Orlando"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Miami"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Tampa Bay"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Jacksonville")
                        ],
                        correctAnswer: "Miami"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 8,
                        question: "When was the Miami Heat established?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1975"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1988"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1996"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "2005")
                        ],
                        correctAnswer: "1988"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 8,
                        question: "Which arena is the home venue for the Miami Heat?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Madison Square Garden"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Staples Center"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "American Airlines Arena"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Fiserv Forum")
                        ],
                        correctAnswer: "American Airlines Arena"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 8,
                        question: "What do the red, black, and white colors of the Miami Heat symbolize?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Sadness and humility"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Peace and tranquility"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Intensity and energy"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Innovation and modernity")
                        ],
                        correctAnswer: "Intensity and energy"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 8,
                        question: "What is the Miami Heat known for in terms of team culture?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Laid-back atmosphere"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Hard work, discipline, and a commitment to success"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Celebrity endorsements"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Isolation and individualism")
                        ],
                        correctAnswer: "Hard work, discipline, and a commitment to success"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 8,
                        question: "How many NBA championships have the Miami Heat won?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "3"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "5"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "7")
                        ],
                        correctAnswer: "3"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 9,
                        question: "In which city is Borussia Dortmund based?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Berlin"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Munich"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Hamburg"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Dortmund")
                        ],
                        correctAnswer: "Dortmund"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 9,
                        question: "When was Borussia Dortmund founded?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1899"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1905"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1909"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1915")
                        ],
                        correctAnswer: "1909"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 9,
                        question: "What is the home stadium of Borussia Dortmund?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Allianz Arena"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Veltins-Arena"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Signal Iduna Park"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Mercedes-Benz Arena")
                        ],
                        correctAnswer: "Signal Iduna Park"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 9,
                        question: "What does the 'Yellow Wall' represent for Borussia Dortmund?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "A yellow-colored stadium wall"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "A famous landmark in Dortmund"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "The team's vibrant and vocal fan section"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "A nickname for the team captain")
                        ],
                        correctAnswer: "The team's vibrant and vocal fan section"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 9,
                        question: "What do the yellow and black colors of Borussia Dortmund symbolize?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Sadness and humility"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Energy, determination, and unity"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Peace and tranquility"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Innovation and modernity")
                        ],
                        correctAnswer: "Energy, determination, and unity"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 9,
                        question: "How many UEFA Champions League titles has Borussia Dortmund won?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "2"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "3"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "4")
                        ],
                        correctAnswer: "1"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 10,
                        question: "In which city are the Toronto Raptors based?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Vancouver"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Montreal"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Ottawa"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Toronto")
                        ],
                        correctAnswer: "Toronto"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 10,
                        question: "When were the Toronto Raptors established?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1985"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1990"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "1995"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "2000")
                        ],
                        correctAnswer: "1995"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 10,
                        question: "Where do the Toronto Raptors play their home games?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Rogers Centre"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Scotiabank Arena"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Air Canada Centre"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Bell Centre")
                        ],
                        correctAnswer: "Scotiabank Arena"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 10,
                        question: "What is a notable achievement of the Toronto Raptors?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Winning the NBA Finals in 2019"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Setting the record for most regular-season wins"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Producing the league's top scorer"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Having the longest winning streak in NBA history")
                        ],
                        correctAnswer: "Winning the NBA Finals in 2019"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 10,
                        question: "What colors represent the identity of the Toronto Raptors?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Blue and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Red, black, and white"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Green and gold"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Purple and gold")
                        ],
                        correctAnswer: "Red, black, and white"
                    ),
                    SelectionModel.Data.SportData.Clubs.ClubTest(
                        study_id: 10,
                        question: "What makes the Toronto Raptors a captivating presence in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Their dominant big man"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Unique Canadian flavor"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Longest winning streak"),
                            SelectionModel.Data.SportData.Clubs.ClubTest.Answer(answer: "Defensive prowess")
                        ],
                        correctAnswer: "Unique Canadian flavor"
                    )
                    
                    
                ]
            ),
            rules: SelectionModel.Data.SportData.Rules(
                study: [
                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 1,
                            title: "Offside Rule in Football",
                            desc: "In football, the offside rule is a fundamental aspect of fair play. A player is considered offside if they are nearer to the opponent's goal line than both the ball and the second-to-last defender when the ball is played to them, unless they are in their own half of the field or level with the second-to-last defender or level with the last two defenders. Understanding and applying the offside rule is crucial for players, coaches, and fans to appreciate the dynamics of goal-scoring opportunities and maintain the integrity of the game."
                        ),
                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 2,
                            title: "Fouls and Free Kicks in Football",
                            desc: "In football, fouls are penalized to ensure a fair and safe game. A player commits a foul by engaging in unfair or reckless play. Common fouls include tripping, pushing, and handling the ball with hands. When a foul occurs, the opposing team is awarded a free kick. Understanding the rules around fouls and free kicks is essential for players to navigate the game strategically, as well as for referees to maintain order and uphold the principles of fair competition."
                        ),
                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 3,
                            title: "Three-Second Violation in Basketball",
                            desc: "In basketball, the three-second violation is a key rule governing player positioning. An offensive player is not allowed to remain in the key or paint area (the restricted area near the basket) for more than three consecutive seconds. This rule prevents offensive players from camping in the key, promoting free movement and facilitating a dynamic style of play. Teams must be aware of the three-second rule to avoid turnovers and make effective offensive plays, while defenders use it to their advantage to disrupt opponents' strategies."
                        ),
                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 4,
                            title: "Double Dribble Rule in Basketball",
                            desc: "The double dribble rule is a fundamental principle in basketball that governs ball-handling. A player is not allowed to dribble the ball, stop, and then start dribbling again. This violation, known as a double dribble, results in the loss of possession to the opposing team. Understanding and avoiding double dribbles is essential for players, as it ensures a fair and continuous flow of the game. Coaches emphasize this rule in training to enhance players' ball-handling skills and maintain the integrity of the sport."
                        ),
                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 5,
                            title: "Handball Violation in Football",
                            desc: "Handball violations occur in football when a player deliberately handles the ball using their hand or arm. The rules define various situations where handball infractions can occur, such as a player gaining an unfair advantage or scoring a goal with their hand. Referees use video assistance to make accurate decisions in contentious handball situations. Understanding the handball rule is crucial for players, officials, and fans, as it influences match outcomes and contributes to the overall fairness of the game."
                        ),
                        // Add more football rules studies as needed

                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 6,
                            title: "Shot Clock Violation in Basketball",
                            desc: "Basketball features a shot clock, which is a time limit for a team to attempt a shot after gaining possession of the ball. A shot clock violation occurs when a team fails to release a shot before the shot clock expires. This rule adds urgency and pace to the game, preventing teams from stalling and promoting offensive strategies. Teams must efficiently move the ball and create scoring opportunities within the shot clock timeframe. The shot clock violation rule is integral to maintaining an exciting and dynamic playing environment in basketball."
                        ),
                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 7,
                            title: "Personal Foul Rule in Basketball",
                            desc: "In basketball, personal fouls are committed when a player makes illegal physical contact with an opponent. Players accumulate personal fouls throughout the game, and reaching a certain limit results in free throws for the opposing team. Understanding the personal foul rule is essential for players to balance aggressive defense with avoiding excessive fouls. Coaches strategize to minimize fouls while maintaining effective defense. Referees play a crucial role in enforcing the personal foul rule to ensure fair play and player safety."
                        ),
                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 8,
                            title: "Traveling Violation in Basketball",
                            desc: "The traveling violation is a fundamental rule in basketball that prohibits players from taking too many steps without dribbling the ball. When a player moves both feet without dribbling, it is considered traveling, resulting in a turnover and possession awarded to the opposing team. Coaches emphasize proper footwork and ball-handling skills to avoid traveling violations. Understanding and enforcing the traveling rule contribute to the fluidity and fairness of the game, ensuring that players adhere to established standards of play."
                        ),
                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 9,
                            title: "Technical Foul Rule in Basketball",
                            desc: "Basketball includes technical fouls, which are infractions for unsportsmanlike conduct or rule violations not involving physical contact. Technical fouls result in free throws for the opposing team, providing an opportunity to score without active defense. Players and coaches must be aware of the consequences of technical fouls, as they can influence game momentum. Referees enforce the technical foul rule to maintain sportsmanship and uphold the integrity of the sport. Understanding when technical fouls may be assessed is crucial for players and teams to navigate game situations successfully."
                        ),
                        SelectionModel.Data.SportData.Rules.RulesStudy(
                            id: 10,
                            title: "Substitution Rule in Basketball",
                            desc: "The substitution rule in basketball allows teams to replace players on the court during stoppages in play. Substitutions help manage player fatigue, adapt to specific game situations, and optimize team performance. Coaches strategically use substitutions to maintain a competitive edge. Understanding the substitution rule is essential for players, coaches, and fans, as it influences the dynamics of the game and player rotations. Successful teams leverage substitutions to capitalize on matchups and ensure peak performance throughout the game."
                        )
                    ],
                test: [
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "When is a player considered offside in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When they are in their own half of the field"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When they are level with the second-to-last defender"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When they are nearer to the opponent's goal line than the ball and the second-to-last defender"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When they are level with the last two defenders")
                        ],
                        correctAnswer: "When they are nearer to the opponent's goal line than the ball and the second-to-last defender"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "Why is understanding the offside rule crucial in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To encourage aggressive play"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To confuse opponents"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To appreciate the dynamics of goal-scoring opportunities"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To slow down the game")
                        ],
                        correctAnswer: "To appreciate the dynamics of goal-scoring opportunities"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "In which situations is a player not considered offside?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When they are level with the last two defenders"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When they are in their own half of the field"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When they are nearer to the opponent's goal line than the ball and the second-to-last defender"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When they are level with the second-to-last defender")
                        ],
                        correctAnswer: "When they are level with the last two defenders"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "What happens if a player is offside in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They receive a warning"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The opposing team is awarded a free kick"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They are shown a yellow card"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The opposing team is awarded a penalty kick")
                        ],
                        correctAnswer: "The opposing team is awarded a free kick"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "What does the offside rule aim to maintain in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Player fatigue"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Goalkeeper positioning"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Fair play and the integrity of the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Crowd excitement")
                        ],
                        correctAnswer: "Fair play and the integrity of the game"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 1,
                        question: "Is a player considered offside if they are level with the last two defenders?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Yes"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "No"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only in the first half"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Depends on the referee's decision")
                        ],
                        correctAnswer: "No"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "How is a player penalized for committing a foul in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They receive a yellow card"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The opposing team is awarded a goal"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They are substituted"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The opposing team is awarded a free kick")
                        ],
                        correctAnswer: "The opposing team is awarded a free kick"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "What types of actions are considered fouls in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Cheering for the opposing team"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Scoring a goal"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Engaging in unfair or reckless play"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Running fast with the ball")
                        ],
                        correctAnswer: "Engaging in unfair or reckless play"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "What happens when a player commits a foul in the penalty area?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They receive a warning"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The opposing team is awarded a throw-in"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The opposing team is awarded a penalty kick"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The player is sent off the field")
                        ],
                        correctAnswer: "The opposing team is awarded a penalty kick"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "How do fouls impact the flow of the game in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They have no impact"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They lead to the suspension of the match"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They result in extra playing time"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They may stop the game temporarily or lead to injury time")
                        ],
                        correctAnswer: "They may stop the game temporarily or lead to injury time"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "What is the purpose of awarding a free kick to the opposing team?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To give the player a chance to rest"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To punish the player's team"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To resume the game after a foul"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To determine the man of the match")
                        ],
                        correctAnswer: "To resume the game after a foul"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 2,
                        question: "Is scoring a goal considered a foul in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Yes"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "No"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only if done with the hand"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Depends on the referee's decision")
                        ],
                        correctAnswer: "No"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "What does the three-second violation in basketball regulate?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Dribbling"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Player positioning in the key"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Shooting techniques"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Passing accuracy")
                        ],
                        correctAnswer: "Player positioning in the key"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "Why is the three-second rule important in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To limit the number of players on the court"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To speed up the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To encourage more fouls"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To promote free movement and dynamic play")
                        ],
                        correctAnswer: "To promote free movement and dynamic play"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "What area on the basketball court does the three-second violation apply to?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Half-court"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Sidelines"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Restricted area near the basket"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Three-point line")
                        ],
                        correctAnswer: "Restricted area near the basket"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "How long can an offensive player stay in the key without violating the three-second rule?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Indefinitely"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "One second"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Three consecutive seconds"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Five consecutive seconds")
                        ],
                        correctAnswer: "Three consecutive seconds"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "What is the purpose of the three-second rule for offensive players?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To prevent scoring"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To encourage fouls"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To limit offensive strategies"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To promote fair play and dynamic offensive plays")
                        ],
                        correctAnswer: "To promote fair play and dynamic offensive plays"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 3,
                        question: "How do defenders use the three-second rule to their advantage?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By avoiding the key"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By ignoring the rule"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By camping in the key"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By disrupting opponents' strategies")
                        ],
                        correctAnswer: "By disrupting opponents' strategies"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "What does the double dribble rule govern in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Shooting techniques"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ball-handling"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Defensive strategies"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Passing accuracy")
                        ],
                        correctAnswer: "Ball-handling"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "What happens if a player commits a double dribble violation?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They receive a warning"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They get a free throw"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They lose possession to the opposing team"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They are ejected from the game")
                        ],
                        correctAnswer: "They lose possession to the opposing team"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "Why is understanding and avoiding double dribbles important in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To confuse opponents"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To showcase skills"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To enhance ball-handling skills and maintain fair play"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To slow down the game")
                        ],
                        correctAnswer: "To enhance ball-handling skills and maintain fair play"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "What does a double dribble violation result in?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A technical foul"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A team timeout"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Loss of possession to the opposing team"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A warning to the player")
                        ],
                        correctAnswer: "Loss of possession to the opposing team"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "How do coaches emphasize the double dribble rule in training?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By ignoring it"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By penalizing players heavily"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "By encouraging double dribbles"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To enhance players' ball-handling skills")
                        ],
                        correctAnswer: "To enhance players' ball-handling skills"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 4,
                        question: "What does a player have to do to commit a double dribble violation?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Dribble with both hands simultaneously"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Dribble, stop, and then start dribbling again"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Dribble for an extended period"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Dribble only with one hand")
                        ],
                        correctAnswer: "Dribble, stop, and then start dribbling again"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "When does a handball violation occur in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Any time a player touches the ball with their hand"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only during penalty kicks"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When the ball accidentally hits a player's hand"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "When a player deliberately handles the ball")
                        ],
                        correctAnswer: "When a player deliberately handles the ball"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "How do referees make decisions in contentious handball situations?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Flip a coin"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Guess the outcome"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Use video assistance"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ask the players for their opinion")
                        ],
                        correctAnswer: "Use video assistance"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "Why is understanding the handball rule crucial in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To confuse opponents"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To make the game more challenging"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It has no impact on the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Influences match outcomes and contributes to overall fairness")
                        ],
                        correctAnswer: "Influences match outcomes and contributes to overall fairness"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "What defines various situations where handball infractions can occur?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Referee's mood"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Team captains' decision"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Video assistance"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The rules")
                        ],
                        correctAnswer: "The rules"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "What happens when a player gains an unfair advantage or scores a goal with their hand?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They receive a trophy"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "No consequences"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The opposing team is penalized"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "It is considered a handball violation")
                        ],
                        correctAnswer: "It is considered a handball violation"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 5,
                        question: "Who does the handball rule influence in football?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only the players"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Referees and officials"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Spectators in the stadium"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Everyone involved: players, officials, and fans")
                        ],
                        correctAnswer: "Everyone involved: players, officials, and fans"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "What is the shot clock in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A clock for tracking game time"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A clock for tracking player movements"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A time limit for a team to attempt a shot"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A clock for measuring timeouts")
                        ],
                        correctAnswer: "A time limit for a team to attempt a shot"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "What happens when a team fails to release a shot before the shot clock expires?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They receive extra time"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "No consequences"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The opposing team is penalized"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A shot clock violation occurs")
                        ],
                        correctAnswer: "A shot clock violation occurs"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "Why does basketball have a shot clock?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To track game time"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To measure player performance"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To add urgency and pace to the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "For measuring timeouts")
                        ],
                        correctAnswer: "To add urgency and pace to the game"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "What does the shot clock violation rule prevent teams from doing?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Scoring too many points"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Using timeouts recklessly"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Stalling and delaying the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Making substitutions too frequently")
                        ],
                        correctAnswer: "Stalling and delaying the game"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "What is the purpose of the shot clock in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To give teams more time to strategize"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To slow down the pace of the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To maintain an exciting and dynamic playing environment"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To measure the total duration of the game")
                        ],
                        correctAnswer: "To maintain an exciting and dynamic playing environment"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 6,
                        question: "What must teams do within the shot clock timeframe?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Nothing, it's optional"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Use timeouts strategically"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Create scoring opportunities and attempt a shot"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Delay the game to tire out opponents")
                        ],
                        correctAnswer: "Create scoring opportunities and attempt a shot"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "What constitutes a personal foul in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Illegal dribbling"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Verbal taunting"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Illegal physical contact with an opponent"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Delay of game")
                        ],
                        correctAnswer: "Illegal physical contact with an opponent"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "What happens when a player accumulates personal fouls in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They receive a warning"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "No consequences"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They are ejected from the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Free throws for the opposing team")
                        ],
                        correctAnswer: "Free throws for the opposing team"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "Why is understanding the personal foul rule essential for basketball players?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To increase their scoring"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To disrupt opponents' strategies"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To balance aggressive defense with avoiding excessive fouls"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To maximize their playing time")
                        ],
                        correctAnswer: "To balance aggressive defense with avoiding excessive fouls"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "How do coaches strategize regarding personal fouls in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Encourage more fouls"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Ignore fouls completely"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Minimize fouls while maintaining effective defense"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Increase aggressive fouling")
                        ],
                        correctAnswer: "Minimize fouls while maintaining effective defense"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "What role do referees play in enforcing the personal foul rule?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They encourage fouls"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They penalize players for legal plays"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They ignore fouls"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "They ensure fair play and player safety")
                        ],
                        correctAnswer: "They ensure fair play and player safety"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 7,
                        question: "What is the consequence of accumulating too many personal fouls in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A trophy is awarded"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Immediate ejection from the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Opponent's team is disqualified"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Free throws for the opposing team")
                        ],
                        correctAnswer: "Free throws for the opposing team"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "What is the primary purpose of the traveling rule in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Encouraging excessive dribbling"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Promoting unfair play"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Maintaining fluidity and fairness of the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Awarding free throws to the opposing team")
                        ],
                        correctAnswer: "Maintaining fluidity and fairness of the game"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "What happens when a player commits a traveling violation in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The player is ejected from the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The game continues without consequences"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "A warning is issued to the player"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Possession is awarded to the opposing team")
                        ],
                        correctAnswer: "Possession is awarded to the opposing team"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "How does the shot clock contribute to the game of basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Encourages stalling tactics"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Adds urgency and pace to the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Increases the time allowed for each possession"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Results in longer game durations")
                        ],
                        correctAnswer: "Adds urgency and pace to the game"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "What is the consequence of a shot clock violation in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The opposing team loses points"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The game is paused"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Possession is awarded to the violating team"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Turnover, and possession is awarded to the opposing team")
                        ],
                        correctAnswer: "Turnover, and possession is awarded to the opposing team"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "Why do basketball teams need to be aware of the shot clock?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To encourage stalling tactics"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To decrease the pace of the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To avoid turnovers"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To facilitate dynamic and strategic play")
                        ],
                        correctAnswer: "To facilitate dynamic and strategic play"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 8,
                        question: "What does the shot clock violation rule prevent in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Encourages stalling tactics"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Promotes excessive dribbling"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Prevents teams from wasting time"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Teams from using strategic plays")
                        ],
                        correctAnswer: "Prevents teams from wasting time"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "What are technical fouls in basketball typically associated with?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Physical contact between players"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Unsportsmanlike conduct or rule violations not involving physical contact"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Legal and fair play"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Scoring points for the team")
                        ],
                        correctAnswer: "Unsportsmanlike conduct or rule violations not involving physical contact"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "What is the consequence of a technical foul in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The game is paused for a timeout"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The opposing team loses possession"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "The violating team is awarded free throws"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Free throws for the opposing team")
                        ],
                        correctAnswer: "Free throws for the opposing team"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "Why is it important for players and teams to be aware of the technical foul rule?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To encourage unsportsmanlike conduct"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To manipulate game situations"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To avoid free throws for the opposing team"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To navigate game situations successfully")
                        ],
                        correctAnswer: "To navigate game situations successfully"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "What does the technical foul rule aim to maintain in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Free throw accuracy"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Game momentum"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Unsportsmanlike conduct"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Player substitutions")
                        ],
                        correctAnswer: "Game momentum"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "When are technical fouls typically assessed in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "During halftime"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only in the final minutes of the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "At the beginning of each quarter"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Throughout the game in response to unsportsmanlike conduct or rule violations")
                        ],
                        correctAnswer: "Throughout the game in response to unsportsmanlike conduct or rule violations"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 9,
                        question: "What opportunity does the opposing team have as a result of a technical foul?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Directly score points for their team"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Take possession of the ball"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Request a timeout"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Be awarded free throws")
                        ],
                        correctAnswer: "Be awarded free throws"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "What does the substitution rule in basketball allow teams to do?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Change the basketball used in the game"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Challenge referee decisions"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Replace players during stoppages in play"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Alter the game duration")
                        ],
                        correctAnswer: "Replace players during stoppages in play"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "How do coaches strategically use substitutions in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To determine the game's outcome"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To decrease the number of players on the court"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To increase player fatigue"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To manage player fatigue and optimize team performance")
                        ],
                        correctAnswer: "To manage player fatigue and optimize team performance"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "Why is understanding the substitution rule essential for fans?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To predict game outcomes"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To influence referee decisions"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To appreciate player rotations and game dynamics"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To determine the game's duration")
                        ],
                        correctAnswer: "To appreciate player rotations and game dynamics"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "What does the substitution rule influence in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Player uniform design"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Game venue selection"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Dynamics of the game and player rotations"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Pre-game rituals")
                        ],
                        correctAnswer: "Dynamics of the game and player rotations"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "What do successful teams leverage substitutions for in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To limit player rotations"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To reduce team performance"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To capitalize on matchups and ensure peak performance"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "To increase player fatigue")
                        ],
                        correctAnswer: "To capitalize on matchups and ensure peak performance"
                    ),
                    SelectionModel.Data.SportData.Rules.RulesTest(
                        study_id: 10,
                        question: "When can teams make substitutions in basketball?",
                        answers: [
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only during halftime"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Throughout the game during stoppages in play"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "After every point scored"),
                            SelectionModel.Data.SportData.Rules.RulesTest.Answer(answer: "Only in the final minutes of the game")
                        ],
                        correctAnswer: "Throughout the game during stoppages in play"
                    )
                ]
            )
        )
    )
    
}
