import 'package:flutter/material.dart';

class GoodsApp extends StatelessWidget {
  const GoodsApp({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: "商品列表",
      debugShowCheckedModeBanner: false,
      home: GoodsHomePage()
    );
  }
}

class GoodsHomePage extends StatelessWidget {
  const GoodsHomePage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("列表"),
      ),

      body: const GoodsBody(),
    );
  }
}

class GoodsBody extends StatelessWidget {
  const GoodsBody({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget> [
        GoodsItems("苹果", "苹果笔记本", "http://n.sinaimg.cn/photo/1_img/upload/cf3881ab/151/w1000h751/20181010/Uahf-hkrzyan6226668.jpg"),
        GoodsItems("苹果", "行摄地球边缘", "http://n.sinaimg.cn/photo/1_img/upload/cf3881ab/151/w1000h751/20181010/Uahf-hkrzyan6226668.jpg"),
        GoodsItems("苹果", "苹果笔记本", "http://n.sinaimg.cn/photo/1_img/upload/cf3881ab/210/w1000h810/20181010/I9q0-hkrzvkw5173130.jpg"),
      ],
    );
  }
}

class GoodsItems extends StatelessWidget {
  final String title;
  final String desc;
  final String url;

  const GoodsItems(this.title, this.desc, this.url);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(color: Colors.orange, fontSize: 20);

    // TODO: implement build
    return Column(
      children: [
        Text(title, style: style),
        Text(desc),
        const SizedBox(height: 8),
        Image.network(url),
      ],
    );
  }
}



