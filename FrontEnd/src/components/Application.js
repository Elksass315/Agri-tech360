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
  };

  const handleUpload = async () => {
    try {
      const formData = new FormData();
      formData.append("file", selectedFile);

      const response = await axios.post(
        "http://localhost:8000/classify",
        formData,
        {
          headers: {
            "Content-Type": "multipart/form-data",
            Authorization:
              "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNoZXJ5b29AZ21haWwuY29tIiwiZXhwIjoxNzE0MzQ2NDgxfQ.Rsx8pb3_kXrEtHLGhNfBExk6Uzp6H9vAefJuiNbsyz0",
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
          <div className="">
            <h2>Result:</h2>
            <p>Predication: {result.prediction}</p>
            <p>Confidence: {result.confidence}</p>
            <p>information: {result.information}</p>
          </div>
        )}
      </div>
      <ChatBot />
    </div>
  );
}

export default Application;
