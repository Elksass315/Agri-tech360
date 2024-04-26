import "../css/about.css";
import icon from "../asests/icon.png";
import ChatBot from "./ChatBot";
import Navbar from "./Navbar";
function About() {
  return (
    <>
      <Navbar isActive = "about"/>
      <div className="about">
        <div className="main-about">
          <div className="main-flex">
            <div className="about-img">
              <img
                src="https://blossomplant.com/assets/images/img_pl_1.webp"
                alt="phone"
                data-aos="fade-right"
              ></img>
            </div>
            <div className="about-text" data-aos="fade-left">
              <h2>
                Identify plants around you with <span>Agri-tech360</span>
              </h2>
              <p>
                Discover more plants, flowers, succulents, and trees around you
              </p>
            </div>
          </div>
          <div className="additional-about-text" data-aos="fade-up">
            <div className="text-flex">
              <h3>
                About <span>Agri-tech360 !</span>
              </h3>
              <p className="ai">
                <span>AI-powered</span> plant identifier in your pocket
              </p>
              <img src={icon} alt="flowr icon"></img>
              <div className="flex">
                <p data-aos="fade-down">
                  Our app utilizes advanced image recognition technology and
                  machine learning algorithms to identify leaf diseases.
                </p>
                <p data-aos="fade-down">
                  Users can simply snap a photo of a diseased leaf for instant
                  and accurate diagnosis.
                </p>
                <p data-aos="fade-down">
                  The app offers personalized recommendations for treatment and
                  preventive measures based on each user's situation.
                </p>
                <p data-aos="fade-down">
                  It provides insights into common leaf diseases, including
                  fungal infections, nutrient deficiencies, and pest
                  infestations.
                </p>
                <p data-aos="fade-down">
                  our app equips users with the insights and resources to
                  maintain healthy and thriving plants.
                </p>
                <p data-aos="fade-down">
                  Our goal is to revolutionize plant health management and
                  empower growers worldwide to achieve greater success and
                  sustainability in agriculture.
                </p>
              </div>
            </div>
          </div>
        </div>
        <div className="purpose" data-aos="fade-up">
          <h3>Purpose!</h3>
          <div className="purpose-text">
            <p data-aos="fade-down">
              1-<span>Revolutionizing Leaf Disease Detection :</span> Our app
              transforms the traditional approach to detecting and managing leaf
              diseases, offering a user-friendly and efficient solution for
              gardeners, farmers, and plant enthusiasts alike.
            </p>
            <div className="imgs">
              <img
                src="https://blossomplant.com/assets/images/img_disease_2-3.webp"
                alt="Powdery mildew"
                data-aos="fade-right"
              ></img>
              <img
                src="	https://blossomplant.com/assets/images/img_disease_2-2.webp"
                alt="Nutrient deficiency"
                data-aos="fade-up"
              ></img>
              <img
                src="	https://blossomplant.com/assets/images/img_disease_2-1.webp"
                alt="Overwatering"
                data-aos="fade-left"
              ></img>
            </div>
            <p data-aos="fade-down">
              2-<span>Empowering Users with Advanced Technology:</span> By
              leveraging cutting-edge image recognition technology and machine
              learning algorithms, our app enables users to quickly and
              accurately identify and diagnose leaf diseases, ensuring precise
              treatment and prevention measures.
            </p>
            <div className="imgs">
              <img
                src="https://blossomplant.com/assets/images/img_pl_2b.webp"
                alt="plant"
                data-aos="fade-right"
              ></img>
              <img
                src="https://www.zulauf.ch/resources/public/dtc/media/frauenhaarfarn-adiantum-raddianum-fragrans.jpg"
                alt="plant"
                data-aos="fade-up"
              ></img>
              <img
                src="https://cdn.myikas.com/images/1bd9ce94-24d0-4dd9-a116-9f46a272aad2/6192b470-ef6b-41ea-bae5-24d643155db1/image_3840.webp"
                alt="plant"
                data-aos="fade-left"
              ></img>
            </div>
            <p data-aos="fade-down">
              3-<span>Promoting Plant Health and Resilience:</span> Our primary
              aim is to provide users with the necessary knowledge and resources
              to address plant health issues promptly, curb disease spread, and
              foster healthier and more productive greenery. Through
              streamlining the leaf disease detection process, our app
              contributes to creating resilient and thriving plant ecosystems.
            </p>
            <div className="imgs">
              <img
                src="https://blossomplant.com/assets/images/img_pl_2c.webp"
                alt="plant"
                data-aos="fade-right"
              ></img>
              <img
                src="http://plantsforhumans.com/cdn/shop/products/Plants_For_Humans_kwiaty_doniczkowe_aglaonema_key_lime_grande.jpg?v=1646059032"
                alt="plant"
                data-aos="fade-up"
              ></img>
              <img
                src="https://www.yesilevbotanik.com/wp-content/uploads/2021/03/DSC08616.jpg"
                alt="plant"
                data-aos="fade-left"
              ></img>
            </div>
          </div>
        </div>
        <ChatBot />
      </div>
    </>
  );
}

export default About;
