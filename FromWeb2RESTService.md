# API CHANGES

@app.get("/get_data_stories")
async def getDataStories(userdata: Annotated[dict | None, Depends(authenticated_user)]):

@app.get("/datastories")
async def getDataStories(userdata: Annotated[dict | None, Depends(authenticated_user)]):


@app.get("/get_item")
async def get_item(ds: str, userdata: Annotated[dict | None, Depends(authenticated_user)]):

@app.get("/datastories/{id}")
async def get_item(ds: str, userdata: Annotated[dict | None, Depends(authenticated_user)]):


@app.get("/delete")
def delete(ds: str):

@app.delete("/datastories/{ds}")
def delete(ds: UUID, userdata: Annotated[dict | None, Depends(authenticated_user)]):
 

@app.get("/create_new")
def create_new(userdata: Annotated[dict | None, Depends(authenticated_user)]):

@app.post("/datastories")
def create_new(userdata: Annotated[dict | None, Depends(authenticated_user)]):


@app.post("/update_datastory")
async def updateDataStory(request: Request):

@app.put("/datastories/{ds}")
async def updateDataStory(ds:UUID, request: Request):