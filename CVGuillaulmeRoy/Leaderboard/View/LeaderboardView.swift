//
//  LeaderboardView.swift
//  GolfDeLaMarterie
//
//  Created by guill roy on 03/05/2024.
//

import SwiftUI


struct LeaderboardView: View {
    @State var tournamentData = LeaderBoard(Tournament: Tour(TournamentID: 0, Name: "", StartDate: ""), Players: [])
    @State var id : Int!
    var manager = leaderboardAPI()
    
    var body: some View {
        NavigationStack{
            Text("\(tournamentData.Tournament.StartDate)")
                .font(.footnote)
            List(tournamentData.Players, id: \.self) { player in
                HStack{
                    Text(player.Name)
                        .font(.headline)
                    Text(player.Country)
                        .font(.caption)
                        .italic()
                    Spacer()
                    if player.TotalScore != nil {
                        if player.TotalScore! < 0{
                            Text("\(Int(round(player.TotalScore!)))")
                                .fontWeight(.medium)
                                .foregroundColor(.red)
                        }
                        if player.TotalScore! >= 0{ Text("\(Int(round(player.TotalScore!)))")
                                .fontWeight(.medium)
                                .foregroundColor(.green)
                        }
                    } else{
                        Text("Missed Cut")
                            .font(.caption)
                            .italic()
                    }
                }
            }
            .navigationTitle(tournamentData.Tournament.Name)
            .task {
                tournamentData = try! await manager.fetchTournamentData(id: id!)
            }
        }
    }
}
 
struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(id: 487)    }
}
