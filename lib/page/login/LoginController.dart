import 'package:blog_mobile/page/login/LoginState.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logincontroller extends StateNotifier<LoginState>{
  Logincontroller():super(LoginState()){

    Future<void> soumettreFormulaire() async {
      state = state.copyWith(isLoading: true);
      await Future.delayed(Duration(seconds: 3));
      state = state.copyWith(isLoading: false);
    }
  }



}
final loginCrtlProvider = StateNotifierProvider<Logincontroller,LoginState>((ref){
 ref.keepAlive();
  return Logincontroller();
});