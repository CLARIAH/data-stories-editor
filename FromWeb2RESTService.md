# API CHANGES


## lijst data stories

    @app.get("/get_data_stories")
    async def getDataStories(userdata: Annotated[dict | None, Depends(authenticated_user)]):

    @app.get("/datastories")
    async def getDataStories(userdata: Annotated[dict | None, Depends(authenticated_user)]):

## enkele data story

    @app.get("/get_item")
    async def get_item(ds: str, userdata: Annotated[dict | None, Depends(authenticated_user)]):

    @app.get("/datastories/{id}")
    async def get_item(ds: str, userdata: Annotated[dict | None, Depends(authenticated_user)]):

## delete data story


    @app.get("/delete")
    def delete(ds: str):

    @app.delete("/datastories/{ds}")
    def delete(ds: UUID, userdata: Annotated[dict | None, Depends(authenticated_user)]):

## create new data story    

    @app.get("/create_new")
    def create_new(userdata: Annotated[dict | None, Depends(authenticated_user)]):

    @app.post("/datastories")
    def create_new(userdata: Annotated[dict | None, Depends(authenticated_user)]):


## update data story

    @app.post("/update_datastory")
    async def updateDataStory(request: Request):

    @app.put("/datastories/{ds}")
    async def updateDataStory(ds:UUID, request: Request):

## upload resource behorende bij een data story


    @app.post('/upload')
    async def upload(file: UploadFile, uuid: str = Form(...)):

    @app.post("/datastories/{datastory_id}/resources")
    async def upload_resource(datastory_id: UUID, file: UploadFile = File(...)):


