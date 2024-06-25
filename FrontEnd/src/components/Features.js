import { useState } from "react";
import bell from "../asests/bell.png";
import time from "../asests/time.png";
import seed from "../asests/seed.png";
import crop from "../asests/crop.png";
import sun from "../asests/sun.png";
import arrow from "../asests/arrow.png";

function Features() {
  const FeatData = [
    {
      question: "Plant identification",
      answer:
        "Discover more greeneries, flowers, succulents, and trees in a snap.",
    },
    {
      question: "Next Crop Suggestion",
      answer:
        "Utilize Agri-Tech360 to capture images of your soil and previous crops. Our advanced technology will analyze the data and recommend the optimal next crop for your agricultural needs",
    },
    {
      question: "Plant information library",
      answer:
        "Agri-Tech360 offers an extensive library containing detailed information on a wide variety of plants. This comprehensive resource supports informed decision-making for your agricultural practices ",
    },
    {
      question: "Agri-Tech360 Smart Store",
      answer:
        "Our AI system not only detects diseases but also recommends the most effective treatments.",
    },
    {
      question: "AI Assistant",
      answer:
        "Discover how to care for your plants in specific conditions with our AI Assistant. Gain expert insights and guidance on plant care tailored to your needs",
    },
  ];

  const feticon = [crop, seed, time, bell, sun];

  const [answerView, setAnswerView] = useState({});

  const displayAnswer = (index) => {
    setAnswerView((prevState) => ({
      ...prevState,
      [index]: !prevState[index],
    }));
  };

  return (
    <div className="fet-list">
      <div className="container">
        {FeatData.map((faq, index) => (
          <div
            className="fet-item"
            key={index}
            onClick={() => displayAnswer(index)}
          >
            <img src={feticon[index]} alt="feticon"></img>
            <h3>{faq.question}</h3>
            <p
              className={answerView[index] ? "answer-visible" : "answer-hidden"}
            >
              {faq.answer}
            </p>
            <img src={arrow} alt="arrow" className="arrow" />
          </div>
        ))}
      </div>
    </div>
  );
}

export default Features;
