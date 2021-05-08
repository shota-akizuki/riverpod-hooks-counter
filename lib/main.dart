import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_notifier/state_notifier.dart';

//グローバルにProviderを宣言する
final counterProvider = StateNotifierProvider((_) => Counter());

//カウンターのモデル
class Counter extends StateNotifier<int> {
  //初期値を代入
  Counter() : super(0);
  void increment() => state++;
}

//Providerにスコープを設定する
void main() {
  runApp(
    ProviderScope(
      child: CounterApp(),
    ),
  );
}

//Hooksを使うにはHookWidgetを継承する
class CounterApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    //stateを読み込むにはuseProviderを使う
    final state = useProvider(counterProvider.state);
    //Counterモデルをcounter変数に格納
    final counter = useProvider(counterProvider);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("CounterApp"),
        ),
        body: Center(child: Text(state.toString())),
        floatingActionButton: FloatingActionButton(
          onPressed: () => counter.increment(),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
