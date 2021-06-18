import 'package:bloc/bloc.dart';
import 'package:food_online/Pages/UI/CartPage.dart';
import './Pages/UX/HomePage.dart';
import 'Pages/UI/AccountPage.dart';

enum NavigationEvents {
  HomePageClickEvent, AccountClickEvent, CartClickEvent}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates>{
  NavigationBloc(NavigationStates initialState) : super(initialState);

  NavigationStates get initialState => initialState;

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async*{
    switch(event){
      case NavigationEvents.HomePageClickEvent:
        yield HomePage();
        break;
      case NavigationEvents.AccountClickEvent:
        yield AccountPage();
        break;
      case NavigationEvents.CartClickEvent:
        yield CartPage();
        break;
    }
  }
}
