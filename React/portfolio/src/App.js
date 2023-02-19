import React, { Component } from "react";
import Projects from './Projects'
import SocialProfiles from "./SocialProfiles";
import profile from './assets/profile.png'
import './index.css';
import Title from "./Title";
// our first component, class name should be same as file name
class App extends Component {
  // constructor(){
  //     super();
  //     this.state= {displayBio: false}
  //     this.toggleDisplayBio = this.toggleDisplayBio.bind(this)
  // }

  // instaed of creating a constructor we can directly do this also
  state = { displayBio: false };

  // this is use to set the state here we are doing opposite of the which state is it in
  toggleDisplayBio = () => {
    this.setState({ displayBio: !this.state.displayBio });
  };

  render() {
    return (
      <div>
        <img src={profile} alt='profile' className="profile"/>
        <h1>Hi! I am Riya Gupta</h1>
        <p>I am a</p>
        <Title />
        <p>I like to learn and explore new technologies </p>
        {/* to render variables/methods use curly braces */}
        {this.state.displayBio ? (
          <div>
            <p>I live in Punjab</p>
            <p> My Favourite language is Python but I think React is Awsome</p>
            <button onClick={this.toggleDisplayBio}>Show Less</button>
          </div>
        ) : (
          <div>
            <button onClick={this.toggleDisplayBio}>Read More</button>
          </div>
        )}
        <hr />
        <Projects />
        <hr />
        <SocialProfiles />
      </div>
    );
  }
  
}

// this is used to use this component in other componenets(exporting)
export default App;
