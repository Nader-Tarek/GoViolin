# GoViolin

GoViolin is a web app written in Go that helps with violin practice.

Currently hosted on Heroku at https://go-violin.herokuapp.com/

GoViolin allows practice over both 1 and 2 octaves.

Contains:
* Major Scales
* Harmonic and Melodic Minor scales
* Arpeggios
* A set of two part scale duet melodies by Franz Wohlfahrt


# Steps to take to test the pipeline

* Create an EC2 instance
* Install Docker, Jenkins, Minikube & Kubectl
* Copy the the KUBECONFIG file to Jenkins's home directory & make sure it's accesible for Jenkins
* Add DockerHub's credentials to Jenkins
* Trigger the pipeline & Voila!

Kindly check Sccreenshots directory
