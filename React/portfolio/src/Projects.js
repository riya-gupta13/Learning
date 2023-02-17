import PROJECTS from "./data/projects";
import React, { Component } from "react";

class Project extends Component{
    render(){
        const { title, image, description, link} = this.props.project;

        return (
            <div style={{display: 'inline-block', width: 300, margin: 10}}>
                <h3>{title}</h3>
                <img src={image} alt='profile' style={{width:200, height:120}} />
                <p>{description}</p>
                <a href={link}>{link}</a>
            </div>
        )
    }
}
class Projects extends Component{
    render(){
        return (
            <div>
                <h2>Highlighted Projects</h2>
            <div>
            {
                PROJECTS.map(PROJECT => {
                    return(
                        // THE project name used here should be same as in the props
                        <Project key={PROJECT.id} project={PROJECT}/>
                    );
                })
            }
            </div>
            </div>
        )
    }
}
export default Projects;