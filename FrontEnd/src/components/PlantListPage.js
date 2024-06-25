import React from "react";
import { useParams } from "react-router-dom";
import plantsData from "./data.json";
import "../css/PlantListPage.css";
import Navbar from "./Navbar";

function PlantListPage() {
  const { id } = useParams();
  const plantId = parseInt(id);
  const plant = plantsData.find((plant) => plant.id === plantId);

  return (
    <>
      <Navbar isActive="library" />
      <div className="plant-details">
        {plant && (
          <div className="description">
            <div className={plant.name}>
              <img src={plant.img} alt={plant.name} />
            </div>
            <div className="text-descrip">
              <h2>{plant ? plant.name : "Plant not found"}</h2>
              <p>{plant.description}</p>
            </div>
          </div>
        )}

        <div className="signs">
          <h3>Signs of damage :</h3>
          <p>{plant.signs}</p>
        </div>
      </div>
    </>
  );
}

export default PlantListPage;
