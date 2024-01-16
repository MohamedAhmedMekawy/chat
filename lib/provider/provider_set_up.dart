import 'package:chat_app/config/locale/locale_vm.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (ctx) => AppLanguage()..getSavedLang()),

];
