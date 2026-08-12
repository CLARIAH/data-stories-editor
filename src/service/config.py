import os

max_content_length: int = 16 * 1024 * 1024

# In Docker version
# DATA_LOCATION = "/app/service/data"

# In dev, on your local file system
# DATA_LOCATION = "/Users/robzeeman/Documents/DI_code/data_stories/localhost.data"
DATA_LOCATION= "/Users/mvdpeet/dockerprojecten/data-stories-editor/example/localhost.data"
ds_app_url = os.environ.get("APP_DOMAIN", 'http://localhost:3000')


DEV_MODE = True
