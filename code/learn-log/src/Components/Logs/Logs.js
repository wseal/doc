import LogItem from "./LogItem";

import "./Logs.css";

const Logs = () => {
  const logsData = [
    {
      date: new Date(),
      desc: "learn",
      time: 30,
    },
  ];

  return (
    <div className="logs">
      <LogItem date={new Date()} desc={"Learn React"} time={65} />
      <LogItem date={new Date()} desc={"Learn Vue"} time={65} />
    </div>
  );
};

export default Logs;
