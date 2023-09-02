# Data Pipelines Pocket Reference
This is the repo of my development work reading DPPR by James Densmore

# Reflections

## Understanding AWS Services

While working through the material, I realized the significance of being well-versed in AWS. This is especially important when dealing with services like RDS (Relational Database Service) and Redshift. It's crucial to be mindful of potential costs, and I discovered that opting for the free tier can save you from unexpected expenses. Additionally, configuring security groups within a VPC (Virtual Private Cloud) cluster might seem challenging at first, but with perseverance, I learned to navigate and modify inbound rules effectively.

## Contextualizing Source Code

James Densmore provides source code examples throughout the book, and it's important to approach them with a discerning eye. While these examples are immensely valuable, I encountered some syntactic errors, particularly around Chapter 10's 'Measuring and Monitoring Pipeline Performance'. This taught me the importance of closely examining and debugging the provided code. For instance, troubleshooting a CSV ingestion into an S3 bucket helped me identify where an additional set of quotation marks was needed. Additionally, I discovered the nuances between Windows file paths and Linux file paths when working with WSL (Windows Subsystem for Linux).

## Navigating the Airflow Setup

One of the challenges I faced was setting up Airflow, a platform for orchestrating complex data workflows. Getting my Python virtual environment to interact seamlessly with the Airflow database on a Postgres DB hosted on RDS, was a trial-and-error process. In the future, I plan to explore setting up Airflow within a Docker container for a smoother experience.

## Insights from the 'Transforming Data' Chapter

The chapter on transforming data provided enlightening lessons on querying tables using complex join and where clauses. These insights are invaluable for anyone working with data transformation, and I found the explanations and data modeling examples provided to be especially helpful.

# Helpful Links
Authorizing Amazon S3 Bucket operations using [IAM Roles](https://docs.aws.amazon.com/redshift/latest/mgmt/copy-unload-iam-role.html)
How to create an IAM Role for [Amazon Redshift Cluster](https://docs.aws.amazon.com/redshift/latest/dg/c-getting-started-using-spectrum-create-role.html#spectrum-get-started-create-role)
Creating a role for an [IAM User](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-user.html)
Solution to an Airflow configuration setting for [email notifications](https://cknotes.com/office365-smtp-error-554-5-2-0-storedrv-submission-exceptionsendasdeniedexception-mapiexceptionsendasdenied/)
End to end guide for [Amazon Redshift connection with Python](https://medium.com/codex/aws-redshift-connects-with-python-part-1-setup-a-redshift-connection-with-python-b9f6a1fa49f0)
COPY command syntax for data transfering in a [S3 Bucket](https://docs.aws.amazon.com/redshift/latest/dg/r_COPY.html)
Command line instructions to properly install Airflow to your [Python virtual environment](https://stackoverflow.com/a/72552421)