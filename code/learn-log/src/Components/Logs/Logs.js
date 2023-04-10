import LogItem from "./LogItem";

import "./Logs.css";

const Logs = () => {
  return (
    <div className="logs">
      <LogItem date={new Date()} desc={"Learn React"} time={65} />
      <LogItem date={new Date()} desc={"Learn Vue"} time={65} />
    </div>
  );
};

export default Logs;
