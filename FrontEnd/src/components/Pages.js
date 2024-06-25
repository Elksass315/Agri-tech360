import Home from "./Home";
import About from "./About";
import Application from "./Application";
import Library from "./Library";
import PlantListPage from "./PlantListPage";
import Crop from "./Crop";
import { Routes, Route } from "react-router-dom";
function Pages() {
  return (
    <>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/about" element={<About />} />
        <Route path="/application" element={<Application />} />
        <Route path="/crop" element={<Crop />} exact />
        <Route path="/library" element={<Library />} />
        <Route path="/library/:id" element={<PlantListPage />} />
      </Routes>
    </>
  );
}

export default Pages;
