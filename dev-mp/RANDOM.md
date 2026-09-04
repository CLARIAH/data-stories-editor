# Random 

Incoherent and coherent thoughts, drafts, documentation, notes, extended memory

## mapping out some things

- In `example/localhost.data` you'll find the data stories
- One directory, with everything from one data story. The name is a unique id: `uidd`
- also here the  sqllite db:  `datastories.db`

Each data story contains:

- a `datastory.json` everything in 1 big json file, texts, metadata
- a directory `resources` which possibly contains the following dirs:
  - images
  - queries
  - audio
  - video

## Front-end thoughts, questions

- As a user of Vimium (xtreme keyboard navigation in the browser). Vimium didn't work on the homepage.
- There are no roles defined in `browserHome.tsx` when I added them, Vimium immediately worked
- The homepage has 2 calls to get_data_stories (GET), UseEffect bug?
- why no viewing the datastory when you click on the line 

## Tools for API development

- rest client in VS Code, does still work with my old .rest files
- Bruno open source alternative for Postman, everything keeps local


## kladje

```javascript
    function saveBlock() {
        if (file) {
            const formData = new FormData();
            formData.append("file", file);

            fetch(API_URL + "datastories/" + uuid + "/resources", {
                method: "POST",
                body: formData,
            })
                .then((res) => {
                    if (!res.ok) {
                        throw new Error(`Upload failed: ${res.status}`);
                    }

                    return res.json();
                })
                .then((data) => {
                    if (data.status !== "OK") {
                        throw new Error(data.detail || "Upload failed");
                    }

                    const resourceUrl = API_URL + data.url;

                    setUrl(resourceUrl);
                    writeToBlock(resourceUrl, caption);
                })
                .catch((err) => {
                    console.error("Upload error:", err);
                    alert("Could not upload the image.");
                });
        } else {
            if (url !== "") {
                writeToBlock(url, caption);
            } else {
                alert("No image added!");
            }
        }
    }
```