function Faqs() {
  const faqData = [
    {
      question: "How does Agri-tech360 identify plant diseases?",
      answer:
        "Agri-tech360 employs artificial intelligence to identify the ailment afflicting your plant. With a database comprising 100 distinct diseases—including root rot, overwatering, powdery mildew, thrips, and numerous others—Agri-tech360 can accurately diagnose your green companion's condition.",
    },
    {
      question:
        "Can I find plant-related information, such as specific care needs?",
      answer:
        "Sure! Right after the recognition process, you will get extensive care info. You can learn specific care requirements such as watering frequency, light and temperature needs, soil type, propagation techniques, common diseases and much more.",
    },
    {
      question: "Does Agri-tech360 work for outdoor species?",
      answer:
        "Agri-tech360 is a plant problem identifier that works for both indoor and outdoor plants - it can recognize a variety of problems and diseases. Be sure you will find solutions for your garden pals, from flowers and trees to veggies and fruits.",
    },
  ];
  return (
    <>
      <div className="faq-list" id="faqs">
        <div className="faq-flex" data-aos="fade-up">
          {faqData.map((faq, index) => (
            <div className="faq-item" key={index}>
              <h3>{faq.question}</h3>
              <p>{faq.answer}</p>
            </div>
          ))}
        </div>
      </div>
    </>
  );
}
export default Faqs;
