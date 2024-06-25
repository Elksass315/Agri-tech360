import { useEffect, useState } from "react";
function Identify() {
  const [activeIndex, setActiveIndex] = useState(0); // State to track the active index

  const instructions = [
    "Open Agri-tech360 and tap the camera button in the Plant Health tab",
    "Place your sick plant or soil at the center of the frame  ",
    "Snap photos of the diseased parts of a leaf or multiple leaves or snap soil and provide pervious crop",
    "That’s it! Now you know the issue and how to cure it  , or  suggestion for next crop",
  ];
  useEffect(() => {
    const interval = setInterval(() => {
      setActiveIndex((prevIndex) =>
        prevIndex < instructions.length - 1 ? prevIndex + 1 : 0
      ); // Increment index or reset to 0
    }, 3000);

    // Clear the interval on component unmount
    return () => clearInterval(interval);
  }, []); // Run only once on component mount

  return (
    <>
      <ul>
        {instructions.map((instruction, index) => (
          <li
            key={index}
            style={{
              color: index === activeIndex ? "#2c6455" : "#718096",
              fontWeight: index === activeIndex ? "600" : "400",
            }}
          >
            <span
              style={{
                marginRight: "0.5rem",
                background: index === activeIndex ? "#63b68e" : "#fff",
                color: index === activeIndex ? "#fff" : "#cbd5e0",
              }}
            >
              {index + 1}
            </span>
            {instruction}
          </li>
        ))}
      </ul>
    </>
  );
}

export default Identify;
