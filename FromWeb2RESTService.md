# API CHANGES

@app.get("/delete")
def delete(ds: str):

@app.delete("/datastory/{ds}")
def delete(ds: UUID, userdata: Annotated[dict | None, Depends(authenticated_user)]):



