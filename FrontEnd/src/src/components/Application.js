import React, { useState } from "react";
import axios from "axios";
import "../css/application.css";
import ChatBot from "./ChatBot";
import Navbar from "./Navbar";

function Application() {
  const [selectedFile, setSelectedFile] = useState(null);
  const [result, setResult] = useState(null);

  const handleFileChange = (event) => {
    setSelectedFile(event.target.files[0]);
    setResult(null);
  };

  const handleUpload = async () => {
    try {
      const formData = new FormData();
      formData.append("file", selectedFile);

      const response = await axios.post(
        "https://c9f1-102-189-209-60.ngrok-free.app/classify",
        formData,
        {
          headers: {
            "Content-Type": "multipart/form-data",
            Authorization:
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNoZXJ5b29AZ21haWwuY29tIiwiZXhwIjoxNzE0ODEzNjg0fQ.X5kA_NoJgAZ5h8Ng1BOP1D3Kx7T7GMYsg-y3aCDAB1U",
          },
        }
      );
      setResult(response.data.data);
    } catch (error) {
      console.error("Error uploading image:", error);
    }
  };

  return (
    <div className="application">
      <Navbar isActive="app" />
      <div className="text-application">
        <h1 style={{ padding: selectedFile ? "0" : "" }}>
          <span>Agri-tech360</span> Detector
        </h1>
        <div className="selected-image">
          {selectedFile && (
            <img src={URL.createObjectURL(selectedFile)} alt="Selected" />
          )}
        </div>
        <div className="custom-file-input">
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
        <button className="custom-button" onClick={handleUpload}>
          Upload
        </button>
        {result && (
          <div className="result-box">
            <h2>
              <span>Result:</span>
            </h2>
            <p>
              <span>Predictions:</span> {result.predictions}
            </p>
            <p>
              <span>Confidence:</span> {result.confidence}
            </p>
            <p>
              <span>Information:</span> {result.information}
            </p>
          </div>
        )}
      </div>

      <ChatBot />
    </div>
  );
}

export default Application;
