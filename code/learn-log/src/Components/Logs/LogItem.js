import "./LogItem.css";

const LogItem = (props) => {
  return (
    <div className="item">
      {/*  */}
      <div className="date">
        <div className="month">April</div>
        <div className="day">19</div>
      </div>

      {/*  */}
      <div className="content">
        <h2 className="desc">{props.desc}</h2>
        <div className="">{props.time}min</div>
      </div>
    </div>
  );
};

export default LogItem;
