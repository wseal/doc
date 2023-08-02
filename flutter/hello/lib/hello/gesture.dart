import 'package:event_bus_plus/event_bus_plus.dart';
import 'package:flutter/material.dart';

class GuestureApp extends StatelessWidget {
  const GuestureApp({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GuestureHome()
    );
  }
}

class GuestureHome extends StatelessWidget {
  const GuestureHome({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Gesture and EventBus")
      ),
      body: FluterEventBus(),
    );
  }
}

class PointEvent extends StatelessWidget {
  const PointEvent({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Listener(
        onPointerDown: (event) {
          print("postion: ${event.position}");
          print("local position: ${event.localPosition}");
        },

        onPointerMove: (event) {

        },

        onPointerUp: (event) {

        },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.green,
        ),
      ),
    );
  }
}

class GuestureEvent extends StatelessWidget {
  const GuestureEvent({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTapDown: (event) {
              print("outlet gesture point ${event.localPosition}");
              print("outlet global point ${event.globalPosition}");
            },

            onTapUp: (event) {

            },
            child: Container(
              width: 150,
              height: 300,
              color: Colors.yellow,
            ),
          ),

          // 忽略手势事件
          IgnorePointer(
            child:  GestureDetector(
              onTapDown: (event) {
                print("inner gesture point ${event.localPosition}");
                print("inner global point ${event.globalPosition}");
              },
              child: Container(
                width: 100,
                height: 200,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}

var eventBus = EventBus();

class EventBusEvent extends AppEvent {
  final int Type;
  final String Data;

  const EventBusEvent(this.Type, this.Data):super();

  @override
  List<Object?> get props => [Type, Data];
}

class FluterEventBus extends StatefulWidget {
  const FluterEventBus({Key? key}):super(key: key);

  @override
  State<FluterEventBus> createState() => _FluterEventBusState();
}

class _FluterEventBusState extends State<FluterEventBus> {
  var _data = "hello";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eventBus.on<EventBusEvent>().listen((event) {
      print("event-->${event.Type} | ${event.Data}");
      setState(() {
        _data = "${event.Type}|${event.Data}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        SizedBox(
          width: 200,
          height: 100,
          child: TextButton(
              onPressed: () {
                eventBus.fire(const EventBusEvent(10, "event"));
              },
              child: const Text("click",
                  style: TextStyle(fontSize: 30, color: Colors.green))),
        ),

        Text(
          "$_data", style: const TextStyle(fontSize: 40, color: Colors.purple),)
      ],
    );
  }
}



