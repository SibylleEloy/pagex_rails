import React from "react";
import { Link } from "react-router-dom";

class Contents extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      contents: []
    };
  }

  componentDidMount() {
    const url = "/api/v1/contents/index";
    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => this.setState({ contents: response }))
      .catch(() => this.props.history.push("/"));
  }
  render() {
    const { contents } = this.state;
    const allContents = contents.map((content, index) => (
      <div key={index} className="col-md-6 col-lg-4">
        <div className="card mb-4">
          <img
            src={content.image}
            className="card-img-top"
            alt={`${content.title} image`}
          />
          <div className="card-body">
            <h5 className="card-title">{content.title}</h5>
            <Link to={`/content/${content.id}`} className="btn custom-button">
              View Content
            </Link>
          </div>
        </div>
      </div>
    ));
    const noContent = (
      <div className="vw-100 vh-50 d-flex align-items-center justify-content-center">
        <h4>
          No contents yet. Why not <Link to="/new_content">create one</Link>
        </h4>
      </div>
    );
    return (
      <>
        <section className="jumbotron jumbotron-fluid text-center">
          <div className="container py-5">
            <h1 className="display-4">Contents Feed</h1>
            <p className="lead text-muted">
              We’ve pulled together our most popular contents
            </p>
          </div>
        </section>
        <div className="py-5">
          <main className="container">
            <div className="text-right mb-3">
              <Link to="/content" className="btn custom-button">
                Create New Content
              </Link>
            </div>
            <div className="row">
              {contents.length > 0 ? allContents : noContent}
            </div>
            <Link to="/" className="btn btn-link">
              Home
            </Link>
          </main>
        </div>
      </>
    );
  }

}
export default Contents;
