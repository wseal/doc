import React from "react";
import { useParams } from "react-router-dom";

export default function Detail() {
  const { id, title, content } = useParams();

  // const math = userMatch("/home/message/detail/:id/:title/:content")

  return (
    <ul>
      <li>{id}</li>
      <li>{title}</li>
      <li>{content}</li>
    </ul>
  );
}
