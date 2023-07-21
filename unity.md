# Unity

- 消息函数（修改脚本的 Execution Order，调整脚本的执行顺序）

  - Awake: 初始化，仅执行一次
  - Start: 初始化，仅执行一次，禁用状态下 start 不会被调用
  - Update: 帧更新，每帧调用一次
  - OnEnable: 组件启用时调用
  - OnDisable: 组件禁用时调用

- 脚本参数

  - 定义默认值：public float roateSpeed = 30f;
  - 在检查器中赋值(unity editer 中)
  - 在 Awake 中初始化
  - 在 Start 中初始化

- 参数类型

  - 值类型：int，float、bool
  - 值类型(struct): Vector3, Color
  - 引用类型(class): GameObject， Transform， MeshRenderer

- Play music

```
AudioSource audio = this.GetComponent<AudioSource>();
audio.play();
if (audio.isPlaying) {
    audio.stop();
}
```

- 引用别的组件

  - define public values
  - use target object to init value

- 引用脚本组件

  - api 获取：FanLogin fun = node.getComponent<FanLogic>();
  - 直接引用(检查器拖拽赋值)：定义 public 变量 public FanLoginc fan；

- 消息调用（使用反射机制实现，并非真的发送消息）

  - 找到目标节点: public GameObject target;
  - 发送消息: target.SendMessage(methodName, value);

- 父子物体(root 节点的 parent 为 null)

  - 获取父节点 transform: this.transform.parent;
  - 获取父节点: this.transform.parent.gameObject;

- 遍历子节点

```
public iterator() {
    foreach(Transform child in transform)
    {
        Debug.Log("-->" + child.name);
    }

}
```

- 查找子节点

  - this.transform.Find("name");
  - this.getChild(0);

- 设置节点的父级

  - this.transform.SetParent(other);
  - this.transform.SetParent(null); // 设置为一级节点

- 显示隐藏

```
    Transform child = this.transform.Find("aa");
    if (child.gameObject.activeSelf) {
        child.gameObject.SetActive(false);
    } else {
        child.gameObject.SetActive(true);
    }

```

- 播放音效

```
public AudioClip audioSuccess;
public Update()
{
    if (Input.GetKeyDown(KeyCode.A)) {
        AudioSource audioSource = GetComponent<AudioSource>();
        audioSource.PlayOneShot(audioSuccess);
    }
}
```

- 播放音乐

```
public AudioClip[] songs;
public void next() {
    int index = Random.Range(0, songs.length);

    AudioSource ac = GetComponent<AuditSource>();
    ac.clip = this.songs[index];
    ac.play();
}
```

- 材质切换

```
public Material[] colors;
public int m_index = 0;
public void Update() {
    if (Input.GetMouseButtonDown(0))
    {
        m_index = (m_index + 1) % this.color.length;
        Material select = this.color[m_index];
        MeshRenderer rd = GetComponent<MeshRenderer>();
        rd.material = select;
    }

}

```

- 定时器

  - Invoke(func, delay) - 调用一次
  - InvokeRepeating(func, delay, interval) - 循环调用
  - IsInvoking(func) - 是否正在调度
  - CancelInvoke(func) - 取消调用，从调度队列移除，无参数的时候，删除当前脚本所有调度

- 向量

  - normalize: 标准化
  - magnitude 长度
  - Vector3.back
  - Vector3.zero
  - Vector3.up: (0, 1, 0)
  - Vector3.right : (1, 0, 0)
  - Vector3.forward: (0, 0, 1)

- 预制体编辑

  - 双击 Prefab，进入单独编辑模式
  - 编辑节点和组件
  - 退出

  - 选择 Prefab Instance
  - 在检查器中 Open
  - Context 显示：Normal、Gray、Hidden

  - 选择 Prefab Instance
  - 场景中编辑
  - 应用、取消

- 预制体动态创建: Object.Instantiate(prefab, parent)

```
public Transform bulletFolder；
public GameObject bulletPrefab;

public Transform firePoint;
public Transform cannon；

void Update() {
    GameObject node = Object.Instantiate(bulletPrefab, bulletFolder);
    node.transform.postion = this.firPoint.position; // Vector3.zero;
    node.transform.localEulerAngles = this.cannon.eulerAngles; // Vector3.zero;

    // 或者 node.transform.rotation = this.cannon.rotation;
}
```

- 预制体对象销毁： Object.Destroy(this.gameObject);

- 刚体

- 物理碰撞

  - 创建物理材质： Physici Material
  - 设置摩擦、反弹：Friction、Bounciness

- 修改天空盒子

  - Window->Rendering->Lighting

# particle system

- 贴图：黑底、透明底、
  - Shader: Particles | Standard Unlit
  - Render Mode: Additive
  - Color Mode: Multiply
  - Albedo: 指定贴图

# cocos creator

- ## node

  - this.node
  - this.node.children[0]
  - this.node.getChildByName("");
  - cc.find("aa/bb/cc")
  - this.node.getParent();
  - this.node.setParent(newNode);
  - this.node.removeAllChildren();
  - this.enabled
  - this.getComponent(cc.Sprite)
  - this.getComponents(cc.Sprite)
  - this.node.getComponentInChildren(cc.Sprite);
  - this.node.addComponent(cc.Sprite);
  - let node = cc.instantiate(this.prefab);
  - node.setParent(this.node);
  - 加载资源

  ```
    let self = this;
    cc.loader.loadRes("dir/resource name", cc.SpriteFrame, function(err, res) {
      self.getComponent(cc.Sprite).spriteFrame = res;
    });

    cc.loader.loadRes("", cc.SpriteAtlas， function(err, atlas: cc.SpriteAtlas) {
      self.getComponent(cc.Sprite).spriteFrame = atlas.getSpriteFramte("bg_day");
    });

  ```

  - 切换场景

  ```
    cc.director.loadScene("scene name", function() {
      // 切换了场景
    })

    cc.director.preloadScene("game scene", function() {
      // 资源加载完成，但未切换场景
      cc.director.loadScene("game scene");
    })

    // 常驻节点
    cc.game.addPersistRootNode(this.node);
    cc.game.removePersistRootNode(this.node); // 从常驻的内存删除，但是当前场景依然可用

  ```

  - cc.systemEvent.on(cc.SystemEvent.EventType.KEY_DOWN, function(event) {})

  - this.node.on(cc.Node.EventType.TOUCH_START, function(event) {})

  - this.node.on("custom event", function(event) {})
  - this.node.emit("custom event")
  - this.node.dispatchEvent(new cc.Event.EventCustom("custome event", true))
  - collisioin

  ```
    // 添加碰撞组件
    // 开启碰撞
    cc.director.getCollisionManager().enable = true;

    onCollisionEnter(other, self) {
      if (other.tag == "") {

      }
    }

    onCollisionStay(other) {
      // 持续碰撞ing
    }

    onCollisionExit(other) {

    }
  ```

  - 音频

  ```
  let play : cc.AudioSource = this.getComponent(cc.AuditSource);
  cc.loader.loadRes("", cc.AudioClip, (err, clip)=>{
    play.clip = clip;

    clip.play();
    clip.isPlaying;
    clip.pause();
  })


  cc.loader.loadRes("", cc.AudioClip, (err, clip)=>{
    let audioId: number = cc.audioEngine.playMusic(clip, true);

    cc.audioEngine.pauseMusic(); // 通常背景音乐就一个，不用区分id
    cc.audioEngine.resume(audioID);
    cc.audioEngine.pause(audioID);

  })
  ```

- 物理系统

```
 // 开启物理系统
 cc.director.getPhysicsManager().enable = true;

 // 组件添加物理刚体
 // 对于高速运动的物体的碰撞检测可能需要选择bullet

 // 刚体类型
 // static - 不受重力，不受冲量 影响
 // Kinematic - 不受重力影响，但受到冲量影响
 // dynamic - 受到重力、冲量影响
 // animated - 参与动画，不受到物理系统影响，通常用于动画

 // Gravity Scale - 受到重力影响的比例
 // Linear Damping - 线性阻力
 // Angular damping - 角速度阻力
 // Fixed Rotation - 禁止旋转滚动

 let rbody = this.getComponent(cc.RigidBody);
 rbody.applyForce(cc.v2(), cc.v2()); // 给一个受力
 rbody.linearVelocity = cc.v2(50, 0); // 给一个速度

 // Sensor - 是否是触发器-只检测碰撞，但不会有阻挡效果，物品可穿过碰撞物，不能获取碰撞点和法线，只能获得碰撞的两个物品
 // 摩擦系数
 // 弹性系数

 // 需要开启Enabled Contact Listener,否则没有碰撞回调
 onBeginContact(contact, self, other) {
  // 物理碰撞点
  let points = contact.getWorldManifold().points;

  // 法线，方向向量
  let normal = contact.getWorldManifold().normal;

 }
```

- 射线

```
  // cc.RayCastType
  // All            - 返回多个点，一个碰撞物体可能有多个点
  // AllClosest     - 返回多个点，每个碰撞物体只包含一个
  // Any            - 一个点，返回任何一个碰撞点
  // Closet         - 一个点，返回最近碰撞的点
  let res = cc.director.getPhysicManager().rayCast(this.node.getPosition(), cc.v2(x, y), cc.RayCastType.Closet);

  for (let i =0; i<res.lenght; i++) {
    let item = res[i];

    // 碰的碰撞器
    res.collider

    // 碰到的点
    res.point

    // 碰点的法线
    res.normal
  }
```

- 动作

```
let action = cc.moveTo(2, 300, 200);
action.setTag(3);

// 移动，旋转，缩放，跳跃，闪烁，淡出淡入，颜色
// move,rotate,scale,jump,blink,fadeIn,fadeOut,tintTo

this.node.runAction(action);
this.node.stopAction(action);
this.node.stopAllActinos();

this.node.stopActionByTag(1);
this.node.stopAllActions();
this.node.resumeAllActions();


// 瞬时动作
cc.show();
cc.hide();
cc.toggleVisibility();
cc.flipX();
cc.flipY();
cc.callFunc(()=>{})


// 容器动作
let seq = cc.sequence(action1, action2, cc.delayTime(1), cc.callFunc(()=>{}));

// 重复动作
let repeat = cc.repeat(action, 3);
cc.repeatForever(seq);

// 并行动作
let spawn = cc.spawn(action1, action2);

this.node.runAction(seq);

```

- 动画系统

```
// 添加animation组件

// 编辑动画

// 动画可用添加事件回调，播放动画的某个点触发业务逻辑


let ani = this.getComponent(cc.Animation);

ani.play("run");
ani.pause();
ani.resume();
ani.stop();


```

- UI 系统(尽量节点都放在 canvas 下面)

```
// 富文本可以响应事件

// Sprite:
//    图集、图片
// 1-SIMPLE正常
// 2-SLICED九宫格，然后编辑
// 3-TILED填充
// 4-FILLED百分比填充
// 5-MESH


// Canvas - 所有ui必须必须在canvas节点下面
// Overlay：Canvas贴在镜头上，所有ui元素在场景物体前方

// Camera: 用camera渲染ui，但是排列顺序根据场景内元素的叠加关系显示，修改canvas到镜头的距离，修改uid大小
//         order layer: 影响UI叠加关系，越大越靠前
//         sorted layer:影响UI叠加关系，越大越靠前，多层ui，用于制作特效
//         UI一般最多设置5层，BackCanvas，BackEffect，MiddleCanvas，MiddleEffect,FrontCanvas

// World Space: Vr游戏一般用的比较多
//

// 一个完整页面一个panel，四锚点，跟canvas一样大
```

- tield map

```
start() {
  this.map = this.getComponent(cc.TiledMap);

  let playerLayer = this.map.getObjectGroup("player")；

  let obj = playerLayer.getObject("startPos");

  if (obj.isPlayer) {
    cc.loader.loadRes("player", cc.Prefab, (err, playerPrefab) =>{
      this.player = cc.instantiate(playerPrefab);
      this.player.setParent(this.node.children[2].children[0]);
      this.player.x = obj.x;
      this.player.y = obj.y;
    })
  }

}

// 摄像机跟随
update(dt) {
  if (this.player != null) {
    cc.Camrea.main.node.x = this.player.x;
    cc.Camera.main.node.y = this.player.y;
  }
}
```
