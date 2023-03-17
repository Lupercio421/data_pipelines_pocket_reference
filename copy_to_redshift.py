import boto3
import configparser
import psycopg2

#connect to the redshift cluster using psycopg2.connect  func and pipeline credentials
parser = configparser.ConfigParser()
parser.read("pipeline.conf")
dbname = parser.get("aws_creds", "database")
user = parser.get("aws_creds", "username")
password = parser.get("aws_creds","password")
host = parser.get("aws_creds","host")
port = parser.get("aws_creds", "port")

#connect to redshift cluster
rs_conn = psycopg2.connect(
    "dbname=" + dbname
    + " user = " + user
    + " password = " + password
    + " host = " + host
    + " port = " + port
)

#load the account_id and iam_role from the conf files
parser = configparser.ConfigParser()
parser.read("pipeline.conf")
account_id = parser.get("aws_boto_credentials", "account_id")
iam_role = parser.get("aws_creds", "iam_role")
bucket_name = parser.get("aws_boto_credentials","bucket_name")