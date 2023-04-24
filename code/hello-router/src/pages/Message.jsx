import React, { useState } from "react";
import { Link, Outlet } from "react-router-dom";

export default function Message() {
  const [messages] = useState([
    {
      id: "001",
      title: "message1",
      contnt: "白日依山尽",
    },
    {
      id: "002",
      title: "message2",
      contnt: "黄河入海流",
    },
    {
      id: "003",
      title: "message3",
      contnt: "欲穷千里目",
    },
    {
      id: "004",
      title: "message4",
      contnt: "更上一层楼",
    },
  ]);
  return (
    <div>
      <ul>
        {messages.map((m) => {
          return (
            <li key={m.id}>
              <Link
                to="detail"
                state={{ id: m.id, title: m.title, content: m.contnt }}
              >
                {m.title}
              </Link>
            </li>
          );
        })}
      </ul>

      <Outlet />
    </div>
  );
}
