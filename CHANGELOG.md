# Changelog MvdP


## 4-9-2026

- upload van een resource  `@app.post('/upload')` =>     `@app.post("/datastories/{datastory_id}/resources")`

## 3-9-2026

- update `@app.post("/update_datastory")` => `@app.put("/datastories/{ds}")`


## 26-8-2026


- I noticed the docs/ didn't show up when I worked offline, since Swagger uses network resources you end up with a blank page. Solution. `pip install fastapi-offline`  `from fastapi_offline import FastAPIOffline` `Replace app = FastAPI()`
with `app = FastAPIOffline()` https://pypi.org/project/fastapi-offline/
- pytest cont.
  
REST overzicht

- `@app.get("/create_new")` => `@app.post("/datastories")`
- `@app.get("/delete")` => `@app.delete("/datastories/{ds}")`
- `@app.get("/get_data_stories")` => `@app.get("/datastories")`
- `@app.get("/get_item")` => `@app.get("/datastories/{id}")`

## 21-8-2026

- pytest start and fastAPI 
- discussion about rest and more of the application flow (visitors, rights)
- from API to IPA

## 20-8-2026


- improved getNewId()
- looked into REST practices in relation to fastAPI, not implemented here TODO (after discussion)
- small cleanups
- started with REST on the delete endpoint also change in frontend src/frontend/src/browser/browserHome.tsx

## 19-8-2026
 
- delete endpoint safe, whitelist, uuid type, path traversal check 
- addes ResourceType queries after I encouterd this in the log `INFO:     127.0.0.1:51837 - "GET /resources/168475ff-7055-4cf0-b1ec-19cd83641f4d/queries/wrak.rq HTTP/1.1" 422 Unprocessable Content`


Extra security with typing. 
is it worth it or overkill when the PATH's are secured? Or is the selfDocumenting nature of typing good, it show up in the localhost/docs 
 
DISCUSS Are the native fastAPI notices sufficient or give these too much info

- UUID as type in resources endpoint
- defined ResourceType in request_types.py
- NOTICE you have to use str() these types with path constructions and ResourceType.value for obtaining the value. (flexible layer?)


 Extra:

 - 'wrote' a startup script start-dev.sh for development, start the server and the npm server. open the browsers

## 14-8-2026

- TODO delete and update endpoints; uuid typing, path instead of str concat, better response handling
- resources/ endpoint secured with Path()
- tested upload with test.html and from the frontend
- api testing
- draft with drafts/questions

## 13-8-2026

- mitigate SQL injections in functions.py
- path traversal mitigation endpoint upload/
- included old test cases & docu in dev-mvp dir
