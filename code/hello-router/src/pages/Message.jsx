import React, { useState } from "react";
import { Link, Outlet, useNavigate } from "react-router-dom";

export default function Message() {
  const navigate = useNavigate();

  const [messages] = useState([
    {
      id: "001",
      title: "message1",
      content: "白日依山尽",
    },
    {
      id: "002",
      title: "message2",
      content: "黄河入海流",
    },
    {
      id: "003",
      title: "message3",
      content: "欲穷千里目",
    },
    {
      id: "004",
      title: "message4",
      content: "更上一层楼",
    },
  ]);

  function showDetail(m) {
    navigate("detail", {
      replace: false,
      state: {
        id: m.id,
        title: m.title,
        content: m.content,
      },
    });
  }
  return (
    <div>
      <ul>
        {messages.map((m) => {
          return (
            <li key={m.id}>
              <Link
                to="detail"
                state={{ id: m.id, title: m.title, content: m.content }}
              >
                {m.title}
              </Link>
              <button onClick={() => showDetail(m)}>click</button>
            </li>
          );
        })}
      </ul>

      <Outlet />
    </div>
  );
}
