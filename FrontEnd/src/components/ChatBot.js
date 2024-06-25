// ChatBot.js
import React, { useState } from "react";
import "../css/chatbot.css";
import plantrobo from "../asests/robo.png";
import send from "../asests/send.png";

function ChatBot() {
  const [userInput, setUserInput] = useState("");
  const [chatHistory, setChatHistory] = useState([]);
  const [showChat, setShowChat] = useState(false);

  const handleChange = (event) => {
    setUserInput(event.target.value);
  };

  const handleSubmit = async (event) => {
    event.preventDefault();

    try {
      const newQuestion = userInput.trim(); // Remove leading/trailing spaces
      if (!newQuestion) return; // Ignore empty questions

      const response = await fetch("http://127.0.0.1:5000/chatbot", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ user_input: newQuestion }),
      });
      const data = await response.json();

      // Update chat history with new question and response
      setChatHistory([
        ...chatHistory,
        { question: newQuestion, answer: data.response },
      ]);
      setUserInput(""); // Clear input field
    } catch (error) {
      console.error("Error:", error);
    }
  };

  const toggleChat = () => {
    setShowChat(!showChat);
  };

  const handleClose = () => {
    setShowChat(false);
  };

  return (
    <div className="chat-bot-container">
      {!showChat && (
        <button className="chat-button" onClick={toggleChat}>
          <img src={plantrobo} alt="robo"></img>
        </button>
      )}
      {showChat && (
        <div className="chat-window">
          <div className="chat-header">
            <span>Planty</span>
            <button className="close-button" onClick={handleClose}>
              X
            </button>
          </div>
          <div className="chat-messages">
            {chatHistory.map((entry, index) => (
              <div key={index} className="message">
                <div className="message-user">{entry.question}</div>
                <div className="message-bot">{entry.answer}</div>
              </div>
            ))}
          </div>
          <form onSubmit={handleSubmit} className="input-form">
            <input
              type="text"
              value={userInput}
              onChange={handleChange}
              placeholder="Ask a question..."
            />
            <button type="submit">
              <img src={send} alt="send img" className="arrow-icon" />
            </button>
          </form>
        </div>
      )}
    </div>
  );
}

export default ChatBot;
