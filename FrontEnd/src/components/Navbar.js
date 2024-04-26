import logo from "../asests/logo.png";
import { Link } from "react-router-dom";
import { useEffect } from "react";
import "../css/navbar.css";
import Aos from "aos";
import "aos/dist/aos.css";
function Navbar(props) {
  useEffect(() => {
    Aos.init({
      duration: 1000,
      delay: 200,
      easing: "ease-in-out",
    });
  }, []);

  return (
    <>
      <div className="nav-bar" data-aos="fade-down">
        <div className="container">
          <div className="logo" data-aos="zoom-in" data-aos-dely="500">
            <img src={logo} alt="logo"></img>
          </div>
          <div className="links" data-aos="fade-left" data-aos-delay="700">
            <ul>
              <li>
                <Link to="/" className={props.isActive==="home"?"home":""}>Home</Link>
              </li>
              <li>
                <Link to="/about" className={props.isActive === "about" ? "home" : ""}>About</Link>
              </li>
              <li>
                <Link to="/application" className={props.isActive === "app" ? "home" : ""}>Application</Link>
              </li>
              <li>
                <Link to="/library" className={props.isActive === "library" ? "home" : ""}>Library</Link>
              </li>
            </ul>
          </div>
          <button>
            <Link to="/application" >Try For Free</Link>
          </button>
        </div>
      </div>
    </>
  );
}

export default Navbar;
