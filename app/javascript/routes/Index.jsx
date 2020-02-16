import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "../components/Home";
import Users from "../components/Users";
import User from "../components/User";
import Contents from "../components/Contents";
import Content from "../components/Content";

export default (
  <Router>
    <Switch>
      <Route path="/" exact component={Home} />
      <Route path="/users" exact component={Users} />
      <Route path="/user/:id" exact component={User} />
      <Route path="/contents" exact component={Contents} />
      <Route path="/content/:id" exact component={Content} />
    </Switch>
  </Router>
);
