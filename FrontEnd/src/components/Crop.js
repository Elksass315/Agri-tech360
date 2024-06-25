import React, { useState } from "react";
import axios from "axios";
import "../css/crop.css";
import ChatBot from "./ChatBot";
import Navbar from "./Navbar";

function Crop() {
  const [selectedFile, setSelectedFile] = useState(null);
  const [result, setResult] = useState(null);
  const [previousCrop, setPreviousCrop] = useState("");
  const handleFileChange = (event) => {
    setSelectedFile(event.target.files[0]);
    setResult(null);
  };
  const handleTextChange = (event) => {
    setPreviousCrop(event.target.value);
    setResult(null);
  };

  const handleUpload = async () => {
    try {
      const formData = new FormData();
      formData.append("file", selectedFile);
      formData.append("previous_crop", previousCrop);
      const response = await axios.post(
        "https://684e-105-197-187-225.ngrok-free.app/recommend-crop",
        formData,
        {
          headers: {
            "Content-Type": "multipart/form-data",
            Authorization:
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNoZXJ5b29AZ21haWwuY29tIiwiZXhwIjoxNzIwMTE0MTEyfQ.utwju-UuCVcFHQh2351056nCKeEMZgLHnJUmxwsQSFk",
          },
        }
      );
      setResult(response.data.data);
    } catch (error) {
      console.error("Error uploading image:", error);
    }
  };

  return (
    <div
      className="crop"
      style={{
        height: result && selectedFile ? "940px" : "742.5px",
      }}
    >
      <Navbar isActive="crop" />
      <div
        className="text-application"
        style={{
          "padding-bottom": selectedFile ? "60px" : "",
          top: result ? "37%" : "57%",
        }}
      >
        <h1 style={{ padding: selectedFile ? "0" : "" }}>
          <span>Agri-tech360</span> Detector
        </h1>
        <div className="selected-image">
          {selectedFile && (
            <img src={URL.createObjectURL(selectedFile)} alt="Selected" />
          )}
        </div>
        <div
          className="custom-file-input"
          style={{
            transform: selectedFile ? "translateY(10px)" : "translateY(-50px)",
          }}
        >
          <input
            type="file"
            accept="image/*"
            onChange={handleFileChange}
            className="file-input"
            id="fileInput"
          />
          <label htmlFor="fileInput" className="custom-button">
            Choose Image
          </label>
        </div>
        <div
          className="text-crop"
          style={{
            top: selectedFile ? "80%" : "60%",
          }}
        >
          <input
            type="text"
            onChange={handleTextChange}
            className="text-input"
            style={{
              border: "none",
              "border-radius": "15px",
              padding: "0.65625rem 16px",
              color: "rgb(255, 255, 255)",
              "font-weight": 400,
              "font-size": "0.875rem",
              display: "block",
              width: "95%",
              background: "linear-gradient(90deg, #ebb461, #fa8966)",
              margin: "1.5rem 0",
              top: selectedFile ? "80%" : "60%",
            }}
            placeholder="What pervious crop ?"
            id="fileInput"
          />
        </div>
        <button
          className="custom-button"
          onClick={handleUpload}
          style={{
            transform: selectedFile ? "translateY(10px)" : "translateY(-50px)",
          }}
        >
          Upload
        </button>
        {result && (
          <div className="result-box">
            <h2>
              <span>Result:</span>
            </h2>
            <p>
              <span>Recommended Crop: </span> {result["recommended crop"]}
            </p>
            <p>
              <span>Confidence: </span> {result.confidence}
            </p>
            <p>
              <span>soil type: </span> {result["soil type"]}
            </p>
            <p>
              <span>previous crop: </span> {result["previous crop"]}
            </p>
            <p>
              <span>Season: </span> {result["season"]}
            </p>
          </div>
        )}
      </div>

      <ChatBot />
    </div>
  );
}

export default Crop;
