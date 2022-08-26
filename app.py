import sys
import os
import json
from predict_script import run
def handler(event, context):
    pgs_credentials = (os.environ["PGS_DB"], os.environ["PGS_USER"], os.environ["PGS_PWD"], os.environ["PGS_HOST"], os.environ["PGS_PORT"])
    run(event["run"], pgs_credentials)
    return{
        'StatusCode': 200,
        'body': json.dumps("Predict fatta sul run: " + event["run"])
    }