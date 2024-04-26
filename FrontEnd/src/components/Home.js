import video from "../asests/Home page video_ contrast_V3.mp4";
import framvideo1 from "../asests/farmer-app-screen-1.mp3";
import framvideo2 from "../asests/farmer-app-screen-3.mp3";
import framvideo3 from "../asests/farmer-app-screen-4.mp3";
import arrowsvg from "../asests/arrow.svg";
import "../css/home.css";
import Faqs from "./Faqs";
import { Link } from "react-router-dom";
import Slider from "./Slider";
import Identify from "../components/Identify";
import Featuress from "./Features";
import ChatBot from "./ChatBot";
import Navbar from "./Navbar";
function Home() {
  const images = [
    "https://blossomplant.com/assets/images/img_disease_3-1.webp",
    "https://blossomplant.com/assets/images/img_disease_3-3.webp",
    "	https://blossomplant.com/assets/images/img_disease_3-5.webp",
  ];
  const featureimages = [
    "https://blossomplant.com/assets/images/img_pl_5-1.webp",
    "	https://blossomplant.com/assets/images/img_disease_6-2.webp",
    "	https://blossomplant.com/assets/images/img_pl_5-3.webp",
    "https://blossomplant.com/assets/images/img_pl_5-5.webp",
    "	https://blossomplant.com/assets/images/img_pl_5-6.webp",
  ];
  return (
    <>
    <Navbar isActive="home"/>
      <div className="home">
        <div className="header">
          <div className="video-header-section">
            <video autoPlay="true" loop="loop" muted preload="true">
              <source src={video}></source>
            </video>
          </div>
          <div className="header-text" data-aos="fade-up">
            <h2>
              Our Earth is <span>Precious</span>
            </h2>
            <p>
              Agri-tech360 focuses on using advanced image recognition to
              swiftly and accurately detect leaf plant diseases for agricultural
              improvement.
            </p>
          </div>
          <button data-aos="fade-left">
            <Link to="application">Try For Free</Link>
          </button>
        </div>
        {/* hero section */}
        <div className="hero-section">
          <div className="container">
            <div className="phone" data-aos="fade-right">
              <img
                src="https://blossomplant.com/assets/images/img_disease_1.webp"
                alt="phone"
              ></img>
            </div>
            <div className="hero-text" data-aos="fade-left">
              <h2>
                Identify and cure <span>plant diseases</span> with Agri-tech360
              </h2>
              <p>
                Is your green buddy dying? Try the<span>Agri-tech360</span> app
                to identify the cause and get extensive disease and care info in
                a snap
              </p>
              <button>
                <Link to="/application">Dignose Now!</Link>
              </button>
            </div>
          </div>
          {/* additional section */}
          <div className="additional">
            <div className="main-additional-text">
              <h2 data-aos="flip-up">
                <span>Personal plant doctor</span> in your pocket
              </h2>
              <p data-aos="fade-up">
                Have you ever searched ‘what’s wrong with my plant’? The results
                may have been disappointing... No more with
                <span> Agri-tech360!</span> Simply snap a photo of the issue to
                get a diagnosis. <span>Agri-tech360</span> will give you
                detailed info on the disease, what caused it, how to treat it,
                and how to prevent it.
              </p>
            </div>
            <div className="additional-images">
              <div className="overlay">
                <br></br>
                <br></br>
                start dignose!
              </div>
              <div className="overlay" data-aos="fade-right">
                <img
                  src="https://blossomplant.com/assets/images/img_disease_2-1.webp"
                  alt="plant-disease"
                ></img>
                <p>Overwatring</p>
              </div>
              <div className="overlay" data-aos="fade-up">
                <img
                  src="https://blossomplant.com/assets/images/img_disease_2-2.webp"
                  alt="plant-disease"
                ></img>
                <p>Nutrient deficiency</p>
              </div>
              <div className="overlay" data-aos="fade-left">
                <img
                  src="	https://blossomplant.com/assets/images/img_disease_2-3.webp"
                  alt="plant-disease"
                ></img>
                <p>Powdery mildew</p>
              </div>
            </div>
          </div>
          {/* about section */}
          <div className="about-section">
            <h2 data-aos="zoom-out">
              OverView about <span>Agri-tech360</span>
            </h2>
            <div className="about-content">
              <div className="about-text">
                <h3 data-aos="fade-up">
                  Get ready to discover the wonders of nature with{" "}
                  <span>Agri-tech360</span> – the ultimate pocket companion for
                  plant enthusiasts! With <span>Agri-tech360's</span>{" "}
                  cutting-edge technology, you can now identify any plant with
                  just a photo. Whether you're indoors admiring your houseplants
                  or outdoors exploring new species, <span>Agri-tech360</span>{" "}
                  will provide you with accurate information, including the
                  plant's name and classification. Become your own botanical
                  expert with <span>Agri-tech360</span> by your side wherever
                  you roam, and delve into the captivating world of flora in
                  real-time
                </h3>
                <div className="about-videos">
                  <div
                    className="video-flex"
                    data-aos="fade-right"
                    data-aos-delay="4000"
                  >
                    <video autoPlay="true" loop="loop" muted preload="true">
                      <source src={framvideo1}></source>
                    </video>
                    <p data-aos="fade-up">Diagnose your sick crop !</p>
                  </div>
                  <img src={arrowsvg} alt="arrow"></img>
                  <div
                    className="video-flex"
                    data-aos="fade-up"
                    data-aos-delay="4000"
                  >
                    <video autoPlay="true" loop="loop" muted preload="true">
                      <source src={framvideo2}></source>
                    </video>
                    <p data-aos="fade-up">Get expert advice !</p>
                  </div>
                  <img src={arrowsvg} alt="arrow"></img>
                  <div
                    className="video-flex"
                    data-aos="fade-left"
                    data-aos-delay="4000"
                    s
                  >
                    <video autoPlay="true" loop="loop" muted preload="true">
                      <source src={framvideo3}></source>
                    </video>
                    <p data-aos="fade-up">Our library has got you covered !</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          {/* how identify */}
          <div className="how-identify">
            <h2 data-aos="zoom-out">
              <span>How to identify </span>a diseases?
            </h2>
            <div className="identify-flex">
              <div className="identify-img">
                <Slider images={images} />
              </div>
              <div className="identify-links">
                <Identify />
              </div>
            </div>
          </div>
        </div>
        {/* features identfication */}
        <div className="features">
          <div className="container">
            <div className="features-text">
              <h3 data-aos="fade-down">
                More than just <span>disease identification</span>
              </h3>
              <p data-aos="fade-up">
                <span>Agri-tech360</span> offers far more than just plant
                disease identification – it's a comprehensive platform designed
                to elevate your plant care experience! Experience{" "}
                <span>Agri-tech360</span> for yourself, free of charge, and
                unlock a wealth of resources including an extensive care
                library, identification tools, personalized care reminders, and
                a plethora of expert plant care advice. Dive into the world of
                plant care with <span>Agri-tech360</span> and discover all the
                tools and tips you need to nurture your green companions to
                their fullest potential!
              </p>
            </div>
            <div className="features-flex">
              <div className="drop-menue" data-aos="zoom-out">
                <Featuress />
              </div>
              <div className="features-images" data-aos="fade-left">
                <img
                  src="https://blossomplant.com/assets/images/img_pl_5-0.png"
                  alt="back-phone"
                  className="back-phone"
                ></img>
                <Slider images={featureimages} />
              </div>
            </div>
          </div>
        </div>
        {/* Faqs section */}
        <div className="faqs">
          <div className="container">
            <h2>Frequently asked questions !</h2>
            <Faqs />
          </div>
        </div>
        {/* Footer */}
        <div className="footer">
          <div className="container">
            <h2>
              Stop killing – <span>start treating your plants!</span>
            </h2>
            <button>
              <Link to="/Application">Dignose now!</Link>
            </button>
          </div>
        </div>
      </div>
      <ChatBot />
    </>
  );
}

export default Home;
