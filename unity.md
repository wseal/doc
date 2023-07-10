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
