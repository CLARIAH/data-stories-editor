# Changelog MvdP


## 19-8-2026
 
Extra security with typing. 
is it worth it or overkill when the PATH's are secured? Or is the selfDocumenting nature of typing good, it show up in the localhost/docs 
 
DISCUSS Are the native fastAPI notices sufficient or give these too much info

- UUID as type in resources endpoint
- defined ResourceType in request_types.py
- NOTICE you have to use str() these types with path constructions and ResourceType.value for obtaining the value. (flexible layer?)


 Extra:
 
 - 'wrote' a startup script start-dev.sh for development, start the server and the npm server. 

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
