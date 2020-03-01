import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';
import 'package:pond_hockey/screens/account/account.dart';
import 'package:pond_hockey/screens/home/home.dart';
import 'package:pond_hockey/screens/login/login.dart';
import 'package:pond_hockey/screens/tournaments/add_teams/add_teams.dart';
import 'package:pond_hockey/screens/tournaments/add_tournament/add_tournament.dart';
import 'package:pond_hockey/screens/tournaments/details/managing/manage_tournament.dart';
import 'package:pond_hockey/screens/tournaments/details/scoring/score_tournament.dart';
import 'package:pond_hockey/screens/tournaments/details/viewing/view_team.dart';
import 'package:pond_hockey/screens/tournaments/details/viewing/view_tournament.dart';
import 'package:pond_hockey/screens/tournaments/tournaments.dart';

@CustomAutoRouter()
class $Router {
  @CustomRoute(initial: true, transitionsBuilder: TransitionsBuilders.slideTop)
  HomeScreen home;
  @CustomRoute(transitionsBuilder: TransitionsBuilders.fadeIn)
  LoginScreen login;
  @CustomRoute(transitionsBuilder: TransitionsBuilders.slideLeftWithFade)
  AccountScreen account;
  @CustomRoute(transitionsBuilder: TransitionsBuilders.slideLeftWithFade)
  TournamentsScreen tournaments;
  @CustomRoute(transitionsBuilder: TransitionsBuilders.slideRightWithFade)
  ViewTournament tournamentDetails;
  @CustomRoute(transitionsBuilder: TransitionsBuilders.slideRightWithFade)
  ScoreTournament scoreTournament;
  @CustomRoute(transitionsBuilder: TransitionsBuilders.slideRightWithFade)
  ManageTournament manageTournament;
  @CustomRoute(transitionsBuilder: TransitionsBuilders.slideRightWithFade)
  TeamDetailsScreen teamDetails;
  @CustomRoute(transitionsBuilder: TransitionsBuilders.slideRight)
  AddTournamentScreen addTournament;
  @CustomRoute(transitionsBuilder: TransitionsBuilders.slideRight)
  AddTeamsScreen addTeams;
}
