import React from "react";
import { Link } from "react-router-dom";


class Content extends React.Component {
  constructor(props) {
    super(props);
    this.state = { content: { text: "" } };

    this.addHtmlEntities = this.addHtmlEntities.bind(this);
  }

  componentDidMount() {
    const {
      match: {
        params: { id }
      }
    } = this.props;

    const url = `/api/v1/show/${id}`;

    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ content: response }))
      .catch(() => this.props.history.push("/contents"));
  }

  addHtmlEntities(str) {
    return String(str)
      .replace(/&lt;/g, "<")
      .replace(/&gt;/g, ">");
  }

  render() {
    const { content } = this.state;
    let textList = "No text available";

    if (content.text.length > 0) {
      textList = content.text
        .split(",")
        .map((text, index) => (
          <li key={index} className="list-group-item">
            {text}
          </li>
        ));
    }
    const contentText = this.addHtmlEntities(content.text);

    return (
     <div className="">
       <div className="hero position-relative d-flex align-items-center justify-content-center">
         <img
           src={content.image}
           alt={`${content.title} image`}
           className="img-fluid position-absolute"
         />
         <div className="overlay bg-dark position-absolute" />
         <h1 className="display-4 position-relative text-white">
           {content.title}
         </h1>
       </div>
       <div className="container py-5">
         <div className="row">
           <div className="col-sm-12 col-lg-3">
             <ul className="list-group">
               <h5 className="mb-2">Text</h5>
               {textList}
             </ul>

            </div>
             <div className="col-sm-12 col-lg-7">
               <h5 className="mb-2">Text</h5>
               <div
                 dangerouslySetInnerHTML={{
                   __html: `${contentText}`
                 }}
               />
             </div>
             <div className="col-sm-12 col-lg-2">
               <button type="button" className="btn btn-danger">
                 Delete Content
               </button>
             </div>
           </div>
           <Link to="/contents" className="btn btn-link">
             Back to contents
           </Link>
         </div>
       </div>
     );
   }
}

export default Content;
