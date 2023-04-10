import "./LogItem.css";

const LogItem = () => {
  return (
    <div className="item">
      {/*  */}
      <div className="date">
        <div className="month">April</div>
        <div className="day">19</div>
      </div>

      {/*  */}
      <div className="content">
        <h2 className="desc">learn</h2>
        <div className="">50 min</div>
      </div>
    </div>
  );
};

export default LogItem;
