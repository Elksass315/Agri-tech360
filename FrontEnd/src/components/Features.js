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
      question: "Care reminders",
      answer:
        "Set personalized reminders so you don’t forget to water, repot, and fertilize all of your green buddies",
    },
    {
      question: "Plant identification",
      answer:
        "Discover 30,000+ greeneries, flowers, succulents, and trees in a snap.",
    },
    {
      question: "Water calculator",
      answer:
        "Get watering tips based on your plant type and the size of a pot.",
    },
    {
      question: "Gardening schedule",
      answer:
        "Plan your seeding season with a personalized gardening calendar.",
    },
    {
      question: "Weather alerts",
      answer:
        "Learn how to care for your green buddies in specific weather conditions.",
    },
  ];

  const feticon = [bell, crop, time, seed, sun];

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
