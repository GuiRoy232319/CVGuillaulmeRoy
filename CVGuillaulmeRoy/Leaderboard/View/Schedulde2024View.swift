//
//  LiveLeaderboard.swift
//  GolfDeLaMarterie
//
//  Created by guill roy on 12/04/2024.
//

import SwiftUI
import Reachability



struct Schedule2024View: View {
    var manager = ScheduleAPI()
    @State var tours = [Tournament]()
    @State var pickerChoice: Int = 0
    var tournamentStatus : [String] = ["En Cours","Tournois Finis","A venir"]
    var body: some View {
        if isWifiConnected(){
            NavigationStack{
                Picker(selection: $pickerChoice, label: Text("Tournois")) {
                    ForEach(0..<3){ index in
                        Text(tournamentStatus[index])
                    }
                }.pickerStyle(.segmented)
                    .padding(.vertical, 15.0)
                    .padding(.horizontal, 5)
                List(tours, id: \.Name) { tournament in
                    if pickerChoice == 0{
                        if tournament.IsInProgress{
                            NavigationLink(tournament.Name, destination: LeaderboardView(id: tournament.TournamentID))
                                .bold()
                        }
                    }
                    if pickerChoice == 1{
                        if tournament.IsOver{
                            NavigationLink(tournament.Name, destination: LeaderboardView(id: tournament.TournamentID))
                                .bold()
                        }
                    }
                    if pickerChoice == 2{
                        
                    }
                }
                
                .navigationTitle(LocalizedStringKey("Schedule"))
                .task{
                    tours = try! await manager.fetchAllTournament()
                }
            }
        }
        else {
            Text("Aucune connexion internet")
        }
    }
    func isWifiConnected() -> Bool{
        let reachability = try! Reachability()
        if reachability.connection == .wifi || reachability.connection == .cellular {
            return true
        } else {
            return false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Schedule2024View()    }
}
