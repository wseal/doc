import "./App.css";

// import Hello from "./components/Hello/Hello";
import Header from "./components/Header";
import List from "./components/List";
import Footer from "./components/Footer";

// create and export

export default function App() {
  return (
    <div className="App">
      <Header />
      <List />
      <Footer />
    </div>
  );
}
