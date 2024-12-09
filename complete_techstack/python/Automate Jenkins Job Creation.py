#Automate Jenkins Job Creation
import requests

JENKINS_URL = "http://jenkins.example.com"
JOB_NAME = "my-new-job"
CONFIG_XML = """<project>...</project>"""  # Job configuration XML

def create_jenkins_job(url, job_name, config):
    response = requests.post(
        f"{url}/createItem?name={job_name}",
        headers={"Content-Type": "application/xml"},
        data=config,
        auth=("admin", "password")
    )
    return response.status_code

print(create_jenkins_job(JENKINS_URL, JOB_NAME, CONFIG_XML))
#Key Concepts: REST API, Jenkins automation.
