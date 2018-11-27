# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#

info_set_2 = { hackathon: { title: "Sam helps Bender take over",
                            completed: true
                          },
               problem_statement: {
                            problem: "How could we get rid of all humans",
                            completed: true
                        },
               empathise: {
                            image_url: "https://res.cloudinary.com/dhodayze1/image/upload/v1543318018/hackathon_images/empathise-1.jpg",
                            completed: "true"
                        },
               ideate: {
                            image_url: "https://res.cloudinary.com/dhodayze1/image/upload/v1543318021/hackathon_images/ideate-1.png",
                            completed: "true"
                        },
              prototype: {
                            image_url: "https://res.cloudinary.com/dhodayze1/image/upload/v1543318039/hackathon_images/prototype-1.png",
                            completed: "true"
                        },
              test: {
                            timeframe: "2 weeks",
                            protocol: ["Pitch Skynet concept to Alphabet Board", "Deploy mastermind AI system"],
                            completed: "true"
                        }
            }

info_set_1 = { hackathon: { title: "Elon Helps Batman",
                            completed: true
                          },
                problem_statement: {
                            problem: "How could we defeat superman",
                            completed: true
                            },
                empathise: {
                            image_url: "https://res.cloudinary.com/dhodayze1/image/upload/v1543318040/hackathon_images/empathise-2.jpg",
                            completed: "true"
                            },
                ideate: {
                            image_url: "https://res.cloudinary.com/dhodayze1/image/upload/v1543318032/hackathon_images/ideate-2.jpg",
                            completed: "true"
                            },
                prototype: {
                            image_url: "https://res.cloudinary.com/dhodayze1/image/upload/v1543318049/hackathon_images/prototype-2.jpg",
                            completed: "true"
                            },
                test: {
                            timeframe: "2 weeks",
                            protocol: ["Present to Justice League", "test with Wonderwoman"],
                            completed: "true"
                            }
                }

def populate_phases(hackathon, info_set)
    hackathon.hackathon_phases.each do |phase|
        phase.completed = true
        if phase.type == "DefinePhase"
            phase.problem_statement = info_set[:problem_statement][:problem]
        elsif phase.type == "EmpathisePhase"
            phase.image_url = info_set[:empathise][:image_url]
        elsif phase.type == "IdeatePhase"
            phase.image_url = info_set[:ideate][:image_url]
        elsif phase.type == "PrototypePhase"
            phase.image_url = info_set[:prototype][:image_url]
        elsif phase.type == "TestPhase"
            phase.test_timeframe = info_set[:test][:timeframe]
            phase.test_protocol = info_set[:test][:protocol]
    end
      phase.save
  end
end
                                

Hackathon.destroy_all
elon = User.where(name: "Elon").first
sam = User.where(name: "Sam").first
hackathon_arr = []
hackathon_1 = Hackathon.new(title: info_set_1[:hackathon][:title])
hackathon_2 = Hackathon.new(title: info_set_2[:hackathon][:title])
hackathon_arr << hackathon_1 << hackathon_2

hackathon_arr.each { |hackathon| hackathon.generate_phases }

populate_phases(hackathon_1, info_set_1)
populate_phases(hackathon_2, info_set_2)

hackathon_arr.each { |hackathon| hackathon.completed = true }

hackathon_1.users << elon
hackathon_2.users << sam

hackathon_1.save
hackathon_2.save

puts hackathon_1
puts hackathon_1.hackathon_phases

puts hackathon_2
puts hackathon_2.hackathon_phases
