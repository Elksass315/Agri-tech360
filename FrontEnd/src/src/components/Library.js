import React, { useState } from "react";
import plantsData from "../components/data.json";

import "../css/library.css";
import ChatBot from "./ChatBot";
import { Link } from "react-router-dom";
import Navbar from "./Navbar";
import boy from "../asests/young-man-sitting-at-computer-desk.png";

function Library() {
  const [expanded, setExpanded] = useState(false);

  const toggleExpanded = () => {
    setExpanded(!expanded);
  };

  return (
    <>
      <Navbar isActive="library" />
      <div className="library">
        <div className="hero-library">
          <h2>Plant Problems Diagnosis, Identification & Preventing</h2>
          <img src={boy} alt="boy"></img>
        </div>
        <button className="lib-btn">
          <Link to="/application">Try For Free</Link>
        </button>
        <div className="text">
          <div>
            <p>
              If you have houseplants or grow them in the garden, you have
              probably encountered problems such as illnesses and even the death
              of your plants. Plant diseases occur due to various causes, such
              as pathogens and adverse environmental conditions. They manifest
              in a violation of the functions and structure of the organism.
              More importantly, they may cause premature death of the plant or
              damage to its organs. Diagnosing different plant problems is key
              to the plant’s successful growth.
            </p>
            {!expanded && <button onClick={toggleExpanded}>Read More</button>}
            {expanded && (
              <>
                <h2>What Are the Common Problems in Plants?</h2>
                <p>
                  Protecting plants from diseases requires a thorough approach.
                  First, you should define the problem:
                </p>
                <ul>
                  <li>
                    Plant diseases: This is of the main plant problems, which
                    includes diseases, damages, and disorders which occur during
                    the plant’s growth.
                  </li>
                  <li>
                    Environmental problems: Experienced gardeners know to
                    consider the habitat in which plants grow for proper and
                    timely protection. Each plant species has its own set of
                    optimal values of factors under which the plants will be in
                    a normal state, and their immune responses to pathogens and
                    pests will be optimal.
                  </li>
                  <li>
                    Plant pests and invasive plants: Plant pests include
                    insects, bugs, and various weeds that may impact the plants.
                  </li>
                </ul>
                <p>
                  To save the crop, you need to notice changes in the plant's
                  appearance in time and take the necessary measures. It's easy
                  to define all these problems at PlantIn and get professional
                  help.
                </p>
                <h2>How to Diagnose Plant Problems ?</h2>
                <p>
                  Here is a short list of the steps you should take for easy
                  detection of the plant problems:
                </p>
                <ol>
                  <li>
                    Pay attention to your plants. Always notice when something
                    changes with your plant to detect the problems timely.
                    Frequent observations will help you solve the problem
                    instantly, so check the signs and symptoms first.
                  </li>
                  <li>
                    Learn the name of the plant. Some gardeners have so many
                    plants that they even forget which one is in front of them.
                    You need to know the plant’s name to figure out its disease.
                  </li>
                  <li>
                    Look at the leaves. The holes in the leaves often point at
                    the insect pests.
                  </li>
                  <li>
                    Look for the culprit. Look for the insects or their signs.
                  </li>
                  <li>
                    Use Plantin. With the Myplantin web version or the PlantIn
                    app for Android and iOS, you can use the identifier of the
                    plant disease that you can rely on in your further search.
                    Moreover, you can get expert help from professionals via the
                    platform.
                  </li>
                </ol>
                <p>
                  Don’t hesitate to identify your plant issues to solve them as
                  quickly as possible!
                </p>
                <p>
                  Are you thinking about how to diagnose my plant? No worries!
                </p>
                <p>
                  You can use our list of possible diseases, read helpful
                  articles, or promptly diagnose the plant and get a treatment
                  guide from our best botanist.
                </p>
              </>
            )}
            {expanded && <button onClick={toggleExpanded}>Hide</button>}
          </div>
        </div>
        <div className="container">
          {plantsData.map((plant) => (
            <div className="grid" key={plant.id}>
              <li>
                <img src={plant.img} alt={plant.name} />
                <h3>{plant.name}</h3>
              </li>
              <button class="uiverse">
                <div class="wrapper">
                  <Link to={`/library/${plant.id}`} className="plant-btn">
                    Read More
                  </Link>
                  <div class="circle circle-12"></div>
                  <div class="circle circle-11"></div>
                  <div class="circle circle-10"></div>
                  <div class="circle circle-9"></div>
                  <div class="circle circle-8"></div>
                  <div class="circle circle-7"></div>
                  <div class="circle circle-6"></div>
                  <div class="circle circle-5"></div>
                  <div class="circle circle-4"></div>
                  <div class="circle circle-3"></div>
                  <div class="circle circle-2"></div>
                  <div class="circle circle-1"></div>
                </div>
              </button>
            </div>
          ))}
        </div>
        <ChatBot />
      </div>
    </>
  );
}

export default Library;
