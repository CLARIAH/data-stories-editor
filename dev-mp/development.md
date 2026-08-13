# Development

There are more ways to skin a cat, but this one is used by the original developer.
Maybe later a different way. With uv for example.

## The service

    git clone https://github.com/CLARIAH/data-stories-editor.git
    cd data-stories-editor
    python3.13 -m venv .venv 
    # 3.14 does not work
    source .venv/bin/activate
        python -m pip install -r src/service/requirements.txt
        cd src/service/
    python main.py

http://localhost/docs/ 


## The frontend

    cd src/frontend
    npm install
    npm start

A REACT application starts at http://localhost:3000/
