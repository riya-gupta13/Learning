package com.springboot.kanban.services;

import com.springboot.kanban.domain.Project;
import com.springboot.kanban.exceptions.ProjectIdException;
import com.springboot.kanban.repostories.ProjectRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProjectService {

    @Autowired
    private ProjectRepository projectRepository;

    public Project saveOrUpdateProject(Project project){
        try{
            project.setProjectIdentifier(project.getProjectIdentifier().toUpperCase());
            return projectRepository.save(project);
        }
        catch (Exception e){
            throw new ProjectIdException("Project ID "+project.getProjectIdentifier().toUpperCase()+" "+"already exists");
        }

    }
    public Project findProjectByIdentifier(String projectId){
        Project project = projectRepository.findByProjectIdentifier(projectId.toUpperCase());

         if (project == null){
             throw new ProjectIdException("Project ID "+projectId+ " does not exists");
         }

        return project;
    }

    public Iterable<Project> findAllProjects(){
        return projectRepository.findAll();
    }

    public void deleteProjectByIdentifier(String projectId){
        Project project = projectRepository.findByProjectIdentifier(projectId.toUpperCase());

        if (project == null){
            throw new ProjectIdException("Cannot find Project with ID "+ projectId+ ". This project does not exists");
        }
        projectRepository.delete(project);
    }

//    public void updateProjectByIdentifier(String projectId){
//        Project project = projectRepository.findByProjectIdentifier(projectId.toUpperCase());
//
//        if (project == null){
//            throw new ProjectIdException("Cannot find Project with ID "+ projectId+ ". This project does not exists");
//        }
//        projectRepository.update(project);
//    }
}
